Readme for Tensorflow modules for Convolutional Neural Networks
==================================
- Final update: 2018 Mar 
- All right reserved @ Jaewook Kang 2017-2018


## About


### Compiler/Interface Dependencies
- Tensorflow >=1.4
- Python2 <= 2.7.12
- Python3 <= 3.6.0


## Components
- `cnn_layer_modules.py`: CNN layer Tensorflow module
    - class `PoolingLayer`
    - class `Conv2dLayer`
    - class `FcLayer`

- `inception_modules.py` : Inception Tensorflow module 
    
- `tfmodoel_lenet5.py`: LeNet5 Tensorlfow model implementation 
- `mnist_data_loader.py`: 


## Tflite Conversion 
All the codes in this repository is convertable to tflite format. 
Note that for tflite conversion, only a limited number of Tensorflow ops are allowed 
for your implementation. 
- For please see [this documentation](https://docs.google.com/document/d/1zC2aldD--QcGyimcbXihpeUlfkfRcvIpoQS0sxMT4GY/edit#) 
- otherwise directly go to [Google documentation](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/contrib/lite/g3doc/tf_ops_compatibility.md).


# Feedback 
- Issues: report issues, bugs, and request new features
- Pull request
- Email: jwkang10@gmail.com

# License
- Apach License 2.0


# Authors information 
- Jaewook Kang Ph.D.
- Personal website: [link](https://sites.google.com/site/jwkang10/)
- Facebook : [link](https://www.facebook.com/jwkkang)
- Linkedin : [link](https://www.linkedin.com/in/jaewook-kang-3a4217b9/)


## Code References
- Basic CNN modules
    - https://github.com/tensorflow/models/blob/master/tutorials/image/mnist/convolutional.py
    - https://github.com/sujaybabruwad/LeNet-in-Tensorflow/blob/master/LeNet-Lab.ipynb

- Inception modules
    - [TF slim implementation](https://github.com/tensorflow/models/tree/master/research/slim/nets)
    