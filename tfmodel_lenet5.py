#-*- coding: utf-8 -*-
#! /usr/bin/env python
'''
    filename: tfmodel_lenet5.py

    description: providing a tensorflow model of LeNet5


    author: Jaewook Kang
    final date  : 2018 Mar

'''

import tensorflow as tf

from cnn_layer_modules import Conv2dLayer
from cnn_layer_modules import PoolingLayer
from cnn_layer_modules import FcLayer

from os import getcwd
from os import path
from subprocess import check_output
from datetime import datetime

class ModelSavePath(object):

    def __init__(self,save_path):
        self.save_dir        = save_path

        self.filename_pbtxt  = 'lenet5.pbtxt'
        self.filename_pb     = 'lenet5.pb'
        self.filename_ckpt   = 'lenet5.ckpt'
        self.datetime_now = datetime.utcnow().strftime("%Y%m%d%H%M%S")
        self.set_model_export_dir()


    def set_model_export_dir(self):
        pathname = self.save_dir

        if not path.exists(pathname):
            check_output('mkdir ' + pathname,shell=True)

        pathname = pathname + '/' + 'runtrain-' + self.datetime_now + '/'

        if not path.exists(pathname):
            check_output('mkdir ' + pathname,shell=True)

        self.save_dir   = pathname
        print('> model save pathname = %s' % self.save_dir)


class Lenet5(object):

    def __init__(self,dropout_keeprate_for_fc,save_ckpt_path,dtype=tf.float32):

        self.dtype = dtype
        self.dropout_keeprate_for_fc = dropout_keeprate_for_fc
        # stacking CNN layers
        # In convolutional layer num_filter == num_output_channels
        self.c1_layer = Conv2dLayer(layer_index=1,
                               num_input_channels=1,
                               filter_size=5,
                               num_filters=6,
                               filter_stride=1,
                               filter_padding="SAME",
                               activation_type='relu',
                               dtype=self.dtype)

        self.s2_layer = PoolingLayer(layer_index=2,
                                    num_input_channels=self.c1_layer.num_output_channels,
                                    tile_size=2,
                                    pool_stride=2,
                                    pool_padding='VALID',
                                    pooling_type='avg')

        self.c3_layer = Conv2dLayer(layer_index=3,
                                   num_input_channels=self.s2_layer.num_output_channels,
                                   filter_size=5,
                                   num_filters=16,
                                   filter_stride=1,
                                   filter_padding="VALID",
                                   activation_type='relu',
                                   dtype=self.dtype)

        self.s4_layer = PoolingLayer(layer_index=4,
                                    num_input_channels=self.c3_layer.num_output_channels,
                                    tile_size=2,
                                    pool_stride=2,
                                    pool_padding='VALID',
                                    pooling_type='avg')

        self.c5_layer = Conv2dLayer(layer_index=5,
                                   num_input_channels=self.s4_layer.num_output_channels,
                                   filter_size=5,
                                   num_filters=120,
                                   filter_stride=1,
                                   filter_padding="VALID",
                                   activation_type='relu',
                                   dtype=self.dtype)

        self.f6_layer = FcLayer(layer_index=6,
                                  num_input_nodes=self.c5_layer.num_output_channels,
                                  num_output_nodes= 84,
                                  dropout_keep_prob =self.dropout_keeprate_for_fc,
                                  activation_type='relu',
                                   dtype= self.dtype)

        self.out_layer = FcLayer(layer_index=7,
                                num_input_nodes = self.f6_layer.num_output_nodes,
                                num_output_nodes = 10,
                                dropout_keep_prob = self.dropout_keeprate_for_fc,
                                activation_type = 'linear',
                                dtype=self.dtype)

        # layer outputs
        self.c1_layer_out   = None
        self.s2_layer_out   = None
        self.c3_layer_out   = None
        self.s4_layer_out   = None
        self.c5_layer_out   = None
        self.f6_layer_out   = None
        self.out_layer_out  = None

        # cost and optimizer
        self.tf_cost        = None
        self.tf_optimizer   = None


        # tf model saver
        self.tf_model_saver = None
        self.model_savepath_worker = ModelSavePath(save_ckpt_path)





    def set_model_saver(self):

        self.tf_model_saver = tf.train.Saver(tf.global_variables())
        return self.tf_model_saver


    def save_tfgraph_pb(self,sess_graph_def):
        tf.train.write_graph(graph_or_graph_def=sess_graph_def,
                             logdir=self.model_savepath_worker.save_dir,
                             name=self.model_savepath_worker.filename_pbtxt)

        tf.train.write_graph(graph_or_graph_def=sess_graph_def,
                             logdir=self.model_savepath_worker.save_dir,
                             name=self.model_savepath_worker.filename_pb,
                             as_text=False)

        model_save_path_pb = self.model_savepath_worker.save_dir + \
                             self.model_savepath_worker.filename_pb

        model_save_path_pbtxt = self.model_savepath_worker.save_dir + \
                                self.model_savepath_worker.filename_pbtxt

        print ("TF graph_def is saved in txt at %s." % model_save_path_pbtxt)
        print ("TF graph_def is saved in binary at %s." % model_save_path_pb)

    def save_ckpt(self,sess,epoch=None):
        save_path = self.tf_model_saver.save(sess=sess,
                                             save_path=self.model_savepath_worker.save_dir +\
                                                       self.model_savepath_worker.filename_ckpt,
                                             global_step=epoch)

        print("epoch - %s: tf ckpt saved: %s" % (epoch, save_path))


    def get_tf_model(self,input_nodes):

        print('====================================')
        print('[Lenet5] Stacking CNN layers!')
        self.c1_layer_out    = self.c1_layer.make_conv2dlayer( layer_input =input_nodes)
        self.s2_layer_out    = self.s2_layer.make_poolinglayer(layer_input =self.c1_layer_out)
        self.c3_layer_out    = self.c3_layer.make_conv2dlayer( layer_input =self.s2_layer_out)
        self.s4_layer_out    = self.s4_layer.make_poolinglayer(layer_input =self.c3_layer_out)
        self.c5_layer_out    = self.c5_layer.make_conv2dlayer( layer_input =self.s4_layer_out)

        c5_layer_out_shape = self.c5_layer_out.get_shape().as_list()
        # print ('[conv_c5] layer_out_shape = %s' % c5_layer_out_shape)

        # data Tensor reshaping for conv_layer to fc_layer pipeline
        #
        # [batchsize, height, width, channelnum]  ==> [batchsize, height * width * channelnum]
        #  in lenet5, which is [ batchsize, 1*1*120]
        c5_layer_out_reshape = tf.reshape(tensor=self.c5_layer_out,
                                          shape =[-1,c5_layer_out_shape[1]*c5_layer_out_shape[2]*c5_layer_out_shape[3]])

        # print ('[conv_c5] c5_layer_out_reshape = %s' % c5_layer_out_reshape.get_shape().as_list())

        # Tflite ops does not support "tf.contrib.layers.flattern()
        # c5_layer_out_reshape = tf.contrib.layers.flatten(self.c5_layer_out)

        self.f6_layer_out         = self.f6_layer.make_fclayer(layer_input = c5_layer_out_reshape)
        self.out_layer_out        = self.out_layer.make_fclayer(layer_input = self.f6_layer_out)

        print ('[Lenet5] output_node_name = %s' % self.out_layer.layer_out_nodename)

        return self.out_layer_out






    def get_tf_cost_fuction(self,train_labels_node,is_l2_loss=False,epsilon=0.0):
        # design cost function======================================
        # in this code the label \in [0, num_label-1]
        # such that we go with sparse_softmax_cross_entropy_with_logits()
        # rather than softmax_cross_entropy_with_logits() which use one-hot coding for the label data
        self.tf_cost = tf.reduce_mean(tf.nn.sparse_softmax_cross_entropy_with_logits(labels=train_labels_node,
                                                                                    logits=self.out_layer_out))
        # l2 regularization for fully-connected layers
        if is_l2_loss == True:
            fc_regularizers = (tf.nn.l2_loss(self.f6_layer.layer_weight) +
                               tf.nn.l2_loss(self.f6_layer.layer_bias)   +
                               tf.nn.l2_loss(self.out_layer.layer_weight)+
                               tf.nn.l2_loss(self.out_layer.layer_bias))
            self.tf_cost += epsilon* fc_regularizers

        return self.tf_cost



    def get_output_node_name(self):

        return self.out_layer.layer_out_nodename



    def get_tf_optimizer(self,opt_type,learning_rate,total_batch_size,minibatch_size,is_exp_decay=False,decay_rate = 1.0):

        if is_exp_decay == True:

            # Decay once per epoch, using an exponential schedule starting at 0.01
            batch = tf.Variable(0.,dtype= self.dtype)
            exp_decay_global_step = batch * minibatch_size
            tf_leaning_rate = tf.train.exponential_decay(learning_rate=learning_rate,
                                                         global_step= exp_decay_global_step,
                                                         decay_steps=total_batch_size,
                                                         decay_rate=decay_rate,
                                                         staircase=True)
            global_step = batch
        else:
            tf_leaning_rate = learning_rate
            global_step = None

        # chose optimizer
        if opt_type == 'Gradient_descent':
            self.tf_optimizer = tf.train.GradientDescentOptimizer(learning_rate=tf_leaning_rate).minimize(
                loss=self.tf_cost,
                global_step=global_step)
            print('[Lenet5] Using GradientDescent optimizer.')

        elif opt_type == 'Adam':
            self.tf_optimizer = tf.train.AdamOptimizer(learning_rate=tf_leaning_rate).minimize(
                loss=self.tf_cost,
                global_step=global_step)
            print('[Lenet5] Using Adam optimizer.')

        else:
            print('[LeNet5] opt_type = %s is not supported.' % opt_type)


        return self.tf_optimizer



