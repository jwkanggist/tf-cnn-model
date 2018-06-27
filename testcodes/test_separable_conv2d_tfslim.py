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

from os import getcwd
import numpy as np
import six
from datetime import datetime
from os import getcwd
import sys
sys.path.insert(0,getcwd())
sys.path.insert(0,getcwd()+'/testcodes')

import tensorflow as tf
import tensorflow.contrib.slim as slim

# module import
from tf_conv_module import get_inception_v2_module
from tf_conv_module import get_separable_conv2d_module
from tf_conv_module import get_linear_bottleneck_module
from tf_conv_module import get_inverted_bottleneck_module
from tf_conv_module import get_residual_module

from test_util  import create_test_input


TEST_MODULE_NAME =  'separable_conv2d'


'''
    code reference: https://github.com/tensorflow/models/blob/master/research/deeplab/core/xception_test.py
'''

# where we adopt the NHWC format.
class inception_conv_chout_num(object):

    def __init__(self):

        self.net1 = [96, 96, 32]
        self.net2 = [96, 128]
        self.net3 = [96]



# class CheckModuleOps(tf.test.TestCase):
    # TBU

class ModuleEndpointName(object):

    def __init__(self,conv_type,input_shape,output_shape):

        input_shape     = input_shape
        output_shape    = output_shape
        if conv_type == 'inceptionv2':
            chnum_list = inception_conv_chout_num()
            self.name_list = ['unittest0_inceptionv2/inceptionv2_net1_conv1x1',
                            'unittest0_inceptionv2/inceptionv2_net1_conv3x3_1',
                            'unittest0_inceptionv2/inceptionv2_net1_conv3x3_2',
                             'unittest0_inceptionv2/inceptionv2_net2_conv1x1',
                             'unittest0_inceptionv2/inceptionv2_net2_conv3x3',
                             'unittest0_inceptionv2/unittest0_inceptionv2/inceptionv2_net3_maxpool3x3',
                             'unittest0_inceptionv2/inceptionv2_net3_conv1x1',
                             'unittest0_inceptionv2/inceptionv2_concat',
                             'unittest0_inceptionv2_out']

            self.shape_dict = {
                                self.name_list[0]:[input_shape[0],  input_shape[1], input_shape[2],     chnum_list.net1[0]],
                                self.name_list[1]:[input_shape[0],  input_shape[1], input_shape[2],     chnum_list.net1[1]],
                                self.name_list[2]:[output_shape[0], output_shape[1],output_shape[2],    chnum_list.net1[2]],
                                self.name_list[3]:[input_shape[0],  input_shape[1], input_shape[2],     chnum_list.net2[0]],
                                self.name_list[4]:[output_shape[0], output_shape[1],output_shape[2],    chnum_list.net2[1]],
                                self.name_list[5]:[output_shape[0], output_shape[1],output_shape[2],    input_shape[3]],
                                self.name_list[6]:[output_shape[0], output_shape[1],output_shape[2],    chnum_list.net3[0]],
                                self.name_list[7]:output_shape,
                                self.name_list[8]:output_shape,
                                }

        elif conv_type == 'separable_conv2d':
            self.name_list = ['unittest0_separable_conv2d/separable_conv2d_dwise_conv',
                              'unittest0_separable_conv2d/separable_conv2d_pwise_conv',
                              'unittest0_separable_conv2d_out']

            self.shape_dict = {
                                self.name_list[0]:input_shape,
                                self.name_list[1]:output_shape,
                                self.name_list[2]:output_shape,
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


class ModuleTest(tf.test.TestCase):

    def _get_module(self,ch_in,
                         ch_out_num,
                         model_config,
                         layer_index=0,
                         kernel_size=3,
                         stride=1,
                         conv_type=TEST_MODULE_NAME,
                         scope=None):

        scope = scope + str(layer_index) + '_' + TEST_MODULE_NAME
        net = ch_in

        inception_chout_num_list = inception_conv_chout_num()
        with tf.name_scope(name=scope, default_name='test_module', values=[ch_in]):

            if conv_type == 'residual':
                net = get_residual_module(ch_in=net,
                                          ch_out_num=ch_out_num,
                                          model_config=model_config,
                                          kernel_size=kernel_size,
                                          stride=stride,
                                          scope=scope)

            elif conv_type == 'inceptionv2':

                net = get_inception_v2_module(ch_in=net,
                                              inception_conv_chout_num=inception_chout_num_list,
                                              model_config=model_config,
                                              stride=stride,
                                              scope=scope)

            elif conv_type == 'separable_conv2d':

                net = get_separable_conv2d_module(ch_in=net,
                                                  ch_out_num=ch_out_num,
                                                  model_config=model_config,
                                                  kernel_size=kernel_size,
                                                  stride=stride,
                                                  scope=scope)
            elif conv_type == 'linear_bottleneck':

                net = get_linear_bottleneck_module(ch_in=net,
                                                   ch_out_num=ch_out_num,
                                                   model_config=model_config,
                                                   kernel_size=kernel_size,
                                                   stride=stride,
                                                   scope=scope)
            elif conv_type == 'inverted_bottleneck':

                net = get_inverted_bottleneck_module(ch_in=net,
                                                     ch_out_num=ch_out_num,
                                                     expand_ch_num=tf.floor(ch_in * 1.2),
                                                     model_config=model_config,
                                                     kernel_size=kernel_size,
                                                     stride=stride,
                                                     scope=scope)

        return net


    def test_endpoint_name_shape(self):



        ch_in_num       = 3
        ch_out_num      = 256
        model_config    = ModelTestConfig()
        scope           = 'unittest'
        stride          = 2
        kernel_size     = 3

        # test input shape
        input_shape     = [None,64,64,ch_in_num]

        # expected output shape
        expected_output_height  = np.floor( int(input_shape[1]-kernel_size)/stride) + 1
        expected_output_width   = np.floor( int(input_shape[2]-kernel_size)/stride) + 1
        expected_output_shape   = [input_shape[0],expected_output_height,expected_output_width,ch_out_num]

        module_graph = tf.Graph()
        with module_graph.as_default():
            inputs          = create_test_input(batchsize=input_shape[0],
                                                heightsize=input_shape[1],
                                                widthsize=input_shape[2],
                                                channelnum=input_shape[3])

            module_output,end_points    = self._get_module(ch_in=inputs,
                                                          ch_out_num=ch_out_num,
                                                          model_config=model_config,
                                                          stride=stride,
                                                          kernel_size=kernel_size,
                                                          conv_type=TEST_MODULE_NAME,
                                                          scope=scope)

        expected_output_name = 'unittest0_'+TEST_MODULE_NAME+'_out'

        print('------------------------------------------------')
        print ('[tfTest] run test_endpoint_name_shape()')
        print ('[tfTest] module name = %s' % TEST_MODULE_NAME)

        print ('[tfTest] model output name = %s' % end_points.keys()[-1])
        print ('[tfTest] expected output name = %s' % expected_output_name)

        print ('[tfTest] model output shape = %s' % module_output.get_shape().as_list())
        print ('[tfTest] expected output shape = %s' % expected_output_shape)

        # check name of the module output
        self.assertTrue(expected_output_name in end_points)

        # check shape of the module output
        self.assertListEqual(module_output.get_shape().as_list(),expected_output_shape)

        print('------------------------------------------------')
        print ('[tfTest] write pbfile')

        self.assertTrue(expected_output_name in end_points)


        # tensorboard graph summary =============
        now = datetime.utcnow().strftime("%Y%m%d%H%M%S")
        tb_logdir_path = getcwd() + '/tf_logs'
        tb_logdir = "{}/run-{}/".format(tb_logdir_path, now)

        if not tf.gfile.Exists(tb_logdir_path):
            tf.gfile.MakeDirs(tb_logdir_path)


        # summary
        tb_summary_writer = tf.summary.FileWriter(logdir=tb_logdir)
        tb_summary_writer.add_graph(module_graph)
        tb_summary_writer.close()


        # write pbfile of graph_def
        savedir = getcwd() + '/pbfiles'
        if not tf.gfile.Exists(savedir):
            tf.gfile.MakeDirs(savedir)

        pbfilename = TEST_MODULE_NAME + '.pb'
        pbtxtfilename = TEST_MODULE_NAME + '.pbtxt'

        graph = tf.get_default_graph()

        with self.test_session(graph=module_graph) as sess:
            print("TF graph_def is saved in pb at %s." % savedir + pbfilename)
            tf.train.write_graph(graph_or_graph_def=sess.graph_def,
                                 logdir=savedir,
                                 name=pbfilename)
            tf.train.write_graph(graph_or_graph_def=sess.graph_def,
                                 logdir=savedir,
                                 name=pbtxtfilename,as_text=True)



    def test_midpoint_name_shape(self):
        ch_in_num = 3
        ch_out_num = 256
        model_config = ModelTestConfig()
        scope = 'unittest'
        stride = 2
        kernel_size = 3

        # test input shape
        input_shape = [None, 64, 64, ch_in_num]

        # expected output shape
        expected_output_height = np.floor(int(input_shape[1] - kernel_size) / stride) + 1
        expected_output_width = np.floor(int(input_shape[2] - kernel_size) / stride) + 1
        expected_output_shape = [input_shape[0], expected_output_height, expected_output_width, ch_out_num]

        inputs = create_test_input(batchsize=input_shape[0],
                                   heightsize=input_shape[1],
                                   widthsize=input_shape[2],
                                   channelnum=input_shape[3])

        module_output, mid_points = self._get_module(ch_in=inputs,
                                                    ch_out_num=ch_out_num,
                                                    model_config=model_config,
                                                    stride=stride,
                                                    kernel_size=kernel_size,
                                                    conv_type=TEST_MODULE_NAME,
                                                    scope=scope)


        expected_midpoint = ModuleEndpointName(conv_type=TEST_MODULE_NAME,
                                               input_shape=input_shape,
                                               output_shape=expected_output_shape)

        print('------------------------------------------------')
        print ('[tfTest] run test_midpoint_name_shape()')
        print ('[tfTest] midpoint name and shape')

        self.assertItemsEqual(mid_points.keys(), expected_midpoint.name_list)

        for name, shape in six.iteritems(expected_midpoint.shape_dict):
            print ('%s : shape = %s' % (name,shape))
            self.assertListEqual(mid_points[name].get_shape().as_list(),shape)



    def test_unknown_batchsize_shape(self):
        '''
            this func check the below test case:
                - when a module is built without specifying batch_norm size,
                  check whether the model output has a proper batch_size given by an input
        '''
        ch_in_num = 3
        ch_out_num = 256
        model_config = ModelTestConfig()
        scope = 'unittest'
        stride = 2
        kernel_size = 3

        # test input shape
        input_shape = [None, 64, 64, ch_in_num]

        # test batch size
        batch_size = 1

        # expected output shape
        expected_output_height = np.floor(int(input_shape[1] - kernel_size) / stride) + 1
        expected_output_width = np.floor(int(input_shape[2] - kernel_size) / stride) + 1

        # which generate a tf.placeholder
        inputs = create_test_input(None,
                                   heightsize=input_shape[1],
                                   widthsize=input_shape[2],
                                   channelnum=input_shape[3])

        module_output, mid_points = self._get_module(ch_in=inputs,
                                                    ch_out_num=ch_out_num,
                                                    model_config=model_config,
                                                    stride=stride,
                                                    kernel_size=kernel_size,
                                                    conv_type=TEST_MODULE_NAME,
                                                    scope=scope)

        input_shape[0] = batch_size
        expected_output_shape = [input_shape[0], expected_output_height, expected_output_width, ch_out_num]



        expected_prefix = 'unittest0_'+TEST_MODULE_NAME
        self.assertTrue(module_output.op.name.startswith(expected_prefix))

        self.assertListEqual(module_output.get_shape().as_list(),
                             [None,expected_output_height,expected_output_width,ch_out_num])

        # which generate a sample image using np.arange()
        print('------------------------------------------------')
        print ('[tfTest] run test_unknown_batchsize_shape()')
        images = create_test_input(  batchsize=input_shape[0],
                                    heightsize=input_shape[1],
                                    widthsize=input_shape[2],
                                    channelnum=input_shape[3])

        with self.test_session() as sess:
            sess.run(tf.global_variables_initializer())
            output = sess.run(module_output, {inputs: images.eval()})
            self.assertListEqual(list(output.shape),expected_output_shape)
            print ('[TfTest] output shape = %s' % list(output.shape))
            print ('[TfTest] expected_output_shape = %s' % expected_output_shape)



if __name__ == '__main__':
    tf.test.main()




