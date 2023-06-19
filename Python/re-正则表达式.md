# re-正则表达式

+ re.findall-返回的结果是一个列表，列表中是符合正则要求的字符串

```python
import re

a = '1sg54ewqscs#*^%'
# re.findall('匹配项'，'匹配源')
b = re.findall('ewq',a)
print(b)
```

+ re.search-扫描整个字符串并返回第一个成功的匹配

```python
import re

print(re.search('www','www,aaa,111').span())
# re.search('匹配项','匹配源').span()
                          # 下标
print(re.search('111','aaa,111,www').span())
```

+ re.match-扫描字符串开头并返回

```python
import re

a = '111222wwweeeccc'
b = re.match('111',a)
# re.match('匹配项'，匹配源)
print(b)
# 返回一个匹配对象
print(b.group())
# 返回内容，获取不到则报错
print(b.span())
# 返回匹配结果的位置，左闭右开区间
```

+ re.findall-返回的结果是一个列表，列表中是符合正则要求的字符串

```python
import re

a = "abc123+-*"
b = re.findall('abc',a)
print(b)
```

+ re.sub——查找字符串中所有相匹配的数据进行替换

```python
import re

print(re.sub('php','python','php是世界上最好的语言——php'))
```

+ split——对字符串进行分割，并返回一个列表

```python
# 以xxx号进行分割
import re

a = 'op,java:php-php3;html'
print(re.split(',',a))
print(re.split(',|:|-|;',a))
```

+ 单字符匹配
  .——匹配任意一个字符

```python
# 使用几个点号就代表几个字符
import re

a = '111222wwweeeccc'
b1 = re.match('..',a)
b2 = re.match('ab.',a)
print(b1.group())
# 输出前两位
print(b2)
```

\d——匹配数字

```python
# 一个\d代表一个数字。开头没匹配到，即使字符串其他部分包含需要匹配的内容，.match也会返回none
import re

a = '111www222eeeccc'
b1 = re.match('\d\d',a)
b2 = re.match('\d\d\d\d.',a)
print(b1)
print(b2) 
```

\D——匹配非数字

```python
# 开头没匹配到，即使字符串其他部分包含需要匹配的内容，.match也会返回none
import re

a = '111www222eeeccc'
a1 = '@dsaf3casda'
b1 = re.match('\D',a)
b2 = re.match('\D.',a1)
print(b1)
print(b2)
```

\s——匹配特殊字符，如空白，空格，tab等

```python
import re

a  = ' 111www222eeeccc'
a1 = '  111www222eeeccc'
a2 = '\n111www222eeeccc'
a3 = '111www222eeeccc'
print(re.match('\s',a))
# 匹配空格
print(re.match('\s',a1))
# 匹配Tab
print(re.match('\s',a2))
# 匹配\r换行
print(re.match('\s',a3))
```

\S——匹配非空白

```python
import re

a  = ' 111www222eeeccc'
a1 = '\n111www222eeeccc'
a2 = '111www222eeeccc'
print(re.match('\S',a))
print(re.match('\S',a1))
print(re.match('\S',a2))
```

\w——匹配单词、字符，如大小写字母，数字，_ 下划线

```python
import re

a  = '1d2www222eeeccc'
a1 = 'aA_faf312213dsa'
a2 = '\n111www222eeeccc'
print(re.match('\w',a))
print(re.match('\w\w\w',a1))
print(re.match('\w',a2))
```

\W——匹配非单词字符

```python
import re

a  = '1d2www222eeeccc'
a1 = ' aA_faf312213dsa'
a2 = '\n111www222eeeccc'
print(re.match('\w',a))
print(re.match('\w',a1))
print(re.match('\w',a2))
```

[]——匹配[ ]中列举的字符

```python
import re

a  = '232fdsfadwd'
print(re.match('21[123]',a))
print(re.match('2[123]',a))
```

[^1234]——不匹配xxxx中的任意一个

```python
import re

a  = '231fdsfadwd'
print(re.match('[^123]',a))
print(re.match('2[^12]',a))
```

[a-z1-4]——匹配x-x或者x-x中的字符

```python
import re

a = '231fdsfadwd'
print(re.match('[1-4a-f]',a))
print(re.match('2[a-f]',a))
```

+ 匹配数量表达
  ![image-20220422134102599](C:\Users\11924\AppData\Roaming\Typora\typora-user-images\image-20220422134102599.png)
  *出现0次或无数次

```python
import re

a = ''
print(re.match('..',a))
print(re.match('.*',a))
```

' + '——至少出现一次

```python
import re

a = 'cc2131wdasd123'
a1 = '122dasdasd231'
print(re.match('c+',a))
print(re.match('c+',a1))
```

?——1次或则0次

```python
import re

a = 'cc2131wdasd123'
a1 = '122dasdasd231'
print(re.match('c?',a))
print(re.match('c?',a1))
```

{m}——指定出现m次

```python
import re

a = 't00000021312dasda'
a1 = 't00312sdasda'
print(re.match('t0{3}',a))
print(re.match('t0{3}',a1))
```

{m,}——至少出现m次

```python
import re

a = 't00000021312dasda'
a1 = 't00312sdasda'
print(re.match('t0{3,}',a))
print(re.match('t0{3,}',a1))
```

{m,n}——指定从m-n次的范围

```python
import re

a = 't00000021312dasda'
a1 = 't00312sdasda'
print(re.match('t0{3,5}',a))
print(re.match('t0{3,5}',a1))
```

+ 匹配边界
  ![image-20220422135342760](C:\Users\11924\AppData\Roaming\Typora\typora-user-images\image-20220422135342760.png)
  $——匹配结尾字符

```python
# 定义整个字符串必须以指定字符串结尾
import re

a = 't00000021312dasda'
print(re.match('.*a$',a))
print(re.match('.*b$',a))
```

^——匹配开头字符

```python
# 定义整个字符串必须以指定字符开头
import re

a = 't00000021312dasda'
print(re.match('^t',a))
print(re.match('^a',a))
```

\b——匹配一个单词的边界

```python
# 表示字母数字与非字母数字的边界，非字母数字与字母数字的边界。即下面xx的右边不能有字母和数字
import re

a = 't00.000021312dasda'
a1 = 't00000021312dasda'
print(re.match(r't00\b',a))
print(re.match(r't00\b',a1))
```

\B——匹配非单词边界

```python
import re

a = 't00.000021312dasda'
a1 = 't00000021312dasda'
print(re.match(r't00\B',a))
print(re.match(r't00\B',a1))
```

+ 匹配分组
  |——匹配左右任意一个表达式

```python
# 只要|两边任意一个表达式符合要求就行
import re

a = 't00.000021312dasda'
print(re.match('[a-z]|[1-3]',a))
print(re.match('[1-3]|[3-6]',a))
```
