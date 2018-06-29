node {
  name: "Placeholder"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\003\000\000\000`\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.246182978153
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.246182978153
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/max"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/mul"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 3
        }
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.99999989895e-05
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/Conv2D"
  op: "Conv2D"
  input: "Placeholder"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/BiasAdd"
  op: "BiasAdd"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/Conv2D"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/beta/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/BatchNorm/beta"
  input: "unittest0/inceptionv2/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/beta/read"
  op: "Identity"
  input: "unittest0/inceptionv2/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/BatchNorm/moving_mean"
  input: "unittest0/inceptionv2/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "unittest0/inceptionv2/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/BatchNorm/moving_variance"
  input: "unittest0/inceptionv2/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "unittest0/inceptionv2/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv1x1/BiasAdd"
  input: "unittest0/inceptionv2/BatchNorm/Const"
  input: "unittest0/inceptionv2/BatchNorm/beta/read"
  input: "unittest0/inceptionv2/BatchNorm/Const_1"
  input: "unittest0/inceptionv2/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000475
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg/sub/x"
  input: "unittest0/inceptionv2/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unittest0/inceptionv2/BatchNorm/moving_mean/read"
  input: "unittest0/inceptionv2/BatchNorm/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg/sub_1"
  input: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "unittest0/inceptionv2/BatchNorm/moving_mean"
  input: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "unittest0/inceptionv2/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unittest0/inceptionv2/BatchNorm/moving_variance/read"
  input: "unittest0/inceptionv2/BatchNorm/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unittest0/inceptionv2/BatchNorm/moving_variance"
  input: "unittest0/inceptionv2/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000`\000\000\000`\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0589255653322
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0589255653322
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/max"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/mul"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 96
        }
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.99999989895e-05
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/kernel/Regularizer/l2_regularizer/scale"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/Conv2D"
  op: "Conv2D"
  input: "unittest0/inceptionv2/BatchNorm/FusedBatchNorm"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/BiasAdd"
  op: "BiasAdd"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/Conv2D"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000`\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0721687823534
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0721687823534
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/max"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/mul"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 96
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.99999989895e-05
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/kernel/Regularizer/l2_regularizer/scale"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/Conv2D"
  op: "Conv2D"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_1/BiasAdd"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/BiasAdd"
  op: "BiasAdd"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/Conv2D"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/beta/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/BatchNorm_1/beta"
  input: "unittest0/inceptionv2/BatchNorm_1/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/beta/read"
  op: "Identity"
  input: "unittest0/inceptionv2/BatchNorm_1/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/beta"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/moving_mean/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/BatchNorm_1/moving_mean"
  input: "unittest0/inceptionv2/BatchNorm_1/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/moving_mean/read"
  op: "Identity"
  input: "unittest0/inceptionv2/BatchNorm_1/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/moving_mean"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/moving_variance/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/BatchNorm_1/moving_variance"
  input: "unittest0/inceptionv2/BatchNorm_1/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/moving_variance/read"
  op: "Identity"
  input: "unittest0/inceptionv2/BatchNorm_1/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/moving_variance"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unittest0/inceptionv2/inceptionv2_net1_conv3x3_2/BiasAdd"
  input: "unittest0/inceptionv2/BatchNorm_1/Const"
  input: "unittest0/inceptionv2/BatchNorm_1/beta/read"
  input: "unittest0/inceptionv2/BatchNorm_1/Const_1"
  input: "unittest0/inceptionv2/BatchNorm_1/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000475
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg/sub/x"
  input: "unittest0/inceptionv2/BatchNorm_1/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unittest0/inceptionv2/BatchNorm_1/moving_mean/read"
  input: "unittest0/inceptionv2/BatchNorm_1/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg/sub_1"
  input: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg"
  op: "AssignSub"
  input: "unittest0/inceptionv2/BatchNorm_1/moving_mean"
  input: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg_1/sub/x"
  input: "unittest0/inceptionv2/BatchNorm_1/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unittest0/inceptionv2/BatchNorm_1/moving_variance/read"
  input: "unittest0/inceptionv2/BatchNorm_1/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg_1/sub_1"
  input: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unittest0/inceptionv2/BatchNorm_1/moving_variance"
  input: "unittest0/inceptionv2/BatchNorm_1/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/BatchNorm_1/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\003\000\000\000`\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.246182978153
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.246182978153
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/max"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/mul"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 3
        }
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.99999989895e-05
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/Conv2D"
  op: "Conv2D"
  input: "Placeholder"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/Conv2D"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/Const"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/beta/read"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/Const_1"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000475
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg/sub/x"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean/read"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg/sub_1"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance/read"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000`\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0545544736087
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0545544736087
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/max"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/mul"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 96
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.99999989895e-05
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/kernel/Regularizer/l2_regularizer/scale"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/Conv2D"
  op: "Conv2D"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv1x1/BatchNorm/FusedBatchNorm"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/Conv2D"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/Const"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/beta/read"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/Const_1"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000475
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg/sub/x"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean/read"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg/sub_1"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance/read"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_maxpool3x3/MaxPool"
  op: "MaxPool"
  input: "Placeholder"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\003\000\000\000`\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.246182978153
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.246182978153
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/max"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/mul"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 3
        }
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.99999989895e-05
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/Conv2D"
  op: "Conv2D"
  input: "unittest0/inceptionv2/inceptionv2_net3_maxpool3x3/MaxPool"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/Conv2D"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/Const"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/beta/read"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/Const_1"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.0010000000475
    }
  }
  attr {
    key: "is_training"
    value {
      b: true
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.999000012875
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg/sub/x"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean/read"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg/sub_1"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg_1/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance/read"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/AssignMovingAvg_1/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2/inceptionv2_concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "unittest0/inceptionv2/inceptionv2/inceptionv2_concat"
  op: "ConcatV2"
  input: "unittest0/inceptionv2/BatchNorm_1/FusedBatchNorm"
  input: "unittest0/inceptionv2/inceptionv2_net2_conv3x3/BatchNorm/FusedBatchNorm"
  input: "unittest0/inceptionv2/inceptionv2_net3_conv1x1/BatchNorm/FusedBatchNorm"
  input: "unittest0/inceptionv2/inceptionv2/inceptionv2_concat/axis"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "unittest0/inceptionv2/unittest0/inceptionv2_out"
  op: "Relu6"
  input: "unittest0/inceptionv2/inceptionv2/inceptionv2_concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
versions {
  producer: 26
}
