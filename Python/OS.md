# os

+ os.access()-对当前的路径检验并返回值

```python
import os

a = os.access('1.jpg',os.F_OK)
b = os.access('1.jpg',os.R_OK)
c = os.access('1.jpg',os.W_OK)
d = os.access('1.jpg',os.X_OK)
# os.access('检测路径',检测项目)
# os.F_OK: 测试path是否存在。
# os.R_OK: 测试path是否可读。
# os.W_OK: 测试path是否可写。
# os.X_OK: 测试path是否可执行。
print(a,b,c,d)
```

+ os.chdir()-改变当前工作目录

```python
import os
a = 'D:/document/python-zha'
print(os.getcwd())
# 查询当前工作目录
os.chdir(a)
# os.chdir(需要的地址)
print(os.getcwd())
```

+ os.chmod()-更改权限，无返回值

```python
import os,stat

os.chmod('1.xlsx',stat.S_IREAD)
# os.chmod('路径文件'，设定权限)
# stat.S_IREAD:  windows下设为只读
# stat.S_IWRITE: windows下取消只读
print(1)
```

+ 改变当前进程的根目录

```python
import os, sys

# 设置根目录为 /tmp
os.chroot("/tmp")
print("修改根目录成功!!")
```

+ os.close()-用于关闭指定的文件描述符 fd

```python
import os

a = os.open('1.txt',os.O_RDWR|os.O_CREAT)
os.write(a,b'hello')
os.close(a)
# os.close(关闭对象)
os.closerange()
# 用于关闭所有文件描述符fd
print('完成')
```

+ os.sep-用于获取当前系统分隔符

```python
import os

a = os.sep
# 获取当前系统分隔符
print(a)
```

+ os.name-用于获取当前系统

```python
import os

a = os.name
# 获取当前系统
print(a)
```

+ os.getcwd()-获得当前工作目录

```python
import os

a = os.getcwd()
# 获取当前工作目录
print(a)
```

+ os.mkdir()-在当前路径下，建立一个子文件夹

```python
import os
os.mkdir('2')
print(1)
```

+ os.rmdir()-删除一个文件夹，不存在时会报错

```python
import os
os.rmdir('1')
print(1)
```

+ os.listdir()-列出某目录下所有的目录和文件

```python
import os
a = os.listdir()
print(a)
```

+ os.rename()-修改路径下文件的名字

```python
import os
os.rename('2.png','2.jgp')
print('完成')
```

+ os.remove()-删除文件

```python
import os
os.remove('2.jgp')
print('完成')
```

# os.path-主要用于获取文件的属性

```
os.path.abspath(path)	            返回绝对路径
os.path.basename(path)	            返回文件名
os.path.commonprefix(list)	        返回list(多个路径)中，所有path共有的最长的路径
os.path.dirname(path)	            返回文件路径
os.path.exists(path)	            路径存在则返回True,路径损坏返回False
os.path.lexists	                    路径存在则返回True,路径损坏也返回True
os.path.expanduser(path)	        把path中包含的"~"和"~user"转换成用户目录
os.path.expandvars(path)	        根据环境变量的值替换path中包含的"$name"和"${name}"
os.path.getatime(path)	            返回最近访问时间（浮点型秒数）
os.path.getmtime(path)	            返回最近文件修改时间
os.path.getctime(path)	            返回文件 path 创建时间
os.path.getsize(path)	            返回文件大小，如果文件不存在就返回错误
os.path.isabs(path)	                判断是否为绝对路径
os.path.isfile(path)	            判断路径是否为文件
os.path.isdir(path)	                判断路径是否为目录
os.path.islink(path)	            判断路径是否为链接
os.path.ismount(path)	            判断路径是否为挂载点
os.path.join(path1[, path2[, ...]])	把目录和文件名合成一个路径
os.path.normcase(path)	            转换path的大小写和斜杠
os.path.normpath(path)	            规范path字符串形式
os.path.realpath(path)	            返回path的真实路径
os.path.relpath(path[, start])	    从start开始计算相对路径
os.path.samefile(path1, path2)	    判断目录或文件是否相同
os.path.sameopenfile(fp1, fp2)	    判断fp1和fp2是否指向同一文件
os.path.samestat(stat1, stat2)  	判断stat tuple stat1和stat2是否指向同一个文件
os.path.split(path)	                把路径分割成 dirname 和 basename，返回一个元组
os.path.splitdrive(path)	        一般用在 windows 下，返回驱动器名和路径组成的元组
os.path.splitext(path)          	分割路径中的文件名与拓展名
os.path.splitunc(path)	            把路径分割为加载点与文件
os.path.walk(path, visit, arg)  	遍历path，进入每个目录都调用visit函数，visit函数必须有3个参数(arg, dirname, names)，dirname表示当前目录的目录名，names代表当前目录下的所有文件名，args则为walk的第三个参数
os.path.supports_unicode_filenames	设置是否支持unicode路径名
```

```python
import os.path as op
import time
print(__file__)
# 当前文件名
print(op.abspath(__file__))
# 当前文件名绝对地址
print(op.dirname(__file__))
# 返回当前文件夹路径
print(op.basename('D:/document/python-机器视觉相关学习/1.txt'))
# 返回文件名
print(op.dirname('D:/document/python-机器视觉相关学习/1.txt'))
# 返回文件路径
print(op.split('D:/document/python-机器视觉相关学习/1.txt'))
# 分割文件名和路径
print(op.join('D:','document','.python-机器视觉相关学习','1.txt'))
# 将目录和文件名合成一个路径

a = 'D:/document/python-机器视觉相关学习/1.txt'
print(op.getatime(a))
# 输出最近访问时间
print(op.getctime(a))
# 输出文件创建时间
print(op.getmtime(a))
# 输出最近修改时间
print(time.gmtime(op.getmtime(a)))
# 以struct_time形式输出最近修改时间
print(op.getsize(a))
# 输出文件大小（字节为单位）
print(op.abspath(a))
# 输出绝对路径
print(op.normpath(a) )
# 规范path字符串形式
```

+ os.open()-用于打开一个文件，并且设置需要的打开选项

```python
import os

a = os.open('1.txt',os.O_RDWR|os.O_CREAT)
# os.O_RDONLY: 以只读的方式打开
# os.O_RDWR :  以读写的方式打开
# os.O_CREAT:  创建并打开一个新文件
os.write(a,b'123456')

os.close(a)
print('1')
```

+ os.write()-用于写入字符串到文件描述符 fd 中. 返回实际写入的字符串长度。

```python
import os

a = os.open('1.txt',os.O_RDWR|os.O_CREAT)
# os.O_RDONLY: 以只读的方式打开
# os.O_RDWR :  以读写的方式打开
# os.O_CREAT:  创建并打开一个新文件
b = os.write(a,b'123456')

os.close(a)
print(b)
```

