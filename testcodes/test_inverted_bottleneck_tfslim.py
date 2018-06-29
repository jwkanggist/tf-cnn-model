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
print ('getcwd() = %s' % getcwd())

import tensorflow as tf

from test_util  import create_test_input
from test_util  import get_module
from test_util  import ModuleEndpointName
from test_util  import ModelTestConfig


TEST_MODULE_NAME =  'inverted_bottleneck'


'''
    code reference: https://github.com/tensorflow/models/blob/master/research/deeplab/core/xception_test.py
'''
# where we adopt the NHWC format.

class ModuleTest(tf.test.TestCase):

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
        expected_output_height  = input_shape[1]/stride
        expected_output_width   = input_shape[2]/stride

        expected_output_shape   = [input_shape[0],expected_output_height,expected_output_width,ch_out_num]

        module_graph = tf.Graph()
        with module_graph.as_default():
            inputs          = create_test_input(batchsize=input_shape[0],
                                                heightsize=input_shape[1],
                                                widthsize=input_shape[2],
                                                channelnum=input_shape[3])

            module_output,end_points    = get_module(ch_in=inputs,
                                                      ch_out_num=ch_out_num,
                                                      model_config=model_config,
                                                      stride=stride,
                                                      kernel_size=kernel_size,
                                                      conv_type=TEST_MODULE_NAME,
                                                      scope=scope)

        expected_output_name = 'unittest0/'+TEST_MODULE_NAME+'_out'

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
        expected_output_height  = input_shape[1]/stride
        expected_output_width   = input_shape[2]/stride

        expected_output_shape = [input_shape[0], expected_output_height, expected_output_width, ch_out_num]

        inputs = create_test_input(batchsize=input_shape[0],
                                   heightsize=input_shape[1],
                                   widthsize=input_shape[2],
                                   channelnum=input_shape[3])

        module_output, mid_points = get_module(ch_in=inputs,
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
        expected_output_height  = input_shape[1]/stride
        expected_output_width   = input_shape[2]/stride

        # which generate a tf.placeholder
        inputs = create_test_input(None,
                                   heightsize=input_shape[1],
                                   widthsize=input_shape[2],
                                   channelnum=input_shape[3])

        module_output, mid_points = get_module(ch_in=inputs,
                                                ch_out_num=ch_out_num,
                                                model_config=model_config,
                                                stride=stride,
                                                kernel_size=kernel_size,
                                                conv_type=TEST_MODULE_NAME,
                                                scope=scope)

        input_shape[0] = batch_size
        expected_output_shape = [input_shape[0], expected_output_height, expected_output_width, ch_out_num]



        expected_prefix = 'unittest0/'+TEST_MODULE_NAME
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




