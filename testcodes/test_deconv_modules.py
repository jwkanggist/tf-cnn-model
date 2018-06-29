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
import six
from datetime import datetime
from os import getcwd
import sys
sys.path.insert(0,getcwd())
print ('getcwd() = %s' % getcwd())

import tensorflow as tf

# module import
from test_util  import create_test_input
from test_util  import get_deconv_module
from test_util  import ModuleEndpointName
from test_util  import ModelTestConfig



class ModuleTest(tf.test.TestCase):


    def test_nearest_neighbor_unpool(self):

        scope               = 'unittest'
        TEST_MODULE_NAME    = 'nearest_neighbor_unpool'


        input_width     = 2
        input_height    = 2
        input_shape     = [1, input_height,input_width,1]


        x = tf.to_float([[0, 1],
                         [2, 3]])
        x = tf.reshape(x,shape=input_shape)


        y_unpool2_test1_expected = tf.to_float([[0,0,1,1],
                                                [0,0,1,1],
                                                [2,2,3,3],
                                                [2,2,3,3]])

        y_unpool2_test1_expected = tf.reshape(y_unpool2_test1_expected,
                                              shape=[1,input_height*2,input_width*2,1])

        y_unpool3_test1_expected = tf.to_float([[0, 0, 0, 1, 1, 1],
                                                [0, 0, 0, 1, 1, 1],
                                                [0, 0, 0, 1, 1, 1],
                                                [2, 2, 2, 3, 3, 3],
                                                [2, 2, 2, 3, 3, 3],
                                                [2, 2, 2, 3, 3, 3]])

        y_unpool3_test1_expected  = tf.reshape(y_unpool3_test1_expected,
                                               shape=[1,input_height*3,input_width*3,1])


        y_unpool2_test1,end_point_test1  =  get_deconv_module(inputs=x,
                                                                unpool_rate=2,
                                                                module_type=TEST_MODULE_NAME,
                                                                layer_index=0,
                                                                scope=scope)

        y_unpool3_test1,end_point_test1 = get_deconv_module(inputs=x,
                                                              unpool_rate=3,
                                                              module_type=TEST_MODULE_NAME,
                                                              layer_index=1,
                                                              scope=scope)

        with self.test_session() as sess:
            print('--------------------------------------------')
            print ('[tfTest] run test_nearest_neighbor_unpool()')
            sess.run(tf.global_variables_initializer())
            self.assertAllClose(y_unpool2_test1.eval(),y_unpool2_test1_expected.eval())
            self.assertAllClose(y_unpool3_test1.eval(),y_unpool3_test1_expected.eval())

            # print ('[test1] Result of unpool rate2   = %s' % y_unpool2_test1.eval())
            # print ('[test1] Expected of unpool rate2 = %s' % y_unpool2_test1_expected.eval())
            # print ('[test1] Result of unpool rate3   = %s' % y_unpool3_test1.eval())
            # print ('[test1] Expected of unpool rate3 = %s' % y_unpool3_test1_expected.eval())

            print ('[test1] input shape of x = %s'% x.get_shape().as_list())
            print ('[test1] output shape of y_unpool2 = %s' % y_unpool2_test1.get_shape().as_list())
            print ('[test1] output shape of y_unpool3 = %s' % y_unpool3_test1.get_shape().as_list())






    def test_transconv_unpool_name_shape(self):
        scope = 'unitest'

        model_config        = ModelTestConfig()
        TEST_MODULE_NAME    = 'conv2dtrans_unpool'

        with tf.name_scope(name=scope):
            input_width     = 2
            input_height    = 2
            input_shape     = [None, input_height,input_width,1]
            unpool_rate     = 3

            expected_output_shape = [input_shape[0],
                                     input_shape[1]*unpool_rate,
                                     input_shape[2]*unpool_rate,
                                     input_shape[3]]

            inputs = create_test_input(batchsize= input_shape[0],
                                       heightsize=input_shape[1],
                                       widthsize =input_shape[2],
                                       channelnum= input_shape[3])


            y_unpool2, midpoint=  get_deconv_module(inputs=inputs,
                                                      unpool_rate=unpool_rate,
                                                      module_type=TEST_MODULE_NAME,
                                                      model_config=model_config,
                                                      scope=scope)

            expected_midpoint = ModuleEndpointName(conv_type=TEST_MODULE_NAME,
                                                   input_shape=input_shape,
                                                   output_shape=expected_output_shape)


            print('------------------------------------------------')
            print('[tfTest] run test_transconv_unpool_name_shape()')
            print('[tfTest] midpoint name and shape')
            print('[tfTest] unpool rate = %s' % unpool_rate)

            self.assertItemsEqual(midpoint.keys(), expected_midpoint.name_list)

            for name, shape in six.iteritems(expected_midpoint.shape_dict):
                print ('%s : shape = %s' %(name,shape))
                self.assertListEqual(midpoint[name].get_shape().as_list(),shape)




    def test_transconv_unknown_batchsize_shape(self):
        '''
            this func check the below test case:
                - when a module is built without specifying batch_norm size,
                  check whether the model output has a proper batch_size given by an input
        '''
        scope = 'unitest'

        model_config        = ModelTestConfig()
        TEST_MODULE_NAME    = 'conv2dtrans_unpool'
        batch_size          = 1

        input_width     = 2
        input_height    = 2
        input_shape     = [None, input_height,input_width,1]
        unpool_rate     = 3

        module_graph = tf.Graph()
        with module_graph.as_default():
            inputs = create_test_input(batchsize= input_shape[0],
                                       heightsize=input_shape[1],
                                       widthsize =input_shape[2],
                                       channelnum= input_shape[3])

            module_output, midpoint=   get_deconv_module(inputs=inputs,
                                                           unpool_rate=unpool_rate,
                                                           module_type=TEST_MODULE_NAME,
                                                           model_config=model_config,
                                                           scope=scope)

            expected_prefix = scope
            self.assertTrue(module_output.op.name.startswith(expected_prefix))
            self.assertListEqual(module_output.get_shape().as_list(),
                                 [None,
                                  input_shape[1] * unpool_rate,
                                  input_shape[2] * unpool_rate,
                                  input_shape[3]])

            input_shape[0]           = batch_size
            expected_output_shape = [input_shape[0],
                                     input_shape[1]*unpool_rate,
                                     input_shape[2]*unpool_rate,
                                     input_shape[3]]


            # which generate a sample image using np.arange()
            print('------------------------------------------------')
            print ('[tfTest] run test_transconv_unknown_batchsize_shape()')
            print('[tfTest] unpool rate = %s' % unpool_rate)

            images = create_test_input( batchsize=input_shape[0],
                                        heightsize=input_shape[1],
                                        widthsize=input_shape[2],
                                        channelnum=input_shape[3])

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

        with self.test_session(graph=module_graph) as sess:
            sess.run(tf.global_variables_initializer())
            output = sess.run(module_output, {inputs: images.eval()})
            self.assertListEqual(list(output.shape),expected_output_shape)
            print ('[TfTest] output shape = %s' % list(output.shape))
            print ('[TfTest] expected_output_shape = %s' % expected_output_shape)

            print("TF graph_def is saved in pb at %s." % savedir + pbfilename)
            tf.train.write_graph(graph_or_graph_def=sess.graph_def,
                                 logdir=savedir,
                                 name=pbfilename)
            tf.train.write_graph(graph_or_graph_def=sess.graph_def,
                                 logdir=savedir,
                                 name=pbtxtfilename,as_text=True)




if __name__ == '__main__':
    tf.test.main()


