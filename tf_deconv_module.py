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

import numpy as np

# where we adopt the NHWC format.


'''
    deconvolutional layer modules

'''

def get_nearest_neighbor_unpool2d_module(inputs,
                                         unpool_rate,
                                         scope = None):
    '''
        the neareset neighbor unpooling implementation via
        tf.reshape and tf.concat
        written by jwkang, 2018 June
    '''
    input_shape = inputs.get_shape().as_list()
    batch_size   = input_shape[0]
    height      = input_shape[1]
    width       = input_shape[2]
    channelnum  = input_shape[3]

    unpool_rate_sqr         = unpool_rate * unpool_rate
    shape_for_reshape       = [batch_size, unpool_rate, unpool_rate, channelnum]
    end_points              = {}

    with tf.variable_scope(name_or_scope=scope,
                           default_name='nearest_neighbor_unpool',
                           values=[inputs]) as sc:

        inputs_reshaped     = tf.reshape(tensor=inputs,
                                         shape=[batch_size,height*width,1,channelnum])

        # tf tile is not supported for tflite (180627)
        input_broadcasted   = tf.tile(input=inputs_reshaped,
                                      multiples=[1,1,unpool_rate_sqr,1])

        # the first block row matrix
        index = 0
        output = tf.reshape(tensor=input_broadcasted[:, index, :, :],
                            shape=shape_for_reshape)

        for w_index in range(1, width):
            index = w_index
            curr_mat = tf.reshape(tensor=input_broadcasted[:, index, :, :],
                                  shape=shape_for_reshape)

            output = tf.concat(values=[output, curr_mat],
                               axis=2)

        # from the second to the last row matrices
        for h_index in range(1,height):

            index         = h_index * width
            block_row_mat = tf.reshape(tensor=input_broadcasted[:, index, :, :],
                                       shape=shape_for_reshape)

            for w_index in range(1, width):

                index           = h_index * width + w_index
                curr_mat        = tf.reshape(tensor=input_broadcasted[:,index,:,:],
                                             shape=shape_for_reshape)
                block_row_mat   = tf.concat(values = [block_row_mat,curr_mat],axis=2)

            output  = tf.concat(values= [output,block_row_mat],
                                axis=1,
                                name=scope + '_out')
            end_points[sc.name + '_out'] = output
            end_points[sc.name + '_in'] = inputs

    return output,end_points





def get_transconv_unpool2d_module(inputs,
                                unpool_rate,
                                model_config,
                                scope = None):

    '''
        Learnable unpooling implemented by slim.conv2d_transpose()
        written by jwkang 2018 June

        -----------------------------------

        outputsize = (w - 1) * s + k -2p

        - w is the width size ( which is the same with the size of height)
        - s is the stride size
        - k is the kernel size
        - p is the padding num
        where we generally set s == k and p=0 such that

        outputsize = ( w - 1) * s + s
        -----------------------------------
    '''

    net = inputs
    input_shape = net.get_shape().as_list()
    ch_out_num  = input_shape[3]

    with tf.variable_scope(name_or_scope=scope,
                           default_name='conv2dtrans_unpool',
                           values=[inputs]) as sc:

        endpoint_collection = sc.original_name_scope + '_end_points'

        with slim.arg_scope([slim.conv2d_transpose],
                            outputs_collections = endpoint_collection,
                            kernel_size         = unpool_rate,
                            stride              = unpool_rate,
                            weights_initializer = model_config.unpool_weights_initializer,
                            weights_regularizer = model_config.unpool_weights_regularizer,
                            biases_initializer  = model_config.unpool_biases_initializer,
                            trainable           = model_config.is_trainable,
                            activation_fn       = None,
                            padding             = 'VALID'):


            with slim.arg_scope([model_config.unpool_normalizer_fn],
                                decay           = model_config.unpool_batch_norm_decay,
                                fused           = model_config.unpool_batch_norm_fused,
                                is_training     = model_config.is_trainable,
                                activation_fn   = model_config.unpool_activation_fn):

                # conv2d transpose
                net     = slim.conv2d_transpose(inputs          = net,
                                                num_outputs     = ch_out_num,
                                                normalizer_fn   = model_config.unpool_normalizer_fn,
                                                scope           =  scope)


        # Convert end_points_collection into a dictionary of end_points.
        end_points = slim.utils.convert_collection_to_dict(
            endpoint_collection, clear_collection=True)

        end_points[scope + '_out'] = net
        end_points[scope + '_in'] = inputs

    return net, end_points

# def get_bedofnails_unpool_module():
# def get_max_unpool_module():

