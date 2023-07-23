# PostgreSQL

## 数据库操作

#### 数据库创建删除

```postgresql
-- 创建数据库
CREATE DATABASE TestData;

-- 删除数据库
DROP DATABASE TestData;
```

## 数据表操作

#### 数据表创建删除

```postgresql
-- 创建表
CREATE TABLE weather -- 指定表名
( -- 指定列名 和 数据类型
    city    varchar(80) ,
    temp_lo int ,
    temp_hi int ,
    prcp    real ,
    date    date
);

-- 删除表
DROP TABLE weather;
```

#### 插入数据

```postgresql
-- 插入数据
INSERT INTO weather -- 指定表名
-- 按照列的顺序插入数据
VALUES ('上海' , 30 , 40 , 0.1 , '2018-01-01');

-- 自定义顺序插入数据
-- 显式指定列名
INSERT INTO weather (date , city , temp_lo , temp_hi , prcp)
VALUES ('2018-01-01' , '上海' , 30 , 40 , 0.1);
```

#### 查询数据

```postgresql
-- 查询数据
SELECT *
FROM weather;

-- 查询数据 指定列
SELECT city,
       temp_lo
FROM weather;

-- 查询数据 列表达式
-- 相应列的值是由表达式计算得到的
SELECT city,
       (temp_hi + temp_lo) / 2 AS temp_avg
-- AS 为列指定别名
FROM weather;

-- 查询数据 WHERE子句
SELECT *
FROM weather
-- WHERE子句指定了一个或多个过滤条件
WHERE city = '上海'
  -- AND 和 OR 用于连接多个过滤条件
  AND prcp > 0.0;

-- 查询数据 排序
SELECT *
FROM weather
-- ORDER BY子句指定了一个或多个列名
ORDER BY temp_lo;

-- 查询数据 删除重复行
SELECT DISTINCT city
FROM weather;
```

#### 表连接

```postgresql
/* 表连接 */
-- 内连接
SELECT *
FROM weather
     JOIN cities ON city = name;
-- JOIN子句指定了连接的表和连接条件

-- 外连接
SELECT *
FROM weather
     LEFT OUTER JOIN cities ON city = name;
-- 外连接中没有匹配的行，将会用NULL填充
```

#### 聚合函数

```postgresql
/* 聚合函数 */
-- 最大值
SELECT MAX(temp_lo)
FROM weather;

-- 子查询并聚合
SELECT city
FROM weather
WHERE temp_lo = (SELECT MAX(temp_lo) FROM weather);

-- 聚合排序
SELECT city, COUNT(*), MAX(temp_lo)
FROM weather
GROUP BY city;

-- 聚合过滤分组
SELECT city, COUNT(*) FILTER ( WHERE temp_lo > 40 ), MAX(temp_lo)
FROM weather
GROUP BY city;
```

#### 数据更新

```postgresql
/* 数据更新 */
-- 按条件更新
UPDATE weather
SET temp_lo = temp_lo - 2
WHERE city = '上海';
```

#### 数据删除

```postgresql
/* 数据删除 */
-- 按条件删除
DELETE
FROM weather
WHERE city = '南京';

-- 删除表中所有数据
DELETE
FROM weather;
```

## 高级操作

#### 视图

>一种虚拟表，其内容由查询定义
>
>用于组合真实表

```postgresql
/* 视图 */
-- 创建视图
CREATE VIEW weatherView AS
SELECT name, temp_lo, temp_hi, prcp, date, location
FROM weather,
     cities
WHERE city = name;

-- 查询视图
SELECT *
FROM weatherView;

-- 删除视图
DROP VIEW weatherView;
```

#### 外键

```postgresql
```

#### 事务

```postgresql
```

#### 窗口函数

```postgresql
```

#### 继承 

```postgresql
/* 继承 */
-- 创建表
CREATE TABLE capital
(
    name       text ,
    population real ,
    elevation  int
);

-- 创建继承表
CREATE TABLE capitals
(
    state text
) INHERITS ( capital );
-- INHERITS子句指定了继承的父表

-- 插入数据
-- 查询父表，可以看到子表的数据
-- 查询子表，只能看到子表的数据
INSERT
INTO capital
VALUES ('武汉' , 1000 , 100);
```

