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

# from os import getcwd
# import sys
# sys.path.insert(0,getcwd())
# print ('getcwd() at test_util.py = %s' % getcwd())

import numpy as np
import tensorflow as tf
import tensorflow.contrib.slim as slim

# module import
from tf_conv_module import get_inception_v2_module
from tf_conv_module import get_separable_conv2d_module
from tf_conv_module import get_linear_bottleneck_module
from tf_conv_module import get_inverted_bottleneck_module
from tf_conv_module import get_residual_module

from tf_deconv_module import get_nearest_neighbor_unpool2d_module
from tf_deconv_module import get_transconv_unpool2d_module

def create_test_input(batchsize,heightsize,widthsize,channelnum):

    '''Create test input tensor by tf.placeholder
        input : the size of 4d tensor
        return:
    '''

    if None in [batchsize, heightsize,widthsize,channelnum]:
        return tf.placeholder(tf.float32, [batchsize,heightsize,widthsize,channelnum])
    else:
        return tf.to_float(
            np.tile(
                np.reshape(
                    np.reshape(np.arange(heightsize),[heightsize,1]) +
                    np.reshape(np.arange(widthsize), [1,widthsize]),
                    [1, heightsize,widthsize,1]),
                    [batchsize,1,1,channelnum]))





def get_module(ch_in,
                 ch_out_num,
                 model_config,
                 layer_index=0,
                 kernel_size=3,
                 stride=1,
                 conv_type='residual',
                 scope=None):

    scope = scope + str(layer_index)
    ch_in_num   = ch_in.get_shape().as_list()[3]
    net = ch_in


    inception_chout_num_list = inception_conv_chout_num()
    with tf.variable_scope(name_or_scope=scope, default_name='test_module', values=[ch_in]):

        if conv_type == 'residual':
            net,end_points = get_residual_module(ch_in=net,
                                                  ch_out_num=ch_out_num,
                                                  model_config=model_config,
                                                  kernel_size=kernel_size,
                                                  stride=stride,
                                                  scope=conv_type)

        elif conv_type == 'inceptionv2':

            net,end_points = get_inception_v2_module(ch_in=net,
                                                      inception_conv_chout_num=inception_chout_num_list,
                                                      model_config=model_config,
                                                      stride=stride,
                                                      scope=conv_type)

        elif conv_type == 'separable_conv2d':

            net,end_points = get_separable_conv2d_module(ch_in=net,
                                                          ch_out_num=ch_out_num,
                                                          model_config=model_config,
                                                          kernel_size=kernel_size,
                                                          stride=stride,
                                                          scope=conv_type)
        elif conv_type == 'linear_bottleneck':

            net,end_points = get_linear_bottleneck_module(ch_in=net,
                                                           ch_out_num=ch_out_num,
                                                           model_config=model_config,
                                                           kernel_size=kernel_size,
                                                           stride=stride,
                                                           scope=conv_type)
        elif conv_type == 'inverted_bottleneck':

            expand_ch_num   = np.floor(ch_in_num*2.0)
            net,end_points = get_inverted_bottleneck_module(ch_in=net,
                                                             ch_out_num=ch_out_num,
                                                             expand_ch_num=expand_ch_num,
                                                             model_config=model_config,
                                                             kernel_size=kernel_size,
                                                             stride=stride,
                                                             scope=conv_type)
    return net,end_points




def get_deconv_module(inputs,
                        unpool_rate,
                        module_type,
                        layer_index=0,
                        scope=None,
                        model_config=None):

    scope = scope + str(layer_index)
    net = inputs

    with tf.variable_scope(name_or_scope =scope,default_name='unittest0',values=[inputs]):

        if module_type is 'nearest_neighbor_unpool':
            net,endpoint = get_nearest_neighbor_unpool2d_module(inputs=net,
                                                               unpool_rate=unpool_rate,
                                                               scope =module_type)
        elif module_type is 'conv2dtrans_unpool':
            net,endpoint = get_transconv_unpool2d_module(inputs=net,
                                                          unpool_rate=unpool_rate,
                                                          model_config=model_config,
                                                          scope=module_type)
    return net,endpoint




class inception_conv_chout_num(object):

    def __init__(self):

        self.net1 = [96, 96, 32]
        self.net2 = [96, 128]
        self.net3 = [96]


class ModuleEndpointName(object):

    def __init__(self,conv_type,input_shape,output_shape):

        input_shape     = input_shape
        output_shape    = output_shape
        if conv_type == 'inceptionv2':
            chnum_list = inception_conv_chout_num()
            self.name_list = ['unittest0/inceptionv2_in',
                             'unittest0/inceptionv2/inceptionv2_net1_conv1x1',
                             'unittest0/inceptionv2/inceptionv2_net1_conv3x3_1',
                             'unittest0/inceptionv2/inceptionv2_net1_conv3x3_2',
                             'unittest0/inceptionv2/inceptionv2_net2_conv1x1',
                             'unittest0/inceptionv2/inceptionv2_net2_conv3x3',
                             'unittest0/inceptionv2/inceptionv2_net3_maxpool3x3',
                             'unittest0/inceptionv2/inceptionv2_net3_conv1x1',
                             'inceptionv2/inceptionv2_concat',
                             'unittest0/inceptionv2_out']

            self.shape_dict = {
                                self.name_list[0]:input_shape,
                                self.name_list[1]:[input_shape[0],  input_shape[1], input_shape[2],     chnum_list.net1[0]],
                                self.name_list[2]:[input_shape[0],  input_shape[1], input_shape[2],     chnum_list.net1[1]],
                                self.name_list[3]:[output_shape[0], output_shape[1],output_shape[2],    chnum_list.net1[2]],
                                self.name_list[4]:[input_shape[0],  input_shape[1], input_shape[2],     chnum_list.net2[0]],
                                self.name_list[5]:[output_shape[0], output_shape[1],output_shape[2],    chnum_list.net2[1]],
                                self.name_list[6]:[output_shape[0], output_shape[1],output_shape[2],    input_shape[3]],
                                self.name_list[7]:[output_shape[0], output_shape[1],output_shape[2],    chnum_list.net3[0]],
                                self.name_list[8]:output_shape,
                                self.name_list[9]:output_shape,
                                }

        elif conv_type == 'separable_conv2d':
            self.name_list = ['unittest0/separable_conv2d_in',
                             'unittest0/separable_conv2d/separable_conv2d_dwise_conv',
                             'unittest0/separable_conv2d/separable_conv2d_pwise_conv',
                             'unittest0/separable_conv2d_out']

            self.shape_dict = {
                                self.name_list[0]: input_shape,
                                self.name_list[1]: [input_shape[0], output_shape[1], output_shape[2], input_shape[3]],
                                self.name_list[2]: output_shape,
                                self.name_list[3]: output_shape,
                                }

        elif conv_type == 'residual':
            self.name_list = [ 'unittest0/residual_in',
                                'unittest0/residual/residual_front_conv1x1',
                                'unittest0/residual/residual_mid_conv3x3',
                                'unittest0/residual/residual_rear_conv1x1',
                                'unittest0/residual/residual_shortcut_conv1x1',
                                'unittest0/residual/residual_shortcut_maxpool',
                                'unittest0/residual_out']
            self.shape_dict = {
                                self.name_list[0]: input_shape,
                                self.name_list[1]: [input_shape[0], input_shape[1], input_shape[2], output_shape[3] / 2.0],
                                self.name_list[2]: [output_shape[0], output_shape[1], output_shape[2], output_shape[3] / 2.0],
                                self.name_list[3]: output_shape,
                                self.name_list[4]: [input_shape[0], input_shape[1], input_shape[2], output_shape[3]],
                                self.name_list[5]: output_shape,
                                self.name_list[6]: output_shape,
                                }

        elif conv_type == 'inverted_bottleneck':
            self.name_list = ['unittest0/inverted_bottleneck_in',
                                'unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck',
                                'unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv',
                                'unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv',
                                'unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1',
                                'unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_maxpool',
                                'unittest0/inverted_bottleneck_out']
            self.shape_dict ={
                                self.name_list[0]: input_shape,
                                self.name_list[1]: [input_shape[0], input_shape[1], input_shape[2], input_shape[3] * 2.0],
                                self.name_list[2]: [output_shape[0], output_shape[1], output_shape[2], input_shape[3] * 2.0],
                                self.name_list[3]: output_shape,
                                self.name_list[4]: [input_shape[0], input_shape[1], input_shape[2], output_shape[3]],
                                self.name_list[5]: output_shape,
                                self.name_list[6]: output_shape,
                                }

        elif conv_type == 'linear_bottleneck':
            self.name_list = ['unittest0/linear_bottleneck_in',
                             'unittest0/linear_bottleneck/linear_bottleneck_dwise_conv',
                             'unittest0/linear_bottleneck/linear_bottleneck_pwise_conv',
                             'unittest0/linear_bottleneck/linear_bottleneck_bottleneck',
                             'unittest0/linear_bottleneck_out']

            self.shape_dict = {
                                self.name_list[0]: input_shape,
                                self.name_list[1]: [input_shape[0], output_shape[1], output_shape[2], input_shape[3]],
                                self.name_list[2]: [input_shape[0], output_shape[1], output_shape[2], input_shape[3]],
                                self.name_list[3]: output_shape,
                                self.name_list[4]: output_shape,
                                }

        elif conv_type == 'conv2dtrans_unpool':
            self.name_list = ['conv2dtrans_unpool_in',
                              'unitest0/conv2dtrans_unpool/conv2dtrans_unpool',
                              'conv2dtrans_unpool_out']

            self.shape_dict = {
                                self.name_list[0]: input_shape,
                                self.name_list[1]:output_shape,
                                self.name_list[2]: output_shape,
                                }



class ModelTestConfig(object):

    def __init__(self):

        self.is_trainable       = True
        self.weights_initializer = tf.contrib.layers.xavier_initializer()
        self.weights_regularizer = tf.contrib.layers.l2_regularizer(4E-5)
        self.biases_initializer  = slim.init_ops.zeros_initializer()
        self.normalizer_fn      = slim.batch_norm

        self.activation_fn      = tf.nn.relu6
        self.dtype              = tf.float32

        # batch_norm
        self.batch_norm_decay   = 0.999
        self.batch_norm_fused   = True


        # meta parameter
        self.depth_multiplier   = 1.0
        self.resol_multiplier   = 1.0

        # for unpoolinbg
        self.unpool_weights_initializer = tf.contrib.layers.xavier_initializer()
        self.unpool_weights_regularizer = tf.contrib.layers.l2_regularizer(4E-5)
        self.unpool_biases_initializer  = slim.init_ops.zeros_initializer()
        self.unpool_normalizer_fn      = slim.batch_norm
        self.unpool_activation_fn      = tf.nn.relu6

        # batch_norm
        self.unpool_batch_norm_decay   = 0.999
        self.unpool_batch_norm_fused   = True