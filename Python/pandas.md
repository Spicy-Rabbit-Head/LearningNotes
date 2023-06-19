# pandas

## Series

似表格中的一个列（column），类似于一维数组，可以保存任何数据类型

+ 通过列表创建Series

```python
import pandas as pd

a = pd.Series([1,2,3,4,5])
print(a)
```

+ 通过Numpy数组创建Series

```python
import pandas as pd
import numpy as np

a = np.arange(1,6)
b = pd.Series(a)
print(b)
```

+ 指定索引对象

```python
import pandas as pd
import numpy as np

a = np.arange(1,6)
a1 = ['a','b','c','d','e']
b = pd.Series(a,a1)
print(b)
```

+ 获取Series对象的值—— values

```python
import pandas as pd
import numpy as np

a = np.arange(1,6)
a1 = ['a','b','c','d','e']
b = pd.Series(a,a1)
print(b.values)
```

+ 获取Series对象的索引—— index

```python
import pandas as pd
import numpy as np

a = np.arange(1,6)
a1 = ['a','b','c','d','e']
b = pd.Series(a,a1)
print(b.index)
```

+ 通过字典创建Series

```python
import pandas as pd

a = {'name':'1','name1':2,'name2':'3'}
b = pd.Series(a)
print(b)
```

+ 查找Series中缺失值—— isnull()

```python
import pandas as pd

a = {'name':'1','name1':2,'name2':'3'}
b = pd.Series(a,index=['name','name1','name2','name3'])
print(b.isnull())
# 判断如果为True则为空
```

+ 查找Series中缺失值—— notnull()

```python
import pandas as pd

a = {'name':'1','name1':2,'name2':'3'}
b = pd.Series(a,index=['name','name1','name2','name3'])
print(b.notnull())
# 判断如果为False则为空
```

+ 通过索引获取数据

```python
import pandas as pd

a = {'name':'李宁','name1':2,'name2':'大润发'}
a1 = [1,2,3,4,5,6,7,8]
b = pd.Series(a)
c = pd.Series(a1)
# 通过下标
print(b[2])
# 通过标签名
print(b['name'])
# 选取多个
print(b[[1,2]])
print(b[['name','name2']])
# 切片
print(b[0:2])
print(b['name1':'name2'])   # 标签切片包含末端数据
# 布尔索引
print(c[c > 4])
# 索引和数据的对应关系不被运算结果影响
print(c*2)
# 数据判断
print(c>4)
```

+ Series属性

```python
import pandas as pd

a1 = [1,2,3,4,5,6,7,8]
c = pd.Series(a1)
# 对象名
c.name = 'text'
print(c)
# 索引名
c.index.name = 'FA'
print(c)
```

+ Series输出

```python
import pandas as pd

a1 = [1,2,3,4,5,6,7,8]
c = pd.Series(a1)
# 从头开始输出指定行数
print(c.head(3))
# 从尾开始输出指定行数
print(c.tail(3))
```

## Data Frame

一个表格型的数据结构，它含有一组有序的列，每列可以是不同的值类型（数值、字符串、布尔型值）。DataFrame 既有行索引也有列索引，它可以被看做由 Series 组成的字典（共同用一个索引）。

+ 数组、列表或元组构成的字典创建Data Frame

```python
import pandas as pd
import numpy as np

a = {'a':[1,2,3,4],'b':(5,6,7,8),'c':np.arange(9,13)}
a1 = ['A','B','C','D']
a2 = ['a','b','c','d']
c = pd.DataFrame(a)
print(c)
# index查看行索引
print(c.index)
# columns查看列索引
print(c.columns)
# values查看值
print(c.values)
# 指定行索引
c = pd.DataFrame(a,index=a1)
print(c)
# 指定列索引
c = pd.DataFrame(a,index=a1,columns=a2)
print(c)
```

+ Series构成的字典创建Data Frame

```python
import pandas as pd
import numpy as np

a = {'a':pd.Series(np.arange(5)),'b':pd.Series(np.arange(5,10))}
b = pd.DataFrame(a)
print(b)
```



