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
          size: 2
        }
        dim {
          size: 2
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
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
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
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
        float_val: -0.577350258827
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
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
        float_val: 0.577350258827
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/shape"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/max"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/min"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/RandomUniform"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/sub"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform"
  op: "Add"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/mul"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform/min"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
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
          size: 1
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Assign"
  op: "Assign"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Initializer/random_uniform"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/read"
  op: "Identity"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/read"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/kernel/Regularizer/l2_regularizer/scale"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/kernel/Regularizer/l2_regularizer/L2Loss"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights"
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/Shape"
  op: "Shape"
  input: "Placeholder"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice/stack"
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
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice/stack_1"
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
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice/stack_2"
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
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice"
  op: "StridedSlice"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/Shape"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice/stack"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice/stack_1"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_1/stack"
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
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_1/stack_1"
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
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_1/stack_2"
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
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_1"
  op: "StridedSlice"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/Shape"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_1/stack"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_1/stack_1"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_2/stack"
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
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_2/stack_1"
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
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_2/stack_2"
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
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_2"
  op: "StridedSlice"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/Shape"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_2/stack"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_2/stack_1"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/mul/y"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/mul"
  op: "Mul"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_1"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/mul/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/add/y"
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
        int_val: 0
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/add"
  op: "Add"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/mul"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/add/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/mul_1/y"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/mul_1"
  op: "Mul"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice_2"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/add_1/y"
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
        int_val: 0
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/add_1"
  op: "Add"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/mul_1"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/add_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/stack/3"
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
        int_val: 1
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/stack"
  op: "Pack"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/strided_slice"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/add"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/add_1"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/stack/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/conv2d_transpose"
  op: "Conv2DBackpropInput"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/stack"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/read"
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
      s: "VALID"
    }
  }
  attr {
    key: "strides"
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
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/Const"
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
            size: 1
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta"
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
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta/Assign"
  op: "Assign"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta/Initializer/zeros"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta/read"
  op: "Identity"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean"
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
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean/Initializer/zeros"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance"
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
            size: 1
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance/Initializer/ones"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/Const_1"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/Const_2"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/conv2d_transpose"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/Const"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta/read"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/Const_1"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/Const_2"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/Const_3"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg/sub/x"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg/sub"
  op: "Sub"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg/sub/x"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg/sub_1"
  op: "Sub"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean/read"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/FusedBatchNorm:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg/mul"
  op: "Mul"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg/sub_1"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg"
  op: "AssignSub"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg/mul"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg_1/sub/x"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg_1/sub"
  op: "Sub"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg_1/sub/x"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg_1/sub_1"
  op: "Sub"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance/read"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/FusedBatchNorm:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg_1/mul"
  op: "Mul"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg_1/sub_1"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg_1/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg_1"
  op: "AssignSub"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/AssignMovingAvg_1/mul"
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
        s: "loc:@unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance"
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
  name: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/Relu6"
  op: "Relu6"
  input: "unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ToFloat/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
          dim {
            size: 1
          }
          dim {
            size: 2
          }
          dim {
            size: 2
          }
          dim {
            size: 1
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "ToFloat"
  op: "Cast"
  input: "ToFloat/x"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "init"
  op: "NoOp"
  input: "^unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/beta/Assign"
  input: "^unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_mean/Assign"
  input: "^unitest0/conv2dtrans_unpool/conv2dtrans_unpool/BatchNorm/moving_variance/Assign"
  input: "^unitest0/conv2dtrans_unpool/conv2dtrans_unpool/weights/Assign"
  device: "/device:CPU:0"
}
versions {
  producer: 26
}
