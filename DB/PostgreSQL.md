# PostgreSQL

## 注释

```postgresql
/* SQL 注释 */
-- 这个是单行注释
/* 这个是多行注释 */
```

## DDL - 数据定义语言

#### 数据库创建

```postgresql
/* 创建数据库 */
CREATE DATABASE test;

/* 创建数据库-可选参数 */
CREATE DATABASE test
    WITH
    -- 指定数据库所有者
    OWNER = postgres
    -- 指定数据库模板
    -- TEMPLATE = template0
    -- 指定数据库编码
    ENCODING = 'UTF8'
    -- 指定数据库区域的快捷方式
    -- LOCALE = 'zh_CN.utf8'
    -- 指定数据库的整理规则
    LC_COLLATE = 'zh_CN.utf8'
    -- 指定数据库的字符分类
    LC_CTYPE = 'zh_CN.utf8'
    -- 将与新数据库关联的表空间
    -- TABLESPACE = pg_default
    -- 是否允许连接到该数据库
    ALLOW_CONNECTIONS = TRUE
    -- 连接数限制 ( -1 表示无限制 )
    CONNECTION LIMIT = -1
    -- 是否为模版数据库
    IS_TEMPLATE = FALSE;
```

#### 数据库删除

```postgresql
/* 删除数据库 */
DROP DATABASE test;

/* 删除数据库-可选参数 */
-- 判断数据库是否存在，存在则删除
DROP DATABASE IF EXISTS test;
```

#### 数据库修改

```postgresql
/* 修改数据库 */
ALTER DATABASE test RENAME TO text;
-- 所有者
ALTER DATABASE test OWNER TO postgres;
-- 连接数限制
ALTER DATABASE test CONNECTION LIMIT 10;
-- 配置
ALTER DATABASE test SET 配置名 TO '配置值';
-- 重置配置
ALTER DATABASE test RESET ALL;
```

#### 数据表创建

```postgresql
/* 创建表 */
CREATE TABLE IF NOT EXISTS customer -- 表名
-- 创建是可通过 IF NOT EXISTS 判断表是否已存在
(
    -- 列名 数据类型 约束
    first_name VARCHAR(30) NOT NULL ,
    last_name  VARCHAR(30) NOT NULL ,
    email      VARCHAR(60) NOT NULL
);

/* 创建表-约束 */
-- PRIMARY_KEY —— 主键约束
-- FOREIGN_KEY —— 外键约束
-- NOT_NULL —— 非空约束
-- UNIQUE —— 唯一约束
-- CHECK —— 检查约束
-- GENERATED_COLUMN —— 生成列约束
-- IDENTIFY_COLUMN —— 标识列约束

/* 创建表-模版创建 */
CREATE TABLE IF NOT EXISTS customer_test
    -- 指定模版表
AS TABLE customer
    -- WITH NO DATA 表示不复制数据
    WITH NO DATA;

/* 创建表-结果集 */
CREATE TABLE IF NOT EXISTS customer_test
    -- 指定结果集
AS
SELECT * -- 指定复制列
FROM
    customer;
```

#### 数据表删除

```postgresql
/* 删除表 */
-- IF EXISTS 判断表是否存在，存在则删除
DROP TABLE IF EXISTS customer;
-- 参数
-- CASCADE —— 删除表的同时删除依赖于该表的其他对象
-- RESTRICT —— 如果其他对象依赖于该表，则不删除该表
```

#### 数据表修改

```postgresql
/* 修改表 */
-- 修改表名
ALTER TABLE customer
    RENAME TO customer_test;
-- 修改表架构
ALTER TABLE customer
    SET SCHEMA postgres.public;
-- 添加列
ALTER TABLE customer
    ADD COLUMN IF NOT EXISTS
        customer_id VARCHAR(10);
-- 修改列类型
ALTER TABLE customer
    ALTER COLUMN customer_id
        -- SET DATA 指定新的排序规则
        SET DATA TYPE VARCHAR(10);
-- 设置非空约束
ALTER TABLE customer
    ALTER COLUMN customer_id
        SET NOT NULL;
-- 删除非空约束
ALTER TABLE customer
    ALTER COLUMN customer_id
        DROP NOT NULL;
-- 添加约束
ALTER TABLE customer
    -- 添加主键约束
    ADD CONSTRAINT customer_pkey
        PRIMARY KEY ( customer_id );
-- 删除约束
ALTER TABLE customer
    -- 删除主键约束
    DROP CONSTRAINT customer_pkey;
```

#### 主键

- 主键是定义在表上的.
- 一个表不强制定义主键,但最多只能定义一个主键.
- 主键可以包含一个列或者多个列.
- 主键列的值必须是唯一的.
- 如果主键包含多个列,则这些列的值组合起来必须是唯一的.
- 主键列中不能包含 `NULL` 值.

```postgresql
/* 主键 */
-- 定义主键
CREATE TABLE users
(
    -- PRIMARY KEY 主键约束
    -- 主键列的值必须是唯一的,且不能为 NULL
    id   INTEGER PRIMARY KEY ,
    name VARCHAR(30)
);
-- 定义主键-多列
CREATE TABLE users
(
    id   INTEGER ,
    name VARCHAR(30) ,
    -- 多列主键
    PRIMARY KEY ( id , name )
);
```

#### 外键

```postgresql
/* 外键 */
-- 外键用来定义两个实体之间的约束关系
-- 创建外键
CREATE TABLE users
(
    id   INTEGER PRIMARY KEY ,
    name VARCHAR(30)
); -- 主表
CREATE TABLE orders
(
    id    INTEGER ,
    email VARCHAR(30) ,
    -- 外键约束名
    CONSTRAINT orders_users_id_fkey
        -- 指定外键列
        FOREIGN KEY ( id )
            -- 外键列
            REFERENCES users ( id )
            -- 删除主表数据时，从表数据也删除
            ON DELETE CASCADE
            -- 更新主表数据时，从表数据也更新
            ON UPDATE CASCADE
    -- 约束策略:
    -- NO ACTION —— 默认值，不做任何操作
    -- RESTRICT —— 拒绝删除或更新主表数据
    -- CASCADE —— 删除或更新主表数据时，从表数据也删除或更新
    -- SET NULL —— 删除或更新主表数据时，从表数据设置为 NULL
    -- SET DEFAULT —— 删除或更新主表数据时，从表数据设置为默认值
);
-- 删除外键
ALTER TABLE orders
    DROP CONSTRAINT orders_users_id_fkey;
```

#### 非空约束

```postgresql
/* 非空约束 */
-- 非空约束用来定义列的值不能为 NULL
-- NULL 不是空串，也不是 0，它表示什么都没有
CREATE TABLE users
(
    id   INTEGER PRIMARY KEY ,
    name VARCHAR(30) NOT NULL
);
```

#### 唯一约束

```postgresql
/* 唯一约束 */
-- 唯一约束用来定义列的值不能重复
-- 唯一约束列可以包含 NULL 值
CREATE TABLE users
(
    id   INTEGER PRIMARY KEY ,
    name VARCHAR(30) UNIQUE -- 唯一约束
);
-- 多列唯一约束
CREATE TABLE users
(
    id    INTEGER PRIMARY KEY ,
    name  VARCHAR(30) ,
    email VARCHAR(30) ,
    -- 唯一约束名
    CONSTRAINT users_name_email_key
        -- 多列唯一约束
        UNIQUE ( name , email )
);
```

#### 生成列

```postgresql
/* 生成列 */
-- 生成列用来定义列的值是通过计算得到的
-- 不能直接写入或更新生成列的值
CREATE TABLE users
(
    id        INTEGER PRIMARY KEY ,
    name      VARCHAR(30) ,
    age       INTEGER ,
    -- 生成列
    full_name INTEGER GENERATED ALWAYS AS (age / 2) STORED -- 存储生成列
);
```

#### 标识列

> 给列自动赋唯一值.
>
> 一个表拥有一个或多个标识列.

```postgresql
/* 标识列 */
-- 标识列用来定义列的值是自动生成的
CREATE TABLE users
(
    -- 标识列
    id   SERIAL GENERATED ALWAYS AS IDENTITY ,
    name VARCHAR(30)
);
```

#### 检查约束

```postgresql
/* 检查约束 */
-- 检查约束用来定义列的值必须满足指定的条件
CREATE TABLE users
(
    id   INTEGER PRIMARY KEY ,
    name VARCHAR(30) ,
    age  INTEGER ,
    -- 检查约束名
    CONSTRAINT users_age_check
        -- 检查条件
        CHECK ( age > 0 AND age < 150 )
    -- 不满足检查约束条件时，会抛出异常
);
```

#### 自增列

|    类型名     | 存储大小 |        取值范围         | 对应的数据类型 |
| :-----------: | :------: | :---------------------: | :------------: |
| `SMALLSERIAL` | 2 bytes  |        1 - 32767        |   `SMALLINT`   |
|   `SERIAL`    | 4 bytes  |     1 - 2147483647      |   `INTEGER`    |
|  `BIGSERIAL`  | 8 bytes  | 1 - 9223372036854775807 |    `BIGINT`    |

```postgresql
/* 自增列 */
-- 自增列用来定义列的值是自动生成的
-- 和标识列不同的是,自增列的值可以手动指定
CREATE TABLE users
(+
    -- 自增列
    id   SERIAL ,
    name VARCHAR(30)
);
```

#### 序列生成器

```postgresql
/* 序列生成器 */
-- 生成一个有序的整数序列
-- TEMPORARY 临时序列
CREATE TEMPORARY
    -- 序列名
    SEQUENCE IF NOT EXISTS users_id_seq
    -- 序列的数据类型
    AS INTEGER
    -- 序列的起始值
    START WITH 1
    -- 序列的最小值
    MINVALUE 1
    -- 序列的最大值
    MAXVALUE 9223372036854775807
    -- 序列的增量
    INCREMENT BY 1
    -- 序列的缓存值
    CACHE 1
    -- 序列的循环方式
    CYCLE;
-- 删除序列
DROP SEQUENCE IF EXISTS users_id_seq;
```

#### 临时表

```postgresql
/* 临时表 */
-- 临时表用来存储临时数据
-- 临时表只在当前会话中存在
CREATE TEMPORARY TABLE users
(
    id   INTEGER PRIMARY KEY ,
    name VARCHAR(30)
);
-- 删除临时表
DROP TABLE IF EXISTS users;
```

#### 结果集创建表

```postgresql
/* 结果集创建表 */
-- 通过结果集创建表
SELECT * -- 指定复制列   
INTO TEMPORARY -- 是否为临时表 
    customer_test -- 指定表名
FROM
    customer;
```

#### 事务

> 事务特性:
>
> - 原子性(Atomicity)： 事务中的操作要么全部执行,要么全部不执行.
> - 一致性(Consistency)： 一个事务必须是数据库从一个一致状态变成另一个一致状态.
> - 隔离性(Isolation)： 多个事务并发执行时,一个事务的执行不应影响其他事务的执行.
> - 持久性(Durability)： 已提交的事务将永久存储在数据库中.

> 开启事务:
>
> - `START TRANSACTION;`
> - `BEGIN TRANSACTION;`
> - `BEGIN WORK;`
> - `BEGIN`;
>
> 提交事务:
>
> - `COMMIT TRANSACTION;`
> - `COMMIT WORK;`
> - `COMMIT;`
>
> 回滚事务:
>
> - `ROLLBACK TRANSACTION;`
> - `ROLLBACK WORK;`
> - `ROLLBACK;`

```postgresql
/* 事务 */
-- 事务用来管理一组 SQL 语句的执行
-- 开启事务
BEGIN;
-- 执行 SQL 语句
INSERT
INTO
    users (name)
VALUES
    ('张三');
-- 提交事务
COMMIT;
-- 回滚事务
ROLLBACK;
```

#### 架构

> 一个数据库下有多个架构,相当于组

```postgresql
/* 架构 */
-- 架构用来组织数据库对象
-- 创建架构
CREATE SCHEMA IF NOT EXISTS test;
-- 在架构中创建表
CREATE TABLE IF NOT EXISTS test.users
(
    id   INTEGER PRIMARY KEY ,
    name VARCHAR(30)
);
-- 删除架构
DROP SCHEMA IF EXISTS test;
-- 重命名架构
ALTER SCHEMA test RENAME TO test1;
```

## DML - 数据操纵语言

```postgresql
/* 表实例 */
CREATE TABLE IF NOT EXISTS users
(
    id   INTEGER PRIMARY KEY ,
    name VARCHAR(30) ,
    age  INTEGER
);
CREATE TABLE IF NOT EXISTS orders
(
    id    INTEGER PRIMARY KEY ,
    email VARCHAR(30) ,
    CONSTRAINT orders_users_id_fkey
        FOREIGN KEY ( id )
            REFERENCES users ( id )
            ON DELETE CASCADE
            ON UPDATE CASCADE
);
```

#### 插入数据

```postgresql
/* 插入数据 */
-- 插入单行数据库
INSERT
INTO
    -- 表名（列名）列名可以顺序可交换
    users (id , name , age)
VALUES
    -- 值
    (1 , '张三' , 18);
-- 插入多行数据
INSERT
INTO
    users (id , name , age)
VALUES
    (2 , '李四' , 20),
    (3 , '王五' , 22);
-- 返回插入的行信息
INSERT
INTO
    users (id , name , age)
VALUES
    (4 , '赵六' , 24)
-- RETURNING 返回插入的行信息
-- 可以指定返回的列和别名
RETURNING id;
-- 插入数据处理
INSERT
INTO
    users (id , name , age)
VALUES
    (4 , '李七' , 18)
ON CONFLICT (id) -- 指定冲突处理
-- DO NOTHING —— 什么都不做
-- DO UPDATE SET —— 更新数据
    DO UPDATE SET
                  name = EXCLUDED.name,
                  age  = EXCLUDED.age;
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



## DQL - 数据查询语言



## DCL - 数据控制语言

