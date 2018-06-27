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
