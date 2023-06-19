# sqlite3

+ 轻量级数据库

+ 创建连接对象

```python
import sqlite3 as sq

com = sq.connect('233.db')
# 创建连接对象和文件
```

+ ## sqlite3游标

可以使用游标对象调用*execute()*方法来执行任何 SQL 查询

```python
com1 = com.cursor()
# 创建游标对象
```



