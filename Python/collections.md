# collections

## collections.Counter

+ 遍历字符串返回一个字典，字典内容为字符串元素个数

```py
from collections import Counter
a = '🍇🍇🍇🍈🍈🍇🍇🍇🏧🏧🍇🍇🏧🍇🍇🍇🍇🍇🍇🍇🍈🍈🏧🏧🍈🍈🍇🍇🍈🍈🍈🍈🏧🏧🏧🏧🏧🍇🏧🏧🍈🍈🍈🏧🏧'
print(Counter(a))
```

## collections.namedtuple

+ 创建自定义tuple对象，并规定tuple元素的个数，可对元素命名

```py
from collections import namedtuple

a = namedtuple('wo',['x','y'])
# 定义对象名称，对象元素名称
p = a(1,2)
# 定义元祖传入值
print(p.x)
print(p.y)
p = a(x=3,y=4)
# 修改值
print(p.x)
print(p.y)
```

## collections.defaultdict

+ 使用dict时，如果引用的Key不存在，返回一个默认值

```py
from collections import defaultdict

a = defaultdict(lambda :'N/A')
# 设定返回默认值
a['key1'] = 'abc'
# 设定Key值	
print(a['key1'])
print(a['key2'])
```

## collections.deque

+ 双向列表

```py
from collections import deque

a = deque([1,2,3])
# 定义双向列表
print(a)

a.append(4)
# 向列表尾部添加元素
print(a)

b = a.pop()
# 从列表尾部取出元素,并返回值
print(b)

a.appendleft(0)
# 向列表头部添加元素
print(a)

b = a.popleft()
# 从列表头部取出元素,并返回值
print(b)

a.extend([4,5])
# 扩展列表右侧
print(a)

a.extendleft([-1,0])
# 扩展列表左侧
print(a)

print(a.index(4))
# 查找下标

a.remove(4)
# 移除第一个xxx
print(a)

a.reverse()
# 将列表逆序
print(a)

a.clear()
# 移除所有元素
print(a)

a = deque([1,2,3],maxlen=10)
# 设定列表上限长度

print(a.maxlen)
# 查询列表长度

b = a.count(2)
# 查询列表中等于x的个数
print(b)

b = a.copy()
# 负责x给x
print(b)

a.insert(2,4)
# 在x位置添加值
print(a)

a.rotate(1)
# 向右循环n位，负数则向左
print(a)

a = list(a)
print(a)
```

## collections.OrderedDict

+ 有序的字典，使得指定有顺序

```py
from collections import OrderedDict

a = [('1','a'),('2','b'),('3','c')]
# 元素定义
a1 = OrderedDict(a)
# 有序字典定义
a1['4'] = 'd'
# 添加元素
for i in a1.items():
    print(i)
# 遍历字典元素
```

## collections.ChainMap

+ 将多个dict按顺序串起来的数据结构，索引时第一个dict未找到则寻找下一个dict

```py
from collections import ChainMap

a = {'1':'a','2':'b'}
b = {'3':'c','4':'d'}
c = {'5':'e','6':'f'}
# 创建字典
d = ChainMap(a,b,c)
# 连接字典
print(d['3'])
print(d['5'])
print(d['2'])
# 索引
```









