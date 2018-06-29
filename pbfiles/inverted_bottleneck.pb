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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
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
        tensor_content: "\001\000\000\000\001\000\000\000\003\000\000\000\006\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
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
        float_val: -0.816496610641
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
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
        float_val: 0.816496610641
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/shape"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/max"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/sub"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
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
          size: 6
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/Initializer/random_uniform"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/dilation_rate"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/Conv2D"
  op: "Conv2D"
  input: "Placeholder"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/weights/read"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/Const"
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
            size: 6
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta"
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
            size: 6
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta"
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
          size: 6
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta/Initializer/zeros"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean"
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
            size: 6
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean"
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
          size: 6
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean/Initializer/zeros"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance"
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
            size: 6
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance"
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
          size: 6
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance/Initializer/ones"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/Const_1"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/Const_2"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/Conv2D"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/Const"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/beta/read"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/Const_1"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/Const_2"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/Const_3"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg/sub/x"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg/sub/x"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean/read"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg/sub_1"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg/mul"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_mean"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg_1/sub/x"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance/read"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/AssignMovingAvg_1/mul"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/moving_variance"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/Relu6"
  op: "Relu6"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
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
        tensor_content: "\003\000\000\000\003\000\000\000\006\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
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
        float_val: -0.30860671401
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
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
        float_val: 0.30860671401
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/shape"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/max"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/sub"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
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
          size: 6
        }
        dim {
          size: 1
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Initializer/random_uniform"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/read"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise/Shape"
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
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\006\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise/dilation_rate"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise"
  op: "DepthwiseConv2dNative"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_bottleneck/BatchNorm/Relu6"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise_weights/read"
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
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/Const"
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
            size: 6
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta"
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
            size: 6
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta"
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
          size: 6
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta/Initializer/zeros"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean"
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
            size: 6
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean"
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
          size: 6
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean/Initializer/zeros"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance"
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
            size: 6
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance"
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
          size: 6
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance/Initializer/ones"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/Const_1"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/Const_2"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/depthwise"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/Const"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/beta/read"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/Const_1"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/Const_2"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/Const_3"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg/sub/x"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg/sub/x"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean/read"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg/sub_1"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg/mul"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_mean"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg_1/sub/x"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance/read"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/AssignMovingAvg_1/mul"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/moving_variance"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/Relu6"
  op: "Relu6"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
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
        tensor_content: "\001\000\000\000\001\000\000\000\006\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
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
        float_val: -0.1513299793
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
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
        float_val: 0.1513299793
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/shape"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/max"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/sub"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
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
          size: 6
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/Initializer/random_uniform"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases/Initializer/zeros"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/dilation_rate"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/Conv2D"
  op: "Conv2D"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_dwise_conv/BatchNorm/Relu6"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/weights/read"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/BiasAdd"
  op: "BiasAdd"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/Conv2D"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/biases/read"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/Const"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/beta"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/beta"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/beta/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/BatchNorm/beta"
  input: "unittest0/inverted_bottleneck/BatchNorm/beta/Initializer/zeros"
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
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/beta"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/beta/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/BatchNorm/beta"
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
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/moving_mean"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/moving_mean"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/BatchNorm/moving_mean"
  input: "unittest0/inverted_bottleneck/BatchNorm/moving_mean/Initializer/zeros"
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
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/moving_mean"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/BatchNorm/moving_mean"
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
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/moving_variance"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/moving_variance"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/BatchNorm/moving_variance"
  input: "unittest0/inverted_bottleneck/BatchNorm/moving_variance/Initializer/ones"
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
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/moving_variance"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/BatchNorm/moving_variance"
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
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/BatchNorm/Const_1"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/Const_2"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_pwise_conv/BiasAdd"
  input: "unittest0/inverted_bottleneck/BatchNorm/Const"
  input: "unittest0/inverted_bottleneck/BatchNorm/beta/read"
  input: "unittest0/inverted_bottleneck/BatchNorm/Const_1"
  input: "unittest0/inverted_bottleneck/BatchNorm/Const_2"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/Const_3"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg/sub/x"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg/sub/x"
  input: "unittest0/inverted_bottleneck/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/BatchNorm/moving_mean/read"
  input: "unittest0/inverted_bottleneck/BatchNorm/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg/sub_1"
  input: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "unittest0/inverted_bottleneck/BatchNorm/moving_mean"
  input: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg/mul"
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
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/moving_mean"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg_1/sub/x"
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
  name: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "unittest0/inverted_bottleneck/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/BatchNorm/moving_variance/read"
  input: "unittest0/inverted_bottleneck/BatchNorm/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unittest0/inverted_bottleneck/BatchNorm/moving_variance"
  input: "unittest0/inverted_bottleneck/BatchNorm/AssignMovingAvg_1/mul"
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
        s: "loc:@unittest0/inverted_bottleneck/BatchNorm/moving_variance"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/shape"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/max"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/RandomUniform"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/sub"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform"
  op: "Add"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/mul"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform/min"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/Initializer/random_uniform"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases/Assign"
  op: "Assign"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases/Initializer/zeros"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases/read"
  op: "Identity"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases"
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
        s: "loc:@unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases"
      }
    }
  }
}
node {
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/dilation_rate"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/Conv2D"
  op: "Conv2D"
  input: "Placeholder"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/weights/read"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/BiasAdd"
  op: "BiasAdd"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/Conv2D"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/biases/read"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_maxpool/MaxPool"
  op: "MaxPool"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_conv1x1/BiasAdd"
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
  name: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_sum"
  op: "Add"
  input: "unittest0/inverted_bottleneck/inverted_bottleneck_shortcut_maxpool/MaxPool"
  input: "unittest0/inverted_bottleneck/BatchNorm/FusedBatchNorm"
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
