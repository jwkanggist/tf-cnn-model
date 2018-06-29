# Copyright 2018 Jaewook Kang (jwkang10@gmail.com)
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ===================================================================================
# -*- coding: utf-8 -*-
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import tensorflow as tf
import tensorflow.contrib.slim as slim

# where we adopt the NHWC format.

'''
 /* convolutional layer modules */
'''

def get_inception_v2_module(ch_in,
                           inception_conv_chout_num,
                           model_config,
                           stride=2,
                           scope=None):
    '''
        - basically this module provides grid reduction

        ch_in --> net1,net2,net3,net4
        net1  --> 1x1/1 (batchnorm) --> 3x3/1     --> 3x3/stride (batchnorm)
        net2  --> 1x1/1 (batchnorm) --> 3x3/stride (batchnorm)
        net3  --> maxpool         --> 1x1/1 (batchnorm)
        ch_out = tf.cancat([net1,net2,net3])

        where all convolution module is followed by batch_norm.
        The relu activation is performed once just after filter concanternation.
        -----------------------------------------------------------------
        inception_conv_chout_num.net1   = [ conv1x1, conv3x3, conv3x3/2]
        inception_conv_chout_num.net2   = [ conv1x1, conv3x3/2]
        inception_conv_chout_num.net3   = maxpool3x3/2 + [ conv1x1 ]
        -----------------------------------------------------------------
        # 180620 note for inception v2 config
        inception_conv_chout_num.net1   = [ 96, 96, 32]
        inception_conv_chout_num.net2   = [ 96, 128]
        inception_conv_chout_num.net3   = [ 96 ]
    '''

    if stride < 2:
        ValueError('[Inceptionv2] Grid reduction is default setting')
    else:
        print ('[Inceptionv2] Grid reduction with stride = %s' %stride)

    net1    = ch_in
    net2    = ch_in
    net3    = ch_in

    orig_scope = scope
    with tf.variable_scope(name_or_scope=scope,default_name='inceptionv2',values=[ch_in]) as sc:

        endpoint_collection = sc.original_name_scope + '_end_points'
        with slim.arg_scope([slim.conv2d,slim.max_pool2d],
                            outputs_collections=endpoint_collection):

            with slim.arg_scope([slim.conv2d],
                                weights_initializer = model_config.weights_initializer,
                                weights_regularizer = model_config.weights_regularizer,
                                biases_initializer  = model_config.biases_initializer,
                                trainable           = model_config.is_trainable,
                                padding             ='SAME',
                                stride              = 1,
                                activation_fn       = None):

                with slim.arg_scope([model_config.normalizer_fn],
                                    decay           =model_config.batch_norm_decay,
                                    fused           =model_config.batch_norm_fused,
                                    is_training     =model_config.is_trainable,
                                    activation_fn   =None):
                    # net1
                    # ---------------------------------------------

                    # conv 1x1 + batch_norm
                    net1    = slim.conv2d(inputs=       net1,
                                          num_outputs=  inception_conv_chout_num.net1[0],
                                          kernel_size=  [1,1],
                                          normalizer_fn=None,
                                          scope=        scope + '_net1_conv1x1')

                    net1    = model_config.normalizer_fn(inputs=   net1)

                    # conv 3x3/1 + conv 3x3/2 + batch_norm
                    net1    = slim.conv2d(inputs=        net1,
                                          num_outputs=  inception_conv_chout_num.net1[1],
                                          kernel_size=  [3,3],
                                          normalizer_fn= None,
                                          scope=         scope + '_net1_conv3x3_1')

                    net1    = slim.conv2d(inputs=        net1,
                                          num_outputs=  inception_conv_chout_num.net1[2],
                                          kernel_size=  [3,3],
                                          stride=       stride,
                                          padding=      'SAME',
                                          normalizer_fn= None,
                                          scope=         scope +'_net1_conv3x3_2')

                    net1    = model_config.normalizer_fn(inputs=   net1)

                    # net2
                    # ---------------------------------------------

                    # conv 1x1 w/ batch norm
                    net2    = slim.conv2d(inputs=               net2,
                                          num_outputs=          inception_conv_chout_num.net2[0],
                                          kernel_size=          [1,1],
                                          normalizer_fn=        model_config.normalizer_fn,
                                          biases_initializer=   None,
                                          scope=                scope + '_net2_conv1x1')

                    # conv 3x3/2 w/ batch norm
                    net2    = slim.conv2d(inputs=               net2,
                                          num_outputs=          inception_conv_chout_num.net2[1],
                                          kernel_size=          [3,3],
                                          stride=               stride,
                                          padding=              'SAME',
                                          normalizer_fn=        model_config.normalizer_fn,
                                          biases_initializer=   None,
                                          scope=                scope + '_net2_conv3x3')

                    # net3
                    # ---------------------------------------------
                    # max pooling 3x3/s
                    # net3    = tf.nn.max_pool(value=             net3,
                    #                          ksize=             [1,3,3,1],
                    #                          strides=           [1,stride,stride,1],
                    #                          padding=           "VALID",
                    #                          name=              scope + '_net3_maxpool3x3/s')

                    net3    = slim.max_pool2d(inputs= net3,
                                              kernel_size=[3,3],
                                              stride=       stride,
                                              padding=      'SAME',
                                              scope= scope + '_net3_maxpool3x3')
                    # conv 1x1 w/ batch norm
                    net3    = slim.conv2d(inputs=               net3,
                                          num_outputs=          inception_conv_chout_num.net3[0],
                                          kernel_size=          [1,1],
                                          normalizer_fn=        model_config.normalizer_fn,
                                          biases_initializer=   None,
                                          scope=                scope + '_net3_conv1x1')

            # Convert end_points_collection into a dictionary of end_points.
            end_points = slim.utils.convert_collection_to_dict(
                endpoint_collection, clear_collection=True)

            net  = tf.concat(values=[net1,net2,net3],
                            axis=3,
                            name= orig_scope + '/' + scope + '_concat')
            end_points[orig_scope + '/' + scope + '_concat'] = net


        net = model_config.activation_fn(features=net,
                                         name=sc.name + '_out')
        end_points[sc.name + '_out'] = net
        end_points[sc.name + '_in'] = ch_in

    return net, end_points






def get_separable_conv2d_module(ch_in,
                                ch_out_num,
                                model_config,
                                kernel_size=3,
                                stride=1,
                                scope=None):
    '''
    ch_in -->
    depthwise_conv3x3xch_in_num/stride --> batchnorm + relu6 -->
    pointwise_conv1x1xch_out_num/1       --> batchnorm + relu6 -->
    ch_out
    '''

    conv2d_padding = 'SAME'
    net = ch_in

    with tf.variable_scope(name_or_scope=scope,default_name='separable_conv2d',values=[ch_in]) as sc:

        endpoint_collection = sc.original_name_scope + '_end_points'

        with slim.arg_scope([slim.conv2d,
                             slim.separable_convolution2d],
                            outputs_collections=endpoint_collection):

            with slim.arg_scope([model_config.normalizer_fn],
                                decay=          model_config.batch_norm_decay,
                                fused=          model_config.batch_norm_fused,
                                is_training=    model_config.is_trainable,
                                activation_fn=  model_config.activation_fn):

                '''
                    Note that "slim.separable_convolution2cd with num_outputs == None" 
                    provides equivalent implementation to the depthwise convolution 
                    with ch_in_num == ch_out_num
                '''
                # depthwise conv with 3x3 kernal
                # followed by batch_norm and relu6
                net = slim.separable_convolution2d(inputs=              net,
                                                   num_outputs=         None,
                                                   kernel_size=         kernel_size,
                                                   depth_multiplier=    1.0,
                                                   stride=              stride,
                                                   padding=             conv2d_padding,
                                                   activation_fn=       None,
                                                   normalizer_fn=       model_config.normalizer_fn,
                                                   biases_initializer=  None,
                                                   weights_initializer= model_config.weights_initializer,
                                                   weights_regularizer= model_config.weights_regularizer,
                                                   trainable=           model_config.is_trainable,
                                                   scope=               scope + '_dwise_conv')

                # pointwise conv with 1x1 kernal
                # followed by batch_norm and relu6
                net = slim.conv2d(inputs=               net,
                                  num_outputs=          ch_out_num,
                                  kernel_size=          [1,1],
                                  stride=               1,
                                  padding=              'SAME',
                                  activation_fn=        None,
                                  normalizer_fn=        model_config.normalizer_fn,
                                  biases_initializer=   None,
                                  weights_initializer=  model_config.weights_initializer,
                                  weights_regularizer=  None,
                                  trainable=            model_config.is_trainable,
                                  scope=                scope + '_pwise_conv')
                # Convert end_points_collection into a dictionary of end_points.
                end_points = slim.utils.convert_collection_to_dict(
                    endpoint_collection, clear_collection=True)

        end_points[sc.name + '_out'] = net
        end_points[sc.name + '_in'] = ch_in

    return net, end_points






def get_linear_bottleneck_module(ch_in,
                                ch_out_num,
                                model_config,
                                kernel_size=3,
                                stride=1,
                                scope=None):
    '''
        ch_in -->
        depthwise_conv 3x3xch_num_in/stride --> batch_norm + relu6 -->
        pointwise_conv 1x1xch_num_in/1      --> batch_norm + relu6 -->
        linear_bottleneck 1x1xch_out_in/1   --> batch_norm -->
        ch_out
    '''

    conv2d_padding = 'SAME'
    net = ch_in
    with tf.variable_scope(name_or_scope=scope,default_name='linear_bottleneck',values=[ch_in]) as sc:

        endpoint_collection = sc.original_name_scope + '_end_points'
        with slim.arg_scope([slim.conv2d,
                             slim.separable_convolution2d],
                            outputs_collections=endpoint_collection):

            with slim.arg_scope([slim.conv2d],
                                kernel_size         =[1, 1],
                                stride              =1,
                                padding             ='SAME',
                                activation_fn       =None,
                                weights_initializer =model_config.weights_initializer,
                                weights_regularizer =None,
                                trainable           =model_config.is_trainable):

                # batch_norm w/ relu6 activation
                with slim.arg_scope([model_config.normalizer_fn],
                                    decay           = model_config.batch_norm_decay,
                                    fused           = model_config.batch_norm_fused,
                                    is_training     = model_config.is_trainable,
                                    activation_fn   = model_config.activation_fn):
                    '''
                        Note that "slim.separable_convolution2cd with num_outputs == None" 
                        provides equivalent implementation to the depthwise convolution 
                        with ch_in_num == ch_out_num
                    '''
                    # depthwise conv with 3x3 conv
                    # followed by batch_norm and relu6
                    net = slim.separable_convolution2d(inputs=              net,
                                                       num_outputs=         None,
                                                       kernel_size=         kernel_size,
                                                       depth_multiplier=    1.0,
                                                       stride=              stride,
                                                       padding=             conv2d_padding,
                                                       activation_fn=       None,
                                                       normalizer_fn=       model_config.normalizer_fn,
                                                       biases_initializer=  None,
                                                       weights_initializer= model_config.weights_initializer,
                                                       weights_regularizer= model_config.weights_regularizer,
                                                       trainable=           model_config.is_trainable,
                                                       scope=               scope + '_dwise_conv')

                    # pointwise conv with 1x1 kernal
                    # followed by batch_norm and relu6
                    net_shape   = net.get_shape().as_list()
                    net_ch_num  = net_shape[3]

                    net = slim.conv2d(inputs=               net,
                                      num_outputs=          net_ch_num,
                                      normalizer_fn=        model_config.normalizer_fn,
                                      biases_initializer=   None,
                                      scope=                scope + '_pwise_conv')

                    # linear bottleneck block by conv1x1
                    # followed by batch_norm
                    net = slim.conv2d(inputs=               net,
                                      num_outputs=          ch_out_num,
                                      normalizer_fn=        None,
                                      biases_initializer=   model_config.biases_initializer,
                                      scope=                scope + '_bottleneck')

                    net = model_config.normalizer_fn(inputs=        net,
                                                     activation_fn= None)

                    # Convert end_points_collection into a dictionary of end_points.
                    end_points = slim.utils.convert_collection_to_dict(
                        endpoint_collection, clear_collection=True)

        end_points[sc.name + '_out'] = net
        end_points[sc.name + '_in'] = ch_in

    return net, end_points





def get_inverted_bottleneck_module(ch_in,
                                ch_out_num,
                                expand_ch_num,
                                model_config,
                                kernel_size=3,
                                stride=1,
                                scope=None):
    '''
        ch_in -->
        linear_bottleneck 1x1xT/1       --> batch_norm + relu6 -->
        depthwise_conv 3x3xT/s          --> batch_norm + relu6 -->
        pointwise_conv 1x1xch_out_num/1 --> batch_norm -->
        ch_out
    '''
    conv2d_padding = 'SAME'
    net = ch_in
    with tf.variable_scope(name_or_scope=scope,default_name='inverted_bottleneck',values=[ch_in]) as sc:

        endpoint_collection = sc.original_name_scope + '_end_points'
        with slim.arg_scope([slim.conv2d,
                             slim.separable_convolution2d,
                             slim.max_pool2d],
                             outputs_collections=endpoint_collection):

            with slim.arg_scope([slim.conv2d],
                                kernel_size         =[1,1],
                                stride              = 1,
                                padding             = 'SAME',
                                activation_fn       = None,
                                weights_initializer = model_config.weights_initializer,
                                weights_regularizer = None,
                                trainable           = model_config.is_trainable):

                with slim.arg_scope([model_config.normalizer_fn],
                                    decay           = model_config.batch_norm_decay,
                                    fused           = model_config.batch_norm_fused,
                                    is_training     = model_config.is_trainable,
                                    activation_fn   = model_config.activation_fn):

                    # linear bottleneck by conv 1x1
                    # followed by batch_norm and relu6

                    net = slim.conv2d(inputs            = net,
                                      num_outputs       = expand_ch_num,
                                      normalizer_fn     = model_config.normalizer_fn,
                                      biases_initializer= None,
                                      scope             = scope + '_bottleneck')

                    '''
                        Note that "slim.separable_convolution2cd with num_outputs == None" 
                        provides equivalent implementation to the depthwise convolution 
                        with ch_in_num == ch_out_num
                    '''
                    # depthwise conv with 3x3 conv
                    # followed by batch_norm and relu6
                    net = slim.separable_convolution2d(inputs=              net,
                                                       num_outputs=         None,
                                                       kernel_size=         kernel_size,
                                                       depth_multiplier=    1.0,
                                                       stride=              stride,
                                                       padding=             conv2d_padding,
                                                       activation_fn=       None,
                                                       normalizer_fn=       model_config.normalizer_fn,
                                                       biases_initializer=  None,
                                                       weights_initializer= model_config.weights_initializer,
                                                       weights_regularizer= model_config.weights_regularizer,
                                                       trainable=           model_config.is_trainable,
                                                       scope=               scope + '_dwise_conv')
                    # pointwise conv with 1x1 kernal
                    # followed by batch_norm
                    net = slim.conv2d(inputs            = net,
                                      num_outputs       = ch_out_num,
                                      normalizer_fn     = None,
                                      biases_initializer= model_config.biases_initializer,
                                      scope             = scope + '_pwise_conv')

                    net = model_config.normalizer_fn(inputs=        net,
                                                     activation_fn= None)

                ch_in_shape = ch_in.get_shape().as_list()
                ch_in_num   = ch_in_shape[3]

                # shortcut connection
                if ch_in_num != ch_out_num:
                    shortcut_out    = slim.conv2d(inputs =              ch_in,
                                                  num_outputs=          ch_out_num,
                                                  normalizer_fn=        None,
                                                  biases_initializer=   model_config.biases_initializer,
                                                  scope=                scope + '_shortcut_conv1x1')
                else:
                    shortcut_out = ch_in

                if stride > 1:
                    shortcut_out = slim.max_pool2d(inputs=shortcut_out,
                                                   kernel_size=kernel_size,
                                                   stride=stride,
                                                   padding=conv2d_padding,
                                                   scope=scope + '_shortcut_maxpool')


                # Convert end_points_collection into a dictionary of end_points.
                end_points = slim.utils.convert_collection_to_dict(
                    endpoint_collection, clear_collection=True)


        # elementwise sum for shortcut connection
        net   = tf.add(x=shortcut_out,
                       y=net,
                       name=scope + '_shortcut_sum')

        end_points[sc.name + '_out'] = net
        end_points[sc.name + '_in'] = ch_in

    return net,end_points






def get_residual_module(ch_in,
                        ch_out_num,
                        model_config,
                        kernel_size=3,
                        stride=1,
                        scope=None):
    '''
    chin                          -->
    conv1x1x(ch_out_num/2)/1      --> batchnorm + relu6 -->
    conv3x3x(ch_out_num/2)/stride --> batchnorm + relu6 -->
    conv1x1xch_out_num/1          --> batchnorm -->
    shortcut_sum                  -->
    chout

    '''
    conv2d_padding = 'SAME'
    net = ch_in
    with tf.variable_scope(name_or_scope=scope, default_name='residual',values=[ch_in]) as sc:
        endpoint_collection = sc.original_name_scope + '_end_points'

        with slim.arg_scope([slim.conv2d,
                             slim.separable_convolution2d,
                             slim.max_pool2d],
                            outputs_collections=endpoint_collection):

            with slim.arg_scope([slim.conv2d],
                                stride              =1,
                                padding             ='SAME',
                                weights_initializer = model_config.weights_initializer,
                                weights_regularizer = model_config.weights_regularizer,
                                normalizer_fn       = model_config.normalizer_fn,
                                biases_initializer  = None,
                                trainable           = model_config.is_trainable,
                                activation_fn       = None):

                # batch normalization w/ relu6
                with slim.arg_scope([model_config.normalizer_fn],
                                    decay=model_config.batch_norm_decay,
                                    fused=model_config.batch_norm_fused,
                                    is_training=model_config.is_trainable,
                                    activation_fn=model_config.activation_fn):

                    net   = slim.conv2d(inputs=       net,
                                        num_outputs=  ch_out_num/2,
                                        kernel_size=  [1,1],
                                        scope=        scope + '_front_conv1x1')

                    net   = slim.conv2d(inputs=       net,
                                        num_outputs=  ch_out_num/2,
                                        kernel_size=  kernel_size,
                                        stride=       stride,
                                        padding=      conv2d_padding,
                                        scope=        scope + '_mid_conv3x3')

                # batch normalization w/o relu6
                    net   = slim.conv2d(inputs=             net,
                                        num_outputs=        ch_out_num,
                                        kernel_size=        [1,1],
                                        normalizer_fn=      None,
                                        biases_initializer= model_config.biases_initializer,
                                        scope=        scope + '_rear_conv1x1')

                    net = model_config.normalizer_fn(inputs=    net,
                                                     activation_fn=None)

                ch_in_shape = ch_in.get_shape().as_list()
                ch_in_num   = ch_in_shape[3]

                # shortcut connection
                if ch_in_num != ch_out_num:
                    shortcut_out = slim.conv2d(inputs               =ch_in,
                                               num_outputs          =ch_out_num,
                                               kernel_size          =[1,1],
                                               normalizer_fn        =None,
                                               biases_initializer   =model_config.biases_initializer,
                                               scope                =scope + '_shortcut_conv1x1')
                else:
                    shortcut_out = ch_in

                if stride > 1:
                    shortcut_out = slim.max_pool2d(inputs= shortcut_out,
                                                   kernel_size=kernel_size,
                                                   stride=  stride,
                                                   padding= conv2d_padding,
                                                   scope=scope + '_shortcut_maxpool')



                # Convert end_points_collection into a dictionary of end_points.
                end_points = slim.utils.convert_collection_to_dict(
                    endpoint_collection, clear_collection=True)

        # elementwise sum for shortcut connection
        net = tf.add(x=shortcut_out,
                     y=net,
                     name=scope + '_shortcut_sum')

        end_points[sc.name + '_out'] = net
        end_points[sc.name + '_in'] = ch_in

    return net,end_points


