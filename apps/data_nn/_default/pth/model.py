# Autogenerated by onnx-pytorch.

import glob
import os
import math

import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
import torchvision


class Model(nn.Module):
  def __init__(self):
    super(Model, self).__init__()
    self._vars = nn.ParameterDict()
    self._regularizer_params = []
    for b in glob.glob(
        os.path.join(os.path.dirname(__file__), "variables", "*.npy")):
      v = torch.from_numpy(np.load(b))
      requires_grad = v.dtype.is_floating_point or v.dtype.is_complex
      self._vars[os.path.basename(b)[:-4]] = nn.Parameter(v, requires_grad=requires_grad)
    self.n_StatefulPartitionedCall_sequential_conv2d_BiasAdd = nn.Conv2d(**{'groups': 1, 'dilation': [1, 1], 'out_channels': 16, 'padding': 0, 'kernel_size': (3, 3), 'stride': [2, 2], 'in_channels': 3, 'bias': True})
    self.n_StatefulPartitionedCall_sequential_conv2d_BiasAdd.weight.data = self._vars["StatefulPartitionedCall_sequential_conv2d_Conv2D_ReadVariableOp_0"]
    self.n_StatefulPartitionedCall_sequential_conv2d_BiasAdd.bias.data = self._vars["StatefulPartitionedCall_sequential_conv2d_BiasAdd_ReadVariableOp_0"]
    self.n_StatefulPartitionedCall_sequential_conv2d_1_BiasAdd = nn.Conv2d(**{'groups': 1, 'dilation': [1, 1], 'out_channels': 32, 'padding': 0, 'kernel_size': (3, 3), 'stride': [2, 2], 'in_channels': 16, 'bias': True})
    self.n_StatefulPartitionedCall_sequential_conv2d_1_BiasAdd.weight.data = self._vars["StatefulPartitionedCall_sequential_conv2d_1_Conv2D_ReadVariableOp_0"]
    self.n_StatefulPartitionedCall_sequential_conv2d_1_BiasAdd.bias.data = self._vars["StatefulPartitionedCall_sequential_conv2d_1_BiasAdd_ReadVariableOp_0"]
    self.n_StatefulPartitionedCall_sequential_conv2d_2_BiasAdd = nn.Conv2d(**{'groups': 1, 'dilation': [1, 1], 'out_channels': 64, 'padding': 0, 'kernel_size': (3, 3), 'stride': [2, 2], 'in_channels': 32, 'bias': True})
    self.n_StatefulPartitionedCall_sequential_conv2d_2_BiasAdd.weight.data = self._vars["StatefulPartitionedCall_sequential_conv2d_2_Conv2D_ReadVariableOp_0"]
    self.n_StatefulPartitionedCall_sequential_conv2d_2_BiasAdd.bias.data = self._vars["StatefulPartitionedCall_sequential_conv2d_2_BiasAdd_ReadVariableOp_0"]
    self.n_StatefulPartitionedCall_sequential_conv2d_3_BiasAdd = nn.Conv2d(**{'groups': 1, 'dilation': [1, 1], 'out_channels': 128, 'padding': 0, 'kernel_size': (3, 3), 'stride': [2, 2], 'in_channels': 64, 'bias': True})
    self.n_StatefulPartitionedCall_sequential_conv2d_3_BiasAdd.weight.data = self._vars["StatefulPartitionedCall_sequential_conv2d_3_Conv2D_ReadVariableOp_0"]
    self.n_StatefulPartitionedCall_sequential_conv2d_3_BiasAdd.bias.data = self._vars["StatefulPartitionedCall_sequential_conv2d_3_BiasAdd_ReadVariableOp_0"]

  def forward(self, *inputs):
    conv2d_input, = inputs
    StatefulPartitionedCall_sequential_conv2d_BiasAdd__6_0 = conv2d_input.permute(*[0, 3, 1, 2])
    StatefulPartitionedCall_sequential_conv2d_BiasAdd_0 = self.n_StatefulPartitionedCall_sequential_conv2d_BiasAdd(StatefulPartitionedCall_sequential_conv2d_BiasAdd__6_0)
    StatefulPartitionedCall_sequential_conv2d_Relu_0 = F.relu(StatefulPartitionedCall_sequential_conv2d_BiasAdd_0)
    StatefulPartitionedCall_sequential_conv2d_1_BiasAdd_0 = self.n_StatefulPartitionedCall_sequential_conv2d_1_BiasAdd(StatefulPartitionedCall_sequential_conv2d_Relu_0)
    StatefulPartitionedCall_sequential_conv2d_1_Relu_0 = F.relu(StatefulPartitionedCall_sequential_conv2d_1_BiasAdd_0)
    StatefulPartitionedCall_sequential_conv2d_2_BiasAdd_0 = self.n_StatefulPartitionedCall_sequential_conv2d_2_BiasAdd(StatefulPartitionedCall_sequential_conv2d_1_Relu_0)
    StatefulPartitionedCall_sequential_conv2d_2_Relu_0 = F.relu(StatefulPartitionedCall_sequential_conv2d_2_BiasAdd_0)
    StatefulPartitionedCall_sequential_conv2d_3_BiasAdd_0 = self.n_StatefulPartitionedCall_sequential_conv2d_3_BiasAdd(StatefulPartitionedCall_sequential_conv2d_2_Relu_0)
    StatefulPartitionedCall_sequential_conv2d_3_Relu_0 = F.relu(StatefulPartitionedCall_sequential_conv2d_3_BiasAdd_0)
    StatefulPartitionedCall_sequential_flatten_Reshape_0 = torch.reshape(StatefulPartitionedCall_sequential_conv2d_3_Relu_0, [s if s != 0 else StatefulPartitionedCall_sequential_conv2d_3_Relu_0.shape[i] for i, s in enumerate(self._vars["const_fold_opt__24"])])
    StatefulPartitionedCall_sequential_dense_MatMul_0 = torch.matmul(StatefulPartitionedCall_sequential_flatten_Reshape_0, self._vars["StatefulPartitionedCall_sequential_dense_MatMul_ReadVariableOp_0"])
    StatefulPartitionedCall_sequential_dense_BiasAdd_0 = torch.add(StatefulPartitionedCall_sequential_dense_MatMul_0, self._vars["StatefulPartitionedCall_sequential_dense_BiasAdd_ReadVariableOp_0"])
    dense = F.softmax(StatefulPartitionedCall_sequential_dense_BiasAdd_0, **{'dim': -1})
    return dense

  def compatible_auto_pad(self, input, kernel_spatial_shape, nn_mod, auto_pad=None, **kwargs):
    input_spatial_shape = input.shape[2:]
    d = len(input_spatial_shape)
    strides = nn_mod.stride
    dilations = nn_mod.dilation
    output_spatial_shape = [math.ceil(float(l) / float(r)) for l, r in zip(input.shape[2:], strides)]
    pt_padding = [0] * 2 * d
    pad_shape = [0] * d
    for i in range(d):
      pad_shape[i] = (output_spatial_shape[i] - 1) * strides[i] + ((kernel_spatial_shape[i] - 1) * dilations[i] + 1) - input_spatial_shape[i]
      mean = pad_shape[i] // 2
      if auto_pad == b"SAME_UPPER":
        l, r = pad_shape[i] - mean, mean
      else:
        l, r = mean, pad_shape[i] - mean
      pt_padding.insert(0, r)
      pt_padding.insert(0, l)
    return F.pad(input, pt_padding)

@torch.no_grad()
def test_run_model(inputs=[torch.from_numpy(np.random.randn(*[1, 32, 32, 3]).astype(np.float32))]):
  model = Model()
  model.eval()
  rs = model(*inputs)
  print(rs)
  return rs
