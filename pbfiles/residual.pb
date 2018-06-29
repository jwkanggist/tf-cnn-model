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
  name: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
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
        tensor_content: "\001\000\000\000\001\000\000\000\003\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
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
        float_val: -0.214012905955
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
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
        float_val: 0.214012905955
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/shape"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
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
  name: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/max"
  input: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/sub"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/mul"
  input: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
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
  name: "unittest0/residual/residual_front_conv1x1/weights/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_front_conv1x1/weights"
  input: "unittest0/residual/residual_front_conv1x1/weights/Initializer/random_uniform"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
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
  name: "unittest0/residual/residual_front_conv1x1/weights/read"
  op: "Identity"
  input: "unittest0/residual/residual_front_conv1x1/weights"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
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
  name: "unittest0/residual/residual_front_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unittest0/residual/residual_front_conv1x1/weights/read"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unittest0/residual/residual_front_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  input: "unittest0/residual/residual_front_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/dilation_rate"
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
  name: "unittest0/residual/residual_front_conv1x1/Conv2D"
  op: "Conv2D"
  input: "Placeholder"
  input: "unittest0/residual/residual_front_conv1x1/weights/read"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/Const"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/beta"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/beta"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/beta/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/beta"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/beta/Initializer/zeros"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/beta"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/beta/read"
  op: "Identity"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/beta"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean/Initializer/zeros"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance/Initializer/ones"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/Const_1"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/Const_2"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unittest0/residual/residual_front_conv1x1/Conv2D"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/Const"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/beta/read"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/Const_1"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/Const_2"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/Const_3"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg/sub/x"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg/sub/x"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean/read"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg/sub_1"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg/mul"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/moving_mean"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg_1/sub/x"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance/read"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/AssignMovingAvg_1/mul"
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
        s: "loc:@unittest0/residual/residual_front_conv1x1/BatchNorm/moving_variance"
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
  name: "unittest0/residual/residual_front_conv1x1/BatchNorm/Relu6"
  op: "Relu6"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
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
        tensor_content: "\003\000\000\000\003\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
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
        float_val: -0.0510310381651
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
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
        float_val: 0.0510310381651
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/shape"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
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
  name: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/max"
  input: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/sub"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/mul"
  input: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
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
          size: 128
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
  name: "unittest0/residual/residual_mid_conv3x3/weights/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_mid_conv3x3/weights"
  input: "unittest0/residual/residual_mid_conv3x3/weights/Initializer/random_uniform"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
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
  name: "unittest0/residual/residual_mid_conv3x3/weights/read"
  op: "Identity"
  input: "unittest0/residual/residual_mid_conv3x3/weights"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
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
  name: "unittest0/residual/residual_mid_conv3x3/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unittest0/residual/residual_mid_conv3x3/weights/read"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unittest0/residual/residual_mid_conv3x3/kernel/Regularizer/l2_regularizer/scale"
  input: "unittest0/residual/residual_mid_conv3x3/kernel/Regularizer/l2_regularizer/L2Loss"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/dilation_rate"
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
  name: "unittest0/residual/residual_mid_conv3x3/Conv2D"
  op: "Conv2D"
  input: "unittest0/residual/residual_front_conv1x1/BatchNorm/Relu6"
  input: "unittest0/residual/residual_mid_conv3x3/weights/read"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/Const"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/beta"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/beta"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/beta/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/beta"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/beta/Initializer/zeros"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/beta"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/beta/read"
  op: "Identity"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/beta"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean/Initializer/zeros"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance/Initializer/ones"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/Const_1"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/Const_2"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unittest0/residual/residual_mid_conv3x3/Conv2D"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/Const"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/beta/read"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/Const_1"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/Const_2"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/Const_3"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg/sub/x"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg/sub/x"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean/read"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg/sub_1"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg/mul"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_mean"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg_1/sub/x"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance/read"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/AssignMovingAvg_1/mul"
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
        s: "loc:@unittest0/residual/residual_mid_conv3x3/BatchNorm/moving_variance"
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
  name: "unittest0/residual/residual_mid_conv3x3/BatchNorm/Relu6"
  op: "Relu6"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
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
        tensor_content: "\001\000\000\000\001\000\000\000\200\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
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
        float_val: -0.125
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
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
        float_val: 0.125
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/shape"
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
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
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
  name: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/max"
  input: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/sub"
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
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/mul"
  input: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
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
          size: 128
        }
        dim {
          size: 256
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
  name: "unittest0/residual/residual_rear_conv1x1/weights/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_rear_conv1x1/weights"
  input: "unittest0/residual/residual_rear_conv1x1/weights/Initializer/random_uniform"
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
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
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
  name: "unittest0/residual/residual_rear_conv1x1/weights/read"
  op: "Identity"
  input: "unittest0/residual/residual_rear_conv1x1/weights"
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
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
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
  name: "unittest0/residual/residual_rear_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unittest0/residual/residual_rear_conv1x1/weights/read"
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
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unittest0/residual/residual_rear_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  input: "unittest0/residual/residual_rear_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
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
        s: "loc:@unittest0/residual/residual_rear_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_rear_conv1x1/biases"
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
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_rear_conv1x1/biases"
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
          size: 256
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
  name: "unittest0/residual/residual_rear_conv1x1/biases/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_rear_conv1x1/biases"
  input: "unittest0/residual/residual_rear_conv1x1/biases/Initializer/zeros"
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
        s: "loc:@unittest0/residual/residual_rear_conv1x1/biases"
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
  name: "unittest0/residual/residual_rear_conv1x1/biases/read"
  op: "Identity"
  input: "unittest0/residual/residual_rear_conv1x1/biases"
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
        s: "loc:@unittest0/residual/residual_rear_conv1x1/biases"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_rear_conv1x1/dilation_rate"
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
  name: "unittest0/residual/residual_rear_conv1x1/Conv2D"
  op: "Conv2D"
  input: "unittest0/residual/residual_mid_conv3x3/BatchNorm/Relu6"
  input: "unittest0/residual/residual_rear_conv1x1/weights/read"
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
  name: "unittest0/residual/residual_rear_conv1x1/BiasAdd"
  op: "BiasAdd"
  input: "unittest0/residual/residual_rear_conv1x1/Conv2D"
  input: "unittest0/residual/residual_rear_conv1x1/biases/read"
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
  name: "unittest0/residual/BatchNorm/Const"
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
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/BatchNorm/beta"
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
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/BatchNorm/beta"
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
          size: 256
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
  name: "unittest0/residual/BatchNorm/beta/Assign"
  op: "Assign"
  input: "unittest0/residual/BatchNorm/beta"
  input: "unittest0/residual/BatchNorm/beta/Initializer/zeros"
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
        s: "loc:@unittest0/residual/BatchNorm/beta"
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
  name: "unittest0/residual/BatchNorm/beta/read"
  op: "Identity"
  input: "unittest0/residual/BatchNorm/beta"
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
        s: "loc:@unittest0/residual/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/BatchNorm/moving_mean"
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
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/BatchNorm/moving_mean"
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
          size: 256
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
  name: "unittest0/residual/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "unittest0/residual/BatchNorm/moving_mean"
  input: "unittest0/residual/BatchNorm/moving_mean/Initializer/zeros"
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
        s: "loc:@unittest0/residual/BatchNorm/moving_mean"
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
  name: "unittest0/residual/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "unittest0/residual/BatchNorm/moving_mean"
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
        s: "loc:@unittest0/residual/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/BatchNorm/moving_variance"
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
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/BatchNorm/moving_variance"
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
          size: 256
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
  name: "unittest0/residual/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "unittest0/residual/BatchNorm/moving_variance"
  input: "unittest0/residual/BatchNorm/moving_variance/Initializer/ones"
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
        s: "loc:@unittest0/residual/BatchNorm/moving_variance"
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
  name: "unittest0/residual/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "unittest0/residual/BatchNorm/moving_variance"
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
        s: "loc:@unittest0/residual/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/Const_1"
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
  name: "unittest0/residual/BatchNorm/Const_2"
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
  name: "unittest0/residual/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unittest0/residual/residual_rear_conv1x1/BiasAdd"
  input: "unittest0/residual/BatchNorm/Const"
  input: "unittest0/residual/BatchNorm/beta/read"
  input: "unittest0/residual/BatchNorm/Const_1"
  input: "unittest0/residual/BatchNorm/Const_2"
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
  name: "unittest0/residual/BatchNorm/Const_3"
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
  name: "unittest0/residual/BatchNorm/AssignMovingAvg/sub/x"
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
  name: "unittest0/residual/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "unittest0/residual/BatchNorm/AssignMovingAvg/sub/x"
  input: "unittest0/residual/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unittest0/residual/BatchNorm/moving_mean/read"
  input: "unittest0/residual/BatchNorm/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "unittest0/residual/BatchNorm/AssignMovingAvg/sub_1"
  input: "unittest0/residual/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "unittest0/residual/BatchNorm/moving_mean"
  input: "unittest0/residual/BatchNorm/AssignMovingAvg/mul"
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
        s: "loc:@unittest0/residual/BatchNorm/moving_mean"
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
  name: "unittest0/residual/BatchNorm/AssignMovingAvg_1/sub/x"
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
  name: "unittest0/residual/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unittest0/residual/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "unittest0/residual/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unittest0/residual/BatchNorm/moving_variance/read"
  input: "unittest0/residual/BatchNorm/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unittest0/residual/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "unittest0/residual/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/residual/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unittest0/residual/BatchNorm/moving_variance"
  input: "unittest0/residual/BatchNorm/AssignMovingAvg_1/mul"
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
        s: "loc:@unittest0/residual/BatchNorm/moving_variance"
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
  name: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
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
        tensor_content: "\001\000\000\000\001\000\000\000\003\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
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
        float_val: -0.152203887701
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
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
        float_val: 0.152203887701
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/shape"
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
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
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
  name: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/max"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/sub"
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
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/mul"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_shortcut_conv1x1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
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
          size: 256
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
  name: "unittest0/residual/residual_shortcut_conv1x1/weights/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights/Initializer/random_uniform"
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
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
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
  name: "unittest0/residual/residual_shortcut_conv1x1/weights/read"
  op: "Identity"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights"
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
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_shortcut_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
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
  name: "unittest0/residual/residual_shortcut_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights/read"
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
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_shortcut_conv1x1/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unittest0/residual/residual_shortcut_conv1x1/kernel/Regularizer/l2_regularizer/scale"
  input: "unittest0/residual/residual_shortcut_conv1x1/kernel/Regularizer/l2_regularizer/L2Loss"
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
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_shortcut_conv1x1/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/biases"
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
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_shortcut_conv1x1/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/biases"
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
          size: 256
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
  name: "unittest0/residual/residual_shortcut_conv1x1/biases/Assign"
  op: "Assign"
  input: "unittest0/residual/residual_shortcut_conv1x1/biases"
  input: "unittest0/residual/residual_shortcut_conv1x1/biases/Initializer/zeros"
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
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/biases"
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
  name: "unittest0/residual/residual_shortcut_conv1x1/biases/read"
  op: "Identity"
  input: "unittest0/residual/residual_shortcut_conv1x1/biases"
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
        s: "loc:@unittest0/residual/residual_shortcut_conv1x1/biases"
      }
    }
  }
}
node {
  name: "unittest0/residual/residual_shortcut_conv1x1/dilation_rate"
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
  name: "unittest0/residual/residual_shortcut_conv1x1/Conv2D"
  op: "Conv2D"
  input: "Placeholder"
  input: "unittest0/residual/residual_shortcut_conv1x1/weights/read"
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
  name: "unittest0/residual/residual_shortcut_conv1x1/BiasAdd"
  op: "BiasAdd"
  input: "unittest0/residual/residual_shortcut_conv1x1/Conv2D"
  input: "unittest0/residual/residual_shortcut_conv1x1/biases/read"
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
  name: "unittest0/residual/residual_shortcut_maxpool/MaxPool"
  op: "MaxPool"
  input: "unittest0/residual/residual_shortcut_conv1x1/BiasAdd"
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
  name: "unittest0/residual/residual_shortcut_sum"
  op: "Add"
  input: "unittest0/residual/residual_shortcut_maxpool/MaxPool"
  input: "unittest0/residual/BatchNorm/FusedBatchNorm"
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
