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



def get_inception_v2_module(ch_in,
                           inception_conv_chout_num,
                           model_config,
                           stride=1,
                           scope=None):
    '''
        # net1 : 1x1 (batchnorm) --> 3x3/1 --> 3x3/2 (batchnorm)
        # net2 : 1x1 (batchnorm) --> 3x3/2 (batchnorm)
        # net3 : maxpool         --> 1x1 (batchnorm)
        # net4 : 1x1 (batchnorm)
        # where all convolution module is followed by batch_norm.
        # The relu activation is performed once just after filter concanternation.
        -----------------------------------------------------------------
        inception_conv_chout_num.net1   = [ conv1x1, conv3x3, conv3x3/2]
        inception_conv_chout_num.net2   = [ conv1x1, conv3x3/2]
        inception_conv_chout_num.net3   = [ conv1x1 ]
        inception_conv_chout_num.net4   = [ conv1x1/2]
        -----------------------------------------------------------------
        # 180620 note for inception v2 config
        inception_conv_chout_num.net1   = [ 16, 32, 32]
        inception_conv_chout_num.net2   = [ 96, 128]
        inception_conv_chout_num.net3   = [ 32 ]
        inception_conv_chout_num.net4   = [ 64 ]
    '''

    net1    = ch_in
    net2    = ch_in
    net3    = ch_in
    net4    = ch_in

    with tf.variable_scope(name_or_scope=scope,default_name='inceptionv2_module',value=[ch_in]):


        with slim.arg_scope([slim.conv2d],
                            weights_initializer = model_config.weights_initializer,
                            weights_regularizer = model_config.weights_regularizer,
                            biases_initializer  = model_config.biases_initializer,
                            trainable           = model_config.is_training,
                            activation_fn       = None):

            # ---------------------------------------------
            # net1
            # ---------------------------------------------
            # conv 1x1
            net1    = slim.conv2d(inputs=        net1,
                                  num_outputs=  inception_conv_chout_num.net1[0],
                                  kernel_size=  [1,1],
                                  stride=       1,
                                  normalizer_fn=None,
                                  scope=        scope + '_net1_conv1x1/1')

            net1    = slim.batch_norm(inputs=   net1,
                                      decay=    model_config.batch_norm_decay,
                                      fused=    model_config.batch_norm_fused,
                                      is_training= model_config.is_training,
                                      activation_fn=None)
            # conv 3x3/1
            net1    = slim.conv2d(inputs=        net1,
                                  num_outputs=  inception_conv_chout_num.net1[1],
                                  kernel_size=  [3,3],
                                  stride=       1,
                                  normalizer_fn=None,
                                  scope=        scope + '_net1_conv3x3/1')


            # conv 3x3/2
            net1    = slim.conv2d(inputs=        net1,
                                  num_outputs=  inception_conv_chout_num.net1[2],
                                  kernel_size=  [3,3],
                                  stride=       stride,
                                  normalizer_fn=None,
                                  scope=        scope +'_net1_conv3x3/2')

            net1    = slim.batch_norm(inputs=   net1,
                                      decay=    model_config.batch_norm_decay,
                                      fused=    model_config.batch_norm_fused,
                                      is_training= model_config.is_training,
                                      activation_fn=None)

            # ---------------------------------------------
            # net2
            # ---------------------------------------------
            with slim.arg_scope([model_config.normalizer_fn],
                                decay=model_config.batch_norm_decay,
                                fused=model_config.batch_norm_fused,
                                is_training=model_config.is_training,
                                activation_fn=None):

                # conv 1x1 w/ batch norm
                net2    = slim.conv2d(inputs=       net2,
                                      num_outputs=  inception_conv_chout_num.net2[0],
                                      kernel_size=  [1,1],
                                      stride=       1,
                                      normalizer_fn=model_config.normalizer_fn,
                                      scope=        scope + '_net2_conv1x1/1')


                # conv 3x3/2 w/ batch norm
                net2    = slim.conv2d(inputs=   net2,
                                      num_outputs=  inception_conv_chout_num.net2[1],
                                      kernel_size=  [3,3],
                                      stride=       stride,
                                      normalizer_fn=model_config.normalizer_fn,
                                      scope=        scope + '_net2_conv3x3/2')

            # ---------------------------------------------
            # net3
            # ---------------------------------------------
                net3    = tf.nn.max_pool(input= net3,
                                         ksize= [1,3,3,1],
                                         strides=[1,stride,stride,1],
                                         padding="VALID",
                                         name= scope + '_net3_maxpool/2')

                net3    = slim.conv2d(inputs=       net3,
                                      num_outputs=  inception_conv_chout_num.net3[0],
                                      kernel_size=  [1,1],
                                      stride=       1,
                                      normalizer_fn=model_config.normalizer_fn,
                                      scope=        scope + '_net3_conv1x1/1')

            # ---------------------------------------------
            # net4
            # ---------------------------------------------
                net4    = slim.conv2d(inputs=       net4,
                                      num_outputs=  inception_conv_chout_num.net4[0],
                                      kernel_size=  [1,1],
                                      stride=       stride,
                                      normalizer_fn=model_config.normalizer_fn,
                                      scope=        scope + '_net4_conv1x1/2')

                                      

        net  = tf.concat(values=[net1,net2,net3,net4],
                        axis=0,
                        name=scope + '_concat')

        net = model_config.activation_fn(features=net,
                                         name=scope + '_act')

    return net

def get_separable_conv2d_module(ch_in,
                                ch_out_num,
                                model_config,
                                kernel_size=3,
                                stride=1,
                                scope=None):

    net = ch_in

    with tf.variable_scope(name_or_scope=scope,default_name='separable_conv2d',values=[ch_in]):

        with slim.arg_scope([slim.batch_norm],
                            decay= model_config.batch_norm_decay,
                            fused= model_config.batch_norm_fused,
                            is_training=model_config.is_trainable,
                            activation_fn=model_config.activation_fn):




    return net


def get_linear_bottleneck_module(ch_in,
                                ch_out_num,
                                model_config,
                                kernel_size=3,
                                stride=1,
                                scope=None):


    return net


def get_inverted_residual_module(ch_in,
                        ch_out_num,
                        model_config,
                        kernel_size=3,
                        stride=1,
                        scope=None):

    return net


def get_residual_module(ch_in,
                        ch_out_num,
                        model_config,
                        kernel_size=3,
                        stride=1,
                        scope=None):

    '''
    chin                   -->
    conv1x1x(ch_out_num/2) --> batchnorm + relu6 -->
    conv3x3x(ch_out_num/2) --> batchnorm + relu6 -->
    conv1x1xch_out_num     --> batchnorm -->
    shortcut_cum           --> chout

    '''
    net = ch_in
    with tf.variable_scope(name_or_scope=scope, default_name='residual_module',values=[ch_in]):


        with slim.arg_scope([slim.conv2d],
                            weights_initializer = model_config.weights_initializer,
                            weights_regularizer = model_config.weights_regularizer,
                            biases_initializer  = model_config.biaes_initializer,
                            normalizer_fn       = model_config.normalizer_fn,
                            trainable           = model_config.is_trainable,
                            activation_fn       =None,
                            padding             ='SAME'):

            with slim.arg_scope([model_config.normalizer_fn],
                                decay=model_config.batch_norm_decay,
                                fused=model_config.batch_norm_fused,
                                is_training=model_config.is_trainable,
                                activation_fn=model_config.activation_fn):

                # batch normalization w/ relu6
                net   = slim.conv2d(inputs=       net,
                                    num_outputs=  ch_out_num/2,
                                    kernel_size=  [1,1],
                                    stride=1,
                                    scope=        scope + '_front_conv1x1')

                net   = slim.conv2d(inputs=       net,
                                    num_outputs=  ch_out_num/2,
                                    kernel_size=  kernel_size,
                                    stride=       stride,
                                    scope=        scope + '_mid_conv3x3')

            with slim.arg_scope([model_config.normalizer_fn],
                                decay=model_config.batch_norm_decay,
                                fused=model_config.batch_norm_fused,
                                is_training=model_config.is_trainable,
                                activation_fn=None):

                # batch normalization w/o relu6
                net   = slim.conv2d(inputs=       net,
                                    num_outputs=  ch_out_num,
                                    kernel_size=  [1,1],
                                    stride=       1,
                                    scope=        scope + '_rear_conv1x1')

        # elementwise sum for shortcut connection
        net   = tf.add(x=ch_in,
                       y=net,
                       name=scope + '_shortcut_sum')


    return net



