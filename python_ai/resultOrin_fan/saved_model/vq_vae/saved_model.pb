��
��
D
AddV2
x"T
y"T
z"T"
Ttype:
2	��
�
ArgMin

input"T
	dimension"Tidx
output"output_type"!
Ttype:
2	
"
Tidxtype0:
2	"
output_typetype0	:
2	
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
�
BiasAdd

value"T	
bias"T
output"T""
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
�
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

�
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

$
DisableCopyOnRead
resource�
.
Identity

input"T
output"T"	
Ttype
u
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
2	
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( ""
Ttype:
2	"
Tidxtype0:
2	
�
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( �
?
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
�
OneHot
indices"TI	
depth
on_value"T
	off_value"T
output"T"
axisint���������"	
Ttype"
TItype0	:
2	
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
8
Pow
x"T
y"T
z"T"
Ttype:
2
	
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
d
Shape

input"T&
output"out_type��out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
2
StopGradient

input"T
output"T"	
Ttype
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( ""
Ttype:
2	"
Tidxtype0:
2	
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.12.02unknown8��
�
-Adam/v/vq_vae/decoder/conv2d_transpose_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*>
shared_name/-Adam/v/vq_vae/decoder/conv2d_transpose_2/bias
�
AAdam/v/vq_vae/decoder/conv2d_transpose_2/bias/Read/ReadVariableOpReadVariableOp-Adam/v/vq_vae/decoder/conv2d_transpose_2/bias*
_output_shapes
:*
dtype0
�
-Adam/m/vq_vae/decoder/conv2d_transpose_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*>
shared_name/-Adam/m/vq_vae/decoder/conv2d_transpose_2/bias
�
AAdam/m/vq_vae/decoder/conv2d_transpose_2/bias/Read/ReadVariableOpReadVariableOp-Adam/m/vq_vae/decoder/conv2d_transpose_2/bias*
_output_shapes
:*
dtype0
�
/Adam/v/vq_vae/decoder/conv2d_transpose_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *@
shared_name1/Adam/v/vq_vae/decoder/conv2d_transpose_2/kernel
�
CAdam/v/vq_vae/decoder/conv2d_transpose_2/kernel/Read/ReadVariableOpReadVariableOp/Adam/v/vq_vae/decoder/conv2d_transpose_2/kernel*&
_output_shapes
: *
dtype0
�
/Adam/m/vq_vae/decoder/conv2d_transpose_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *@
shared_name1/Adam/m/vq_vae/decoder/conv2d_transpose_2/kernel
�
CAdam/m/vq_vae/decoder/conv2d_transpose_2/kernel/Read/ReadVariableOpReadVariableOp/Adam/m/vq_vae/decoder/conv2d_transpose_2/kernel*&
_output_shapes
: *
dtype0
�
-Adam/v/vq_vae/decoder/conv2d_transpose_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*>
shared_name/-Adam/v/vq_vae/decoder/conv2d_transpose_1/bias
�
AAdam/v/vq_vae/decoder/conv2d_transpose_1/bias/Read/ReadVariableOpReadVariableOp-Adam/v/vq_vae/decoder/conv2d_transpose_1/bias*
_output_shapes
:@*
dtype0
�
-Adam/m/vq_vae/decoder/conv2d_transpose_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*>
shared_name/-Adam/m/vq_vae/decoder/conv2d_transpose_1/bias
�
AAdam/m/vq_vae/decoder/conv2d_transpose_1/bias/Read/ReadVariableOpReadVariableOp-Adam/m/vq_vae/decoder/conv2d_transpose_1/bias*
_output_shapes
:@*
dtype0
�
/Adam/v/vq_vae/decoder/conv2d_transpose_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*@
shared_name1/Adam/v/vq_vae/decoder/conv2d_transpose_1/kernel
�
CAdam/v/vq_vae/decoder/conv2d_transpose_1/kernel/Read/ReadVariableOpReadVariableOp/Adam/v/vq_vae/decoder/conv2d_transpose_1/kernel*&
_output_shapes
:@@*
dtype0
�
/Adam/m/vq_vae/decoder/conv2d_transpose_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*@
shared_name1/Adam/m/vq_vae/decoder/conv2d_transpose_1/kernel
�
CAdam/m/vq_vae/decoder/conv2d_transpose_1/kernel/Read/ReadVariableOpReadVariableOp/Adam/m/vq_vae/decoder/conv2d_transpose_1/kernel*&
_output_shapes
:@@*
dtype0
�
+Adam/v/vq_vae/decoder/conv2d_transpose/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *<
shared_name-+Adam/v/vq_vae/decoder/conv2d_transpose/bias
�
?Adam/v/vq_vae/decoder/conv2d_transpose/bias/Read/ReadVariableOpReadVariableOp+Adam/v/vq_vae/decoder/conv2d_transpose/bias*
_output_shapes
: *
dtype0
�
+Adam/m/vq_vae/decoder/conv2d_transpose/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *<
shared_name-+Adam/m/vq_vae/decoder/conv2d_transpose/bias
�
?Adam/m/vq_vae/decoder/conv2d_transpose/bias/Read/ReadVariableOpReadVariableOp+Adam/m/vq_vae/decoder/conv2d_transpose/bias*
_output_shapes
: *
dtype0
�
-Adam/v/vq_vae/decoder/conv2d_transpose/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*>
shared_name/-Adam/v/vq_vae/decoder/conv2d_transpose/kernel
�
AAdam/v/vq_vae/decoder/conv2d_transpose/kernel/Read/ReadVariableOpReadVariableOp-Adam/v/vq_vae/decoder/conv2d_transpose/kernel*&
_output_shapes
: @*
dtype0
�
-Adam/m/vq_vae/decoder/conv2d_transpose/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*>
shared_name/-Adam/m/vq_vae/decoder/conv2d_transpose/kernel
�
AAdam/m/vq_vae/decoder/conv2d_transpose/kernel/Read/ReadVariableOpReadVariableOp-Adam/m/vq_vae/decoder/conv2d_transpose/kernel*&
_output_shapes
: @*
dtype0
�
Adam/v/embeddings_vqvaeVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@�*(
shared_nameAdam/v/embeddings_vqvae
�
+Adam/v/embeddings_vqvae/Read/ReadVariableOpReadVariableOpAdam/v/embeddings_vqvae*
_output_shapes
:	@�*
dtype0
�
Adam/m/embeddings_vqvaeVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@�*(
shared_nameAdam/m/embeddings_vqvae
�
+Adam/m/embeddings_vqvae/Read/ReadVariableOpReadVariableOpAdam/m/embeddings_vqvae*
_output_shapes
:	@�*
dtype0
�
#Adam/v/vq_vae/encoder/conv2d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*4
shared_name%#Adam/v/vq_vae/encoder/conv2d_2/bias
�
7Adam/v/vq_vae/encoder/conv2d_2/bias/Read/ReadVariableOpReadVariableOp#Adam/v/vq_vae/encoder/conv2d_2/bias*
_output_shapes
:@*
dtype0
�
#Adam/m/vq_vae/encoder/conv2d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*4
shared_name%#Adam/m/vq_vae/encoder/conv2d_2/bias
�
7Adam/m/vq_vae/encoder/conv2d_2/bias/Read/ReadVariableOpReadVariableOp#Adam/m/vq_vae/encoder/conv2d_2/bias*
_output_shapes
:@*
dtype0
�
%Adam/v/vq_vae/encoder/conv2d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*6
shared_name'%Adam/v/vq_vae/encoder/conv2d_2/kernel
�
9Adam/v/vq_vae/encoder/conv2d_2/kernel/Read/ReadVariableOpReadVariableOp%Adam/v/vq_vae/encoder/conv2d_2/kernel*&
_output_shapes
:@@*
dtype0
�
%Adam/m/vq_vae/encoder/conv2d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*6
shared_name'%Adam/m/vq_vae/encoder/conv2d_2/kernel
�
9Adam/m/vq_vae/encoder/conv2d_2/kernel/Read/ReadVariableOpReadVariableOp%Adam/m/vq_vae/encoder/conv2d_2/kernel*&
_output_shapes
:@@*
dtype0
�
#Adam/v/vq_vae/encoder/conv2d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*4
shared_name%#Adam/v/vq_vae/encoder/conv2d_1/bias
�
7Adam/v/vq_vae/encoder/conv2d_1/bias/Read/ReadVariableOpReadVariableOp#Adam/v/vq_vae/encoder/conv2d_1/bias*
_output_shapes
:@*
dtype0
�
#Adam/m/vq_vae/encoder/conv2d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*4
shared_name%#Adam/m/vq_vae/encoder/conv2d_1/bias
�
7Adam/m/vq_vae/encoder/conv2d_1/bias/Read/ReadVariableOpReadVariableOp#Adam/m/vq_vae/encoder/conv2d_1/bias*
_output_shapes
:@*
dtype0
�
%Adam/v/vq_vae/encoder/conv2d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*6
shared_name'%Adam/v/vq_vae/encoder/conv2d_1/kernel
�
9Adam/v/vq_vae/encoder/conv2d_1/kernel/Read/ReadVariableOpReadVariableOp%Adam/v/vq_vae/encoder/conv2d_1/kernel*&
_output_shapes
: @*
dtype0
�
%Adam/m/vq_vae/encoder/conv2d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*6
shared_name'%Adam/m/vq_vae/encoder/conv2d_1/kernel
�
9Adam/m/vq_vae/encoder/conv2d_1/kernel/Read/ReadVariableOpReadVariableOp%Adam/m/vq_vae/encoder/conv2d_1/kernel*&
_output_shapes
: @*
dtype0
�
!Adam/v/vq_vae/encoder/conv2d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *2
shared_name#!Adam/v/vq_vae/encoder/conv2d/bias
�
5Adam/v/vq_vae/encoder/conv2d/bias/Read/ReadVariableOpReadVariableOp!Adam/v/vq_vae/encoder/conv2d/bias*
_output_shapes
: *
dtype0
�
!Adam/m/vq_vae/encoder/conv2d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *2
shared_name#!Adam/m/vq_vae/encoder/conv2d/bias
�
5Adam/m/vq_vae/encoder/conv2d/bias/Read/ReadVariableOpReadVariableOp!Adam/m/vq_vae/encoder/conv2d/bias*
_output_shapes
: *
dtype0
�
#Adam/v/vq_vae/encoder/conv2d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *4
shared_name%#Adam/v/vq_vae/encoder/conv2d/kernel
�
7Adam/v/vq_vae/encoder/conv2d/kernel/Read/ReadVariableOpReadVariableOp#Adam/v/vq_vae/encoder/conv2d/kernel*&
_output_shapes
: *
dtype0
�
#Adam/m/vq_vae/encoder/conv2d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *4
shared_name%#Adam/m/vq_vae/encoder/conv2d/kernel
�
7Adam/m/vq_vae/encoder/conv2d/kernel/Read/ReadVariableOpReadVariableOp#Adam/m/vq_vae/encoder/conv2d/kernel*&
_output_shapes
: *
dtype0
n
learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namelearning_rate
g
!learning_rate/Read/ReadVariableOpReadVariableOplearning_rate*
_output_shapes
: *
dtype0
f
	iterationVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	iteration
_
iteration/Read/ReadVariableOpReadVariableOp	iteration*
_output_shapes
: *
dtype0	
�
&vq_vae/decoder/conv2d_transpose_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*7
shared_name(&vq_vae/decoder/conv2d_transpose_2/bias
�
:vq_vae/decoder/conv2d_transpose_2/bias/Read/ReadVariableOpReadVariableOp&vq_vae/decoder/conv2d_transpose_2/bias*
_output_shapes
:*
dtype0
�
(vq_vae/decoder/conv2d_transpose_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *9
shared_name*(vq_vae/decoder/conv2d_transpose_2/kernel
�
<vq_vae/decoder/conv2d_transpose_2/kernel/Read/ReadVariableOpReadVariableOp(vq_vae/decoder/conv2d_transpose_2/kernel*&
_output_shapes
: *
dtype0
�
&vq_vae/decoder/conv2d_transpose_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*7
shared_name(&vq_vae/decoder/conv2d_transpose_1/bias
�
:vq_vae/decoder/conv2d_transpose_1/bias/Read/ReadVariableOpReadVariableOp&vq_vae/decoder/conv2d_transpose_1/bias*
_output_shapes
:@*
dtype0
�
(vq_vae/decoder/conv2d_transpose_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*9
shared_name*(vq_vae/decoder/conv2d_transpose_1/kernel
�
<vq_vae/decoder/conv2d_transpose_1/kernel/Read/ReadVariableOpReadVariableOp(vq_vae/decoder/conv2d_transpose_1/kernel*&
_output_shapes
:@@*
dtype0
�
$vq_vae/decoder/conv2d_transpose/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *5
shared_name&$vq_vae/decoder/conv2d_transpose/bias
�
8vq_vae/decoder/conv2d_transpose/bias/Read/ReadVariableOpReadVariableOp$vq_vae/decoder/conv2d_transpose/bias*
_output_shapes
: *
dtype0
�
&vq_vae/decoder/conv2d_transpose/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*7
shared_name(&vq_vae/decoder/conv2d_transpose/kernel
�
:vq_vae/decoder/conv2d_transpose/kernel/Read/ReadVariableOpReadVariableOp&vq_vae/decoder/conv2d_transpose/kernel*&
_output_shapes
: @*
dtype0
}
embeddings_vqvaeVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@�*!
shared_nameembeddings_vqvae
v
$embeddings_vqvae/Read/ReadVariableOpReadVariableOpembeddings_vqvae*
_output_shapes
:	@�*
dtype0
�
vq_vae/encoder/conv2d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*-
shared_namevq_vae/encoder/conv2d_2/bias
�
0vq_vae/encoder/conv2d_2/bias/Read/ReadVariableOpReadVariableOpvq_vae/encoder/conv2d_2/bias*
_output_shapes
:@*
dtype0
�
vq_vae/encoder/conv2d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*/
shared_name vq_vae/encoder/conv2d_2/kernel
�
2vq_vae/encoder/conv2d_2/kernel/Read/ReadVariableOpReadVariableOpvq_vae/encoder/conv2d_2/kernel*&
_output_shapes
:@@*
dtype0
�
vq_vae/encoder/conv2d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*-
shared_namevq_vae/encoder/conv2d_1/bias
�
0vq_vae/encoder/conv2d_1/bias/Read/ReadVariableOpReadVariableOpvq_vae/encoder/conv2d_1/bias*
_output_shapes
:@*
dtype0
�
vq_vae/encoder/conv2d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*/
shared_name vq_vae/encoder/conv2d_1/kernel
�
2vq_vae/encoder/conv2d_1/kernel/Read/ReadVariableOpReadVariableOpvq_vae/encoder/conv2d_1/kernel*&
_output_shapes
: @*
dtype0
�
vq_vae/encoder/conv2d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *+
shared_namevq_vae/encoder/conv2d/bias
�
.vq_vae/encoder/conv2d/bias/Read/ReadVariableOpReadVariableOpvq_vae/encoder/conv2d/bias*
_output_shapes
: *
dtype0
�
vq_vae/encoder/conv2d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *-
shared_namevq_vae/encoder/conv2d/kernel
�
0vq_vae/encoder/conv2d/kernel/Read/ReadVariableOpReadVariableOpvq_vae/encoder/conv2d/kernel*&
_output_shapes
: *
dtype0
�
serving_default_input_1Placeholder*/
_output_shapes
:���������  *
dtype0*$
shape:���������  
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1vq_vae/encoder/conv2d/kernelvq_vae/encoder/conv2d/biasvq_vae/encoder/conv2d_1/kernelvq_vae/encoder/conv2d_1/biasvq_vae/encoder/conv2d_2/kernelvq_vae/encoder/conv2d_2/biasembeddings_vqvae(vq_vae/decoder/conv2d_transpose_1/kernel&vq_vae/decoder/conv2d_transpose_1/bias&vq_vae/decoder/conv2d_transpose/kernel$vq_vae/decoder/conv2d_transpose/bias(vq_vae/decoder/conv2d_transpose_2/kernel&vq_vae/decoder/conv2d_transpose_2/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  */
_read_only_resource_inputs
	
*8
config_proto(&

CPU

GPU2*0J

   E8� *,
f'R%
#__inference_signature_wrapper_15979

NoOpNoOp
�_
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�^
value�^B�^ B�^
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
encoder
	vector_quantizer

decoder
	optimizer
loss

signatures*
b
0
1
2
3
4
5
6
7
8
9
10
11
12*
b
0
1
2
3
4
5
6
7
8
9
10
11
12*
* 
�
non_trainable_variables

layers
metrics
layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

 trace_0
!trace_1* 

"trace_0
#trace_1* 
* 
�
$	variables
%trainable_variables
&regularization_losses
'	keras_api
(__call__
*)&call_and_return_all_conditional_losses
*
layer_dict
+
latent_dim*
�
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses

embeddings*
�
2	variables
3trainable_variables
4regularization_losses
5	keras_api
6__call__
*7&call_and_return_all_conditional_losses
8
layer_dict
9output_layer*
�
:
_variables
;_iterations
<_learning_rate
=_index_dict
>
_momentums
?_velocities
@_update_step_xla*
* 

Aserving_default* 
\V
VARIABLE_VALUEvq_vae/encoder/conv2d/kernel&variables/0/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEvq_vae/encoder/conv2d/bias&variables/1/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEvq_vae/encoder/conv2d_1/kernel&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEvq_vae/encoder/conv2d_1/bias&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEvq_vae/encoder/conv2d_2/kernel&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
\V
VARIABLE_VALUEvq_vae/encoder/conv2d_2/bias&variables/5/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEembeddings_vqvae&variables/6/.ATTRIBUTES/VARIABLE_VALUE*
f`
VARIABLE_VALUE&vq_vae/decoder/conv2d_transpose/kernel&variables/7/.ATTRIBUTES/VARIABLE_VALUE*
d^
VARIABLE_VALUE$vq_vae/decoder/conv2d_transpose/bias&variables/8/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUE(vq_vae/decoder/conv2d_transpose_1/kernel&variables/9/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUE&vq_vae/decoder/conv2d_transpose_1/bias'variables/10/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUE(vq_vae/decoder/conv2d_transpose_2/kernel'variables/11/.ATTRIBUTES/VARIABLE_VALUE*
ga
VARIABLE_VALUE&vq_vae/decoder/conv2d_transpose_2/bias'variables/12/.ATTRIBUTES/VARIABLE_VALUE*
* 

0
	1

2*
* 
* 
* 
* 
* 
* 
* 
.
0
1
2
3
4
5*
.
0
1
2
3
4
5*

B0
C1
D2* 
�
Enon_trainable_variables

Flayers
Gmetrics
Hlayer_regularization_losses
Ilayer_metrics
$	variables
%trainable_variables
&regularization_losses
(__call__
*)&call_and_return_all_conditional_losses
&)"call_and_return_conditional_losses*

Jtrace_0
Ktrace_1* 

Ltrace_0
Mtrace_1* 

Nlayer_1
Olayer_2*
�
P	variables
Qtrainable_variables
Rregularization_losses
S	keras_api
T__call__
*U&call_and_return_all_conditional_losses

kernel
bias
 V_jit_compiled_convolution_op*

0*

0*
* 
�
Wnon_trainable_variables

Xlayers
Ymetrics
Zlayer_regularization_losses
[layer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses*

\trace_0
]trace_1* 

^trace_0
_trace_1* 
.
0
1
2
3
4
5*
.
0
1
2
3
4
5*

`0
a1
b2* 
�
cnon_trainable_variables

dlayers
emetrics
flayer_regularization_losses
glayer_metrics
2	variables
3trainable_variables
4regularization_losses
6__call__
*7&call_and_return_all_conditional_losses
&7"call_and_return_conditional_losses*

htrace_0
itrace_1* 

jtrace_0
ktrace_1* 

llayer_1
mlayer_2*
�
n	variables
otrainable_variables
pregularization_losses
q	keras_api
r__call__
*s&call_and_return_all_conditional_losses

kernel
bias
 t_jit_compiled_convolution_op*
�
;0
u1
v2
w3
x4
y5
z6
{7
|8
}9
~10
11
�12
�13
�14
�15
�16
�17
�18
�19
�20
�21
�22
�23
�24
�25
�26*
SM
VARIABLE_VALUE	iteration0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUElearning_rate3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
i
u0
w1
y2
{3
}4
5
�6
�7
�8
�9
�10
�11
�12*
j
v0
x1
z2
|3
~4
�5
�6
�7
�8
�9
�10
�11
�12*
�
�trace_0
�trace_1
�trace_2
�trace_3
�trace_4
�trace_5
�trace_6
�trace_7
�trace_8
�trace_9
�trace_10
�trace_11
�trace_12* 
* 

�trace_0* 

�trace_0* 

�trace_0* 
* 

N0
O1
+2*
* 
* 
* 
* 
* 
* 
* 
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses

kernel
bias
!�_jit_compiled_convolution_op*
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses

kernel
bias
!�_jit_compiled_convolution_op*

0
1*

0
1*
	
D0* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
P	variables
Qtrainable_variables
Rregularization_losses
T__call__
*U&call_and_return_all_conditional_losses
&U"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

�trace_0* 

�trace_0* 

�trace_0* 
* 

l0
m1
92*
* 
* 
* 
* 
* 
* 
* 
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses

kernel
bias
!�_jit_compiled_convolution_op*
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses

kernel
bias
!�_jit_compiled_convolution_op*

0
1*

0
1*
	
b0* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
n	variables
otrainable_variables
pregularization_losses
r__call__
*s&call_and_return_all_conditional_losses
&s"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
* 
nh
VARIABLE_VALUE#Adam/m/vq_vae/encoder/conv2d/kernel1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUE#Adam/v/vq_vae/encoder/conv2d/kernel1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUE*
lf
VARIABLE_VALUE!Adam/m/vq_vae/encoder/conv2d/bias1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUE*
lf
VARIABLE_VALUE!Adam/v/vq_vae/encoder/conv2d/bias1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUE%Adam/m/vq_vae/encoder/conv2d_1/kernel1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUE%Adam/v/vq_vae/encoder/conv2d_1/kernel1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUE#Adam/m/vq_vae/encoder/conv2d_1/bias1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUE#Adam/v/vq_vae/encoder/conv2d_1/bias1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUE%Adam/m/vq_vae/encoder/conv2d_2/kernel1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUE*
qk
VARIABLE_VALUE%Adam/v/vq_vae/encoder/conv2d_2/kernel2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUE*
oi
VARIABLE_VALUE#Adam/m/vq_vae/encoder/conv2d_2/bias2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUE*
oi
VARIABLE_VALUE#Adam/v/vq_vae/encoder/conv2d_2/bias2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEAdam/m/embeddings_vqvae2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUEAdam/v/embeddings_vqvae2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUE-Adam/m/vq_vae/decoder/conv2d_transpose/kernel2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUE-Adam/v/vq_vae/decoder/conv2d_transpose/kernel2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUE*
wq
VARIABLE_VALUE+Adam/m/vq_vae/decoder/conv2d_transpose/bias2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUE*
wq
VARIABLE_VALUE+Adam/v/vq_vae/decoder/conv2d_transpose/bias2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUE/Adam/m/vq_vae/decoder/conv2d_transpose_1/kernel2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUE/Adam/v/vq_vae/decoder/conv2d_transpose_1/kernel2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUE-Adam/m/vq_vae/decoder/conv2d_transpose_1/bias2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUE-Adam/v/vq_vae/decoder/conv2d_transpose_1/bias2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUE/Adam/m/vq_vae/decoder/conv2d_transpose_2/kernel2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUE/Adam/v/vq_vae/decoder/conv2d_transpose_2/kernel2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUE-Adam/m/vq_vae/decoder/conv2d_transpose_2/bias2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUE-Adam/v/vq_vae/decoder/conv2d_transpose_2/bias2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

0
1*

0
1*
	
B0* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
* 

0
1*

0
1*
	
C0* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
* 
* 
* 
* 
	
D0* 
* 
* 
* 
* 
* 
* 

0
1*

0
1*
	
`0* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
* 

0
1*

0
1*
	
a0* 
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses*

�trace_0* 

�trace_0* 
* 
* 
* 
* 
	
b0* 
* 
* 
* 
* 
* 
* 
	
B0* 
* 
* 
* 
* 
* 
* 
	
C0* 
* 
* 
* 
* 
* 
* 
	
`0* 
* 
* 
* 
* 
* 
* 
	
a0* 
* 
* 
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenamevq_vae/encoder/conv2d/kernelvq_vae/encoder/conv2d/biasvq_vae/encoder/conv2d_1/kernelvq_vae/encoder/conv2d_1/biasvq_vae/encoder/conv2d_2/kernelvq_vae/encoder/conv2d_2/biasembeddings_vqvae&vq_vae/decoder/conv2d_transpose/kernel$vq_vae/decoder/conv2d_transpose/bias(vq_vae/decoder/conv2d_transpose_1/kernel&vq_vae/decoder/conv2d_transpose_1/bias(vq_vae/decoder/conv2d_transpose_2/kernel&vq_vae/decoder/conv2d_transpose_2/bias	iterationlearning_rate#Adam/m/vq_vae/encoder/conv2d/kernel#Adam/v/vq_vae/encoder/conv2d/kernel!Adam/m/vq_vae/encoder/conv2d/bias!Adam/v/vq_vae/encoder/conv2d/bias%Adam/m/vq_vae/encoder/conv2d_1/kernel%Adam/v/vq_vae/encoder/conv2d_1/kernel#Adam/m/vq_vae/encoder/conv2d_1/bias#Adam/v/vq_vae/encoder/conv2d_1/bias%Adam/m/vq_vae/encoder/conv2d_2/kernel%Adam/v/vq_vae/encoder/conv2d_2/kernel#Adam/m/vq_vae/encoder/conv2d_2/bias#Adam/v/vq_vae/encoder/conv2d_2/biasAdam/m/embeddings_vqvaeAdam/v/embeddings_vqvae-Adam/m/vq_vae/decoder/conv2d_transpose/kernel-Adam/v/vq_vae/decoder/conv2d_transpose/kernel+Adam/m/vq_vae/decoder/conv2d_transpose/bias+Adam/v/vq_vae/decoder/conv2d_transpose/bias/Adam/m/vq_vae/decoder/conv2d_transpose_1/kernel/Adam/v/vq_vae/decoder/conv2d_transpose_1/kernel-Adam/m/vq_vae/decoder/conv2d_transpose_1/bias-Adam/v/vq_vae/decoder/conv2d_transpose_1/bias/Adam/m/vq_vae/decoder/conv2d_transpose_2/kernel/Adam/v/vq_vae/decoder/conv2d_transpose_2/kernel-Adam/m/vq_vae/decoder/conv2d_transpose_2/bias-Adam/v/vq_vae/decoder/conv2d_transpose_2/biasConst*6
Tin/
-2+*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

   E8� *'
f"R 
__inference__traced_save_17022
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamevq_vae/encoder/conv2d/kernelvq_vae/encoder/conv2d/biasvq_vae/encoder/conv2d_1/kernelvq_vae/encoder/conv2d_1/biasvq_vae/encoder/conv2d_2/kernelvq_vae/encoder/conv2d_2/biasembeddings_vqvae&vq_vae/decoder/conv2d_transpose/kernel$vq_vae/decoder/conv2d_transpose/bias(vq_vae/decoder/conv2d_transpose_1/kernel&vq_vae/decoder/conv2d_transpose_1/bias(vq_vae/decoder/conv2d_transpose_2/kernel&vq_vae/decoder/conv2d_transpose_2/bias	iterationlearning_rate#Adam/m/vq_vae/encoder/conv2d/kernel#Adam/v/vq_vae/encoder/conv2d/kernel!Adam/m/vq_vae/encoder/conv2d/bias!Adam/v/vq_vae/encoder/conv2d/bias%Adam/m/vq_vae/encoder/conv2d_1/kernel%Adam/v/vq_vae/encoder/conv2d_1/kernel#Adam/m/vq_vae/encoder/conv2d_1/bias#Adam/v/vq_vae/encoder/conv2d_1/bias%Adam/m/vq_vae/encoder/conv2d_2/kernel%Adam/v/vq_vae/encoder/conv2d_2/kernel#Adam/m/vq_vae/encoder/conv2d_2/bias#Adam/v/vq_vae/encoder/conv2d_2/biasAdam/m/embeddings_vqvaeAdam/v/embeddings_vqvae-Adam/m/vq_vae/decoder/conv2d_transpose/kernel-Adam/v/vq_vae/decoder/conv2d_transpose/kernel+Adam/m/vq_vae/decoder/conv2d_transpose/bias+Adam/v/vq_vae/decoder/conv2d_transpose/bias/Adam/m/vq_vae/decoder/conv2d_transpose_1/kernel/Adam/v/vq_vae/decoder/conv2d_transpose_1/kernel-Adam/m/vq_vae/decoder/conv2d_transpose_1/bias-Adam/v/vq_vae/decoder/conv2d_transpose_1/bias/Adam/m/vq_vae/decoder/conv2d_transpose_2/kernel/Adam/v/vq_vae/decoder/conv2d_transpose_2/kernel-Adam/m/vq_vae/decoder/conv2d_transpose_2/bias-Adam/v/vq_vae/decoder/conv2d_transpose_2/bias*5
Tin.
,2**
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *8
config_proto(&

CPU

GPU2*0J

   E8� **
f%R#
!__inference__traced_restore_17155��
�
V
"__inference__update_step_xla_16216
gradient"
variable:@@*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
:@@: *
	_noinline(:P L
&
_output_shapes
:@@
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�
�
C__inference_conv2d_1_layer_call_and_return_conditional_losses_15235

inputs8
conv2d_readvariableop_resource: @-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
1vq_vae/encoder/conv2d_1/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_1/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOpA^vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������   : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp:W S
/
_output_shapes
:���������   
 
_user_specified_nameinputs
�
�
0__inference_vector_quantizer_layer_call_fn_15483
input_1
unknown:	@�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  @: *#
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *T
fORM
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_15477w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������  @: 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:���������  @
!
_user_specified_name	input_1
�
�
__inference_loss_fn_2_16497c
Ivq_vae_encoder_conv2d_2_kernel_regularizer_l2loss_readvariableop_resource:@@
identity��@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpIvq_vae_encoder_conv2d_2_kernel_regularizer_l2loss_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
1vq_vae/encoder/conv2d_2/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_2/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: p
IdentityIdentity2vq_vae/encoder/conv2d_2/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpA^vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp
�
�
2__inference_conv2d_transpose_2_layer_call_fn_16573

inputs!
unknown: 
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *V
fQRO
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_15628�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+��������������������������� : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+��������������������������� 
 
_user_specified_nameinputs
�
J
"__inference__update_step_xla_16246
gradient
variable:@*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:@: *
	_noinline(:D @

_output_shapes
:@
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�
�
C__inference_conv2d_2_layer_call_and_return_conditional_losses_16529

inputs8
conv2d_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
1vq_vae/encoder/conv2d_2/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_2/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOpA^vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�)
�
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_15628

inputsB
(conv2d_transpose_readvariableop_resource: -
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+���������������������������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������p
SigmoidSigmoidBiasAdd:output:0*
T0*A
_output_shapes/
-:+����������������������������
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
;vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: t
IdentityIdentitySigmoid:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+��������������������������� : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:i e
A
_output_shapes/
-:+��������������������������� 
 
_user_specified_nameinputs
�
J
"__inference__update_step_xla_16211
gradient
variable:@*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:@: *
	_noinline(:D @

_output_shapes
:@
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�
O
"__inference__update_step_xla_16226
gradient
variable:	@�*
_XlaMustCompile(*(
_construction_contextkEagerRuntime* 
_input_shapes
:	@�: *
	_noinline(:I E

_output_shapes
:	@�
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�
J
"__inference__update_step_xla_16201
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

: : *
	_noinline(:D @

_output_shapes
: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�	
�
'__inference_decoder_layer_call_fn_15719
input_1!
unknown:@@
	unknown_0:@#
	unknown_1: @
	unknown_2: #
	unknown_3: 
	unknown_4:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

   E8� *K
fFRD
B__inference_decoder_layer_call_and_return_conditional_losses_15704w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  @: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:���������  @
!
_user_specified_name	input_1
�
�
0__inference_vector_quantizer_layer_call_fn_16322
x
unknown:	@�
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallxunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  @: *#
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *T
fORM
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_15477w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������  @: 22
StatefulPartitionedCallStatefulPartitionedCall:R N
/
_output_shapes
:���������  @

_user_specified_namex
�'
�
B__inference_encoder_layer_call_and_return_conditional_losses_15275
input_1&
conv2d_15215: 
conv2d_15217: (
conv2d_1_15236: @
conv2d_1_15238:@(
conv2d_2_15257:@@
conv2d_2_15259:@
identity��conv2d/StatefulPartitionedCall� conv2d_1/StatefulPartitionedCall� conv2d_2/StatefulPartitionedCall�>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp�
conv2d/StatefulPartitionedCallStatefulPartitionedCallinput_1conv2d_15215conv2d_15217*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������   *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *J
fERC
A__inference_conv2d_layer_call_and_return_conditional_losses_15214�
 conv2d_1/StatefulPartitionedCallStatefulPartitionedCall'conv2d/StatefulPartitionedCall:output:0conv2d_1_15236conv2d_1_15238*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *L
fGRE
C__inference_conv2d_1_layer_call_and_return_conditional_losses_15235�
 conv2d_2/StatefulPartitionedCallStatefulPartitionedCall)conv2d_1/StatefulPartitionedCall:output:0conv2d_2_15257conv2d_2_15259*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *L
fGRE
C__inference_conv2d_2_layer_call_and_return_conditional_losses_15256�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_15215*&
_output_shapes
: *
dtype0�
/vq_vae/encoder/conv2d/kernel/Regularizer/L2LossL2LossFvq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: s
.vq_vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
,vq_vae/encoder/conv2d/kernel/Regularizer/mulMul7vq_vae/encoder/conv2d/kernel/Regularizer/mul/x:output:08vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_1_15236*&
_output_shapes
: @*
dtype0�
1vq_vae/encoder/conv2d_1/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_1/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_2_15257*&
_output_shapes
:@@*
dtype0�
1vq_vae/encoder/conv2d_2/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_2/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
IdentityIdentity)conv2d_2/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^conv2d/StatefulPartitionedCall!^conv2d_1/StatefulPartitionedCall!^conv2d_2/StatefulPartitionedCall?^vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  : : : : : : 2@
conv2d/StatefulPartitionedCallconv2d/StatefulPartitionedCall2D
 conv2d_1/StatefulPartitionedCall conv2d_1/StatefulPartitionedCall2D
 conv2d_2/StatefulPartitionedCall conv2d_2/StatefulPartitionedCall2�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�D
�
A__inference_vq_vae_layer_call_and_return_conditional_losses_15858	
input'
encoder_15802: 
encoder_15804: '
encoder_15806: @
encoder_15808:@'
encoder_15810:@@
encoder_15812:@)
vector_quantizer_15815:	@�'
decoder_15819:@@
decoder_15821:@'
decoder_15823: @
decoder_15825: '
decoder_15827: 
decoder_15829:
identity

identity_1��decoder/StatefulPartitionedCall�encoder/StatefulPartitionedCall�(vector_quantizer/StatefulPartitionedCall�Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp�>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp�
encoder/StatefulPartitionedCallStatefulPartitionedCallinputencoder_15802encoder_15804encoder_15806encoder_15808encoder_15810encoder_15812*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

   E8� *K
fFRD
B__inference_encoder_layer_call_and_return_conditional_losses_15309�
(vector_quantizer/StatefulPartitionedCallStatefulPartitionedCall(encoder/StatefulPartitionedCall:output:0vector_quantizer_15815*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  @: *#
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *T
fORM
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_15477�
decoder/StatefulPartitionedCallStatefulPartitionedCall1vector_quantizer/StatefulPartitionedCall:output:0decoder_15819decoder_15821decoder_15823decoder_15825decoder_15827decoder_15829*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

   E8� *K
fFRD
B__inference_decoder_layer_call_and_return_conditional_losses_15704�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpencoder_15802*&
_output_shapes
: *
dtype0�
/vq_vae/encoder/conv2d/kernel/Regularizer/L2LossL2LossFvq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: s
.vq_vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
,vq_vae/encoder/conv2d/kernel/Regularizer/mulMul7vq_vae/encoder/conv2d/kernel/Regularizer/mul/x:output:08vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpencoder_15806*&
_output_shapes
: @*
dtype0�
1vq_vae/encoder/conv2d_1/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_1/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpencoder_15810*&
_output_shapes
:@@*
dtype0�
1vq_vae/encoder/conv2d_2/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_2/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpdecoder_15823*&
_output_shapes
: @*
dtype0�
9vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2LossL2LossPvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: }
8vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
6vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mulMulAvq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0Bvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpdecoder_15819*&
_output_shapes
:@@*
dtype0�
;vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpdecoder_15827*&
_output_shapes
: *
dtype0�
;vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: 
IdentityIdentity(decoder/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  q

Identity_1Identity1vector_quantizer/StatefulPartitionedCall:output:1^NoOp*
T0*
_output_shapes
: �
NoOpNoOp ^decoder/StatefulPartitionedCall ^encoder/StatefulPartitionedCall)^vector_quantizer/StatefulPartitionedCallI^vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp?^vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 2B
decoder/StatefulPartitionedCalldecoder/StatefulPartitionedCall2B
encoder/StatefulPartitionedCallencoder/StatefulPartitionedCall2T
(vector_quantizer/StatefulPartitionedCall(vector_quantizer/StatefulPartitionedCall2�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpHvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp2�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:V R
/
_output_shapes
:���������  

_user_specified_nameinput
��
�
 __inference__wrapped_model_15195
input_1N
4vq_vae_encoder_conv2d_conv2d_readvariableop_resource: C
5vq_vae_encoder_conv2d_biasadd_readvariableop_resource: P
6vq_vae_encoder_conv2d_1_conv2d_readvariableop_resource: @E
7vq_vae_encoder_conv2d_1_biasadd_readvariableop_resource:@P
6vq_vae_encoder_conv2d_2_conv2d_readvariableop_resource:@@E
7vq_vae_encoder_conv2d_2_biasadd_readvariableop_resource:@I
6vq_vae_vector_quantizer_matmul_readvariableop_resource:	@�d
Jvq_vae_decoder_conv2d_transpose_1_conv2d_transpose_readvariableop_resource:@@O
Avq_vae_decoder_conv2d_transpose_1_biasadd_readvariableop_resource:@b
Hvq_vae_decoder_conv2d_transpose_conv2d_transpose_readvariableop_resource: @M
?vq_vae_decoder_conv2d_transpose_biasadd_readvariableop_resource: d
Jvq_vae_decoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource: O
Avq_vae_decoder_conv2d_transpose_2_biasadd_readvariableop_resource:
identity��6vq_vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOp�?vq_vae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp�8vq_vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp�Avq_vae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp�8vq_vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp�Avq_vae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp�,vq_vae/encoder/conv2d/BiasAdd/ReadVariableOp�+vq_vae/encoder/conv2d/Conv2D/ReadVariableOp�.vq_vae/encoder/conv2d_1/BiasAdd/ReadVariableOp�-vq_vae/encoder/conv2d_1/Conv2D/ReadVariableOp�.vq_vae/encoder/conv2d_2/BiasAdd/ReadVariableOp�-vq_vae/encoder/conv2d_2/Conv2D/ReadVariableOp�-vq_vae/vector_quantizer/MatMul/ReadVariableOp�/vq_vae/vector_quantizer/MatMul_1/ReadVariableOp�&vq_vae/vector_quantizer/ReadVariableOp�
+vq_vae/encoder/conv2d/Conv2D/ReadVariableOpReadVariableOp4vq_vae_encoder_conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
vq_vae/encoder/conv2d/Conv2DConv2Dinput_13vq_vae/encoder/conv2d/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
,vq_vae/encoder/conv2d/BiasAdd/ReadVariableOpReadVariableOp5vq_vae_encoder_conv2d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
vq_vae/encoder/conv2d/BiasAddBiasAdd%vq_vae/encoder/conv2d/Conv2D:output:04vq_vae/encoder/conv2d/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   �
vq_vae/encoder/conv2d/ReluRelu&vq_vae/encoder/conv2d/BiasAdd:output:0*
T0*/
_output_shapes
:���������   �
-vq_vae/encoder/conv2d_1/Conv2D/ReadVariableOpReadVariableOp6vq_vae_encoder_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
vq_vae/encoder/conv2d_1/Conv2DConv2D(vq_vae/encoder/conv2d/Relu:activations:05vq_vae/encoder/conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
.vq_vae/encoder/conv2d_1/BiasAdd/ReadVariableOpReadVariableOp7vq_vae_encoder_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
vq_vae/encoder/conv2d_1/BiasAddBiasAdd'vq_vae/encoder/conv2d_1/Conv2D:output:06vq_vae/encoder/conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @�
vq_vae/encoder/conv2d_1/ReluRelu(vq_vae/encoder/conv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
-vq_vae/encoder/conv2d_2/Conv2D/ReadVariableOpReadVariableOp6vq_vae_encoder_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
vq_vae/encoder/conv2d_2/Conv2DConv2D*vq_vae/encoder/conv2d_1/Relu:activations:05vq_vae/encoder/conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
.vq_vae/encoder/conv2d_2/BiasAdd/ReadVariableOpReadVariableOp7vq_vae_encoder_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
vq_vae/encoder/conv2d_2/BiasAddBiasAdd'vq_vae/encoder/conv2d_2/Conv2D:output:06vq_vae/encoder/conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @�
vq_vae/encoder/conv2d_2/ReluRelu(vq_vae/encoder/conv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
vq_vae/vector_quantizer/ShapeShape*vq_vae/encoder/conv2d_2/Relu:activations:0*
T0*
_output_shapes
::��v
%vq_vae/vector_quantizer/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   �
vq_vae/vector_quantizer/ReshapeReshape*vq_vae/encoder/conv2d_2/Relu:activations:0.vq_vae/vector_quantizer/Reshape/shape:output:0*
T0*'
_output_shapes
:���������@�
-vq_vae/vector_quantizer/MatMul/ReadVariableOpReadVariableOp6vq_vae_vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
vq_vae/vector_quantizer/MatMulMatMul(vq_vae/vector_quantizer/Reshape:output:05vq_vae/vector_quantizer/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������b
vq_vae/vector_quantizer/pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vq_vae/vector_quantizer/powPow(vq_vae/vector_quantizer/Reshape:output:0&vq_vae/vector_quantizer/pow/y:output:0*
T0*'
_output_shapes
:���������@o
-vq_vae/vector_quantizer/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
vq_vae/vector_quantizer/SumSumvq_vae/vector_quantizer/pow:z:06vq_vae/vector_quantizer/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(�
&vq_vae/vector_quantizer/ReadVariableOpReadVariableOp6vq_vae_vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0d
vq_vae/vector_quantizer/pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vq_vae/vector_quantizer/pow_1Pow.vq_vae/vector_quantizer/ReadVariableOp:value:0(vq_vae/vector_quantizer/pow_1/y:output:0*
T0*
_output_shapes
:	@�q
/vq_vae/vector_quantizer/Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : �
vq_vae/vector_quantizer/Sum_1Sum!vq_vae/vector_quantizer/pow_1:z:08vq_vae/vector_quantizer/Sum_1/reduction_indices:output:0*
T0*
_output_shapes	
:��
vq_vae/vector_quantizer/addAddV2$vq_vae/vector_quantizer/Sum:output:0&vq_vae/vector_quantizer/Sum_1:output:0*
T0*(
_output_shapes
:����������b
vq_vae/vector_quantizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vq_vae/vector_quantizer/mulMul&vq_vae/vector_quantizer/mul/x:output:0(vq_vae/vector_quantizer/MatMul:product:0*
T0*(
_output_shapes
:�����������
vq_vae/vector_quantizer/subSubvq_vae/vector_quantizer/add:z:0vq_vae/vector_quantizer/mul:z:0*
T0*(
_output_shapes
:����������j
(vq_vae/vector_quantizer/ArgMin/dimensionConst*
_output_shapes
: *
dtype0*
value	B :�
vq_vae/vector_quantizer/ArgMinArgMinvq_vae/vector_quantizer/sub:z:01vq_vae/vector_quantizer/ArgMin/dimension:output:0*
T0*#
_output_shapes
:���������m
(vq_vae/vector_quantizer/one_hot/on_valueConst*
_output_shapes
: *
dtype0*
valueB
 *  �?n
)vq_vae/vector_quantizer/one_hot/off_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    h
%vq_vae/vector_quantizer/one_hot/depthConst*
_output_shapes
: *
dtype0*
value
B :��
vq_vae/vector_quantizer/one_hotOneHot'vq_vae/vector_quantizer/ArgMin:output:0.vq_vae/vector_quantizer/one_hot/depth:output:01vq_vae/vector_quantizer/one_hot/on_value:output:02vq_vae/vector_quantizer/one_hot/off_value:output:0*
T0*(
_output_shapes
:�����������
/vq_vae/vector_quantizer/MatMul_1/ReadVariableOpReadVariableOp6vq_vae_vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
 vq_vae/vector_quantizer/MatMul_1MatMul(vq_vae/vector_quantizer/one_hot:output:07vq_vae/vector_quantizer/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@*
transpose_b(�
!vq_vae/vector_quantizer/Reshape_1Reshape*vq_vae/vector_quantizer/MatMul_1:product:0&vq_vae/vector_quantizer/Shape:output:0*
T0*/
_output_shapes
:���������  @�
$vq_vae/vector_quantizer/StopGradientStopGradient*vq_vae/vector_quantizer/Reshape_1:output:0*
T0*/
_output_shapes
:���������  @�
vq_vae/vector_quantizer/sub_1Sub-vq_vae/vector_quantizer/StopGradient:output:0*vq_vae/encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @d
vq_vae/vector_quantizer/pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vq_vae/vector_quantizer/pow_2Pow!vq_vae/vector_quantizer/sub_1:z:0(vq_vae/vector_quantizer/pow_2/y:output:0*
T0*/
_output_shapes
:���������  @v
vq_vae/vector_quantizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             �
vq_vae/vector_quantizer/MeanMean!vq_vae/vector_quantizer/pow_2:z:0&vq_vae/vector_quantizer/Const:output:0*
T0*
_output_shapes
: d
vq_vae/vector_quantizer/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �>�
vq_vae/vector_quantizer/mul_1Mul(vq_vae/vector_quantizer/mul_1/x:output:0%vq_vae/vector_quantizer/Mean:output:0*
T0*
_output_shapes
: �
&vq_vae/vector_quantizer/StopGradient_1StopGradient*vq_vae/encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @�
vq_vae/vector_quantizer/sub_2Sub*vq_vae/vector_quantizer/Reshape_1:output:0/vq_vae/vector_quantizer/StopGradient_1:output:0*
T0*/
_output_shapes
:���������  @d
vq_vae/vector_quantizer/pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vq_vae/vector_quantizer/pow_3Pow!vq_vae/vector_quantizer/sub_2:z:0(vq_vae/vector_quantizer/pow_3/y:output:0*
T0*/
_output_shapes
:���������  @x
vq_vae/vector_quantizer/Const_1Const*
_output_shapes
:*
dtype0*%
valueB"             �
vq_vae/vector_quantizer/Mean_1Mean!vq_vae/vector_quantizer/pow_3:z:0(vq_vae/vector_quantizer/Const_1:output:0*
T0*
_output_shapes
: �
vq_vae/vector_quantizer/add_1AddV2!vq_vae/vector_quantizer/mul_1:z:0'vq_vae/vector_quantizer/Mean_1:output:0*
T0*
_output_shapes
: �
vq_vae/vector_quantizer/sub_3Sub*vq_vae/vector_quantizer/Reshape_1:output:0*vq_vae/encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @�
&vq_vae/vector_quantizer/StopGradient_2StopGradient!vq_vae/vector_quantizer/sub_3:z:0*
T0*/
_output_shapes
:���������  @�
vq_vae/vector_quantizer/add_2AddV2*vq_vae/encoder/conv2d_2/Relu:activations:0/vq_vae/vector_quantizer/StopGradient_2:output:0*
T0*/
_output_shapes
:���������  @�
'vq_vae/decoder/conv2d_transpose_1/ShapeShape!vq_vae/vector_quantizer/add_2:z:0*
T0*
_output_shapes
::��
5vq_vae/decoder/conv2d_transpose_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: �
7vq_vae/decoder/conv2d_transpose_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
7vq_vae/decoder/conv2d_transpose_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
/vq_vae/decoder/conv2d_transpose_1/strided_sliceStridedSlice0vq_vae/decoder/conv2d_transpose_1/Shape:output:0>vq_vae/decoder/conv2d_transpose_1/strided_slice/stack:output:0@vq_vae/decoder/conv2d_transpose_1/strided_slice/stack_1:output:0@vq_vae/decoder/conv2d_transpose_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskk
)vq_vae/decoder/conv2d_transpose_1/stack/1Const*
_output_shapes
: *
dtype0*
value	B : k
)vq_vae/decoder/conv2d_transpose_1/stack/2Const*
_output_shapes
: *
dtype0*
value	B : k
)vq_vae/decoder/conv2d_transpose_1/stack/3Const*
_output_shapes
: *
dtype0*
value	B :@�
'vq_vae/decoder/conv2d_transpose_1/stackPack8vq_vae/decoder/conv2d_transpose_1/strided_slice:output:02vq_vae/decoder/conv2d_transpose_1/stack/1:output:02vq_vae/decoder/conv2d_transpose_1/stack/2:output:02vq_vae/decoder/conv2d_transpose_1/stack/3:output:0*
N*
T0*
_output_shapes
:�
7vq_vae/decoder/conv2d_transpose_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: �
9vq_vae/decoder/conv2d_transpose_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
9vq_vae/decoder/conv2d_transpose_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
1vq_vae/decoder/conv2d_transpose_1/strided_slice_1StridedSlice0vq_vae/decoder/conv2d_transpose_1/stack:output:0@vq_vae/decoder/conv2d_transpose_1/strided_slice_1/stack:output:0Bvq_vae/decoder/conv2d_transpose_1/strided_slice_1/stack_1:output:0Bvq_vae/decoder/conv2d_transpose_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
Avq_vae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOpReadVariableOpJvq_vae_decoder_conv2d_transpose_1_conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
2vq_vae/decoder/conv2d_transpose_1/conv2d_transposeConv2DBackpropInput0vq_vae/decoder/conv2d_transpose_1/stack:output:0Ivq_vae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp:value:0!vq_vae/vector_quantizer/add_2:z:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
8vq_vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOpReadVariableOpAvq_vae_decoder_conv2d_transpose_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
)vq_vae/decoder/conv2d_transpose_1/BiasAddBiasAdd;vq_vae/decoder/conv2d_transpose_1/conv2d_transpose:output:0@vq_vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @�
&vq_vae/decoder/conv2d_transpose_1/ReluRelu2vq_vae/decoder/conv2d_transpose_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
%vq_vae/decoder/conv2d_transpose/ShapeShape4vq_vae/decoder/conv2d_transpose_1/Relu:activations:0*
T0*
_output_shapes
::��}
3vq_vae/decoder/conv2d_transpose/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
5vq_vae/decoder/conv2d_transpose/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
5vq_vae/decoder/conv2d_transpose/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
-vq_vae/decoder/conv2d_transpose/strided_sliceStridedSlice.vq_vae/decoder/conv2d_transpose/Shape:output:0<vq_vae/decoder/conv2d_transpose/strided_slice/stack:output:0>vq_vae/decoder/conv2d_transpose/strided_slice/stack_1:output:0>vq_vae/decoder/conv2d_transpose/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maski
'vq_vae/decoder/conv2d_transpose/stack/1Const*
_output_shapes
: *
dtype0*
value	B : i
'vq_vae/decoder/conv2d_transpose/stack/2Const*
_output_shapes
: *
dtype0*
value	B : i
'vq_vae/decoder/conv2d_transpose/stack/3Const*
_output_shapes
: *
dtype0*
value	B : �
%vq_vae/decoder/conv2d_transpose/stackPack6vq_vae/decoder/conv2d_transpose/strided_slice:output:00vq_vae/decoder/conv2d_transpose/stack/1:output:00vq_vae/decoder/conv2d_transpose/stack/2:output:00vq_vae/decoder/conv2d_transpose/stack/3:output:0*
N*
T0*
_output_shapes
:
5vq_vae/decoder/conv2d_transpose/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: �
7vq_vae/decoder/conv2d_transpose/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
7vq_vae/decoder/conv2d_transpose/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
/vq_vae/decoder/conv2d_transpose/strided_slice_1StridedSlice.vq_vae/decoder/conv2d_transpose/stack:output:0>vq_vae/decoder/conv2d_transpose/strided_slice_1/stack:output:0@vq_vae/decoder/conv2d_transpose/strided_slice_1/stack_1:output:0@vq_vae/decoder/conv2d_transpose/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
?vq_vae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOpReadVariableOpHvq_vae_decoder_conv2d_transpose_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
0vq_vae/decoder/conv2d_transpose/conv2d_transposeConv2DBackpropInput.vq_vae/decoder/conv2d_transpose/stack:output:0Gvq_vae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp:value:04vq_vae/decoder/conv2d_transpose_1/Relu:activations:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
6vq_vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOpReadVariableOp?vq_vae_decoder_conv2d_transpose_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
'vq_vae/decoder/conv2d_transpose/BiasAddBiasAdd9vq_vae/decoder/conv2d_transpose/conv2d_transpose:output:0>vq_vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   �
$vq_vae/decoder/conv2d_transpose/ReluRelu0vq_vae/decoder/conv2d_transpose/BiasAdd:output:0*
T0*/
_output_shapes
:���������   �
'vq_vae/decoder/conv2d_transpose_2/ShapeShape2vq_vae/decoder/conv2d_transpose/Relu:activations:0*
T0*
_output_shapes
::��
5vq_vae/decoder/conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: �
7vq_vae/decoder/conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
7vq_vae/decoder/conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
/vq_vae/decoder/conv2d_transpose_2/strided_sliceStridedSlice0vq_vae/decoder/conv2d_transpose_2/Shape:output:0>vq_vae/decoder/conv2d_transpose_2/strided_slice/stack:output:0@vq_vae/decoder/conv2d_transpose_2/strided_slice/stack_1:output:0@vq_vae/decoder/conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskk
)vq_vae/decoder/conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B : k
)vq_vae/decoder/conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B : k
)vq_vae/decoder/conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B :�
'vq_vae/decoder/conv2d_transpose_2/stackPack8vq_vae/decoder/conv2d_transpose_2/strided_slice:output:02vq_vae/decoder/conv2d_transpose_2/stack/1:output:02vq_vae/decoder/conv2d_transpose_2/stack/2:output:02vq_vae/decoder/conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:�
7vq_vae/decoder/conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: �
9vq_vae/decoder/conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:�
9vq_vae/decoder/conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
1vq_vae/decoder/conv2d_transpose_2/strided_slice_1StridedSlice0vq_vae/decoder/conv2d_transpose_2/stack:output:0@vq_vae/decoder/conv2d_transpose_2/strided_slice_1/stack:output:0Bvq_vae/decoder/conv2d_transpose_2/strided_slice_1/stack_1:output:0Bvq_vae/decoder/conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
Avq_vae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOpJvq_vae_decoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
2vq_vae/decoder/conv2d_transpose_2/conv2d_transposeConv2DBackpropInput0vq_vae/decoder/conv2d_transpose_2/stack:output:0Ivq_vae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:02vq_vae/decoder/conv2d_transpose/Relu:activations:0*
T0*/
_output_shapes
:���������  *
paddingSAME*
strides
�
8vq_vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOpAvq_vae_decoder_conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
)vq_vae/decoder/conv2d_transpose_2/BiasAddBiasAdd;vq_vae/decoder/conv2d_transpose_2/conv2d_transpose:output:0@vq_vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  �
)vq_vae/decoder/conv2d_transpose_2/SigmoidSigmoid2vq_vae/decoder/conv2d_transpose_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  �
IdentityIdentity-vq_vae/decoder/conv2d_transpose_2/Sigmoid:y:0^NoOp*
T0*/
_output_shapes
:���������  �
NoOpNoOp7^vq_vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOp@^vq_vae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp9^vq_vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOpB^vq_vae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp9^vq_vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOpB^vq_vae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp-^vq_vae/encoder/conv2d/BiasAdd/ReadVariableOp,^vq_vae/encoder/conv2d/Conv2D/ReadVariableOp/^vq_vae/encoder/conv2d_1/BiasAdd/ReadVariableOp.^vq_vae/encoder/conv2d_1/Conv2D/ReadVariableOp/^vq_vae/encoder/conv2d_2/BiasAdd/ReadVariableOp.^vq_vae/encoder/conv2d_2/Conv2D/ReadVariableOp.^vq_vae/vector_quantizer/MatMul/ReadVariableOp0^vq_vae/vector_quantizer/MatMul_1/ReadVariableOp'^vq_vae/vector_quantizer/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 2p
6vq_vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOp6vq_vae/decoder/conv2d_transpose/BiasAdd/ReadVariableOp2�
?vq_vae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp?vq_vae/decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp2t
8vq_vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp8vq_vae/decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp2�
Avq_vae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOpAvq_vae/decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp2t
8vq_vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp8vq_vae/decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp2�
Avq_vae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOpAvq_vae/decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp2\
,vq_vae/encoder/conv2d/BiasAdd/ReadVariableOp,vq_vae/encoder/conv2d/BiasAdd/ReadVariableOp2Z
+vq_vae/encoder/conv2d/Conv2D/ReadVariableOp+vq_vae/encoder/conv2d/Conv2D/ReadVariableOp2`
.vq_vae/encoder/conv2d_1/BiasAdd/ReadVariableOp.vq_vae/encoder/conv2d_1/BiasAdd/ReadVariableOp2^
-vq_vae/encoder/conv2d_1/Conv2D/ReadVariableOp-vq_vae/encoder/conv2d_1/Conv2D/ReadVariableOp2`
.vq_vae/encoder/conv2d_2/BiasAdd/ReadVariableOp.vq_vae/encoder/conv2d_2/BiasAdd/ReadVariableOp2^
-vq_vae/encoder/conv2d_2/Conv2D/ReadVariableOp-vq_vae/encoder/conv2d_2/Conv2D/ReadVariableOp2^
-vq_vae/vector_quantizer/MatMul/ReadVariableOp-vq_vae/vector_quantizer/MatMul/ReadVariableOp2b
/vq_vae/vector_quantizer/MatMul_1/ReadVariableOp/vq_vae/vector_quantizer/MatMul_1/ReadVariableOp2P
&vq_vae/vector_quantizer/ReadVariableOp&vq_vae/vector_quantizer/ReadVariableOp:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�
V
"__inference__update_step_xla_16241
gradient"
variable:@@*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
:@@: *
	_noinline(:P L
&
_output_shapes
:@@
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�
�
#__inference_signature_wrapper_15979
input_1!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
	unknown_5:	@�#
	unknown_6:@@
	unknown_7:@#
	unknown_8: @
	unknown_9: $

unknown_10: 

unknown_11:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  */
_read_only_resource_inputs
	
*8
config_proto(&

CPU

GPU2*0J

   E8� *)
f$R"
 __inference__wrapped_model_15195w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�
J
"__inference__update_step_xla_16256
gradient
variable:*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:: *
	_noinline(:D @

_output_shapes
:
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�	
�
'__inference_decoder_layer_call_fn_16390	
input!
unknown:@@
	unknown_0:@#
	unknown_1: @
	unknown_2: #
	unknown_3: 
	unknown_4:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

   E8� *K
fFRD
B__inference_decoder_layer_call_and_return_conditional_losses_15704w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  @: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
/
_output_shapes
:���������  @

_user_specified_nameinput
�)
�
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_16753

inputsB
(conv2d_transpose_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :@y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+���������������������������@*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������@j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+���������������������������@�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
;vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������@�
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs
�
�
__inference_loss_fn_5_16556m
Svq_vae_decoder_conv2d_transpose_2_kernel_regularizer_l2loss_readvariableop_resource: 
identity��Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp�
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpSvq_vae_decoder_conv2d_transpose_2_kernel_regularizer_l2loss_readvariableop_resource*&
_output_shapes
: *
dtype0�
;vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: z
IdentityIdentity<vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpK^vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp
�
�
2__inference_conv2d_transpose_1_layer_call_fn_16715

inputs!
unknown:@@
	unknown_0:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+���������������������������@*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *V
fQRO
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_15579�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs
�
V
"__inference__update_step_xla_16206
gradient"
variable: @*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
: @: *
	_noinline(:P L
&
_output_shapes
: @
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�
�
(__inference_conv2d_2_layer_call_fn_16514

inputs!
unknown:@@
	unknown_0:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *L
fGRE
C__inference_conv2d_2_layer_call_and_return_conditional_losses_15256w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�
�
A__inference_conv2d_layer_call_and_return_conditional_losses_16635

inputs8
conv2d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������   �
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
/vq_vae/encoder/conv2d/kernel/Regularizer/L2LossL2LossFvq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: s
.vq_vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
,vq_vae/encoder/conv2d/kernel/Regularizer/mulMul7vq_vae/encoder/conv2d/kernel/Regularizer/mul/x:output:08vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������   �
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp?^vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp:W S
/
_output_shapes
:���������  
 
_user_specified_nameinputs
�
�
C__inference_conv2d_2_layer_call_and_return_conditional_losses_15256

inputs8
conv2d_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
1vq_vae/encoder/conv2d_2/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_2/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOpA^vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:W S
/
_output_shapes
:���������  @
 
_user_specified_nameinputs
�
V
"__inference__update_step_xla_16251
gradient"
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
: : *
	_noinline(:P L
&
_output_shapes
: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�
�
&__inference_vq_vae_layer_call_fn_16011	
input!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
	unknown_5:	@�#
	unknown_6:@@
	unknown_7:@#
	unknown_8: @
	unknown_9: $

unknown_10: 

unknown_11:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  : */
_read_only_resource_inputs
	
*8
config_proto(&

CPU

GPU2*0J

   E8� *J
fERC
A__inference_vq_vae_layer_call_and_return_conditional_losses_15858w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
/
_output_shapes
:���������  

_user_specified_nameinput
�
�
&__inference_vq_vae_layer_call_fn_15888
input_1!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
	unknown_5:	@�#
	unknown_6:@@
	unknown_7:@#
	unknown_8: @
	unknown_9: $

unknown_10: 

unknown_11:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  : */
_read_only_resource_inputs
	
*8
config_proto(&

CPU

GPU2*0J

   E8� *J
fERC
A__inference_vq_vae_layer_call_and_return_conditional_losses_15858w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�
�
__inference_loss_fn_4_16547m
Svq_vae_decoder_conv2d_transpose_1_kernel_regularizer_l2loss_readvariableop_resource:@@
identity��Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpSvq_vae_decoder_conv2d_transpose_1_kernel_regularizer_l2loss_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
;vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: z
IdentityIdentity<vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpK^vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp
�-
�
B__inference_decoder_layer_call_and_return_conditional_losses_15704	
input2
conv2d_transpose_1_15676:@@&
conv2d_transpose_1_15678:@0
conv2d_transpose_15681: @$
conv2d_transpose_15683: 2
conv2d_transpose_2_15686: &
conv2d_transpose_2_15688:
identity��(conv2d_transpose/StatefulPartitionedCall�*conv2d_transpose_1/StatefulPartitionedCall�*conv2d_transpose_2/StatefulPartitionedCall�Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp�
*conv2d_transpose_1/StatefulPartitionedCallStatefulPartitionedCallinputconv2d_transpose_1_15676conv2d_transpose_1_15678*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *V
fQRO
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_15579�
(conv2d_transpose/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_1/StatefulPartitionedCall:output:0conv2d_transpose_15681conv2d_transpose_15683*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������   *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *T
fORM
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_15530�
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall1conv2d_transpose/StatefulPartitionedCall:output:0conv2d_transpose_2_15686conv2d_transpose_2_15688*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *V
fQRO
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_15628�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_transpose_15681*&
_output_shapes
: @*
dtype0�
9vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2LossL2LossPvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: }
8vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
6vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mulMulAvq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0Bvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_transpose_1_15676*&
_output_shapes
:@@*
dtype0�
;vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_transpose_2_15686*&
_output_shapes
: *
dtype0�
;vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
IdentityIdentity3conv2d_transpose_2/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  �
NoOpNoOp)^conv2d_transpose/StatefulPartitionedCall+^conv2d_transpose_1/StatefulPartitionedCall+^conv2d_transpose_2/StatefulPartitionedCallI^vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  @: : : : : : 2T
(conv2d_transpose/StatefulPartitionedCall(conv2d_transpose/StatefulPartitionedCall2X
*conv2d_transpose_1/StatefulPartitionedCall*conv2d_transpose_1/StatefulPartitionedCall2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpHvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:V R
/
_output_shapes
:���������  @

_user_specified_nameinput
�

�
__inference_loss_fn_0_16479a
Gvq_vae_encoder_conv2d_kernel_regularizer_l2loss_readvariableop_resource: 
identity��>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpGvq_vae_encoder_conv2d_kernel_regularizer_l2loss_readvariableop_resource*&
_output_shapes
: *
dtype0�
/vq_vae/encoder/conv2d/kernel/Regularizer/L2LossL2LossFvq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: s
.vq_vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
,vq_vae/encoder/conv2d/kernel/Regularizer/mulMul7vq_vae/encoder/conv2d/kernel/Regularizer/mul/x:output:08vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: n
IdentityIdentity0vq_vae/encoder/conv2d/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp?^vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp
�	
�
'__inference_encoder_layer_call_fn_15324
input_1!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

   E8� *K
fFRD
B__inference_encoder_layer_call_and_return_conditional_losses_15309w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�
�
0__inference_conv2d_transpose_layer_call_fn_16668

inputs!
unknown: @
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+��������������������������� *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *T
fORM
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_15530�
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+��������������������������� `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs
�D
�
A__inference_vq_vae_layer_call_and_return_conditional_losses_15796
input_1'
encoder_15740: 
encoder_15742: '
encoder_15744: @
encoder_15746:@'
encoder_15748:@@
encoder_15750:@)
vector_quantizer_15753:	@�'
decoder_15757:@@
decoder_15759:@'
decoder_15761: @
decoder_15763: '
decoder_15765: 
decoder_15767:
identity

identity_1��decoder/StatefulPartitionedCall�encoder/StatefulPartitionedCall�(vector_quantizer/StatefulPartitionedCall�Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp�>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp�
encoder/StatefulPartitionedCallStatefulPartitionedCallinput_1encoder_15740encoder_15742encoder_15744encoder_15746encoder_15748encoder_15750*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

   E8� *K
fFRD
B__inference_encoder_layer_call_and_return_conditional_losses_15309�
(vector_quantizer/StatefulPartitionedCallStatefulPartitionedCall(encoder/StatefulPartitionedCall:output:0vector_quantizer_15753*
Tin
2*
Tout
2*
_collective_manager_ids
 *1
_output_shapes
:���������  @: *#
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *T
fORM
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_15477�
decoder/StatefulPartitionedCallStatefulPartitionedCall1vector_quantizer/StatefulPartitionedCall:output:0decoder_15757decoder_15759decoder_15761decoder_15763decoder_15765decoder_15767*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

   E8� *K
fFRD
B__inference_decoder_layer_call_and_return_conditional_losses_15704�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpencoder_15740*&
_output_shapes
: *
dtype0�
/vq_vae/encoder/conv2d/kernel/Regularizer/L2LossL2LossFvq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: s
.vq_vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
,vq_vae/encoder/conv2d/kernel/Regularizer/mulMul7vq_vae/encoder/conv2d/kernel/Regularizer/mul/x:output:08vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpencoder_15744*&
_output_shapes
: @*
dtype0�
1vq_vae/encoder/conv2d_1/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_1/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpencoder_15748*&
_output_shapes
:@@*
dtype0�
1vq_vae/encoder/conv2d_2/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_2/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpdecoder_15761*&
_output_shapes
: @*
dtype0�
9vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2LossL2LossPvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: }
8vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
6vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mulMulAvq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0Bvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpdecoder_15757*&
_output_shapes
:@@*
dtype0�
;vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpdecoder_15765*&
_output_shapes
: *
dtype0�
;vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: 
IdentityIdentity(decoder/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  q

Identity_1Identity1vector_quantizer/StatefulPartitionedCall:output:1^NoOp*
T0*
_output_shapes
: �
NoOpNoOp ^decoder/StatefulPartitionedCall ^encoder/StatefulPartitionedCall)^vector_quantizer/StatefulPartitionedCallI^vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp?^vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 2B
decoder/StatefulPartitionedCalldecoder/StatefulPartitionedCall2B
encoder/StatefulPartitionedCallencoder/StatefulPartitionedCall2T
(vector_quantizer/StatefulPartitionedCall(vector_quantizer/StatefulPartitionedCall2�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpHvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp2�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:X T
/
_output_shapes
:���������  
!
_user_specified_name	input_1
�
J
"__inference__update_step_xla_16221
gradient
variable:@*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

:@: *
	_noinline(:D @

_output_shapes
:@
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�)
�
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_15477
x1
matmul_readvariableop_resource:	@�
identity

identity_1��MatMul/ReadVariableOp�MatMul_1/ReadVariableOp�ReadVariableOpD
ShapeShapex*
T0*
_output_shapes
::��^
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   _
ReshapeReshapexReshape/shape:output:0*
T0*'
_output_shapes
:���������@u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0t
MatMulMatMulReshape:output:0MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������J
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @^
powPowReshape:output:0pow/y:output:0*
T0*'
_output_shapes
:���������@W
Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :v
SumSumpow:z:0Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(n
ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0L
pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @`
pow_1PowReadVariableOp:value:0pow_1/y:output:0*
T0*
_output_shapes
:	@�Y
Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : _
Sum_1Sum	pow_1:z:0 Sum_1/reduction_indices:output:0*
T0*
_output_shapes	
:�]
addAddV2Sum:output:0Sum_1:output:0*
T0*(
_output_shapes
:����������J
mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @_
mulMulmul/x:output:0MatMul:product:0*
T0*(
_output_shapes
:����������O
subSubadd:z:0mul:z:0*
T0*(
_output_shapes
:����������R
ArgMin/dimensionConst*
_output_shapes
: *
dtype0*
value	B :b
ArgMinArgMinsub:z:0ArgMin/dimension:output:0*
T0*#
_output_shapes
:���������U
one_hot/on_valueConst*
_output_shapes
: *
dtype0*
valueB
 *  �?V
one_hot/off_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    P
one_hot/depthConst*
_output_shapes
: *
dtype0*
value
B :��
one_hotOneHotArgMin:output:0one_hot/depth:output:0one_hot/on_value:output:0one_hot/off_value:output:0*
T0*(
_output_shapes
:����������w
MatMul_1/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
MatMul_1MatMulone_hot:output:0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@*
transpose_b(r
	Reshape_1ReshapeMatMul_1:product:0Shape:output:0*
T0*/
_output_shapes
:���������  @j
StopGradientStopGradientReshape_1:output:0*
T0*/
_output_shapes
:���������  @`
sub_1SubStopGradient:output:0x*
T0*/
_output_shapes
:���������  @L
pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_2Pow	sub_1:z:0pow_2/y:output:0*
T0*/
_output_shapes
:���������  @^
ConstConst*
_output_shapes
:*
dtype0*%
valueB"             H
MeanMean	pow_2:z:0Const:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �>N
mul_1Mulmul_1/x:output:0Mean:output:0*
T0*
_output_shapes
: [
StopGradient_1StopGradientx*
T0*/
_output_shapes
:���������  @s
sub_2SubReshape_1:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:���������  @L
pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_3Pow	sub_2:z:0pow_3/y:output:0*
T0*/
_output_shapes
:���������  @`
Const_1Const*
_output_shapes
:*
dtype0*%
valueB"             L
Mean_1Mean	pow_3:z:0Const_1:output:0*
T0*
_output_shapes
: K
add_1AddV2	mul_1:z:0Mean_1:output:0*
T0*
_output_shapes
: ]
sub_3SubReshape_1:output:0x*
T0*/
_output_shapes
:���������  @c
StopGradient_2StopGradient	sub_3:z:0*
T0*/
_output_shapes
:���������  @d
add_2AddV2xStopGradient_2:output:0*
T0*/
_output_shapes
:���������  @`
IdentityIdentity	add_2:z:0^NoOp*
T0*/
_output_shapes
:���������  @I

Identity_1Identity	add_1:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������  @: 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp2 
ReadVariableOpReadVariableOp:R N
/
_output_shapes
:���������  @

_user_specified_namex
�-
�
B__inference_decoder_layer_call_and_return_conditional_losses_15670
input_12
conv2d_transpose_1_15642:@@&
conv2d_transpose_1_15644:@0
conv2d_transpose_15647: @$
conv2d_transpose_15649: 2
conv2d_transpose_2_15652: &
conv2d_transpose_2_15654:
identity��(conv2d_transpose/StatefulPartitionedCall�*conv2d_transpose_1/StatefulPartitionedCall�*conv2d_transpose_2/StatefulPartitionedCall�Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp�
*conv2d_transpose_1/StatefulPartitionedCallStatefulPartitionedCallinput_1conv2d_transpose_1_15642conv2d_transpose_1_15644*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *V
fQRO
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_15579�
(conv2d_transpose/StatefulPartitionedCallStatefulPartitionedCall3conv2d_transpose_1/StatefulPartitionedCall:output:0conv2d_transpose_15647conv2d_transpose_15649*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������   *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *T
fORM
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_15530�
*conv2d_transpose_2/StatefulPartitionedCallStatefulPartitionedCall1conv2d_transpose/StatefulPartitionedCall:output:0conv2d_transpose_2_15652conv2d_transpose_2_15654*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *V
fQRO
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_15628�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_transpose_15647*&
_output_shapes
: @*
dtype0�
9vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2LossL2LossPvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: }
8vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
6vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mulMulAvq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0Bvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_transpose_1_15642*&
_output_shapes
:@@*
dtype0�
;vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_transpose_2_15652*&
_output_shapes
: *
dtype0�
;vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
IdentityIdentity3conv2d_transpose_2/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  �
NoOpNoOp)^conv2d_transpose/StatefulPartitionedCall+^conv2d_transpose_1/StatefulPartitionedCall+^conv2d_transpose_2/StatefulPartitionedCallI^vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  @: : : : : : 2T
(conv2d_transpose/StatefulPartitionedCall(conv2d_transpose/StatefulPartitionedCall2X
*conv2d_transpose_1/StatefulPartitionedCall*conv2d_transpose_1/StatefulPartitionedCall2X
*conv2d_transpose_2/StatefulPartitionedCall*conv2d_transpose_2/StatefulPartitionedCall2�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpHvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:X T
/
_output_shapes
:���������  @
!
_user_specified_name	input_1
�3
�
B__inference_encoder_layer_call_and_return_conditional_losses_16310	
input?
%conv2d_conv2d_readvariableop_resource: 4
&conv2d_biasadd_readvariableop_resource: A
'conv2d_1_conv2d_readvariableop_resource: @6
(conv2d_1_biasadd_readvariableop_resource:@A
'conv2d_2_conv2d_readvariableop_resource:@@6
(conv2d_2_biasadd_readvariableop_resource:@
identity��conv2d/BiasAdd/ReadVariableOp�conv2d/Conv2D/ReadVariableOp�conv2d_1/BiasAdd/ReadVariableOp�conv2d_1/Conv2D/ReadVariableOp�conv2d_2/BiasAdd/ReadVariableOp�conv2d_2/Conv2D/ReadVariableOp�>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp�
conv2d/Conv2D/ReadVariableOpReadVariableOp%conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
conv2d/Conv2DConv2Dinput$conv2d/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
conv2d/BiasAdd/ReadVariableOpReadVariableOp&conv2d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
conv2d/BiasAddBiasAddconv2d/Conv2D:output:0%conv2d/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   f
conv2d/ReluReluconv2d/BiasAdd:output:0*
T0*/
_output_shapes
:���������   �
conv2d_1/Conv2D/ReadVariableOpReadVariableOp'conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
conv2d_1/Conv2DConv2Dconv2d/Relu:activations:0&conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
conv2d_1/BiasAdd/ReadVariableOpReadVariableOp(conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
conv2d_1/BiasAddBiasAddconv2d_1/Conv2D:output:0'conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @j
conv2d_1/ReluReluconv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
conv2d_2/Conv2D/ReadVariableOpReadVariableOp'conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
conv2d_2/Conv2DConv2Dconv2d_1/Relu:activations:0&conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
conv2d_2/BiasAdd/ReadVariableOpReadVariableOp(conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
conv2d_2/BiasAddBiasAddconv2d_2/Conv2D:output:0'conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @j
conv2d_2/ReluReluconv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp%conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
/vq_vae/encoder/conv2d/kernel/Regularizer/L2LossL2LossFvq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: s
.vq_vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
,vq_vae/encoder/conv2d/kernel/Regularizer/mulMul7vq_vae/encoder/conv2d/kernel/Regularizer/mul/x:output:08vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp'conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
1vq_vae/encoder/conv2d_1/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_1/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp'conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
1vq_vae/encoder/conv2d_2/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_2/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: r
IdentityIdentityconv2d_2/Relu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^conv2d/BiasAdd/ReadVariableOp^conv2d/Conv2D/ReadVariableOp ^conv2d_1/BiasAdd/ReadVariableOp^conv2d_1/Conv2D/ReadVariableOp ^conv2d_2/BiasAdd/ReadVariableOp^conv2d_2/Conv2D/ReadVariableOp?^vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  : : : : : : 2>
conv2d/BiasAdd/ReadVariableOpconv2d/BiasAdd/ReadVariableOp2<
conv2d/Conv2D/ReadVariableOpconv2d/Conv2D/ReadVariableOp2B
conv2d_1/BiasAdd/ReadVariableOpconv2d_1/BiasAdd/ReadVariableOp2@
conv2d_1/Conv2D/ReadVariableOpconv2d_1/Conv2D/ReadVariableOp2B
conv2d_2/BiasAdd/ReadVariableOpconv2d_2/BiasAdd/ReadVariableOp2@
conv2d_2/Conv2D/ReadVariableOpconv2d_2/Conv2D/ReadVariableOp2�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:V R
/
_output_shapes
:���������  

_user_specified_nameinput
�)
�
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_16611

inputsB
(conv2d_transpose_readvariableop_resource: -
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+���������������������������*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������p
SigmoidSigmoidBiasAdd:output:0*
T0*A
_output_shapes/
-:+����������������������������
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
;vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: t
IdentityIdentitySigmoid:y:0^NoOp*
T0*A
_output_shapes/
-:+����������������������������
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+��������������������������� : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:i e
A
_output_shapes/
-:+��������������������������� 
 
_user_specified_nameinputs
�'
�
B__inference_encoder_layer_call_and_return_conditional_losses_15309	
input&
conv2d_15281: 
conv2d_15283: (
conv2d_1_15286: @
conv2d_1_15288:@(
conv2d_2_15291:@@
conv2d_2_15293:@
identity��conv2d/StatefulPartitionedCall� conv2d_1/StatefulPartitionedCall� conv2d_2/StatefulPartitionedCall�>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp�
conv2d/StatefulPartitionedCallStatefulPartitionedCallinputconv2d_15281conv2d_15283*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������   *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *J
fERC
A__inference_conv2d_layer_call_and_return_conditional_losses_15214�
 conv2d_1/StatefulPartitionedCallStatefulPartitionedCall'conv2d/StatefulPartitionedCall:output:0conv2d_1_15286conv2d_1_15288*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *L
fGRE
C__inference_conv2d_1_layer_call_and_return_conditional_losses_15235�
 conv2d_2/StatefulPartitionedCallStatefulPartitionedCall)conv2d_1/StatefulPartitionedCall:output:0conv2d_2_15291conv2d_2_15293*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *L
fGRE
C__inference_conv2d_2_layer_call_and_return_conditional_losses_15256�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_15281*&
_output_shapes
: *
dtype0�
/vq_vae/encoder/conv2d/kernel/Regularizer/L2LossL2LossFvq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: s
.vq_vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
,vq_vae/encoder/conv2d/kernel/Regularizer/mulMul7vq_vae/encoder/conv2d/kernel/Regularizer/mul/x:output:08vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_1_15286*&
_output_shapes
: @*
dtype0�
1vq_vae/encoder/conv2d_1/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_1/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_2_15291*&
_output_shapes
:@@*
dtype0�
1vq_vae/encoder/conv2d_2/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_2/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
IdentityIdentity)conv2d_2/StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^conv2d/StatefulPartitionedCall!^conv2d_1/StatefulPartitionedCall!^conv2d_2/StatefulPartitionedCall?^vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  : : : : : : 2@
conv2d/StatefulPartitionedCallconv2d/StatefulPartitionedCall2D
 conv2d_1/StatefulPartitionedCall conv2d_1/StatefulPartitionedCall2D
 conv2d_2/StatefulPartitionedCall conv2d_2/StatefulPartitionedCall2�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:V R
/
_output_shapes
:���������  

_user_specified_nameinput
��
�,
__inference__traced_save_17022
file_prefixM
3read_disablecopyonread_vq_vae_encoder_conv2d_kernel: A
3read_1_disablecopyonread_vq_vae_encoder_conv2d_bias: Q
7read_2_disablecopyonread_vq_vae_encoder_conv2d_1_kernel: @C
5read_3_disablecopyonread_vq_vae_encoder_conv2d_1_bias:@Q
7read_4_disablecopyonread_vq_vae_encoder_conv2d_2_kernel:@@C
5read_5_disablecopyonread_vq_vae_encoder_conv2d_2_bias:@<
)read_6_disablecopyonread_embeddings_vqvae:	@�Y
?read_7_disablecopyonread_vq_vae_decoder_conv2d_transpose_kernel: @K
=read_8_disablecopyonread_vq_vae_decoder_conv2d_transpose_bias: [
Aread_9_disablecopyonread_vq_vae_decoder_conv2d_transpose_1_kernel:@@N
@read_10_disablecopyonread_vq_vae_decoder_conv2d_transpose_1_bias:@\
Bread_11_disablecopyonread_vq_vae_decoder_conv2d_transpose_2_kernel: N
@read_12_disablecopyonread_vq_vae_decoder_conv2d_transpose_2_bias:-
#read_13_disablecopyonread_iteration:	 1
'read_14_disablecopyonread_learning_rate: W
=read_15_disablecopyonread_adam_m_vq_vae_encoder_conv2d_kernel: W
=read_16_disablecopyonread_adam_v_vq_vae_encoder_conv2d_kernel: I
;read_17_disablecopyonread_adam_m_vq_vae_encoder_conv2d_bias: I
;read_18_disablecopyonread_adam_v_vq_vae_encoder_conv2d_bias: Y
?read_19_disablecopyonread_adam_m_vq_vae_encoder_conv2d_1_kernel: @Y
?read_20_disablecopyonread_adam_v_vq_vae_encoder_conv2d_1_kernel: @K
=read_21_disablecopyonread_adam_m_vq_vae_encoder_conv2d_1_bias:@K
=read_22_disablecopyonread_adam_v_vq_vae_encoder_conv2d_1_bias:@Y
?read_23_disablecopyonread_adam_m_vq_vae_encoder_conv2d_2_kernel:@@Y
?read_24_disablecopyonread_adam_v_vq_vae_encoder_conv2d_2_kernel:@@K
=read_25_disablecopyonread_adam_m_vq_vae_encoder_conv2d_2_bias:@K
=read_26_disablecopyonread_adam_v_vq_vae_encoder_conv2d_2_bias:@D
1read_27_disablecopyonread_adam_m_embeddings_vqvae:	@�D
1read_28_disablecopyonread_adam_v_embeddings_vqvae:	@�a
Gread_29_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_kernel: @a
Gread_30_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_kernel: @S
Eread_31_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_bias: S
Eread_32_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_bias: c
Iread_33_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_1_kernel:@@c
Iread_34_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_1_kernel:@@U
Gread_35_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_1_bias:@U
Gread_36_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_1_bias:@c
Iread_37_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_2_kernel: c
Iread_38_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_2_kernel: U
Gread_39_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_2_bias:U
Gread_40_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_2_bias:
savev2_const
identity_83��MergeV2Checkpoints�Read/DisableCopyOnRead�Read/ReadVariableOp�Read_1/DisableCopyOnRead�Read_1/ReadVariableOp�Read_10/DisableCopyOnRead�Read_10/ReadVariableOp�Read_11/DisableCopyOnRead�Read_11/ReadVariableOp�Read_12/DisableCopyOnRead�Read_12/ReadVariableOp�Read_13/DisableCopyOnRead�Read_13/ReadVariableOp�Read_14/DisableCopyOnRead�Read_14/ReadVariableOp�Read_15/DisableCopyOnRead�Read_15/ReadVariableOp�Read_16/DisableCopyOnRead�Read_16/ReadVariableOp�Read_17/DisableCopyOnRead�Read_17/ReadVariableOp�Read_18/DisableCopyOnRead�Read_18/ReadVariableOp�Read_19/DisableCopyOnRead�Read_19/ReadVariableOp�Read_2/DisableCopyOnRead�Read_2/ReadVariableOp�Read_20/DisableCopyOnRead�Read_20/ReadVariableOp�Read_21/DisableCopyOnRead�Read_21/ReadVariableOp�Read_22/DisableCopyOnRead�Read_22/ReadVariableOp�Read_23/DisableCopyOnRead�Read_23/ReadVariableOp�Read_24/DisableCopyOnRead�Read_24/ReadVariableOp�Read_25/DisableCopyOnRead�Read_25/ReadVariableOp�Read_26/DisableCopyOnRead�Read_26/ReadVariableOp�Read_27/DisableCopyOnRead�Read_27/ReadVariableOp�Read_28/DisableCopyOnRead�Read_28/ReadVariableOp�Read_29/DisableCopyOnRead�Read_29/ReadVariableOp�Read_3/DisableCopyOnRead�Read_3/ReadVariableOp�Read_30/DisableCopyOnRead�Read_30/ReadVariableOp�Read_31/DisableCopyOnRead�Read_31/ReadVariableOp�Read_32/DisableCopyOnRead�Read_32/ReadVariableOp�Read_33/DisableCopyOnRead�Read_33/ReadVariableOp�Read_34/DisableCopyOnRead�Read_34/ReadVariableOp�Read_35/DisableCopyOnRead�Read_35/ReadVariableOp�Read_36/DisableCopyOnRead�Read_36/ReadVariableOp�Read_37/DisableCopyOnRead�Read_37/ReadVariableOp�Read_38/DisableCopyOnRead�Read_38/ReadVariableOp�Read_39/DisableCopyOnRead�Read_39/ReadVariableOp�Read_4/DisableCopyOnRead�Read_4/ReadVariableOp�Read_40/DisableCopyOnRead�Read_40/ReadVariableOp�Read_5/DisableCopyOnRead�Read_5/ReadVariableOp�Read_6/DisableCopyOnRead�Read_6/ReadVariableOp�Read_7/DisableCopyOnRead�Read_7/ReadVariableOp�Read_8/DisableCopyOnRead�Read_8/ReadVariableOp�Read_9/DisableCopyOnRead�Read_9/ReadVariableOpw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: �
Read/DisableCopyOnReadDisableCopyOnRead3read_disablecopyonread_vq_vae_encoder_conv2d_kernel"/device:CPU:0*
_output_shapes
 �
Read/ReadVariableOpReadVariableOp3read_disablecopyonread_vq_vae_encoder_conv2d_kernel^Read/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: *
dtype0q
IdentityIdentityRead/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: i

Identity_1IdentityIdentity:output:0"/device:CPU:0*
T0*&
_output_shapes
: �
Read_1/DisableCopyOnReadDisableCopyOnRead3read_1_disablecopyonread_vq_vae_encoder_conv2d_bias"/device:CPU:0*
_output_shapes
 �
Read_1/ReadVariableOpReadVariableOp3read_1_disablecopyonread_vq_vae_encoder_conv2d_bias^Read_1/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0i

Identity_2IdentityRead_1/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: _

Identity_3IdentityIdentity_2:output:0"/device:CPU:0*
T0*
_output_shapes
: �
Read_2/DisableCopyOnReadDisableCopyOnRead7read_2_disablecopyonread_vq_vae_encoder_conv2d_1_kernel"/device:CPU:0*
_output_shapes
 �
Read_2/ReadVariableOpReadVariableOp7read_2_disablecopyonread_vq_vae_encoder_conv2d_1_kernel^Read_2/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: @*
dtype0u

Identity_4IdentityRead_2/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: @k

Identity_5IdentityIdentity_4:output:0"/device:CPU:0*
T0*&
_output_shapes
: @�
Read_3/DisableCopyOnReadDisableCopyOnRead5read_3_disablecopyonread_vq_vae_encoder_conv2d_1_bias"/device:CPU:0*
_output_shapes
 �
Read_3/ReadVariableOpReadVariableOp5read_3_disablecopyonread_vq_vae_encoder_conv2d_1_bias^Read_3/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:@*
dtype0i

Identity_6IdentityRead_3/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:@_

Identity_7IdentityIdentity_6:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_4/DisableCopyOnReadDisableCopyOnRead7read_4_disablecopyonread_vq_vae_encoder_conv2d_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_4/ReadVariableOpReadVariableOp7read_4_disablecopyonread_vq_vae_encoder_conv2d_2_kernel^Read_4/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:@@*
dtype0u

Identity_8IdentityRead_4/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:@@k

Identity_9IdentityIdentity_8:output:0"/device:CPU:0*
T0*&
_output_shapes
:@@�
Read_5/DisableCopyOnReadDisableCopyOnRead5read_5_disablecopyonread_vq_vae_encoder_conv2d_2_bias"/device:CPU:0*
_output_shapes
 �
Read_5/ReadVariableOpReadVariableOp5read_5_disablecopyonread_vq_vae_encoder_conv2d_2_bias^Read_5/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:@*
dtype0j
Identity_10IdentityRead_5/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:@a
Identity_11IdentityIdentity_10:output:0"/device:CPU:0*
T0*
_output_shapes
:@}
Read_6/DisableCopyOnReadDisableCopyOnRead)read_6_disablecopyonread_embeddings_vqvae"/device:CPU:0*
_output_shapes
 �
Read_6/ReadVariableOpReadVariableOp)read_6_disablecopyonread_embeddings_vqvae^Read_6/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	@�*
dtype0o
Identity_12IdentityRead_6/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	@�f
Identity_13IdentityIdentity_12:output:0"/device:CPU:0*
T0*
_output_shapes
:	@��
Read_7/DisableCopyOnReadDisableCopyOnRead?read_7_disablecopyonread_vq_vae_decoder_conv2d_transpose_kernel"/device:CPU:0*
_output_shapes
 �
Read_7/ReadVariableOpReadVariableOp?read_7_disablecopyonread_vq_vae_decoder_conv2d_transpose_kernel^Read_7/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: @*
dtype0v
Identity_14IdentityRead_7/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: @m
Identity_15IdentityIdentity_14:output:0"/device:CPU:0*
T0*&
_output_shapes
: @�
Read_8/DisableCopyOnReadDisableCopyOnRead=read_8_disablecopyonread_vq_vae_decoder_conv2d_transpose_bias"/device:CPU:0*
_output_shapes
 �
Read_8/ReadVariableOpReadVariableOp=read_8_disablecopyonread_vq_vae_decoder_conv2d_transpose_bias^Read_8/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0j
Identity_16IdentityRead_8/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: a
Identity_17IdentityIdentity_16:output:0"/device:CPU:0*
T0*
_output_shapes
: �
Read_9/DisableCopyOnReadDisableCopyOnReadAread_9_disablecopyonread_vq_vae_decoder_conv2d_transpose_1_kernel"/device:CPU:0*
_output_shapes
 �
Read_9/ReadVariableOpReadVariableOpAread_9_disablecopyonread_vq_vae_decoder_conv2d_transpose_1_kernel^Read_9/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:@@*
dtype0v
Identity_18IdentityRead_9/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:@@m
Identity_19IdentityIdentity_18:output:0"/device:CPU:0*
T0*&
_output_shapes
:@@�
Read_10/DisableCopyOnReadDisableCopyOnRead@read_10_disablecopyonread_vq_vae_decoder_conv2d_transpose_1_bias"/device:CPU:0*
_output_shapes
 �
Read_10/ReadVariableOpReadVariableOp@read_10_disablecopyonread_vq_vae_decoder_conv2d_transpose_1_bias^Read_10/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:@*
dtype0k
Identity_20IdentityRead_10/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:@a
Identity_21IdentityIdentity_20:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_11/DisableCopyOnReadDisableCopyOnReadBread_11_disablecopyonread_vq_vae_decoder_conv2d_transpose_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_11/ReadVariableOpReadVariableOpBread_11_disablecopyonread_vq_vae_decoder_conv2d_transpose_2_kernel^Read_11/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: *
dtype0w
Identity_22IdentityRead_11/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: m
Identity_23IdentityIdentity_22:output:0"/device:CPU:0*
T0*&
_output_shapes
: �
Read_12/DisableCopyOnReadDisableCopyOnRead@read_12_disablecopyonread_vq_vae_decoder_conv2d_transpose_2_bias"/device:CPU:0*
_output_shapes
 �
Read_12/ReadVariableOpReadVariableOp@read_12_disablecopyonread_vq_vae_decoder_conv2d_transpose_2_bias^Read_12/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_24IdentityRead_12/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_25IdentityIdentity_24:output:0"/device:CPU:0*
T0*
_output_shapes
:x
Read_13/DisableCopyOnReadDisableCopyOnRead#read_13_disablecopyonread_iteration"/device:CPU:0*
_output_shapes
 �
Read_13/ReadVariableOpReadVariableOp#read_13_disablecopyonread_iteration^Read_13/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0	g
Identity_26IdentityRead_13/ReadVariableOp:value:0"/device:CPU:0*
T0	*
_output_shapes
: ]
Identity_27IdentityIdentity_26:output:0"/device:CPU:0*
T0	*
_output_shapes
: |
Read_14/DisableCopyOnReadDisableCopyOnRead'read_14_disablecopyonread_learning_rate"/device:CPU:0*
_output_shapes
 �
Read_14/ReadVariableOpReadVariableOp'read_14_disablecopyonread_learning_rate^Read_14/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_28IdentityRead_14/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_29IdentityIdentity_28:output:0"/device:CPU:0*
T0*
_output_shapes
: �
Read_15/DisableCopyOnReadDisableCopyOnRead=read_15_disablecopyonread_adam_m_vq_vae_encoder_conv2d_kernel"/device:CPU:0*
_output_shapes
 �
Read_15/ReadVariableOpReadVariableOp=read_15_disablecopyonread_adam_m_vq_vae_encoder_conv2d_kernel^Read_15/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: *
dtype0w
Identity_30IdentityRead_15/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: m
Identity_31IdentityIdentity_30:output:0"/device:CPU:0*
T0*&
_output_shapes
: �
Read_16/DisableCopyOnReadDisableCopyOnRead=read_16_disablecopyonread_adam_v_vq_vae_encoder_conv2d_kernel"/device:CPU:0*
_output_shapes
 �
Read_16/ReadVariableOpReadVariableOp=read_16_disablecopyonread_adam_v_vq_vae_encoder_conv2d_kernel^Read_16/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: *
dtype0w
Identity_32IdentityRead_16/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: m
Identity_33IdentityIdentity_32:output:0"/device:CPU:0*
T0*&
_output_shapes
: �
Read_17/DisableCopyOnReadDisableCopyOnRead;read_17_disablecopyonread_adam_m_vq_vae_encoder_conv2d_bias"/device:CPU:0*
_output_shapes
 �
Read_17/ReadVariableOpReadVariableOp;read_17_disablecopyonread_adam_m_vq_vae_encoder_conv2d_bias^Read_17/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0k
Identity_34IdentityRead_17/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: a
Identity_35IdentityIdentity_34:output:0"/device:CPU:0*
T0*
_output_shapes
: �
Read_18/DisableCopyOnReadDisableCopyOnRead;read_18_disablecopyonread_adam_v_vq_vae_encoder_conv2d_bias"/device:CPU:0*
_output_shapes
 �
Read_18/ReadVariableOpReadVariableOp;read_18_disablecopyonread_adam_v_vq_vae_encoder_conv2d_bias^Read_18/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0k
Identity_36IdentityRead_18/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: a
Identity_37IdentityIdentity_36:output:0"/device:CPU:0*
T0*
_output_shapes
: �
Read_19/DisableCopyOnReadDisableCopyOnRead?read_19_disablecopyonread_adam_m_vq_vae_encoder_conv2d_1_kernel"/device:CPU:0*
_output_shapes
 �
Read_19/ReadVariableOpReadVariableOp?read_19_disablecopyonread_adam_m_vq_vae_encoder_conv2d_1_kernel^Read_19/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: @*
dtype0w
Identity_38IdentityRead_19/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: @m
Identity_39IdentityIdentity_38:output:0"/device:CPU:0*
T0*&
_output_shapes
: @�
Read_20/DisableCopyOnReadDisableCopyOnRead?read_20_disablecopyonread_adam_v_vq_vae_encoder_conv2d_1_kernel"/device:CPU:0*
_output_shapes
 �
Read_20/ReadVariableOpReadVariableOp?read_20_disablecopyonread_adam_v_vq_vae_encoder_conv2d_1_kernel^Read_20/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: @*
dtype0w
Identity_40IdentityRead_20/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: @m
Identity_41IdentityIdentity_40:output:0"/device:CPU:0*
T0*&
_output_shapes
: @�
Read_21/DisableCopyOnReadDisableCopyOnRead=read_21_disablecopyonread_adam_m_vq_vae_encoder_conv2d_1_bias"/device:CPU:0*
_output_shapes
 �
Read_21/ReadVariableOpReadVariableOp=read_21_disablecopyonread_adam_m_vq_vae_encoder_conv2d_1_bias^Read_21/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:@*
dtype0k
Identity_42IdentityRead_21/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:@a
Identity_43IdentityIdentity_42:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_22/DisableCopyOnReadDisableCopyOnRead=read_22_disablecopyonread_adam_v_vq_vae_encoder_conv2d_1_bias"/device:CPU:0*
_output_shapes
 �
Read_22/ReadVariableOpReadVariableOp=read_22_disablecopyonread_adam_v_vq_vae_encoder_conv2d_1_bias^Read_22/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:@*
dtype0k
Identity_44IdentityRead_22/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:@a
Identity_45IdentityIdentity_44:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_23/DisableCopyOnReadDisableCopyOnRead?read_23_disablecopyonread_adam_m_vq_vae_encoder_conv2d_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_23/ReadVariableOpReadVariableOp?read_23_disablecopyonread_adam_m_vq_vae_encoder_conv2d_2_kernel^Read_23/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:@@*
dtype0w
Identity_46IdentityRead_23/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:@@m
Identity_47IdentityIdentity_46:output:0"/device:CPU:0*
T0*&
_output_shapes
:@@�
Read_24/DisableCopyOnReadDisableCopyOnRead?read_24_disablecopyonread_adam_v_vq_vae_encoder_conv2d_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_24/ReadVariableOpReadVariableOp?read_24_disablecopyonread_adam_v_vq_vae_encoder_conv2d_2_kernel^Read_24/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:@@*
dtype0w
Identity_48IdentityRead_24/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:@@m
Identity_49IdentityIdentity_48:output:0"/device:CPU:0*
T0*&
_output_shapes
:@@�
Read_25/DisableCopyOnReadDisableCopyOnRead=read_25_disablecopyonread_adam_m_vq_vae_encoder_conv2d_2_bias"/device:CPU:0*
_output_shapes
 �
Read_25/ReadVariableOpReadVariableOp=read_25_disablecopyonread_adam_m_vq_vae_encoder_conv2d_2_bias^Read_25/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:@*
dtype0k
Identity_50IdentityRead_25/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:@a
Identity_51IdentityIdentity_50:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_26/DisableCopyOnReadDisableCopyOnRead=read_26_disablecopyonread_adam_v_vq_vae_encoder_conv2d_2_bias"/device:CPU:0*
_output_shapes
 �
Read_26/ReadVariableOpReadVariableOp=read_26_disablecopyonread_adam_v_vq_vae_encoder_conv2d_2_bias^Read_26/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:@*
dtype0k
Identity_52IdentityRead_26/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:@a
Identity_53IdentityIdentity_52:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_27/DisableCopyOnReadDisableCopyOnRead1read_27_disablecopyonread_adam_m_embeddings_vqvae"/device:CPU:0*
_output_shapes
 �
Read_27/ReadVariableOpReadVariableOp1read_27_disablecopyonread_adam_m_embeddings_vqvae^Read_27/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	@�*
dtype0p
Identity_54IdentityRead_27/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	@�f
Identity_55IdentityIdentity_54:output:0"/device:CPU:0*
T0*
_output_shapes
:	@��
Read_28/DisableCopyOnReadDisableCopyOnRead1read_28_disablecopyonread_adam_v_embeddings_vqvae"/device:CPU:0*
_output_shapes
 �
Read_28/ReadVariableOpReadVariableOp1read_28_disablecopyonread_adam_v_embeddings_vqvae^Read_28/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	@�*
dtype0p
Identity_56IdentityRead_28/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	@�f
Identity_57IdentityIdentity_56:output:0"/device:CPU:0*
T0*
_output_shapes
:	@��
Read_29/DisableCopyOnReadDisableCopyOnReadGread_29_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_kernel"/device:CPU:0*
_output_shapes
 �
Read_29/ReadVariableOpReadVariableOpGread_29_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_kernel^Read_29/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: @*
dtype0w
Identity_58IdentityRead_29/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: @m
Identity_59IdentityIdentity_58:output:0"/device:CPU:0*
T0*&
_output_shapes
: @�
Read_30/DisableCopyOnReadDisableCopyOnReadGread_30_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_kernel"/device:CPU:0*
_output_shapes
 �
Read_30/ReadVariableOpReadVariableOpGread_30_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_kernel^Read_30/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: @*
dtype0w
Identity_60IdentityRead_30/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: @m
Identity_61IdentityIdentity_60:output:0"/device:CPU:0*
T0*&
_output_shapes
: @�
Read_31/DisableCopyOnReadDisableCopyOnReadEread_31_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_bias"/device:CPU:0*
_output_shapes
 �
Read_31/ReadVariableOpReadVariableOpEread_31_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_bias^Read_31/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0k
Identity_62IdentityRead_31/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: a
Identity_63IdentityIdentity_62:output:0"/device:CPU:0*
T0*
_output_shapes
: �
Read_32/DisableCopyOnReadDisableCopyOnReadEread_32_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_bias"/device:CPU:0*
_output_shapes
 �
Read_32/ReadVariableOpReadVariableOpEread_32_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_bias^Read_32/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0k
Identity_64IdentityRead_32/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: a
Identity_65IdentityIdentity_64:output:0"/device:CPU:0*
T0*
_output_shapes
: �
Read_33/DisableCopyOnReadDisableCopyOnReadIread_33_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_1_kernel"/device:CPU:0*
_output_shapes
 �
Read_33/ReadVariableOpReadVariableOpIread_33_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_1_kernel^Read_33/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:@@*
dtype0w
Identity_66IdentityRead_33/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:@@m
Identity_67IdentityIdentity_66:output:0"/device:CPU:0*
T0*&
_output_shapes
:@@�
Read_34/DisableCopyOnReadDisableCopyOnReadIread_34_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_1_kernel"/device:CPU:0*
_output_shapes
 �
Read_34/ReadVariableOpReadVariableOpIread_34_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_1_kernel^Read_34/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
:@@*
dtype0w
Identity_68IdentityRead_34/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
:@@m
Identity_69IdentityIdentity_68:output:0"/device:CPU:0*
T0*&
_output_shapes
:@@�
Read_35/DisableCopyOnReadDisableCopyOnReadGread_35_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_1_bias"/device:CPU:0*
_output_shapes
 �
Read_35/ReadVariableOpReadVariableOpGread_35_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_1_bias^Read_35/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:@*
dtype0k
Identity_70IdentityRead_35/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:@a
Identity_71IdentityIdentity_70:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_36/DisableCopyOnReadDisableCopyOnReadGread_36_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_1_bias"/device:CPU:0*
_output_shapes
 �
Read_36/ReadVariableOpReadVariableOpGread_36_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_1_bias^Read_36/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:@*
dtype0k
Identity_72IdentityRead_36/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:@a
Identity_73IdentityIdentity_72:output:0"/device:CPU:0*
T0*
_output_shapes
:@�
Read_37/DisableCopyOnReadDisableCopyOnReadIread_37_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_37/ReadVariableOpReadVariableOpIread_37_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_2_kernel^Read_37/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: *
dtype0w
Identity_74IdentityRead_37/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: m
Identity_75IdentityIdentity_74:output:0"/device:CPU:0*
T0*&
_output_shapes
: �
Read_38/DisableCopyOnReadDisableCopyOnReadIread_38_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_2_kernel"/device:CPU:0*
_output_shapes
 �
Read_38/ReadVariableOpReadVariableOpIread_38_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_2_kernel^Read_38/DisableCopyOnRead"/device:CPU:0*&
_output_shapes
: *
dtype0w
Identity_76IdentityRead_38/ReadVariableOp:value:0"/device:CPU:0*
T0*&
_output_shapes
: m
Identity_77IdentityIdentity_76:output:0"/device:CPU:0*
T0*&
_output_shapes
: �
Read_39/DisableCopyOnReadDisableCopyOnReadGread_39_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_2_bias"/device:CPU:0*
_output_shapes
 �
Read_39/ReadVariableOpReadVariableOpGread_39_disablecopyonread_adam_m_vq_vae_decoder_conv2d_transpose_2_bias^Read_39/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_78IdentityRead_39/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_79IdentityIdentity_78:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_40/DisableCopyOnReadDisableCopyOnReadGread_40_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_2_bias"/device:CPU:0*
_output_shapes
 �
Read_40/ReadVariableOpReadVariableOpGread_40_disablecopyonread_adam_v_vq_vae_decoder_conv2d_transpose_2_bias^Read_40/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_80IdentityRead_40/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_81IdentityIdentity_80:output:0"/device:CPU:0*
T0*
_output_shapes
:�
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:**
dtype0*�
value�B�*B&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:**
dtype0*g
value^B\*B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �	
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0Identity_15:output:0Identity_17:output:0Identity_19:output:0Identity_21:output:0Identity_23:output:0Identity_25:output:0Identity_27:output:0Identity_29:output:0Identity_31:output:0Identity_33:output:0Identity_35:output:0Identity_37:output:0Identity_39:output:0Identity_41:output:0Identity_43:output:0Identity_45:output:0Identity_47:output:0Identity_49:output:0Identity_51:output:0Identity_53:output:0Identity_55:output:0Identity_57:output:0Identity_59:output:0Identity_61:output:0Identity_63:output:0Identity_65:output:0Identity_67:output:0Identity_69:output:0Identity_71:output:0Identity_73:output:0Identity_75:output:0Identity_77:output:0Identity_79:output:0Identity_81:output:0savev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *8
dtypes.
,2*	�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 i
Identity_82Identityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: U
Identity_83IdentityIdentity_82:output:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp^MergeV2Checkpoints^Read/DisableCopyOnRead^Read/ReadVariableOp^Read_1/DisableCopyOnRead^Read_1/ReadVariableOp^Read_10/DisableCopyOnRead^Read_10/ReadVariableOp^Read_11/DisableCopyOnRead^Read_11/ReadVariableOp^Read_12/DisableCopyOnRead^Read_12/ReadVariableOp^Read_13/DisableCopyOnRead^Read_13/ReadVariableOp^Read_14/DisableCopyOnRead^Read_14/ReadVariableOp^Read_15/DisableCopyOnRead^Read_15/ReadVariableOp^Read_16/DisableCopyOnRead^Read_16/ReadVariableOp^Read_17/DisableCopyOnRead^Read_17/ReadVariableOp^Read_18/DisableCopyOnRead^Read_18/ReadVariableOp^Read_19/DisableCopyOnRead^Read_19/ReadVariableOp^Read_2/DisableCopyOnRead^Read_2/ReadVariableOp^Read_20/DisableCopyOnRead^Read_20/ReadVariableOp^Read_21/DisableCopyOnRead^Read_21/ReadVariableOp^Read_22/DisableCopyOnRead^Read_22/ReadVariableOp^Read_23/DisableCopyOnRead^Read_23/ReadVariableOp^Read_24/DisableCopyOnRead^Read_24/ReadVariableOp^Read_25/DisableCopyOnRead^Read_25/ReadVariableOp^Read_26/DisableCopyOnRead^Read_26/ReadVariableOp^Read_27/DisableCopyOnRead^Read_27/ReadVariableOp^Read_28/DisableCopyOnRead^Read_28/ReadVariableOp^Read_29/DisableCopyOnRead^Read_29/ReadVariableOp^Read_3/DisableCopyOnRead^Read_3/ReadVariableOp^Read_30/DisableCopyOnRead^Read_30/ReadVariableOp^Read_31/DisableCopyOnRead^Read_31/ReadVariableOp^Read_32/DisableCopyOnRead^Read_32/ReadVariableOp^Read_33/DisableCopyOnRead^Read_33/ReadVariableOp^Read_34/DisableCopyOnRead^Read_34/ReadVariableOp^Read_35/DisableCopyOnRead^Read_35/ReadVariableOp^Read_36/DisableCopyOnRead^Read_36/ReadVariableOp^Read_37/DisableCopyOnRead^Read_37/ReadVariableOp^Read_38/DisableCopyOnRead^Read_38/ReadVariableOp^Read_39/DisableCopyOnRead^Read_39/ReadVariableOp^Read_4/DisableCopyOnRead^Read_4/ReadVariableOp^Read_40/DisableCopyOnRead^Read_40/ReadVariableOp^Read_5/DisableCopyOnRead^Read_5/ReadVariableOp^Read_6/DisableCopyOnRead^Read_6/ReadVariableOp^Read_7/DisableCopyOnRead^Read_7/ReadVariableOp^Read_8/DisableCopyOnRead^Read_8/ReadVariableOp^Read_9/DisableCopyOnRead^Read_9/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "#
identity_83Identity_83:output:0*i
_input_shapesX
V: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints20
Read/DisableCopyOnReadRead/DisableCopyOnRead2*
Read/ReadVariableOpRead/ReadVariableOp24
Read_1/DisableCopyOnReadRead_1/DisableCopyOnRead2.
Read_1/ReadVariableOpRead_1/ReadVariableOp26
Read_10/DisableCopyOnReadRead_10/DisableCopyOnRead20
Read_10/ReadVariableOpRead_10/ReadVariableOp26
Read_11/DisableCopyOnReadRead_11/DisableCopyOnRead20
Read_11/ReadVariableOpRead_11/ReadVariableOp26
Read_12/DisableCopyOnReadRead_12/DisableCopyOnRead20
Read_12/ReadVariableOpRead_12/ReadVariableOp26
Read_13/DisableCopyOnReadRead_13/DisableCopyOnRead20
Read_13/ReadVariableOpRead_13/ReadVariableOp26
Read_14/DisableCopyOnReadRead_14/DisableCopyOnRead20
Read_14/ReadVariableOpRead_14/ReadVariableOp26
Read_15/DisableCopyOnReadRead_15/DisableCopyOnRead20
Read_15/ReadVariableOpRead_15/ReadVariableOp26
Read_16/DisableCopyOnReadRead_16/DisableCopyOnRead20
Read_16/ReadVariableOpRead_16/ReadVariableOp26
Read_17/DisableCopyOnReadRead_17/DisableCopyOnRead20
Read_17/ReadVariableOpRead_17/ReadVariableOp26
Read_18/DisableCopyOnReadRead_18/DisableCopyOnRead20
Read_18/ReadVariableOpRead_18/ReadVariableOp26
Read_19/DisableCopyOnReadRead_19/DisableCopyOnRead20
Read_19/ReadVariableOpRead_19/ReadVariableOp24
Read_2/DisableCopyOnReadRead_2/DisableCopyOnRead2.
Read_2/ReadVariableOpRead_2/ReadVariableOp26
Read_20/DisableCopyOnReadRead_20/DisableCopyOnRead20
Read_20/ReadVariableOpRead_20/ReadVariableOp26
Read_21/DisableCopyOnReadRead_21/DisableCopyOnRead20
Read_21/ReadVariableOpRead_21/ReadVariableOp26
Read_22/DisableCopyOnReadRead_22/DisableCopyOnRead20
Read_22/ReadVariableOpRead_22/ReadVariableOp26
Read_23/DisableCopyOnReadRead_23/DisableCopyOnRead20
Read_23/ReadVariableOpRead_23/ReadVariableOp26
Read_24/DisableCopyOnReadRead_24/DisableCopyOnRead20
Read_24/ReadVariableOpRead_24/ReadVariableOp26
Read_25/DisableCopyOnReadRead_25/DisableCopyOnRead20
Read_25/ReadVariableOpRead_25/ReadVariableOp26
Read_26/DisableCopyOnReadRead_26/DisableCopyOnRead20
Read_26/ReadVariableOpRead_26/ReadVariableOp26
Read_27/DisableCopyOnReadRead_27/DisableCopyOnRead20
Read_27/ReadVariableOpRead_27/ReadVariableOp26
Read_28/DisableCopyOnReadRead_28/DisableCopyOnRead20
Read_28/ReadVariableOpRead_28/ReadVariableOp26
Read_29/DisableCopyOnReadRead_29/DisableCopyOnRead20
Read_29/ReadVariableOpRead_29/ReadVariableOp24
Read_3/DisableCopyOnReadRead_3/DisableCopyOnRead2.
Read_3/ReadVariableOpRead_3/ReadVariableOp26
Read_30/DisableCopyOnReadRead_30/DisableCopyOnRead20
Read_30/ReadVariableOpRead_30/ReadVariableOp26
Read_31/DisableCopyOnReadRead_31/DisableCopyOnRead20
Read_31/ReadVariableOpRead_31/ReadVariableOp26
Read_32/DisableCopyOnReadRead_32/DisableCopyOnRead20
Read_32/ReadVariableOpRead_32/ReadVariableOp26
Read_33/DisableCopyOnReadRead_33/DisableCopyOnRead20
Read_33/ReadVariableOpRead_33/ReadVariableOp26
Read_34/DisableCopyOnReadRead_34/DisableCopyOnRead20
Read_34/ReadVariableOpRead_34/ReadVariableOp26
Read_35/DisableCopyOnReadRead_35/DisableCopyOnRead20
Read_35/ReadVariableOpRead_35/ReadVariableOp26
Read_36/DisableCopyOnReadRead_36/DisableCopyOnRead20
Read_36/ReadVariableOpRead_36/ReadVariableOp26
Read_37/DisableCopyOnReadRead_37/DisableCopyOnRead20
Read_37/ReadVariableOpRead_37/ReadVariableOp26
Read_38/DisableCopyOnReadRead_38/DisableCopyOnRead20
Read_38/ReadVariableOpRead_38/ReadVariableOp26
Read_39/DisableCopyOnReadRead_39/DisableCopyOnRead20
Read_39/ReadVariableOpRead_39/ReadVariableOp24
Read_4/DisableCopyOnReadRead_4/DisableCopyOnRead2.
Read_4/ReadVariableOpRead_4/ReadVariableOp26
Read_40/DisableCopyOnReadRead_40/DisableCopyOnRead20
Read_40/ReadVariableOpRead_40/ReadVariableOp24
Read_5/DisableCopyOnReadRead_5/DisableCopyOnRead2.
Read_5/ReadVariableOpRead_5/ReadVariableOp24
Read_6/DisableCopyOnReadRead_6/DisableCopyOnRead2.
Read_6/ReadVariableOpRead_6/ReadVariableOp24
Read_7/DisableCopyOnReadRead_7/DisableCopyOnRead2.
Read_7/ReadVariableOpRead_7/ReadVariableOp24
Read_8/DisableCopyOnReadRead_8/DisableCopyOnRead2.
Read_8/ReadVariableOpRead_8/ReadVariableOp24
Read_9/DisableCopyOnReadRead_9/DisableCopyOnRead2.
Read_9/ReadVariableOpRead_9/ReadVariableOp:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:*

_output_shapes
: 
�)
�
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_16373
x1
matmul_readvariableop_resource:	@�
identity

identity_1��MatMul/ReadVariableOp�MatMul_1/ReadVariableOp�ReadVariableOpD
ShapeShapex*
T0*
_output_shapes
::��^
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   _
ReshapeReshapexReshape/shape:output:0*
T0*'
_output_shapes
:���������@u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0t
MatMulMatMulReshape:output:0MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������J
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @^
powPowReshape:output:0pow/y:output:0*
T0*'
_output_shapes
:���������@W
Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :v
SumSumpow:z:0Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(n
ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0L
pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @`
pow_1PowReadVariableOp:value:0pow_1/y:output:0*
T0*
_output_shapes
:	@�Y
Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : _
Sum_1Sum	pow_1:z:0 Sum_1/reduction_indices:output:0*
T0*
_output_shapes	
:�]
addAddV2Sum:output:0Sum_1:output:0*
T0*(
_output_shapes
:����������J
mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @_
mulMulmul/x:output:0MatMul:product:0*
T0*(
_output_shapes
:����������O
subSubadd:z:0mul:z:0*
T0*(
_output_shapes
:����������R
ArgMin/dimensionConst*
_output_shapes
: *
dtype0*
value	B :b
ArgMinArgMinsub:z:0ArgMin/dimension:output:0*
T0*#
_output_shapes
:���������U
one_hot/on_valueConst*
_output_shapes
: *
dtype0*
valueB
 *  �?V
one_hot/off_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    P
one_hot/depthConst*
_output_shapes
: *
dtype0*
value
B :��
one_hotOneHotArgMin:output:0one_hot/depth:output:0one_hot/on_value:output:0one_hot/off_value:output:0*
T0*(
_output_shapes
:����������w
MatMul_1/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
MatMul_1MatMulone_hot:output:0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@*
transpose_b(r
	Reshape_1ReshapeMatMul_1:product:0Shape:output:0*
T0*/
_output_shapes
:���������  @j
StopGradientStopGradientReshape_1:output:0*
T0*/
_output_shapes
:���������  @`
sub_1SubStopGradient:output:0x*
T0*/
_output_shapes
:���������  @L
pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_2Pow	sub_1:z:0pow_2/y:output:0*
T0*/
_output_shapes
:���������  @^
ConstConst*
_output_shapes
:*
dtype0*%
valueB"             H
MeanMean	pow_2:z:0Const:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �>N
mul_1Mulmul_1/x:output:0Mean:output:0*
T0*
_output_shapes
: [
StopGradient_1StopGradientx*
T0*/
_output_shapes
:���������  @s
sub_2SubReshape_1:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:���������  @L
pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_3Pow	sub_2:z:0pow_3/y:output:0*
T0*/
_output_shapes
:���������  @`
Const_1Const*
_output_shapes
:*
dtype0*%
valueB"             L
Mean_1Mean	pow_3:z:0Const_1:output:0*
T0*
_output_shapes
: K
add_1AddV2	mul_1:z:0Mean_1:output:0*
T0*
_output_shapes
: ]
sub_3SubReshape_1:output:0x*
T0*/
_output_shapes
:���������  @c
StopGradient_2StopGradient	sub_3:z:0*
T0*/
_output_shapes
:���������  @d
add_2AddV2xStopGradient_2:output:0*
T0*/
_output_shapes
:���������  @`
IdentityIdentity	add_2:z:0^NoOp*
T0*/
_output_shapes
:���������  @I

Identity_1Identity	add_1:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������  @: 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp2 
ReadVariableOpReadVariableOp:R N
/
_output_shapes
:���������  @

_user_specified_namex
�)
�
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_16706

inputsB
(conv2d_transpose_readvariableop_resource: @-
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B : y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+��������������������������� *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+��������������������������� j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+��������������������������� �
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
9vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2LossL2LossPvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: }
8vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
6vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mulMulAvq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0Bvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+��������������������������� �
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpI^vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpHvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs
��
�
A__inference_vq_vae_layer_call_and_return_conditional_losses_16167	
inputG
-encoder_conv2d_conv2d_readvariableop_resource: <
.encoder_conv2d_biasadd_readvariableop_resource: I
/encoder_conv2d_1_conv2d_readvariableop_resource: @>
0encoder_conv2d_1_biasadd_readvariableop_resource:@I
/encoder_conv2d_2_conv2d_readvariableop_resource:@@>
0encoder_conv2d_2_biasadd_readvariableop_resource:@B
/vector_quantizer_matmul_readvariableop_resource:	@�]
Cdecoder_conv2d_transpose_1_conv2d_transpose_readvariableop_resource:@@H
:decoder_conv2d_transpose_1_biasadd_readvariableop_resource:@[
Adecoder_conv2d_transpose_conv2d_transpose_readvariableop_resource: @F
8decoder_conv2d_transpose_biasadd_readvariableop_resource: ]
Cdecoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource: H
:decoder_conv2d_transpose_2_biasadd_readvariableop_resource:
identity

identity_1��/decoder/conv2d_transpose/BiasAdd/ReadVariableOp�8decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp�1decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp�:decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp�1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp�:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp�%encoder/conv2d/BiasAdd/ReadVariableOp�$encoder/conv2d/Conv2D/ReadVariableOp�'encoder/conv2d_1/BiasAdd/ReadVariableOp�&encoder/conv2d_1/Conv2D/ReadVariableOp�'encoder/conv2d_2/BiasAdd/ReadVariableOp�&encoder/conv2d_2/Conv2D/ReadVariableOp�&vector_quantizer/MatMul/ReadVariableOp�(vector_quantizer/MatMul_1/ReadVariableOp�vector_quantizer/ReadVariableOp�Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp�>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp�@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp�
$encoder/conv2d/Conv2D/ReadVariableOpReadVariableOp-encoder_conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
encoder/conv2d/Conv2DConv2Dinput,encoder/conv2d/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
%encoder/conv2d/BiasAdd/ReadVariableOpReadVariableOp.encoder_conv2d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
encoder/conv2d/BiasAddBiasAddencoder/conv2d/Conv2D:output:0-encoder/conv2d/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   v
encoder/conv2d/ReluReluencoder/conv2d/BiasAdd:output:0*
T0*/
_output_shapes
:���������   �
&encoder/conv2d_1/Conv2D/ReadVariableOpReadVariableOp/encoder_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
encoder/conv2d_1/Conv2DConv2D!encoder/conv2d/Relu:activations:0.encoder/conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
'encoder/conv2d_1/BiasAdd/ReadVariableOpReadVariableOp0encoder_conv2d_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
encoder/conv2d_1/BiasAddBiasAdd encoder/conv2d_1/Conv2D:output:0/encoder/conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @z
encoder/conv2d_1/ReluRelu!encoder/conv2d_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
&encoder/conv2d_2/Conv2D/ReadVariableOpReadVariableOp/encoder_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
encoder/conv2d_2/Conv2DConv2D#encoder/conv2d_1/Relu:activations:0.encoder/conv2d_2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
'encoder/conv2d_2/BiasAdd/ReadVariableOpReadVariableOp0encoder_conv2d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
encoder/conv2d_2/BiasAddBiasAdd encoder/conv2d_2/Conv2D:output:0/encoder/conv2d_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @z
encoder/conv2d_2/ReluRelu!encoder/conv2d_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @w
vector_quantizer/ShapeShape#encoder/conv2d_2/Relu:activations:0*
T0*
_output_shapes
::��o
vector_quantizer/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   �
vector_quantizer/ReshapeReshape#encoder/conv2d_2/Relu:activations:0'vector_quantizer/Reshape/shape:output:0*
T0*'
_output_shapes
:���������@�
&vector_quantizer/MatMul/ReadVariableOpReadVariableOp/vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
vector_quantizer/MatMulMatMul!vector_quantizer/Reshape:output:0.vector_quantizer/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������[
vector_quantizer/pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vector_quantizer/powPow!vector_quantizer/Reshape:output:0vector_quantizer/pow/y:output:0*
T0*'
_output_shapes
:���������@h
&vector_quantizer/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :�
vector_quantizer/SumSumvector_quantizer/pow:z:0/vector_quantizer/Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(�
vector_quantizer/ReadVariableOpReadVariableOp/vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0]
vector_quantizer/pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vector_quantizer/pow_1Pow'vector_quantizer/ReadVariableOp:value:0!vector_quantizer/pow_1/y:output:0*
T0*
_output_shapes
:	@�j
(vector_quantizer/Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : �
vector_quantizer/Sum_1Sumvector_quantizer/pow_1:z:01vector_quantizer/Sum_1/reduction_indices:output:0*
T0*
_output_shapes	
:��
vector_quantizer/addAddV2vector_quantizer/Sum:output:0vector_quantizer/Sum_1:output:0*
T0*(
_output_shapes
:����������[
vector_quantizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vector_quantizer/mulMulvector_quantizer/mul/x:output:0!vector_quantizer/MatMul:product:0*
T0*(
_output_shapes
:�����������
vector_quantizer/subSubvector_quantizer/add:z:0vector_quantizer/mul:z:0*
T0*(
_output_shapes
:����������c
!vector_quantizer/ArgMin/dimensionConst*
_output_shapes
: *
dtype0*
value	B :�
vector_quantizer/ArgMinArgMinvector_quantizer/sub:z:0*vector_quantizer/ArgMin/dimension:output:0*
T0*#
_output_shapes
:���������f
!vector_quantizer/one_hot/on_valueConst*
_output_shapes
: *
dtype0*
valueB
 *  �?g
"vector_quantizer/one_hot/off_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    a
vector_quantizer/one_hot/depthConst*
_output_shapes
: *
dtype0*
value
B :��
vector_quantizer/one_hotOneHot vector_quantizer/ArgMin:output:0'vector_quantizer/one_hot/depth:output:0*vector_quantizer/one_hot/on_value:output:0+vector_quantizer/one_hot/off_value:output:0*
T0*(
_output_shapes
:�����������
(vector_quantizer/MatMul_1/ReadVariableOpReadVariableOp/vector_quantizer_matmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
vector_quantizer/MatMul_1MatMul!vector_quantizer/one_hot:output:00vector_quantizer/MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@*
transpose_b(�
vector_quantizer/Reshape_1Reshape#vector_quantizer/MatMul_1:product:0vector_quantizer/Shape:output:0*
T0*/
_output_shapes
:���������  @�
vector_quantizer/StopGradientStopGradient#vector_quantizer/Reshape_1:output:0*
T0*/
_output_shapes
:���������  @�
vector_quantizer/sub_1Sub&vector_quantizer/StopGradient:output:0#encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @]
vector_quantizer/pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vector_quantizer/pow_2Powvector_quantizer/sub_1:z:0!vector_quantizer/pow_2/y:output:0*
T0*/
_output_shapes
:���������  @o
vector_quantizer/ConstConst*
_output_shapes
:*
dtype0*%
valueB"             {
vector_quantizer/MeanMeanvector_quantizer/pow_2:z:0vector_quantizer/Const:output:0*
T0*
_output_shapes
: ]
vector_quantizer/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �>�
vector_quantizer/mul_1Mul!vector_quantizer/mul_1/x:output:0vector_quantizer/Mean:output:0*
T0*
_output_shapes
: �
vector_quantizer/StopGradient_1StopGradient#encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @�
vector_quantizer/sub_2Sub#vector_quantizer/Reshape_1:output:0(vector_quantizer/StopGradient_1:output:0*
T0*/
_output_shapes
:���������  @]
vector_quantizer/pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @�
vector_quantizer/pow_3Powvector_quantizer/sub_2:z:0!vector_quantizer/pow_3/y:output:0*
T0*/
_output_shapes
:���������  @q
vector_quantizer/Const_1Const*
_output_shapes
:*
dtype0*%
valueB"             
vector_quantizer/Mean_1Meanvector_quantizer/pow_3:z:0!vector_quantizer/Const_1:output:0*
T0*
_output_shapes
: ~
vector_quantizer/add_1AddV2vector_quantizer/mul_1:z:0 vector_quantizer/Mean_1:output:0*
T0*
_output_shapes
: �
vector_quantizer/sub_3Sub#vector_quantizer/Reshape_1:output:0#encoder/conv2d_2/Relu:activations:0*
T0*/
_output_shapes
:���������  @�
vector_quantizer/StopGradient_2StopGradientvector_quantizer/sub_3:z:0*
T0*/
_output_shapes
:���������  @�
vector_quantizer/add_2AddV2#encoder/conv2d_2/Relu:activations:0(vector_quantizer/StopGradient_2:output:0*
T0*/
_output_shapes
:���������  @x
 decoder/conv2d_transpose_1/ShapeShapevector_quantizer/add_2:z:0*
T0*
_output_shapes
::��x
.decoder/conv2d_transpose_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0decoder/conv2d_transpose_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0decoder/conv2d_transpose_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(decoder/conv2d_transpose_1/strided_sliceStridedSlice)decoder/conv2d_transpose_1/Shape:output:07decoder/conv2d_transpose_1/strided_slice/stack:output:09decoder/conv2d_transpose_1/strided_slice/stack_1:output:09decoder/conv2d_transpose_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskd
"decoder/conv2d_transpose_1/stack/1Const*
_output_shapes
: *
dtype0*
value	B : d
"decoder/conv2d_transpose_1/stack/2Const*
_output_shapes
: *
dtype0*
value	B : d
"decoder/conv2d_transpose_1/stack/3Const*
_output_shapes
: *
dtype0*
value	B :@�
 decoder/conv2d_transpose_1/stackPack1decoder/conv2d_transpose_1/strided_slice:output:0+decoder/conv2d_transpose_1/stack/1:output:0+decoder/conv2d_transpose_1/stack/2:output:0+decoder/conv2d_transpose_1/stack/3:output:0*
N*
T0*
_output_shapes
:z
0decoder/conv2d_transpose_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2decoder/conv2d_transpose_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2decoder/conv2d_transpose_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
*decoder/conv2d_transpose_1/strided_slice_1StridedSlice)decoder/conv2d_transpose_1/stack:output:09decoder/conv2d_transpose_1/strided_slice_1/stack:output:0;decoder/conv2d_transpose_1/strided_slice_1/stack_1:output:0;decoder/conv2d_transpose_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
:decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOpReadVariableOpCdecoder_conv2d_transpose_1_conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
+decoder/conv2d_transpose_1/conv2d_transposeConv2DBackpropInput)decoder/conv2d_transpose_1/stack:output:0Bdecoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp:value:0vector_quantizer/add_2:z:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
1decoder/conv2d_transpose_1/BiasAdd/ReadVariableOpReadVariableOp:decoder_conv2d_transpose_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
"decoder/conv2d_transpose_1/BiasAddBiasAdd4decoder/conv2d_transpose_1/conv2d_transpose:output:09decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @�
decoder/conv2d_transpose_1/ReluRelu+decoder/conv2d_transpose_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
decoder/conv2d_transpose/ShapeShape-decoder/conv2d_transpose_1/Relu:activations:0*
T0*
_output_shapes
::��v
,decoder/conv2d_transpose/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: x
.decoder/conv2d_transpose/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:x
.decoder/conv2d_transpose/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
&decoder/conv2d_transpose/strided_sliceStridedSlice'decoder/conv2d_transpose/Shape:output:05decoder/conv2d_transpose/strided_slice/stack:output:07decoder/conv2d_transpose/strided_slice/stack_1:output:07decoder/conv2d_transpose/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskb
 decoder/conv2d_transpose/stack/1Const*
_output_shapes
: *
dtype0*
value	B : b
 decoder/conv2d_transpose/stack/2Const*
_output_shapes
: *
dtype0*
value	B : b
 decoder/conv2d_transpose/stack/3Const*
_output_shapes
: *
dtype0*
value	B : �
decoder/conv2d_transpose/stackPack/decoder/conv2d_transpose/strided_slice:output:0)decoder/conv2d_transpose/stack/1:output:0)decoder/conv2d_transpose/stack/2:output:0)decoder/conv2d_transpose/stack/3:output:0*
N*
T0*
_output_shapes
:x
.decoder/conv2d_transpose/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0decoder/conv2d_transpose/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0decoder/conv2d_transpose/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(decoder/conv2d_transpose/strided_slice_1StridedSlice'decoder/conv2d_transpose/stack:output:07decoder/conv2d_transpose/strided_slice_1/stack:output:09decoder/conv2d_transpose/strided_slice_1/stack_1:output:09decoder/conv2d_transpose/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
8decoder/conv2d_transpose/conv2d_transpose/ReadVariableOpReadVariableOpAdecoder_conv2d_transpose_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
)decoder/conv2d_transpose/conv2d_transposeConv2DBackpropInput'decoder/conv2d_transpose/stack:output:0@decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp:value:0-decoder/conv2d_transpose_1/Relu:activations:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
/decoder/conv2d_transpose/BiasAdd/ReadVariableOpReadVariableOp8decoder_conv2d_transpose_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
 decoder/conv2d_transpose/BiasAddBiasAdd2decoder/conv2d_transpose/conv2d_transpose:output:07decoder/conv2d_transpose/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   �
decoder/conv2d_transpose/ReluRelu)decoder/conv2d_transpose/BiasAdd:output:0*
T0*/
_output_shapes
:���������   �
 decoder/conv2d_transpose_2/ShapeShape+decoder/conv2d_transpose/Relu:activations:0*
T0*
_output_shapes
::��x
.decoder/conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: z
0decoder/conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:z
0decoder/conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
(decoder/conv2d_transpose_2/strided_sliceStridedSlice)decoder/conv2d_transpose_2/Shape:output:07decoder/conv2d_transpose_2/strided_slice/stack:output:09decoder/conv2d_transpose_2/strided_slice/stack_1:output:09decoder/conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskd
"decoder/conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B : d
"decoder/conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B : d
"decoder/conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B :�
 decoder/conv2d_transpose_2/stackPack1decoder/conv2d_transpose_2/strided_slice:output:0+decoder/conv2d_transpose_2/stack/1:output:0+decoder/conv2d_transpose_2/stack/2:output:0+decoder/conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:z
0decoder/conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: |
2decoder/conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:|
2decoder/conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
*decoder/conv2d_transpose_2/strided_slice_1StridedSlice)decoder/conv2d_transpose_2/stack:output:09decoder/conv2d_transpose_2/strided_slice_1/stack:output:0;decoder/conv2d_transpose_2/strided_slice_1/stack_1:output:0;decoder/conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOpCdecoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
+decoder/conv2d_transpose_2/conv2d_transposeConv2DBackpropInput)decoder/conv2d_transpose_2/stack:output:0Bdecoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:0+decoder/conv2d_transpose/Relu:activations:0*
T0*/
_output_shapes
:���������  *
paddingSAME*
strides
�
1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOp:decoder_conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
"decoder/conv2d_transpose_2/BiasAddBiasAdd4decoder/conv2d_transpose_2/conv2d_transpose:output:09decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  �
"decoder/conv2d_transpose_2/SigmoidSigmoid+decoder/conv2d_transpose_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  �
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp-encoder_conv2d_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
/vq_vae/encoder/conv2d/kernel/Regularizer/L2LossL2LossFvq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: s
.vq_vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
,vq_vae/encoder/conv2d/kernel/Regularizer/mulMul7vq_vae/encoder/conv2d/kernel/Regularizer/mul/x:output:08vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp/encoder_conv2d_1_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
1vq_vae/encoder/conv2d_1/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_1/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp/encoder_conv2d_2_conv2d_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
1vq_vae/encoder/conv2d_2/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_2/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_2/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpAdecoder_conv2d_transpose_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
9vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2LossL2LossPvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: }
8vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
6vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mulMulAvq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0Bvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpCdecoder_conv2d_transpose_1_conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
;vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpCdecoder_conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
;vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: }
IdentityIdentity&decoder/conv2d_transpose_2/Sigmoid:y:0^NoOp*
T0*/
_output_shapes
:���������  Z

Identity_1Identityvector_quantizer/add_1:z:0^NoOp*
T0*
_output_shapes
: �	
NoOpNoOp0^decoder/conv2d_transpose/BiasAdd/ReadVariableOp9^decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp2^decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp;^decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp2^decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp;^decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp&^encoder/conv2d/BiasAdd/ReadVariableOp%^encoder/conv2d/Conv2D/ReadVariableOp(^encoder/conv2d_1/BiasAdd/ReadVariableOp'^encoder/conv2d_1/Conv2D/ReadVariableOp(^encoder/conv2d_2/BiasAdd/ReadVariableOp'^encoder/conv2d_2/Conv2D/ReadVariableOp'^vector_quantizer/MatMul/ReadVariableOp)^vector_quantizer/MatMul_1/ReadVariableOp ^vector_quantizer/ReadVariableOpI^vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp?^vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpA^vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:���������  : : : : : : : : : : : : : 2b
/decoder/conv2d_transpose/BiasAdd/ReadVariableOp/decoder/conv2d_transpose/BiasAdd/ReadVariableOp2t
8decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp8decoder/conv2d_transpose/conv2d_transpose/ReadVariableOp2f
1decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp1decoder/conv2d_transpose_1/BiasAdd/ReadVariableOp2x
:decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp:decoder/conv2d_transpose_1/conv2d_transpose/ReadVariableOp2f
1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp1decoder/conv2d_transpose_2/BiasAdd/ReadVariableOp2x
:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp:decoder/conv2d_transpose_2/conv2d_transpose/ReadVariableOp2N
%encoder/conv2d/BiasAdd/ReadVariableOp%encoder/conv2d/BiasAdd/ReadVariableOp2L
$encoder/conv2d/Conv2D/ReadVariableOp$encoder/conv2d/Conv2D/ReadVariableOp2R
'encoder/conv2d_1/BiasAdd/ReadVariableOp'encoder/conv2d_1/BiasAdd/ReadVariableOp2P
&encoder/conv2d_1/Conv2D/ReadVariableOp&encoder/conv2d_1/Conv2D/ReadVariableOp2R
'encoder/conv2d_2/BiasAdd/ReadVariableOp'encoder/conv2d_2/BiasAdd/ReadVariableOp2P
&encoder/conv2d_2/Conv2D/ReadVariableOp&encoder/conv2d_2/Conv2D/ReadVariableOp2P
&vector_quantizer/MatMul/ReadVariableOp&vector_quantizer/MatMul/ReadVariableOp2T
(vector_quantizer/MatMul_1/ReadVariableOp(vector_quantizer/MatMul_1/ReadVariableOp2B
vector_quantizer/ReadVariableOpvector_quantizer/ReadVariableOp2�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpHvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp2�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_2/kernel/Regularizer/L2Loss/ReadVariableOp:V R
/
_output_shapes
:���������  

_user_specified_nameinput
�l
�
B__inference_decoder_layer_call_and_return_conditional_losses_16466	
inputU
;conv2d_transpose_1_conv2d_transpose_readvariableop_resource:@@@
2conv2d_transpose_1_biasadd_readvariableop_resource:@S
9conv2d_transpose_conv2d_transpose_readvariableop_resource: @>
0conv2d_transpose_biasadd_readvariableop_resource: U
;conv2d_transpose_2_conv2d_transpose_readvariableop_resource: @
2conv2d_transpose_2_biasadd_readvariableop_resource:
identity��'conv2d_transpose/BiasAdd/ReadVariableOp�0conv2d_transpose/conv2d_transpose/ReadVariableOp�)conv2d_transpose_1/BiasAdd/ReadVariableOp�2conv2d_transpose_1/conv2d_transpose/ReadVariableOp�)conv2d_transpose_2/BiasAdd/ReadVariableOp�2conv2d_transpose_2/conv2d_transpose/ReadVariableOp�Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp[
conv2d_transpose_1/ShapeShapeinput*
T0*
_output_shapes
::��p
&conv2d_transpose_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
 conv2d_transpose_1/strided_sliceStridedSlice!conv2d_transpose_1/Shape:output:0/conv2d_transpose_1/strided_slice/stack:output:01conv2d_transpose_1/strided_slice/stack_1:output:01conv2d_transpose_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_1/stack/1Const*
_output_shapes
: *
dtype0*
value	B : \
conv2d_transpose_1/stack/2Const*
_output_shapes
: *
dtype0*
value	B : \
conv2d_transpose_1/stack/3Const*
_output_shapes
: *
dtype0*
value	B :@�
conv2d_transpose_1/stackPack)conv2d_transpose_1/strided_slice:output:0#conv2d_transpose_1/stack/1:output:0#conv2d_transpose_1/stack/2:output:0#conv2d_transpose_1/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
"conv2d_transpose_1/strided_slice_1StridedSlice!conv2d_transpose_1/stack:output:01conv2d_transpose_1/strided_slice_1/stack:output:03conv2d_transpose_1/strided_slice_1/stack_1:output:03conv2d_transpose_1/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
2conv2d_transpose_1/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_1_conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
#conv2d_transpose_1/conv2d_transposeConv2DBackpropInput!conv2d_transpose_1/stack:output:0:conv2d_transpose_1/conv2d_transpose/ReadVariableOp:value:0input*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
�
)conv2d_transpose_1/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
conv2d_transpose_1/BiasAddBiasAdd,conv2d_transpose_1/conv2d_transpose:output:01conv2d_transpose_1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @~
conv2d_transpose_1/ReluRelu#conv2d_transpose_1/BiasAdd:output:0*
T0*/
_output_shapes
:���������  @y
conv2d_transpose/ShapeShape%conv2d_transpose_1/Relu:activations:0*
T0*
_output_shapes
::��n
$conv2d_transpose/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: p
&conv2d_transpose/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:p
&conv2d_transpose/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
conv2d_transpose/strided_sliceStridedSliceconv2d_transpose/Shape:output:0-conv2d_transpose/strided_slice/stack:output:0/conv2d_transpose/strided_slice/stack_1:output:0/conv2d_transpose/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskZ
conv2d_transpose/stack/1Const*
_output_shapes
: *
dtype0*
value	B : Z
conv2d_transpose/stack/2Const*
_output_shapes
: *
dtype0*
value	B : Z
conv2d_transpose/stack/3Const*
_output_shapes
: *
dtype0*
value	B : �
conv2d_transpose/stackPack'conv2d_transpose/strided_slice:output:0!conv2d_transpose/stack/1:output:0!conv2d_transpose/stack/2:output:0!conv2d_transpose/stack/3:output:0*
N*
T0*
_output_shapes
:p
&conv2d_transpose/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
 conv2d_transpose/strided_slice_1StridedSliceconv2d_transpose/stack:output:0/conv2d_transpose/strided_slice_1/stack:output:01conv2d_transpose/strided_slice_1/stack_1:output:01conv2d_transpose/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
0conv2d_transpose/conv2d_transpose/ReadVariableOpReadVariableOp9conv2d_transpose_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
!conv2d_transpose/conv2d_transposeConv2DBackpropInputconv2d_transpose/stack:output:08conv2d_transpose/conv2d_transpose/ReadVariableOp:value:0%conv2d_transpose_1/Relu:activations:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
�
'conv2d_transpose/BiasAdd/ReadVariableOpReadVariableOp0conv2d_transpose_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
conv2d_transpose/BiasAddBiasAdd*conv2d_transpose/conv2d_transpose:output:0/conv2d_transpose/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   z
conv2d_transpose/ReluRelu!conv2d_transpose/BiasAdd:output:0*
T0*/
_output_shapes
:���������   y
conv2d_transpose_2/ShapeShape#conv2d_transpose/Relu:activations:0*
T0*
_output_shapes
::��p
&conv2d_transpose_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(conv2d_transpose_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(conv2d_transpose_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
 conv2d_transpose_2/strided_sliceStridedSlice!conv2d_transpose_2/Shape:output:0/conv2d_transpose_2/strided_slice/stack:output:01conv2d_transpose_2/strided_slice/stack_1:output:01conv2d_transpose_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask\
conv2d_transpose_2/stack/1Const*
_output_shapes
: *
dtype0*
value	B : \
conv2d_transpose_2/stack/2Const*
_output_shapes
: *
dtype0*
value	B : \
conv2d_transpose_2/stack/3Const*
_output_shapes
: *
dtype0*
value	B :�
conv2d_transpose_2/stackPack)conv2d_transpose_2/strided_slice:output:0#conv2d_transpose_2/stack/1:output:0#conv2d_transpose_2/stack/2:output:0#conv2d_transpose_2/stack/3:output:0*
N*
T0*
_output_shapes
:r
(conv2d_transpose_2/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*conv2d_transpose_2/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*conv2d_transpose_2/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
"conv2d_transpose_2/strided_slice_1StridedSlice!conv2d_transpose_2/stack:output:01conv2d_transpose_2/strided_slice_1/stack:output:03conv2d_transpose_2/strided_slice_1/stack_1:output:03conv2d_transpose_2/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
2conv2d_transpose_2/conv2d_transpose/ReadVariableOpReadVariableOp;conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
#conv2d_transpose_2/conv2d_transposeConv2DBackpropInput!conv2d_transpose_2/stack:output:0:conv2d_transpose_2/conv2d_transpose/ReadVariableOp:value:0#conv2d_transpose/Relu:activations:0*
T0*/
_output_shapes
:���������  *
paddingSAME*
strides
�
)conv2d_transpose_2/BiasAdd/ReadVariableOpReadVariableOp2conv2d_transpose_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
conv2d_transpose_2/BiasAddBiasAdd,conv2d_transpose_2/conv2d_transpose:output:01conv2d_transpose_2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  �
conv2d_transpose_2/SigmoidSigmoid#conv2d_transpose_2/BiasAdd:output:0*
T0*/
_output_shapes
:���������  �
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp9conv2d_transpose_conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
9vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2LossL2LossPvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: }
8vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
6vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mulMulAvq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0Bvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp;conv2d_transpose_1_conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
;vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: �
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp;conv2d_transpose_2_conv2d_transpose_readvariableop_resource*&
_output_shapes
: *
dtype0�
;vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: u
IdentityIdentityconv2d_transpose_2/Sigmoid:y:0^NoOp*
T0*/
_output_shapes
:���������  �
NoOpNoOp(^conv2d_transpose/BiasAdd/ReadVariableOp1^conv2d_transpose/conv2d_transpose/ReadVariableOp*^conv2d_transpose_1/BiasAdd/ReadVariableOp3^conv2d_transpose_1/conv2d_transpose/ReadVariableOp*^conv2d_transpose_2/BiasAdd/ReadVariableOp3^conv2d_transpose_2/conv2d_transpose/ReadVariableOpI^vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  @: : : : : : 2R
'conv2d_transpose/BiasAdd/ReadVariableOp'conv2d_transpose/BiasAdd/ReadVariableOp2d
0conv2d_transpose/conv2d_transpose/ReadVariableOp0conv2d_transpose/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_1/BiasAdd/ReadVariableOp)conv2d_transpose_1/BiasAdd/ReadVariableOp2h
2conv2d_transpose_1/conv2d_transpose/ReadVariableOp2conv2d_transpose_1/conv2d_transpose/ReadVariableOp2V
)conv2d_transpose_2/BiasAdd/ReadVariableOp)conv2d_transpose_2/BiasAdd/ReadVariableOp2h
2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2conv2d_transpose_2/conv2d_transpose/ReadVariableOp2�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpHvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_2/kernel/Regularizer/L2Loss/ReadVariableOp:V R
/
_output_shapes
:���������  @

_user_specified_nameinput
�
�
(__inference_conv2d_1_layer_call_fn_16644

inputs!
unknown: @
	unknown_0:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *L
fGRE
C__inference_conv2d_1_layer_call_and_return_conditional_losses_15235w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������   : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������   
 
_user_specified_nameinputs
�
�
__inference_loss_fn_1_16488c
Ivq_vae_encoder_conv2d_1_kernel_regularizer_l2loss_readvariableop_resource: @
identity��@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpIvq_vae_encoder_conv2d_1_kernel_regularizer_l2loss_readvariableop_resource*&
_output_shapes
: @*
dtype0�
1vq_vae/encoder/conv2d_1/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_1/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: p
IdentityIdentity2vq_vae/encoder/conv2d_1/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpA^vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp
�
�
&__inference_conv2d_layer_call_fn_16620

inputs!
unknown: 
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������   *$
_read_only_resource_inputs
*8
config_proto(&

CPU

GPU2*0J

   E8� *J
fERC
A__inference_conv2d_layer_call_and_return_conditional_losses_15214w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������   `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:���������  
 
_user_specified_nameinputs
�	
�
'__inference_encoder_layer_call_fn_16273	
input!
unknown: 
	unknown_0: #
	unknown_1: @
	unknown_2:@#
	unknown_3:@@
	unknown_4:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:���������  @*(
_read_only_resource_inputs

*8
config_proto(&

CPU

GPU2*0J

   E8� *K
fFRD
B__inference_encoder_layer_call_and_return_conditional_losses_15309w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:���������  @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':���������  : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
/
_output_shapes
:���������  

_user_specified_nameinput
�)
�
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_15530

inputsB
(conv2d_transpose_readvariableop_resource: @-
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B : y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+��������������������������� *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+��������������������������� j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+��������������������������� �
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
: @*
dtype0�
9vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2LossL2LossPvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: }
8vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
6vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mulMulAvq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0Bvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+��������������������������� �
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpI^vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpHvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs
�
J
"__inference__update_step_xla_16236
gradient
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*
_input_shapes

: : *
	_noinline(:D @

_output_shapes
: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�
�
__inference_loss_fn_3_16538k
Qvq_vae_decoder_conv2d_transpose_kernel_regularizer_l2loss_readvariableop_resource: @
identity��Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpQvq_vae_decoder_conv2d_transpose_kernel_regularizer_l2loss_readvariableop_resource*&
_output_shapes
: @*
dtype0�
9vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2LossL2LossPvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: }
8vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
6vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mulMulAvq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul/x:output:0Bvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: x
IdentityIdentity:vq_vae/decoder/conv2d_transpose/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOpI^vq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2�
Hvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOpHvq_vae/decoder/conv2d_transpose/kernel/Regularizer/L2Loss/ReadVariableOp
�
V
"__inference__update_step_xla_16196
gradient"
variable: *
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
: : *
	_noinline(:P L
&
_output_shapes
: 
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
�
�
A__inference_conv2d_layer_call_and_return_conditional_losses_15214

inputs8
conv2d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������   X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������   �
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0�
/vq_vae/encoder/conv2d/kernel/Regularizer/L2LossL2LossFvq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: s
.vq_vae/encoder/conv2d/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
,vq_vae/encoder/conv2d/kernel/Regularizer/mulMul7vq_vae/encoder/conv2d/kernel/Regularizer/mul/x:output:08vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������   �
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp?^vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������  : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp>vq_vae/encoder/conv2d/kernel/Regularizer/L2Loss/ReadVariableOp:W S
/
_output_shapes
:���������  
 
_user_specified_nameinputs
�)
�
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_15579

inputsB
(conv2d_transpose_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�conv2d_transpose/ReadVariableOp�Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSliceShape:output:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskG
mul/yConst*
_output_shapes
: *
dtype0*
value	B :U
mulMulstrided_slice_1:output:0mul/y:output:0*
T0*
_output_shapes
: I
mul_1/yConst*
_output_shapes
: *
dtype0*
value	B :Y
mul_1Mulstrided_slice_2:output:0mul_1/y:output:0*
T0*
_output_shapes
: I
stack/3Const*
_output_shapes
: *
dtype0*
value	B :@y
stackPackstrided_slice:output:0mul:z:0	mul_1:z:0stack/3:output:0*
N*
T0*
_output_shapes
:_
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlicestack:output:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask�
conv2d_transpose/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
conv2d_transposeConv2DBackpropInputstack:output:0'conv2d_transpose/ReadVariableOp:value:0inputs*
T0*A
_output_shapes/
-:+���������������������������@*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0�
BiasAddBiasAddconv2d_transpose:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+���������������������������@j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+���������������������������@�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOp(conv2d_transpose_readvariableop_resource*&
_output_shapes
:@@*
dtype0�
;vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2LossL2LossRvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: 
:vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
8vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mulMulCvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/mul/x:output:0Dvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+���������������������������@�
NoOpNoOp^BiasAdd/ReadVariableOp ^conv2d_transpose/ReadVariableOpK^vq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+���������������������������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2B
conv2d_transpose/ReadVariableOpconv2d_transpose/ReadVariableOp2�
Jvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOpJvq_vae/decoder/conv2d_transpose_1/kernel/Regularizer/L2Loss/ReadVariableOp:i e
A
_output_shapes/
-:+���������������������������@
 
_user_specified_nameinputs
�)
�
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_15423
input_11
matmul_readvariableop_resource:	@�
identity

identity_1��MatMul/ReadVariableOp�MatMul_1/ReadVariableOp�ReadVariableOpJ
ShapeShapeinput_1*
T0*
_output_shapes
::��^
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"����@   e
ReshapeReshapeinput_1Reshape/shape:output:0*
T0*'
_output_shapes
:���������@u
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0t
MatMulMatMulReshape:output:0MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������J
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @^
powPowReshape:output:0pow/y:output:0*
T0*'
_output_shapes
:���������@W
Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :v
SumSumpow:z:0Sum/reduction_indices:output:0*
T0*'
_output_shapes
:���������*
	keep_dims(n
ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0L
pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @`
pow_1PowReadVariableOp:value:0pow_1/y:output:0*
T0*
_output_shapes
:	@�Y
Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B : _
Sum_1Sum	pow_1:z:0 Sum_1/reduction_indices:output:0*
T0*
_output_shapes	
:�]
addAddV2Sum:output:0Sum_1:output:0*
T0*(
_output_shapes
:����������J
mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   @_
mulMulmul/x:output:0MatMul:product:0*
T0*(
_output_shapes
:����������O
subSubadd:z:0mul:z:0*
T0*(
_output_shapes
:����������R
ArgMin/dimensionConst*
_output_shapes
: *
dtype0*
value	B :b
ArgMinArgMinsub:z:0ArgMin/dimension:output:0*
T0*#
_output_shapes
:���������U
one_hot/on_valueConst*
_output_shapes
: *
dtype0*
valueB
 *  �?V
one_hot/off_valueConst*
_output_shapes
: *
dtype0*
valueB
 *    P
one_hot/depthConst*
_output_shapes
: *
dtype0*
value
B :��
one_hotOneHotArgMin:output:0one_hot/depth:output:0one_hot/on_value:output:0one_hot/off_value:output:0*
T0*(
_output_shapes
:����������w
MatMul_1/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@�*
dtype0�
MatMul_1MatMulone_hot:output:0MatMul_1/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@*
transpose_b(r
	Reshape_1ReshapeMatMul_1:product:0Shape:output:0*
T0*/
_output_shapes
:���������  @j
StopGradientStopGradientReshape_1:output:0*
T0*/
_output_shapes
:���������  @f
sub_1SubStopGradient:output:0input_1*
T0*/
_output_shapes
:���������  @L
pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_2Pow	sub_1:z:0pow_2/y:output:0*
T0*/
_output_shapes
:���������  @^
ConstConst*
_output_shapes
:*
dtype0*%
valueB"             H
MeanMean	pow_2:z:0Const:output:0*
T0*
_output_shapes
: L
mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �>N
mul_1Mulmul_1/x:output:0Mean:output:0*
T0*
_output_shapes
: a
StopGradient_1StopGradientinput_1*
T0*/
_output_shapes
:���������  @s
sub_2SubReshape_1:output:0StopGradient_1:output:0*
T0*/
_output_shapes
:���������  @L
pow_3/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @c
pow_3Pow	sub_2:z:0pow_3/y:output:0*
T0*/
_output_shapes
:���������  @`
Const_1Const*
_output_shapes
:*
dtype0*%
valueB"             L
Mean_1Mean	pow_3:z:0Const_1:output:0*
T0*
_output_shapes
: K
add_1AddV2	mul_1:z:0Mean_1:output:0*
T0*
_output_shapes
: c
sub_3SubReshape_1:output:0input_1*
T0*/
_output_shapes
:���������  @c
StopGradient_2StopGradient	sub_3:z:0*
T0*/
_output_shapes
:���������  @j
add_2AddV2input_1StopGradient_2:output:0*
T0*/
_output_shapes
:���������  @`
IdentityIdentity	add_2:z:0^NoOp*
T0*/
_output_shapes
:���������  @I

Identity_1Identity	add_1:z:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������  @: 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp2 
ReadVariableOpReadVariableOp:X T
/
_output_shapes
:���������  @
!
_user_specified_name	input_1
�
V
"__inference__update_step_xla_16231
gradient"
variable: @*
_XlaMustCompile(*(
_construction_contextkEagerRuntime*'
_input_shapes
: @: *
	_noinline(:P L
&
_output_shapes
: @
"
_user_specified_name
gradient:($
"
_user_specified_name
variable
ɷ
� 
!__inference__traced_restore_17155
file_prefixG
-assignvariableop_vq_vae_encoder_conv2d_kernel: ;
-assignvariableop_1_vq_vae_encoder_conv2d_bias: K
1assignvariableop_2_vq_vae_encoder_conv2d_1_kernel: @=
/assignvariableop_3_vq_vae_encoder_conv2d_1_bias:@K
1assignvariableop_4_vq_vae_encoder_conv2d_2_kernel:@@=
/assignvariableop_5_vq_vae_encoder_conv2d_2_bias:@6
#assignvariableop_6_embeddings_vqvae:	@�S
9assignvariableop_7_vq_vae_decoder_conv2d_transpose_kernel: @E
7assignvariableop_8_vq_vae_decoder_conv2d_transpose_bias: U
;assignvariableop_9_vq_vae_decoder_conv2d_transpose_1_kernel:@@H
:assignvariableop_10_vq_vae_decoder_conv2d_transpose_1_bias:@V
<assignvariableop_11_vq_vae_decoder_conv2d_transpose_2_kernel: H
:assignvariableop_12_vq_vae_decoder_conv2d_transpose_2_bias:'
assignvariableop_13_iteration:	 +
!assignvariableop_14_learning_rate: Q
7assignvariableop_15_adam_m_vq_vae_encoder_conv2d_kernel: Q
7assignvariableop_16_adam_v_vq_vae_encoder_conv2d_kernel: C
5assignvariableop_17_adam_m_vq_vae_encoder_conv2d_bias: C
5assignvariableop_18_adam_v_vq_vae_encoder_conv2d_bias: S
9assignvariableop_19_adam_m_vq_vae_encoder_conv2d_1_kernel: @S
9assignvariableop_20_adam_v_vq_vae_encoder_conv2d_1_kernel: @E
7assignvariableop_21_adam_m_vq_vae_encoder_conv2d_1_bias:@E
7assignvariableop_22_adam_v_vq_vae_encoder_conv2d_1_bias:@S
9assignvariableop_23_adam_m_vq_vae_encoder_conv2d_2_kernel:@@S
9assignvariableop_24_adam_v_vq_vae_encoder_conv2d_2_kernel:@@E
7assignvariableop_25_adam_m_vq_vae_encoder_conv2d_2_bias:@E
7assignvariableop_26_adam_v_vq_vae_encoder_conv2d_2_bias:@>
+assignvariableop_27_adam_m_embeddings_vqvae:	@�>
+assignvariableop_28_adam_v_embeddings_vqvae:	@�[
Aassignvariableop_29_adam_m_vq_vae_decoder_conv2d_transpose_kernel: @[
Aassignvariableop_30_adam_v_vq_vae_decoder_conv2d_transpose_kernel: @M
?assignvariableop_31_adam_m_vq_vae_decoder_conv2d_transpose_bias: M
?assignvariableop_32_adam_v_vq_vae_decoder_conv2d_transpose_bias: ]
Cassignvariableop_33_adam_m_vq_vae_decoder_conv2d_transpose_1_kernel:@@]
Cassignvariableop_34_adam_v_vq_vae_decoder_conv2d_transpose_1_kernel:@@O
Aassignvariableop_35_adam_m_vq_vae_decoder_conv2d_transpose_1_bias:@O
Aassignvariableop_36_adam_v_vq_vae_decoder_conv2d_transpose_1_bias:@]
Cassignvariableop_37_adam_m_vq_vae_decoder_conv2d_transpose_2_kernel: ]
Cassignvariableop_38_adam_v_vq_vae_decoder_conv2d_transpose_2_kernel: O
Aassignvariableop_39_adam_m_vq_vae_decoder_conv2d_transpose_2_bias:O
Aassignvariableop_40_adam_v_vq_vae_decoder_conv2d_transpose_2_bias:
identity_42��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_33�AssignVariableOp_34�AssignVariableOp_35�AssignVariableOp_36�AssignVariableOp_37�AssignVariableOp_38�AssignVariableOp_39�AssignVariableOp_4�AssignVariableOp_40�AssignVariableOp_5�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:**
dtype0*�
value�B�*B&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/6/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/7/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/8/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/9/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/10/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/11/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/12/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/13/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/14/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/15/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/16/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/17/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/18/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/19/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/20/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/21/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/22/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/23/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/24/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/25/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/_variables/26/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:**
dtype0*g
value^B\*B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�::::::::::::::::::::::::::::::::::::::::::*8
dtypes.
,2*	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOp-assignvariableop_vq_vae_encoder_conv2d_kernelIdentity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOp-assignvariableop_1_vq_vae_encoder_conv2d_biasIdentity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOp1assignvariableop_2_vq_vae_encoder_conv2d_1_kernelIdentity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOp/assignvariableop_3_vq_vae_encoder_conv2d_1_biasIdentity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOp1assignvariableop_4_vq_vae_encoder_conv2d_2_kernelIdentity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOp/assignvariableop_5_vq_vae_encoder_conv2d_2_biasIdentity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp#assignvariableop_6_embeddings_vqvaeIdentity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOp9assignvariableop_7_vq_vae_decoder_conv2d_transpose_kernelIdentity_7:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOp7assignvariableop_8_vq_vae_decoder_conv2d_transpose_biasIdentity_8:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOp;assignvariableop_9_vq_vae_decoder_conv2d_transpose_1_kernelIdentity_9:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_10AssignVariableOp:assignvariableop_10_vq_vae_decoder_conv2d_transpose_1_biasIdentity_10:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOp<assignvariableop_11_vq_vae_decoder_conv2d_transpose_2_kernelIdentity_11:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOp:assignvariableop_12_vq_vae_decoder_conv2d_transpose_2_biasIdentity_12:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_13AssignVariableOpassignvariableop_13_iterationIdentity_13:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_14AssignVariableOp!assignvariableop_14_learning_rateIdentity_14:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOp7assignvariableop_15_adam_m_vq_vae_encoder_conv2d_kernelIdentity_15:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_16AssignVariableOp7assignvariableop_16_adam_v_vq_vae_encoder_conv2d_kernelIdentity_16:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_17AssignVariableOp5assignvariableop_17_adam_m_vq_vae_encoder_conv2d_biasIdentity_17:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_18AssignVariableOp5assignvariableop_18_adam_v_vq_vae_encoder_conv2d_biasIdentity_18:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_19AssignVariableOp9assignvariableop_19_adam_m_vq_vae_encoder_conv2d_1_kernelIdentity_19:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_20AssignVariableOp9assignvariableop_20_adam_v_vq_vae_encoder_conv2d_1_kernelIdentity_20:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_21AssignVariableOp7assignvariableop_21_adam_m_vq_vae_encoder_conv2d_1_biasIdentity_21:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_22AssignVariableOp7assignvariableop_22_adam_v_vq_vae_encoder_conv2d_1_biasIdentity_22:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_23AssignVariableOp9assignvariableop_23_adam_m_vq_vae_encoder_conv2d_2_kernelIdentity_23:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_24AssignVariableOp9assignvariableop_24_adam_v_vq_vae_encoder_conv2d_2_kernelIdentity_24:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_25AssignVariableOp7assignvariableop_25_adam_m_vq_vae_encoder_conv2d_2_biasIdentity_25:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_26AssignVariableOp7assignvariableop_26_adam_v_vq_vae_encoder_conv2d_2_biasIdentity_26:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_27AssignVariableOp+assignvariableop_27_adam_m_embeddings_vqvaeIdentity_27:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_28AssignVariableOp+assignvariableop_28_adam_v_embeddings_vqvaeIdentity_28:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_29AssignVariableOpAassignvariableop_29_adam_m_vq_vae_decoder_conv2d_transpose_kernelIdentity_29:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_30AssignVariableOpAassignvariableop_30_adam_v_vq_vae_decoder_conv2d_transpose_kernelIdentity_30:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_31AssignVariableOp?assignvariableop_31_adam_m_vq_vae_decoder_conv2d_transpose_biasIdentity_31:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_32AssignVariableOp?assignvariableop_32_adam_v_vq_vae_decoder_conv2d_transpose_biasIdentity_32:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_33AssignVariableOpCassignvariableop_33_adam_m_vq_vae_decoder_conv2d_transpose_1_kernelIdentity_33:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_34AssignVariableOpCassignvariableop_34_adam_v_vq_vae_decoder_conv2d_transpose_1_kernelIdentity_34:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_35AssignVariableOpAassignvariableop_35_adam_m_vq_vae_decoder_conv2d_transpose_1_biasIdentity_35:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_36AssignVariableOpAassignvariableop_36_adam_v_vq_vae_decoder_conv2d_transpose_1_biasIdentity_36:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_37AssignVariableOpCassignvariableop_37_adam_m_vq_vae_decoder_conv2d_transpose_2_kernelIdentity_37:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_38AssignVariableOpCassignvariableop_38_adam_v_vq_vae_decoder_conv2d_transpose_2_kernelIdentity_38:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_39AssignVariableOpAassignvariableop_39_adam_m_vq_vae_decoder_conv2d_transpose_2_biasIdentity_39:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_40AssignVariableOpAassignvariableop_40_adam_v_vq_vae_decoder_conv2d_transpose_2_biasIdentity_40:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 �
Identity_41Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_42IdentityIdentity_41:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_42Identity_42:output:0*g
_input_shapesV
T: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
�
C__inference_conv2d_1_layer_call_and_return_conditional_losses_16659

inputs8
conv2d_readvariableop_resource: @-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�Conv2D/ReadVariableOp�@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:���������  @X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:���������  @�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype0�
1vq_vae/encoder/conv2d_1/kernel/Regularizer/L2LossL2LossHvq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp:value:0*
T0*
_output_shapes
: u
0vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *�Q9�
.vq_vae/encoder/conv2d_1/kernel/Regularizer/mulMul9vq_vae/encoder/conv2d_1/kernel/Regularizer/mul/x:output:0:vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss:output:0*
T0*
_output_shapes
: i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:���������  @�
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOpA^vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������   : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp2�
@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp@vq_vae/encoder/conv2d_1/kernel/Regularizer/L2Loss/ReadVariableOp:W S
/
_output_shapes
:���������   
 
_user_specified_nameinputs"�
L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
C
input_18
serving_default_input_1:0���������  D
output_18
StatefulPartitionedCall:0���������  tensorflow/serving/predict:ɷ
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
encoder
	vector_quantizer

decoder
	optimizer
loss

signatures"
_tf_keras_model
~
0
1
2
3
4
5
6
7
8
9
10
11
12"
trackable_list_wrapper
~
0
1
2
3
4
5
6
7
8
9
10
11
12"
trackable_list_wrapper
 "
trackable_list_wrapper
�
non_trainable_variables

layers
metrics
layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
 trace_0
!trace_12�
&__inference_vq_vae_layer_call_fn_15888
&__inference_vq_vae_layer_call_fn_16011�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z trace_0z!trace_1
�
"trace_0
#trace_12�
A__inference_vq_vae_layer_call_and_return_conditional_losses_15796
A__inference_vq_vae_layer_call_and_return_conditional_losses_16167�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z"trace_0z#trace_1
�B�
 __inference__wrapped_model_15195input_1"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�
$	variables
%trainable_variables
&regularization_losses
'	keras_api
(__call__
*)&call_and_return_all_conditional_losses
*
layer_dict
+
latent_dim"
_tf_keras_model
�
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses

embeddings"
_tf_keras_model
�
2	variables
3trainable_variables
4regularization_losses
5	keras_api
6__call__
*7&call_and_return_all_conditional_losses
8
layer_dict
9output_layer"
_tf_keras_model
�
:
_variables
;_iterations
<_learning_rate
=_index_dict
>
_momentums
?_velocities
@_update_step_xla"
experimentalOptimizer
 "
trackable_dict_wrapper
,
Aserving_default"
signature_map
6:4 2vq_vae/encoder/conv2d/kernel
(:& 2vq_vae/encoder/conv2d/bias
8:6 @2vq_vae/encoder/conv2d_1/kernel
*:(@2vq_vae/encoder/conv2d_1/bias
8:6@@2vq_vae/encoder/conv2d_2/kernel
*:(@2vq_vae/encoder/conv2d_2/bias
#:!	@�2embeddings_vqvae
@:> @2&vq_vae/decoder/conv2d_transpose/kernel
2:0 2$vq_vae/decoder/conv2d_transpose/bias
B:@@@2(vq_vae/decoder/conv2d_transpose_1/kernel
4:2@2&vq_vae/decoder/conv2d_transpose_1/bias
B:@ 2(vq_vae/decoder/conv2d_transpose_2/kernel
4:22&vq_vae/decoder/conv2d_transpose_2/bias
 "
trackable_list_wrapper
5
0
	1

2"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
&__inference_vq_vae_layer_call_fn_15888input_1"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
&__inference_vq_vae_layer_call_fn_16011input"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
A__inference_vq_vae_layer_call_and_return_conditional_losses_15796input_1"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
A__inference_vq_vae_layer_call_and_return_conditional_losses_16167input"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
J
0
1
2
3
4
5"
trackable_list_wrapper
J
0
1
2
3
4
5"
trackable_list_wrapper
5
B0
C1
D2"
trackable_list_wrapper
�
Enon_trainable_variables

Flayers
Gmetrics
Hlayer_regularization_losses
Ilayer_metrics
$	variables
%trainable_variables
&regularization_losses
(__call__
*)&call_and_return_all_conditional_losses
&)"call_and_return_conditional_losses"
_generic_user_object
�
Jtrace_0
Ktrace_12�
'__inference_encoder_layer_call_fn_15324
'__inference_encoder_layer_call_fn_16273�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 zJtrace_0zKtrace_1
�
Ltrace_0
Mtrace_12�
B__inference_encoder_layer_call_and_return_conditional_losses_15275
B__inference_encoder_layer_call_and_return_conditional_losses_16310�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 zLtrace_0zMtrace_1
:
Nlayer_1
Olayer_2"
trackable_dict_wrapper
�
P	variables
Qtrainable_variables
Rregularization_losses
S	keras_api
T__call__
*U&call_and_return_all_conditional_losses

kernel
bias
 V_jit_compiled_convolution_op"
_tf_keras_layer
'
0"
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
�
Wnon_trainable_variables

Xlayers
Ymetrics
Zlayer_regularization_losses
[layer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses"
_generic_user_object
�
\trace_0
]trace_12�
0__inference_vector_quantizer_layer_call_fn_15483
0__inference_vector_quantizer_layer_call_fn_16322�
���
FullArgSpec
args�
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z\trace_0z]trace_1
�
^trace_0
_trace_12�
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_15423
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_16373�
���
FullArgSpec
args�
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z^trace_0z_trace_1
J
0
1
2
3
4
5"
trackable_list_wrapper
J
0
1
2
3
4
5"
trackable_list_wrapper
5
`0
a1
b2"
trackable_list_wrapper
�
cnon_trainable_variables

dlayers
emetrics
flayer_regularization_losses
glayer_metrics
2	variables
3trainable_variables
4regularization_losses
6__call__
*7&call_and_return_all_conditional_losses
&7"call_and_return_conditional_losses"
_generic_user_object
�
htrace_0
itrace_12�
'__inference_decoder_layer_call_fn_15719
'__inference_decoder_layer_call_fn_16390�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 zhtrace_0zitrace_1
�
jtrace_0
ktrace_12�
B__inference_decoder_layer_call_and_return_conditional_losses_15670
B__inference_decoder_layer_call_and_return_conditional_losses_16466�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 zjtrace_0zktrace_1
:
llayer_1
mlayer_2"
trackable_dict_wrapper
�
n	variables
otrainable_variables
pregularization_losses
q	keras_api
r__call__
*s&call_and_return_all_conditional_losses

kernel
bias
 t_jit_compiled_convolution_op"
_tf_keras_layer
�
;0
u1
v2
w3
x4
y5
z6
{7
|8
}9
~10
11
�12
�13
�14
�15
�16
�17
�18
�19
�20
�21
�22
�23
�24
�25
�26"
trackable_list_wrapper
:	 2	iteration
: 2learning_rate
 "
trackable_dict_wrapper
�
u0
w1
y2
{3
}4
5
�6
�7
�8
�9
�10
�11
�12"
trackable_list_wrapper
�
v0
x1
z2
|3
~4
�5
�6
�7
�8
�9
�10
�11
�12"
trackable_list_wrapper
�
�trace_0
�trace_1
�trace_2
�trace_3
�trace_4
�trace_5
�trace_6
�trace_7
�trace_8
�trace_9
�trace_10
�trace_11
�trace_122�
"__inference__update_step_xla_16196
"__inference__update_step_xla_16201
"__inference__update_step_xla_16206
"__inference__update_step_xla_16211
"__inference__update_step_xla_16216
"__inference__update_step_xla_16221
"__inference__update_step_xla_16226
"__inference__update_step_xla_16231
"__inference__update_step_xla_16236
"__inference__update_step_xla_16241
"__inference__update_step_xla_16246
"__inference__update_step_xla_16251
"__inference__update_step_xla_16256�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0z�trace_0z�trace_1z�trace_2z�trace_3z�trace_4z�trace_5z�trace_6z�trace_7z�trace_8z�trace_9z�trace_10z�trace_11z�trace_12
�B�
#__inference_signature_wrapper_15979input_1"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�
�trace_02�
__inference_loss_fn_0_16479�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� z�trace_0
�
�trace_02�
__inference_loss_fn_1_16488�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� z�trace_0
�
�trace_02�
__inference_loss_fn_2_16497�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� z�trace_0
 "
trackable_list_wrapper
5
N0
O1
+2"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
'__inference_encoder_layer_call_fn_15324input_1"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
'__inference_encoder_layer_call_fn_16273input"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
B__inference_encoder_layer_call_and_return_conditional_losses_15275input_1"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
B__inference_encoder_layer_call_and_return_conditional_losses_16310input"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses

kernel
bias
!�_jit_compiled_convolution_op"
_tf_keras_layer
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses

kernel
bias
!�_jit_compiled_convolution_op"
_tf_keras_layer
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
'
D0"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
P	variables
Qtrainable_variables
Rregularization_losses
T__call__
*U&call_and_return_all_conditional_losses
&U"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
(__inference_conv2d_2_layer_call_fn_16514�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
C__inference_conv2d_2_layer_call_and_return_conditional_losses_16529�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_vector_quantizer_layer_call_fn_15483input_1"�
���
FullArgSpec
args�
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
0__inference_vector_quantizer_layer_call_fn_16322x"�
���
FullArgSpec
args�
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_15423input_1"�
���
FullArgSpec
args�
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_16373x"�
���
FullArgSpec
args�
jx
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�
�trace_02�
__inference_loss_fn_3_16538�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� z�trace_0
�
�trace_02�
__inference_loss_fn_4_16547�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� z�trace_0
�
�trace_02�
__inference_loss_fn_5_16556�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� z�trace_0
 "
trackable_list_wrapper
5
l0
m1
92"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
'__inference_decoder_layer_call_fn_15719input_1"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
'__inference_decoder_layer_call_fn_16390input"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
B__inference_decoder_layer_call_and_return_conditional_losses_15670input_1"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
B__inference_decoder_layer_call_and_return_conditional_losses_16466input"�
���
FullArgSpec
args�	
jinput
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses

kernel
bias
!�_jit_compiled_convolution_op"
_tf_keras_layer
�
�	variables
�trainable_variables
�regularization_losses
�	keras_api
�__call__
+�&call_and_return_all_conditional_losses

kernel
bias
!�_jit_compiled_convolution_op"
_tf_keras_layer
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
'
b0"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
n	variables
otrainable_variables
pregularization_losses
r__call__
*s&call_and_return_all_conditional_losses
&s"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_conv2d_transpose_2_layer_call_fn_16573�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_16611�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
;:9 2#Adam/m/vq_vae/encoder/conv2d/kernel
;:9 2#Adam/v/vq_vae/encoder/conv2d/kernel
-:+ 2!Adam/m/vq_vae/encoder/conv2d/bias
-:+ 2!Adam/v/vq_vae/encoder/conv2d/bias
=:; @2%Adam/m/vq_vae/encoder/conv2d_1/kernel
=:; @2%Adam/v/vq_vae/encoder/conv2d_1/kernel
/:-@2#Adam/m/vq_vae/encoder/conv2d_1/bias
/:-@2#Adam/v/vq_vae/encoder/conv2d_1/bias
=:;@@2%Adam/m/vq_vae/encoder/conv2d_2/kernel
=:;@@2%Adam/v/vq_vae/encoder/conv2d_2/kernel
/:-@2#Adam/m/vq_vae/encoder/conv2d_2/bias
/:-@2#Adam/v/vq_vae/encoder/conv2d_2/bias
(:&	@�2Adam/m/embeddings_vqvae
(:&	@�2Adam/v/embeddings_vqvae
E:C @2-Adam/m/vq_vae/decoder/conv2d_transpose/kernel
E:C @2-Adam/v/vq_vae/decoder/conv2d_transpose/kernel
7:5 2+Adam/m/vq_vae/decoder/conv2d_transpose/bias
7:5 2+Adam/v/vq_vae/decoder/conv2d_transpose/bias
G:E@@2/Adam/m/vq_vae/decoder/conv2d_transpose_1/kernel
G:E@@2/Adam/v/vq_vae/decoder/conv2d_transpose_1/kernel
9:7@2-Adam/m/vq_vae/decoder/conv2d_transpose_1/bias
9:7@2-Adam/v/vq_vae/decoder/conv2d_transpose_1/bias
G:E 2/Adam/m/vq_vae/decoder/conv2d_transpose_2/kernel
G:E 2/Adam/v/vq_vae/decoder/conv2d_transpose_2/kernel
9:72-Adam/m/vq_vae/decoder/conv2d_transpose_2/bias
9:72-Adam/v/vq_vae/decoder/conv2d_transpose_2/bias
�B�
"__inference__update_step_xla_16196gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16201gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16206gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16211gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16216gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16221gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16226gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16231gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16236gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16241gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16246gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16251gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
"__inference__update_step_xla_16256gradientvariable"�
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
__inference_loss_fn_0_16479"�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�B�
__inference_loss_fn_1_16488"�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�B�
__inference_loss_fn_2_16497"�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
'
B0"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
&__inference_conv2d_layer_call_fn_16620�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
A__inference_conv2d_layer_call_and_return_conditional_losses_16635�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
'
C0"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
(__inference_conv2d_1_layer_call_fn_16644�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
C__inference_conv2d_1_layer_call_and_return_conditional_losses_16659�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
D0"
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
(__inference_conv2d_2_layer_call_fn_16514inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
C__inference_conv2d_2_layer_call_and_return_conditional_losses_16529inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
__inference_loss_fn_3_16538"�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�B�
__inference_loss_fn_4_16547"�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�B�
__inference_loss_fn_5_16556"�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
'
`0"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
0__inference_conv2d_transpose_layer_call_fn_16668�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_16706�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
'
a0"
trackable_list_wrapper
�
�non_trainable_variables
�layers
�metrics
 �layer_regularization_losses
�layer_metrics
�	variables
�trainable_variables
�regularization_losses
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
�
�trace_02�
2__inference_conv2d_transpose_1_layer_call_fn_16715�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�
�trace_02�
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_16753�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z�trace_0
�2��
���
FullArgSpec
args�
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
b0"
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_conv2d_transpose_2_layer_call_fn_16573inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_16611inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
B0"
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
&__inference_conv2d_layer_call_fn_16620inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
A__inference_conv2d_layer_call_and_return_conditional_losses_16635inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
C0"
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
(__inference_conv2d_1_layer_call_fn_16644inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
C__inference_conv2d_1_layer_call_and_return_conditional_losses_16659inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
`0"
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_conv2d_transpose_layer_call_fn_16668inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_16706inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
a0"
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
2__inference_conv2d_transpose_1_layer_call_fn_16715inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_16753inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 �
"__inference__update_step_xla_16196~x�u
n�k
!�
gradient 
<�9	%�"
� 
�
p
` VariableSpec 
`������
� "
 �
"__inference__update_step_xla_16201f`�]
V�S
�
gradient 
0�-	�
� 
�
p
` VariableSpec 
`������
� "
 �
"__inference__update_step_xla_16206~x�u
n�k
!�
gradient @
<�9	%�"
� @
�
p
` VariableSpec 
`������
� "
 �
"__inference__update_step_xla_16211f`�]
V�S
�
gradient@
0�-	�
�@
�
p
` VariableSpec 
`������
� "
 �
"__inference__update_step_xla_16216~x�u
n�k
!�
gradient@@
<�9	%�"
�@@
�
p
` VariableSpec 
`������
� "
 �
"__inference__update_step_xla_16221f`�]
V�S
�
gradient@
0�-	�
�@
�
p
` VariableSpec 
`������
� "
 �
"__inference__update_step_xla_16226pj�g
`�]
�
gradient	@�
5�2	�
�	@�
�
p
` VariableSpec 
`�����
� "
 �
"__inference__update_step_xla_16231~x�u
n�k
!�
gradient @
<�9	%�"
� @
�
p
` VariableSpec 
`������
� "
 �
"__inference__update_step_xla_16236f`�]
V�S
�
gradient 
0�-	�
� 
�
p
` VariableSpec 
`������
� "
 �
"__inference__update_step_xla_16241~x�u
n�k
!�
gradient@@
<�9	%�"
�@@
�
p
` VariableSpec 
`ఀ���
� "
 �
"__inference__update_step_xla_16246f`�]
V�S
�
gradient@
0�-	�
�@
�
p
` VariableSpec 
`඀���
� "
 �
"__inference__update_step_xla_16251~x�u
n�k
!�
gradient 
<�9	%�"
� 
�
p
` VariableSpec 
`������
� "
 �
"__inference__update_step_xla_16256f`�]
V�S
�
gradient
0�-	�
�
�
p
` VariableSpec 
`������
� "
 �
 __inference__wrapped_model_15195�8�5
.�+
)�&
input_1���������  
� ";�8
6
output_1*�'
output_1���������  �
C__inference_conv2d_1_layer_call_and_return_conditional_losses_16659s7�4
-�*
(�%
inputs���������   
� "4�1
*�'
tensor_0���������  @
� �
(__inference_conv2d_1_layer_call_fn_16644h7�4
-�*
(�%
inputs���������   
� ")�&
unknown���������  @�
C__inference_conv2d_2_layer_call_and_return_conditional_losses_16529s7�4
-�*
(�%
inputs���������  @
� "4�1
*�'
tensor_0���������  @
� �
(__inference_conv2d_2_layer_call_fn_16514h7�4
-�*
(�%
inputs���������  @
� ")�&
unknown���������  @�
A__inference_conv2d_layer_call_and_return_conditional_losses_16635s7�4
-�*
(�%
inputs���������  
� "4�1
*�'
tensor_0���������   
� �
&__inference_conv2d_layer_call_fn_16620h7�4
-�*
(�%
inputs���������  
� ")�&
unknown���������   �
M__inference_conv2d_transpose_1_layer_call_and_return_conditional_losses_16753�I�F
?�<
:�7
inputs+���������������������������@
� "F�C
<�9
tensor_0+���������������������������@
� �
2__inference_conv2d_transpose_1_layer_call_fn_16715�I�F
?�<
:�7
inputs+���������������������������@
� ";�8
unknown+���������������������������@�
M__inference_conv2d_transpose_2_layer_call_and_return_conditional_losses_16611�I�F
?�<
:�7
inputs+��������������������������� 
� "F�C
<�9
tensor_0+���������������������������
� �
2__inference_conv2d_transpose_2_layer_call_fn_16573�I�F
?�<
:�7
inputs+��������������������������� 
� ";�8
unknown+����������������������������
K__inference_conv2d_transpose_layer_call_and_return_conditional_losses_16706�I�F
?�<
:�7
inputs+���������������������������@
� "F�C
<�9
tensor_0+��������������������������� 
� �
0__inference_conv2d_transpose_layer_call_fn_16668�I�F
?�<
:�7
inputs+���������������������������@
� ";�8
unknown+��������������������������� �
B__inference_decoder_layer_call_and_return_conditional_losses_15670x8�5
.�+
)�&
input_1���������  @
� "4�1
*�'
tensor_0���������  
� �
B__inference_decoder_layer_call_and_return_conditional_losses_16466v6�3
,�)
'�$
input���������  @
� "4�1
*�'
tensor_0���������  
� �
'__inference_decoder_layer_call_fn_15719m8�5
.�+
)�&
input_1���������  @
� ")�&
unknown���������  �
'__inference_decoder_layer_call_fn_16390k6�3
,�)
'�$
input���������  @
� ")�&
unknown���������  �
B__inference_encoder_layer_call_and_return_conditional_losses_15275x8�5
.�+
)�&
input_1���������  
� "4�1
*�'
tensor_0���������  @
� �
B__inference_encoder_layer_call_and_return_conditional_losses_16310v6�3
,�)
'�$
input���������  
� "4�1
*�'
tensor_0���������  @
� �
'__inference_encoder_layer_call_fn_15324m8�5
.�+
)�&
input_1���������  
� ")�&
unknown���������  @�
'__inference_encoder_layer_call_fn_16273k6�3
,�)
'�$
input���������  
� ")�&
unknown���������  @C
__inference_loss_fn_0_16479$�

� 
� "�
unknown C
__inference_loss_fn_1_16488$�

� 
� "�
unknown C
__inference_loss_fn_2_16497$�

� 
� "�
unknown C
__inference_loss_fn_3_16538$�

� 
� "�
unknown C
__inference_loss_fn_4_16547$�

� 
� "�
unknown C
__inference_loss_fn_5_16556$�

� 
� "�
unknown �
#__inference_signature_wrapper_15979�C�@
� 
9�6
4
input_1)�&
input_1���������  ";�8
6
output_1*�'
output_1���������  �
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_15423�8�5
.�+
)�&
input_1���������  @
� "I�F
*�'
tensor_0���������  @
�
�

tensor_1_0 �
K__inference_vector_quantizer_layer_call_and_return_conditional_losses_16373�2�/
(�%
#� 
x���������  @
� "I�F
*�'
tensor_0���������  @
�
�

tensor_1_0 �
0__inference_vector_quantizer_layer_call_fn_15483h8�5
.�+
)�&
input_1���������  @
� ")�&
unknown���������  @�
0__inference_vector_quantizer_layer_call_fn_16322b2�/
(�%
#� 
x���������  @
� ")�&
unknown���������  @�
A__inference_vq_vae_layer_call_and_return_conditional_losses_15796�8�5
.�+
)�&
input_1���������  
� "I�F
*�'
tensor_0���������  
�
�

tensor_1_0 �
A__inference_vq_vae_layer_call_and_return_conditional_losses_16167�6�3
,�)
'�$
input���������  
� "I�F
*�'
tensor_0���������  
�
�

tensor_1_0 �
&__inference_vq_vae_layer_call_fn_15888t8�5
.�+
)�&
input_1���������  
� ")�&
unknown���������  �
&__inference_vq_vae_layer_call_fn_16011r6�3
,�)
'�$
input���������  
� ")�&
unknown���������  