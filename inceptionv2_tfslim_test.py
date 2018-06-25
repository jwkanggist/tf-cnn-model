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

import numpy as np

import tensorflow as tf
import tensorflow.contrib.slim as slim
from tensorflow.contrib.slim.nets import resnet_utils

# module import
from tfslim_module import gen_inception_v2_module

'''
    code reference: https://github.com/tensorflow/models/blob/master/research/deeplab/core/xception_test.py
'''

# where we adopt the NHWC format.


def create_test_input(batchsize,heightsize,widthsize,channelssize):

    '''Create test input tensor by tf.placeholder
        input : the size of 4d tensor
        return:
    '''

    if None in [batchsize, heightsize,widthsize,channelssize]:
        return tf.placeholder(tf.float32, [batchsize,heightsize,widthsize,channelssize])
    else:
        return tf.to_float(
            np.tile(
                np.reshpae(
                    np.reshape(np.arange(heightsize),[heightsize,1]) +
                    np.reshape(np.arange(widthsize), [1,widthsize]),
                    [1, heightsize,widthsize,1])
                    [batchsize,1,1,channelssize]))


class UtilityFunctionTest(tf.test.TestCase):

  def testSeparableConv2DSameWithInputEvenSize(self):
    n, n2 = 4, 2

    # Input image.
    x = create_test_input(1, n, n, 1)

    # Convolution kernel.
    dw = create_test_input(1, 3, 3, 1) # get input shape
    dw = tf.reshape(dw, [3, 3, 1, 1])

    tf.get_variable('Conv/depthwise_weights', initializer=dw)
    tf.get_variable('Conv/pointwise_weights',
                    initializer=tf.ones([1, 1, 1, 1]))
    tf.get_variable('Conv/biases', initializer=tf.zeros([1]))
    tf.get_variable_scope().reuse_variables()

    y1 = slim.separable_conv2d(x, 1, [3, 3], depth_multiplier=1,
                               stride=1, scope='Conv')
    y1_expected = tf.to_float([[14, 28, 43, 26],
                               [28, 48, 66, 37],
                               [43, 66, 84, 46],
                               [26, 37, 46, 22]])
    y1_expected = tf.reshape(y1_expected, [1, n, n, 1])

    #---------------------------------------------------

    y2 = resnet_utils.subsample(y1, 2)
    y2_expected = tf.to_float([[14, 43],
                               [43, 84]])
    y2_expected = tf.reshape(y2_expected, [1, n2, n2, 1])

    y3 = xception.separable_conv2d_same(x, 1, 3, depth_multiplier=1,
                                        regularize_depthwise=True,
                                        stride=2, scope='Conv')
    y3_expected = y2_expected

    y4 = slim.separable_conv2d(x, 1, [3, 3], depth_multiplier=1,
                               stride=2, scope='Conv')
    y4_expected = tf.to_float([[48, 37],
                               [37, 22]])
    y4_expected = tf.reshape(y4_expected, [1, n2, n2, 1])

    with self.test_session() as sess:
      sess.run(tf.global_variables_initializer())
      self.assertAllClose(y1.eval(), y1_expected.eval())
      self.assertAllClose(y2.eval(), y2_expected.eval())
      self.assertAllClose(y3.eval(), y3_expected.eval())
      self.assertAllClose(y4.eval(), y4_expected.eval())

  def testSeparableConv2DSameWithInputOddSize(self):
    n, n2 = 5, 3

    # Input image.
    x = create_test_input(1, n, n, 1)

    # Convolution kernel.
    dw = create_test_input(1, 3, 3, 1)
    dw = tf.reshape(dw, [3, 3, 1, 1])

    tf.get_variable('Conv/depthwise_weights', initializer=dw)
    tf.get_variable('Conv/pointwise_weights',
                    initializer=tf.ones([1, 1, 1, 1]))
    tf.get_variable('Conv/biases', initializer=tf.zeros([1]))
    tf.get_variable_scope().reuse_variables()

    y1 = slim.separable_conv2d(x, 1, [3, 3], depth_multiplier=1,
                               stride=1, scope='Conv')
    y1_expected = tf.to_float([[14, 28, 43, 58, 34],
                               [28, 48, 66, 84, 46],
                               [43, 66, 84, 102, 55],
                               [58, 84, 102, 120, 64],
                               [34, 46, 55, 64, 30]])
    y1_expected = tf.reshape(y1_expected, [1, n, n, 1])

    y2 = resnet_utils.subsample(y1, 2)
    y2_expected = tf.to_float([[14, 43, 34],
                               [43, 84, 55],
                               [34, 55, 30]])
    y2_expected = tf.reshape(y2_expected, [1, n2, n2, 1])

    y3 = xception.separable_conv2d_same(x, 1, 3, depth_multiplier=1,
                                        regularize_depthwise=True,
                                        stride=2, scope='Conv')
    y3_expected = y2_expected

    y4 = slim.separable_conv2d(x, 1, [3, 3], depth_multiplier=1,
                               stride=2, scope='Conv')
    y4_expected = y2_expected

    with self.test_session() as sess:
      sess.run(tf.global_variables_initializer())
      self.assertAllClose(y1.eval(), y1_expected.eval())
      self.assertAllClose(y2.eval(), y2_expected.eval())
      self.assertAllClose(y3.eval(), y3_expected.eval())
      self.assertAllClose(y4.eval(), y4_expected.eval())



'''
/* inception v2 module io */
def get_inception_v2_module(ch_in,
                           inception_conv_chout_num,
                           model_config,
                           stride=2,
                           scope=None):
                           
/* separable_conv2d module io */
def get_separable_conv2d_module(ch_in,
                                ch_out_num,
                                model_config,
                                kernel_size=3,
                                stride=1,
                                scope=None):
    
/* linear bottleneck modeul */
def get_linear_bottleneck_module(ch_in,
                                ch_out_num,
                                model_config,
                                kernel_size=3,
                                stride=1,
                                scope=None):

/* inverted bottleneck module */
def get_inverted_bottleneck_module(ch_in,
                                ch_out_num,
                                expand_ch_num,
                                model_config,
                                kernel_size=3,
                                stride=1,
                                scope=None):  
/* residual module */
def get_residual_module(ch_in,
                        ch_out_num,
                        model_config,
                        kernel_size=3,
                        stride=1,
                        scope=None):                              
'''

class XceptionNetworkTest(tf.test.TestCase):
  """Tests with small Xception network."""


  def __init__(self, ):


  def testClassificationEndPoints(self):


  def testEndpointNames(self):


  def testClassificationShapes(self):


  def testFullyConvolutionalEndpointShapes(self):



  def testUnknownBatchSize(self):


  def testFullyConvolutionalUnknownHeightWidth(self):






if __name__ == '__main__':
  tf.test.main()




