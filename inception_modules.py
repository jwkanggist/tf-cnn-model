#-*- coding: utf-8 -*-
#! /usr/bin/env python
'''
    filename: inception_modules.py

    description: providing a set of inception modules
    - inception v1
        Going deeper with convolutions
        Christian Szegedy, Wei Liu, Yangqing Jia, Pierre Sermanet, Scott Reed,
        Dragomir Anguelov, Dumitru Erhan, Vincent Vanhoucke, Andrew Rabinovich.
        http://arxiv.org/pdf/1409.4842v1.pdf.



    author: Jaewook Kang
    final date  : 2018 Mar

'''
import numpy as np
import tensorflow as tf

from cnn_layer_modules import PoolingLayer
from cnn_layer_modules import Conv2dLayer


class InceptionV1(object):

    def __init__(self,
                 layer_index,
                 num_input_channels,
                 num_output_channels,
                 num_conv1x1_channels,
                 num_reduce_conv3x3_channels,
                 num_conv3x3_channels,
                 num_reduce_conv5x5_channels,
                 num_conv5x5_channels,
                 num_reduce_pooling_channels,
                 activation_type='relu',
                 dtype = tf.float32):

        self.layer_index = layer_index
        self.variable_scope_name=  'inceptionv1_' + activation_type + '_' + str(self.layer_index)

        self.num_input_channels     = num_input_channels
        self.num_output_channels    = num_output_channels

        self.num_conv1x1_channels       = num_conv1x1_channels
        self.num_reduce_conv3x3_channels= num_reduce_conv3x3_channels
        self.num_conv3x3_channels       = num_conv3x3_channels
        self.num_reduce_conv5x5_channels= num_reduce_conv5x5_channels
        self.num_conv5x5_channels       = num_conv5x5_channels
        self.num_reduce_pooling_channels= num_reduce_pooling_channels

        self.activation_type        = activation_type
        self.dtype                  = dtype

        # conv layer components

        self.conv1x1_layer          = Conv2dLayer(  layer_index= self.layer_index * 10 + 1,
                                                    num_input_channels=num_input_channels,
                                                    filter_size=1,
                                                    num_filters=self.num_conv1x1_channels,
                                                    filter_stride=1,
                                                    filter_padding="SAME",
                                                    activation_type=self.activation_type,
                                                    dtype=self.dtype)

        self.reduce_conv3x3_layer   = Conv2dLayer(  layer_index=self.layer_index * 10 + 2,
                                                    num_input_channels=num_input_channels,
                                                    filter_size=1,
                                                    num_filters=self.num_reduce_conv3x3_channels,
                                                    filter_stride=1,
                                                    filter_padding="SAME",
                                                    activation_type=self.activation_type,
                                                    dtype=self.dtype)

        self.conv3x3_layer          = Conv2dLayer(  layer_index=self.layer_index * 10 + 3,
                                                    num_input_channels=num_reduce_conv3x3_channels,
                                                    filter_size=3,
                                                    num_filters=self.num_conv3x3_channels,
                                                    filter_stride=1,
                                                    filter_padding="SAME",
                                                    activation_type=self.activation_type,
                                                    dtype=self.dtype)

        self.reduce_conv5x5_layer   = Conv2dLayer(  layer_index=self.layer_index * 10 + 4,
                                                    num_input_channels=num_input_channels,
                                                    filter_size=1,
                                                    num_filters=self.num_reduce_conv5x5_channels,
                                                    filter_stride=1,
                                                    filter_padding="SAME",
                                                    activation_type=self.activation_type,
                                                    dtype=self.dtype)

        self.conv5x5_layer          = Conv2dLayer(  layer_index=self.layer_index * 10 + 5,
                                                    num_input_channels=num_reduce_conv5x5_channels,
                                                    filter_size=5,
                                                    num_filters=self.num_conv5x5_channels,
                                                    filter_stride=1,
                                                    filter_padding="SAME",
                                                    activation_type=self.activation_type,
                                                    dtype=self.dtype)

        self.pooling_layer = PoolingLayer(  layer_index=self.layer_index * 10 + 6,
                                            num_input_channels=self.num_input_channels,
                                            tile_size=3,
                                            pool_stride=3,
                                            pool_padding='VALID',
                                            pooling_type='max')

        self.reduce_pooling_layer   = Conv2dLayer( layer_index=self.layer_index * 10 + 7,
                                                    num_input_channels=self.num_input_channels,
                                                    filter_size=1,
                                                    num_filters=self.num_reduce_pooling_channels,
                                                    filter_stride=1,
                                                    filter_padding="SAME",
                                                    activation_type=self.activation_type,
                                                    dtype=self.dtype)

        # tf variable generation
        self.get_inception_v1_tfvariables()


    def get_inception_v1_tfvariables(self):
        # where we declear tf variable for inception modules
        with tf.variable_scope(name_or_scope= self.variable_scope_name):
            self.conv1x1_layer.get_conv2dlayer_tfvariables()
            self.conv3x3_layer.get_conv2dlayer_tfvariables()
            self.conv5x5_layer.get_conv2dlayer_tfvariables()
            self.reduce_conv3x3_layer.get_conv2dlayer_tfvariables()
            self.reduce_conv5x5_layer.get_conv2dlayer_tfvariables()
            self.reduce_pooling_layer.get_conv2dlayer_tfvariables()

    def concatenation(self):


    def activation(self):
        # where we activate the inception module according to act_type


    def make_inception_module(self):
    #   where we build inception module


    #
    #     def get_conv2dlayer_tfvariables(self):
    #         with tf.variable_scope(name_or_scope=self.variable_scope_name):
    #             self.filter_weight = tf.get_variable(name="weights",
    #                                                  shape=self.filter_shape,
    #                                                  dtype=self.dtype,
    #                                                  initializer=tf.random_normal_initializer(mean=0.0,
    #                                                                                           stddev=0.1,
    #                                                                                           seed=SEED))
    #
    #             self.layer_bias = tf.get_variable(name="bias",
    #                                               shape=self.bias_shape,
    #                                               dtype=self.dtype,
    #                                               initializer=tf.random_normal_initializer(mean=0.0,
    #                                                                                        stddev=0.1,
    #                                                                                        seed=SEED))
     #         return self.filter_weight, self.layer_bias
    #
    #     def activation(self):
    #
    #         if self.activation_type == 'relu':
    #             self.layer_out = tf.nn.relu(features=self.layer_logit,
    #                                         name=self.variable_scope_name + '_actfunc')
    #             # print('[%s] Activation function = %s ' % (self.variable_scope_name,self.activation_type))
    #
    #         elif self.activation_type == 'softmax':
    #             self.layer_out = tf.nn.softmax(logits=self.layer_logit,
    #                                            name=self.variable_scope_name + '_actfunc')
    #             # print('[%s] Activation function = %s ' % (self.variable_scope_name,self.activation_type))
    #
    #         elif self.activation_type == 'tanh':
    #             self.layer_out = tf.nn.tanh(x=self.layer_logit,
    #                                         name=self.variable_scope_name + '_actfunc')
    #             # print('[%s] Activation function = %s ' % (self.variable_scope_name,self.activation_type))
    #         elif self.activation_type == 'none':
    #             self.layer_out = self.layer_logit
    #             # print('[%s] Configure to no activation' % self.variable_scope_name)
    #
    #         else:
    #             print('[%s] Activation function named %s is not supported' % (
    #             self.variable_scope_name, self.activation_type))
    #
    #         return self.layer_out
    #
    #     def make_conv2dlayer(self, layer_input):
    #
    #         with tf.name_scope(self.variable_scope_name):
    #             conv = tf.nn.conv2d(input=layer_input,
    #                                 filter=self.filter_weight,
    #                                 strides=self.filter_stride_shape,
    #                                 padding=self.filter_padding)
    #
    #             self.layer_logit = tf.nn.bias_add(conv, self.layer_bias)
    #             self.layer_out = self.activation()
    #
    #         return self.layer_out
    #
    #




