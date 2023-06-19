# NumPy

+ 数组的数学函数库
+ array

```python
import numpy as np

a = np.array([1,2,3])
# object	数组或嵌套的数列
# dtype 	数组元素的数据类型，可选
# copy	    对象是否需要复制，可选
# order	    创建数组的样式，C为行方向，F为列方向，A为任意方向（默认）
# subok	    默认返回一个与基类类型一致的数组
# ndmin	    指定生成数组的最小维度

b = np.array([[1,2],[3,4]])
# 多一个维度

c = np.array([1,2,3,4,5],ndmin=2)
# 最小维度

d = np.array([1,2,3],dtype=complex)
# dtype参数

print(a)
print(b)
print(c)
print(d)
```

+ 数据类型

```python
# bool_	布尔型数据类型（True 或者 False）
# int_	默认的整数类型（类似于 C 语言中的 long，int32 或 int64）
# intc	与 C 的 int 类型一样，一般是 int32 或 int 64
# intp	用于索引的整数类型（类似于 C 的 ssize_t，一般情况下仍然是 int32 或 int64）
# int8	字节（-128 to 127）
# int16	整数（-32768 to 32767）
# int32	整数（-2147483648 to 2147483647）
# int64	整数（-9223372036854775808 to 9223372036854775807）
# uint8	无符号整数（0 to 255）
# uint16	无符号整数（0 to 65535）
# uint32	无符号整数（0 to 4294967295）
# uint64	无符号整数（0 to 18446744073709551615）
# float_	float64 类型的简写
# float16	半精度浮点数，包括：1 个符号位，5 个指数位，10 个尾数位
# float32	单精度浮点数，包括：1 个符号位，8 个指数位，23 个尾数位
# float64	双精度浮点数，包括：1 个符号位，11 个指数位，52 个尾数位
# complex_	complex128 类型的简写，即 128 位复数
# complex64	复数，表示双 32 位浮点数（实数部分和虚数部分）
# complex128	复数，表示双 64 位浮点数（实数部分和虚数部分）
```

+ ndim-返回数组的维数

```python
import numpy as np

a = np.arange(24)
b = a.reshape(2,4,3)
print(a.ndim)   # 现在1维
print(b.ndim)   # 现在3维
```

+ shape-返回维度行列

```python
import numpy as np

a = np.array([[1,2,3],[4,5,6]])
print(a.shape)
a.shape = (3,2)
# 调整数组大小
print(a.shape)
```

+ reshape-调整数组大小    

```python
import numpy as np

a = np.array([[1,2,3],[4,5,6]])
print(a.shape)
b = a.reshape(3,2)
# 调整数组大小
print(b)
```

+ itemsize-以字节的形式返回数组中每一个元素的大小

```python
import numpy as np

# 数组的 dtype 为 int8（一个字节）
x = np.array([1, 2, 3, 4, 5], dtype=np.int8)
print(x.itemsize)

# 数组的 dtype 现在为 float64（八个字节）
y = np.array([1, 2, 3, 4, 5], dtype=np.float64)
print(y.itemsize)
```

+ flags-返回 ndarray 对象的内存信息

```python
import numpy as np

x = np.array([1,2,3,4,5])
# C_CONTIGUOUS (C)	数据是在一个单一的C风格的连续段中
# F_CONTIGUOUS (F)	数据是在一个单一的Fortran风格的连续段中
# OWNDATA (O)	    数组拥有它所使用的内存或从另一个对象中借用它
# WRITEABLE (W)	    数据区域可以被写入，将该值设置为 False，则数据为只读
# ALIGNED (A)	    数据和所有元素都适当地对齐到硬件上
# UPDATEIFCOPY (U)	这个数组是其它数组的一个副本，当这个数组被释放时，原数组的内容将被更新
print(x.flags)
```

+ empty-创建指定形状数据类型且未初始化的数组

```python
import numpy as np

x = np.empty([3,2],dtype=int)
# empty(数组形态，数据类型，C/F行优先和列优先)
print(x)
# 如未初始化，数组元素为随机值
```

+ zeros-创建指定大小的数组，数组元素以 0 来填充

```python
import numpy as np

x = np.zeros(5)
# 默认为浮点数
a = np.zeros((5),dtype=np.int32)
b = np.zeros((2,2),dtype=[('x','i4'),('y','i4')])
# zeros(数组形状，数据类型，'C' 用于 C 的行数组，或者 'F' 用于 FORTRAN 的列数组)

print(x)
print(a)
print(b)
```

+ ones-创建指定形状的数组，数组元素以 1 来填充

```python
import numpy as np

x = np.ones(5)
# 默认为浮点数
a = np.ones([2,2],dtype=int)
# ones（数组形状，数据类型，'C' 用于 C 的行数组，或者 'F' 用于 FORTRAN 的列数组）

print(x)
print(a)
```

+ asarray-已有数据转数组

```python
import numpy as np
# asarray(任意输出，数据类型，"C"和"F"两个选项,分别代表，行优先和列优先）
x1 = [1,2,3,4,5]
a = np.asarray(x1)
# 列表转
x2 = (1,2,3,4,5)
b = np.asarray(x2)
# 元组转
x3 = [(1,2,3),(4,5)]
c = np.asarray(x3)
# 列表元组转
x4 = [1,2,3,4,5]
d = np.asarray(x4,dtype=float)

print(a)
print(b)
print(c)
print(d)
```

+ frombuffer-输入参数，以流的形式读入转换

```python
import numpy as np

x = b'Hello World'
a = np.frombuffer(x,dtype='S1')
# frombuffer(任意对象，数据类型，读取数据的数量，读取的起始位置）
print(a)
```

+ fromiter-方法从可迭代对象中建立 ndarray 对象，返回一维数组

```python
import numpy as np

x = range(10)
a = iter(x)

b = np.fromiter(a,dtype=float)
# fromiter(可迭代对象，数据类型，读取的数据数量)
print(b)
```

+ arange-创建数值范围并返回 ndarray 对象

```python
import numpy as np

x = np.arange(5)
# arange(起始值，终止值，步长，返回数据类型)
a = np.arange(5,dtype=float)
# 浮点数
b = np.arange(10,20,2)
# 设置了起始值，终止值，步长
print(x)
print(a)
print(b)
```

+ linspace-用于创建一个一维数组，数组是一个等差数列构成的

```python
import numpy as np

x = np.linspace(1,10,10)
# linspace(序列起始值，序列终止值，要生成的样本数量，是否包含停止值，是否显示间隔，数据类型)
x1 = np.linspace(1,1,10)
# 设置元素全部是1的等差数列
x2 = np.linspace(10,20,5,endpoint=False)
# 将 endpoint 设为 false，不包含终止值
x3 = np.linspace(1,10,10,retstep=True)
# 显示间距
x4 = np.linspace(1,10,10).reshape([10,1])
# 设定为竖列
print(x)
print(x1)
print(x2)
print(x3)
print(x4)
```

+ logspace-用于创建一个于等比数列

```python
import numpy as np
# 默认低数是10
x = np.logspace(1.0,2.0,num=10)
# logspace(起始值（底数**当前），终止值（底数**当前），要生成的等步长的样本数量，是否包含终止值，底数，数据类型)
x1 = np.logspace(1,9,10,base=2)
# 设定对数的底数为2
print(x)
print(x1)
```

+ NumPy-索引1

```python
import numpy as np

a = np.arange(10)
s = slice(2, 7, 2)
# 从索引 2 开始到索引 7 停止，间隔为2
b = a[2:7:2]
# 从索引 2 开始到索引 7 停止，间隔为 2
print(a[s])
print(b)
```

+ NumPy-索引2

```python
import numpy as np

a = np.arange(10)
b = a[5]
# 返回与该索引相对应的单个元素

print(b)
print(a[2:])
# 从该索引开始以后的所有项都将被提取
print(a[2:5])
# 提取两个索引(不包括停止索引)之间的项
```

+ NumPy-索引3(多维数组)

```python
import numpy as np

a = np.array([[1,2,3],[3,4,5],[4,5,6]])
print(a)
print('/')
print(a[1:])
```

+ NumPy-索引4(省略号)

```python
import numpy as np

a = np.array([[1,2,3],[3,4,5],[4,5,6]])
print (a[...,1])   # 第2列元素
print (a[1,...])   # 第2行元素
print('/')
print (a[...,1:])  # 第2列及剩下的所有元素
```

+ 整数数组索引

```python
import numpy as np

x = np.array([[1,  2],  [3,  4],  [5,  6]])
y = x[[0,1,2],  [0,1,0]]
# 获取数组中(0,0)，(1,1)和(2,0)位置处的元素
print (y)
```

+ 布尔索引

```python
import numpy as np

x = np.array([[1,2,3],[4,5,6],[7,8,9],[10,11,12]])
print(x)
print('\n')
print(x[x>5])
```

+ 使用了 ~（取补运算符）来过滤 NaN

```python
import numpy as np

a = np.array([np.nan, 1, 2, np.nan, 3, 4, 5])
print(a[~np.isnan(a)])
# isnan判定是否有空值
```

+ iscomplex-从数组中过滤掉非复数元素

```python
import numpy as np

a = np.array([1, 2 + 6j, 5, 3.5 + 5j])
print(a[np.iscomplex(a)])
# 逐元素过滤非复数
```

+ 传入顺序索引数组

```python
import numpy as np

x = np.arange(32).reshape((8, 4))
# 生成到32，8行4列的自然数
print(x[[4, 2, 1, 7]])
# 输出相应行
```

+ 传入倒序索引数组

```python
import numpy as np

x = np.arange(32).reshape((8, 4))
# 生成到32，8行4列的自然数
print(x[[-4,-2,-1,-7]])
# 输出相应行
```

+ 传入多个索引数组（要使用np.ix_）

```python
import numpy as np 
 
x=np.arange(32).reshape((8,4))
print (x[np.ix_([1,5,7,2],[0,3,1,2])])
# ix_函数就是输入两个数组，产生笛卡尔积的映射关系
```

+ 数组进行数值计算

```python
import numpy as np

a = np.array([1, 2, 3, 4])
b = np.array([10, 20, 30, 40])
c = a * b
q = a + b
print(c)
print(q)
```

+ 广播(Broadcast)-不同形状(shape)的数组进行数值计算的方式

```python
import numpy as np

a = np.array([[0, 0, 0],
              [10, 10, 10],
              [20, 20, 20],
              [30, 30, 30]])
b = np.array([1, 2, 3])
# 进行广播
print(a + b)
```

+ tile()-轴复制

```python
import numpy as np

a = np.array([[0, 0, 0],
              [10, 10, 10],
              [20, 20, 20],
              [30, 30, 30]])
b = np.array([1, 2, 3])
bb = np.tile(b, (4, 1))
# tile(目标，xy)
# 复制 b 的各个维度
print(a + bb)
# 广播的规则:

# 让所有输入数组都向其中形状最长的数组看齐，形状中不足的部分都通过在前面加 1 补齐。
# 输出数组的形状是输入数组形状的各个维度上的最大值。
# 如果输入数组的某个维度和输出数组的对应维度的长度相同或者其长度为 1 时，这个数组能够用来计算，否则出错。
# 当输入数组的某个维度的长度为 1 时，沿着此维度运算时都用此维度上的第一组值。
# 简单理解：对两个数组，分别比较他们的每一个维度（若其中一个数组没有当前维度则忽略），满足：

# 数组拥有相同形状。
# 当前维度的值相等。
# 当前维度的值有一个是 1。
# 若条件不满足，抛出 "ValueError: frames are not aligned" 异常。
```

+ nditer-迭代器可以完成对数组元素的访问

```python
import numpy as np

a = np.arange(6).reshape(2,3)
print(a)
print('\n')
for x in np.nditer(a):
    print(x,end=',')
```

+ nditer-迭代器元素修改

```python
import numpy as np

a = np.arange(6).reshape(2,3)
print(a)
print('\n')
for x in np.nditer(a,op_flags=['readwrite']):
    # op_flags修改元素，readwrite可读取和写入
    x[...]=2*x
print(a)
```

+ nditer-迭代器遍历顺序

```python
# order = 'F'，即是列序优先；
# order = 'C'，即是行序优先；
```

+ nditer-迭代器外部循环

```python
# c_index	    可以跟踪 C 顺序的索引
# f_index	    可以跟踪 Fortran 顺序的索引
# multi_index	每次迭代可以跟踪一种索引类型
# external_loop	给出的值是具有多个值的一维数组，而不是零维数组
import numpy as np

a = np.arange(6).reshape(2,3)
print(a)
print('\n')
for x in np.nditer(a,flags=['external_loop'],order='F'):
    print(x,end=',')
# 迭代器遍历对应于每列，并组合为一维数组
```

+ flatten-返回一份数组拷贝，对拷贝所做的修改不会影响原始数组

```python
import numpy as np

a = np.arange(8).reshape(2, 4)

print(a)
print('\n')

print(a.flatten())
print('\n')

print(a.flatten(order='F'))
# 以 F 风格顺序展开的数组
# order：'C' -- 按行，'F' -- 按列，'A' -- 原顺序，'K' -- 元素在内存中的出现顺序。
```

+ ravel-展平的数组元素，顺序通常是"C风格"，返回的是数组视图

```python
import numpy as np

a = np.arange(8).reshape(2, 4)
print(a)
print('\n')

print(a.ravel())
print('\n')

print(a.ravel(order='F'))
# order：'C' -- 按行，'F' -- 按列，'A' -- 原顺序，'K' -- 元素在内存中的出现顺序。
```

+ transpose-用于对换数组的维度

```python
import numpy as np

a = np.arange(12).reshape(3, 4)
print(a)
print('\n')

print(np.transpose(a))
```
