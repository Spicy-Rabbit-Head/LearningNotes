# PostgreSQL

## 注释

```postgresql
/* SQL 注释 */
-- 这个是单行注释
/* 这个是多行注释 */
```

## 语言定义

#### DDL - 数据定义语言

> - CREATE DATABASE: 创建数据库
> - ALTER DATABASE: 修改数据库属性
> - DROP DATABASE: 删除数据库
> - CREATE SCHEMA: 创建模式（相当于数据库中的命名空间）
> - DROP SCHEMA: 删除模式
> - CREATE TABLE: 创建表
> - ALTER TABLE: 修改表结构
> - DROP TABLE: 删除表
> - CREATE INDEX: 创建索引
> - DROP INDEX: 删除索引
> - CREATE VIEW: 创建视图
> - DROP VIEW: 删除视图

#### DQL - 数据查询语言

> - SELECT: 从表中检索数据
> - FROM: 指定数据源表
> - WHERE: 设置条件过滤
> - GROUP BY: 对结果进行分组
> - HAVING: 设置分组后的条件过滤
> - ORDER BY: 按指定列对结果进行排序
> - LIMIT: 限制结果返回的记录数
> - OFFSET: 设置结果集的偏移量
> - JOIN: 表连接操作（包括 INNER JOIN、LEFT JOIN、RIGHT JOIN 等）
> - UNION: 将两个或多个查询结果合并为一个结果集（去重）
> - UNION ALL: 将两个或多个查询结果合并为一个结果集（不去重）
> - INTERSECT: 返回两个查询结果集的交集
> - EXCEPT: 返回第一个查询结果集中不包含在第二个查询结果集中的数据

#### DML - 数据操作语言

> - INSERT INTO: 向表中插入数据
> - UPDATE: 更新表中的数据
> - DELETE FROM: 从表中删除数据
> - MERGE INTO: 将 INSERT、UPDATE 和 DELETE 操作合并为一条语句

#### DCL - 数据控制语言

> - GRANT: 授权用户或角色对数据库对象的权限
> - REVOKE: 撤销用户或角色对数据库对象的权限
> - COMMIT: 提交当前事务的修改
> - ROLLBACK: 回滚当前事务的修改

## 数据类型

#### 字符类型

| 类型         | 描述                       |
| :----------- | -------------------------- |
| `CHAR(N)`    | 固定长度的字符串           |
| `VARCHAR(N)` | 具有长度限制的可变长度文本 |
| `TEXT`       | 没有长度限制的可变长度文本 |

```postgresql
CREATE TABLE test
(
    -- 插入是超出的是空白不会报错,会自动截断
    -- 插入是未满的会自动补空白
    char    CHAR(1) ,
    -- 插入是超出的会报错
    -- 插入是未满会自动改变长度
    varchar VARCHAR(10) ,
    -- 无限制字符串
    text    TEXT
);
```

#### 数值类型

+ 整数类型

| 类型       | 存储大小 | 描述   | 范围             |
| ---------- | -------- | ------ | ---------------- |
| `SMALLINT` | 2 字节   | 短整型 | -32,768~32,767   |
| `INTEGER`  | 4 字节   | 整型   | -2,14e7~2,14e7   |
| `BIGINT`   | 8 字节   | 长整型 | -9.22e18~9.22e18 |

+ 任意精度数

> NUMERIC(precision,scale)
>
> + precision 允许存储的数字的总位数,含小数部分的位数
> + scale 小数部分的位数

| 类型      | 存储大小 | 描述         | 范围                                             |
| --------- | -------- | ------------ | ------------------------------------------------ |
| `DECIMAL` | 变量     | 可指定的精度 | 小数点前最多 131072 位数字;小数点后最多 16383 位 |
| `NUMERIC` | 变量     | 可指定的精度 | 小数点前最多 131072 位数字;小数点后最多 16383 位 |

```postgresql
CREATE TABLE test
(
    -- 创建是指定总长度和小数位数
    -- 如下 5位总长度,2位小数位数
    decimal DECIMAL(5 , 2) ,
    -- 还可以插入特殊值
    -- 无穷大 Infinity
    -- 无穷小 -Infinity
    -- 非数   NaN
    numeric NUMERIC(5 , 2)
);
```

+ 串行类型

| 类型          | 描述                    |
| ------------- | ----------------------- |
| `SMALLSERIAL` | 自动递增短整型 SMALLINT |
| `SERIAL`      | 自动递增整型 INTEGER    |
| `BIGSERIAL`   | 自动递增长整型 BIGINT   |

+ 浮点类型

| 类型               | 存储大小 | 描述         | 范围            |
| ------------------ | -------- | ------------ | --------------- |
| `REAL`             | 4 字节   | 单精度浮点数 | 6 位十进制精度  |
| `DOUBLE PRECISION` | 8 字节   | 双精度浮点数 | 15 位十进制精度 |

#### 布尔类型

> 布尔类型 BOOLEAN 只能接受 TRUE FALSE NULL
>
> >以下是接受的别名 不区分大小写
> >
> >TRUE  : 'true' 't' 'yes' 'y' '1'
> >
> >FALSE : 'false' 'f' 'no' 'n' '0'

#### 日期/时间类型

+ 日期类型

| 类型   | 存储大小 | 描述           |
| ------ | -------- | -------------- |
| `DATE` | 4 字节   | 日期（无时间） |

```postgresql
CREATE TABLE test
(
    -- 日期类型
    -- 公元前 4713年到公元 5874897年
    -- 必须保证数据以 yyyy-mm-dd 格式存储
    date           DATE
);
```

+ 时间类型

| 类型                  | 存储大小 | 描述                   |
| --------------------- | -------- | ---------------------- |
| `TIME`                | 8 字节   | 一天中的时间（无日期） |
| `TIME WITH TIME ZONE` | 12 字节  | 一天中的时间（带时区)  |

```postgresql
CREATE TABLE test
(
    -- 时间类型,无时区
    -- 00:00:00 到 24:00:00
    -- 数据以 HH:MI:SS.ssssss 格式存储
    -- 时:分:秒.毫秒
    time           TIME ,
    -- 时间类型,有时区
    -- 00:00:00+1559 到 24:00:00-1559
    time_zone      TIME WITH TIME ZONE
);
```

+ 时间戳类型

| 类型                       | 存储大小 | 描述                 |
| -------------------------- | -------- | -------------------- |
| `TIMESTAMP`                | 8 字节   | 日期和时间（无时区） |
| `TIMESTAMP WITH TIME ZONE` | 8 字节   | 日期和时间（带时区   |

```postgresql
CREATE TABLE test
(
    -- 日期时间类型,无时区
    -- 公元前 4713年到公元 294276年
    -- 数据以 yyyy-mm-dd HH:MI:SS.ssssss 格式存储
    timestamp      TIMESTAMP ,
    -- 日期时间类型,有时区
    -- 公元前 4713年到公元 294276年
    timestamp_zone TIMESTAMP WITH TIME ZONE
);
```

+ 时间间隔类型

| 类型       | 存储大小 | 描述     |
| ---------- | -------- | -------- |
| `INTERVAL` | 16 字节  | 时间间隔 |

#### 货币类型

| 类型    | 存储大小 | 描述     | 范围              |
| ------- | -------- | -------- | ----------------- |
| `MONEY` | 8 字节   | 货币金额 | -9.22e15~+9.22e15 |

#### 二进制数据类型

| 类型    | 存储大小                            | 描述                 |
| ------- | ----------------------------------- | -------------------- |
| `BYTEA` | 1 或 4 个字节加上实际的二进制字符串 | 可变长度二进制字符串 |

#### 枚举类型

+ 声明枚举

```postgresql
CREATE TYPE WEEK AS ENUM (
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
    );
```

+ 使用枚举

```postgresql
CREATE TABLE test
(
    id  INTEGER ,
    -- 插入非枚举值会报错
    -- 枚举排序规则就是枚举声明时的顺序
    day WEEK
);
```

#### JSON类型

+ 创建

```postgresql
CREATE TABLE test
(
    json JSON
);
```

+ 插入

```postgresql
INSERT
INTO
    test
VALUES
    ('{
      "id": 1,
      "name": "张三"
    }'),
    ('{
      "id": 2,
      "name": "李四"
    }');
```

+ JSON操作符

>-> : 获取 JSON 数组的元素或者 JSON 对象中的字段,返回值为 JSON 类型的值
>
>->> : 获取 JSON 数组的元素或者 JSON 对象中的字段,返回值为文本
>
>#> : 获取指定路径的值,返回值为 JSON 类型的值
>
>#>> : 获取指定路径的值,返回值为文本

+ 查询

```postgresql
SELECT
    -- 使用操作符
    -- -> 获取 json 字段的值
    json -> 'id'                 AS id,
    -- ->> 获取 json 字段的值文本
    json ->> 'name'              AS name,
    -- 多级
    json -> 'address' ->> 'city' AS city,
    -- 指定路径的值
    json #>> '{address,street}'   AS street
FROM
    test;
```

#### 几何类型

+ 点

| 类型    | 存储大小 | 描述       | 表示法   |
| ------- | -------- | ---------- | -------- |
| `POINT` | 16 字节  | 平面上的点 | （x，y） |

```postgresql
/* POINT 二维点 */
CREATE TABLE test
(
    -- 基本二维构建块
    point POINT
);

-- 创建点
INSERT
INTO
    test
VALUES
    (POINT(1,2));

-- 创建点
INSERT
INTO
    test
VALUES
    -- x和y为各自坐标
    -- 未浮点数
    ('(0,3)');
```

+ 线

| 类型   | 存储大小 | 描述   | 表示法    |
| ------ | -------- | ------ | --------- |
| `LINE` | 32 字节  | 无限线 | {A，B，C} |

```postgresql
/* LINE 线 */
CREATE TABLE test
(
    -- 无限长的线
    line LINE
);

-- 创建线
INSERT
INTO
    test
VALUES
    (LINE(POINT(1,2),POINT(3,4)));

-- 创建线
INSERT
INTO
    test
VALUES
    -- {A,B,C}式输入
    ('{1,5,1}'),
    -- [(x1,y1),(x2,y2)]式输入
    ('((0,0),(1,1))');
```

+ 线段

| 类型   | 存储大小 | 描述     | 表示法                     |
| ------ | -------- | -------- | -------------------------- |
| `LSEG` | 32 字节  | 有限线段 | （（x1，y1），（x2，y2）） |

```postgresql
/* LINESTRING 线段 */
CREATE TABLE test
(
    -- 有限长的线段
    lseg LSEG
);

-- 创建线段
INSERT
INTO
    test
VALUES
    (LSEG(POINT(1,2),POINT(3,4)));

-- 创建线段
INSERT
INTO
    test
VALUES
    -- [(x1,y1),(x2,y2)]式或
    -- ((x1,y1),(x2,y2))式输入
    ('((0,0),(1,1))');
```

+ 矩形

| 类型  | 存储大小 | 描述   | 表示法                     |
| ----- | -------- | ------ | -------------------------- |
| `BOX` | 32 字节  | 矩形框 | （（x1，y1），（x2，y2）） |

```postgresql
/* BOX 矩形 */
CREATE TABLE test
(
    -- 矩形框
    box BOX
);

-- 创建矩形
INSERT
INTO
    test
VALUES
    (BOX(POINT(1,2),POINT(3,4)));

-- 创建矩形
INSERT
INTO
    test
VALUES
    -- [(x1,y1),(x2,y2)]式
    ('((0,0),(1,1))');
-- 按右上角和左下角的储存顺序
```

+ 路径

| 类型   | 存储大小    | 描述                     | 表示法             |
| ------ | ----------- | ------------------------ | ------------------ |
| `PATH` | 16+16n 字节 | 闭合路径（类似于多边形） | （（x1，y1）,...） |
| `PATH` | 16+16n 字节 | 开放路径                 | [（x1，y1）,...]   |

```postgresql
/* PATH 路径 */
CREATE TABLE test
(
    -- 路径
    path PATH
);

-- 创建路径
INSERT
INTO
    test
VALUES
    -- [(x1,y1),(x2,y2)]式或
    -- ((x1,y1),(x2,y2))式输入
    -- ()表示不封闭,[]表示封闭
    ('((1,2),(3,4))');
```

+ 多边型

| 类型      | 存储大小    | 描述                     | 表示法             |
| --------- | ----------- | ------------------------ | ------------------ |
| `POLYGON` | 40+16n 字节 | 多边形（类似于封闭路径） | （（x1，y1）,...） |

```postgresql
/* POLYGON 多边形 */
CREATE TABLE test
(
    -- 多边形
    polygon POLYGON
);

-- 创建多边形
INSERT
INTO
    test
VALUES
    -- ((x1,y1),(xn,yn))式输入
    ('((1,2),(3,4))');
```

+ 圆

| 类型     | 存储大小 | 描述 | 表示法                        |
| -------- | -------- | ---- | ----------------------------- |
| `CIRCLE` | 24 字节  | 圈   | <（x，y），r>（中心点和半径） |

```postgresql
/* CIRCLE 圆 */
CREATE TABLE test
(
    -- 圆
    circle CIRCLE
);

-- 创建圆
INSERT
INTO
    test
VALUES
    -- <(x,y),r>式或
    -- ((x,y),r)式输入
    ('((1,2),3)');
```

#### 网络地址类型

| 名字       | 存储大小     | 描述                    |
| ---------- | ------------ | ----------------------- |
| `cidr`     | 7 或 19 字节 | IPv4 和 IPv6 网络       |
| `inet`     | 7 或 19 字节 | IPv4 和 IPv6 主机和网络 |
| `macaddr`  | 6 字节       | MAC 地址                |
| `macaddr8` | 8 字节       | MAC 地址（EUI-64 格式） |

```postgresql
/* CIDR 网络地址 */
CREATE TABLE test
(
    -- 网络地址
    cidr     CIDR ,
    -- 网络地址
    inet     INET ,
    -- MAC地址
    macaddr  MACADDR ,
    -- MAC地址(EUI-64)
    macaddr8 MACADDR8
);

-- 创建网络地址
INSERT
INTO
    test
    (cidr , inet , macaddr , macaddr8)
VALUES
    -- x.x.x.x/y式输入
    -- y为网络掩码位数
    ('192.168.1.0/24' , '192.168.1.0/24' , '08:00:2b:01:02:03' , '08:00:2b:01:02:03:04:05');
```

#### 文本检索类型

```postgresql
/* TSVECTOR 文本搜索向量 */
CREATE TABLE test
(
    -- 文本搜索向量
    text TSVECTOR ,
    -- 文本搜索查询
    ts   TSQUERY
);

-- 创建文本搜索向量
INSERT
INTO
    test
    (text , ts)
VALUES
    ('a fat cat sat on a mat and ate a fat rat' , 'rat');

SELECT *
FROM
    test
WHERE
    test.text @@ test.ts;
```

#### UUID类型

> 由一组32位数的16进制数字所构成

```postgresql
/* UUID 通用唯一标识符 */
-- 生成UUID
SELECT gen_random_uuid();

CREATE TABLE test
(
    -- 通用唯一标识符
    uuid UUID DEFAULT gen_random_uuid() PRIMARY KEY
);
```

#### XML 类型

```postgresql
-- 创建XML类型
INSERT
INTO
    test
VALUES
    ('<a>123</a>');

SELECT *
FROM
    test;
```

#### 数组类型

```postgresql
/* ARRAY 数组 */
-- TYPE[]的形式创建
-- 创建数组
SELECT ARRAY [1,2,3];
-- 创建数组
SELECT '{1,2,3}'::INT[];
CREATE TABLE test
(
    -- 数组
    intArr INT[]
);
INSERT
INTO
    test
VALUES
    ('{1,2,3}');
-- 数组索引
SELECT
    intArr[1]
FROM
    test;
-- 数组搜索
SELECT
    intArr
FROM
    test
WHERE
    1 = ANY (intArr);
-- 数组修改
UPDATE
    test
SET
    intArr[2] = 4
RETURNING *;
```













## 数据库创建

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

## 数据库删除

```postgresql
/* 删除数据库 */
DROP DATABASE test;

/* 删除数据库-可选参数 */
-- 判断数据库是否存在，存在则删除
DROP DATABASE IF EXISTS test;
```

## 数据库修改

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

## 数据表创建

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

## 数据表删除

```postgresql
/* 删除表 */
-- IF EXISTS 判断表是否存在，存在则删除
DROP TABLE IF EXISTS customer;
-- 参数
-- CASCADE —— 删除表的同时删除依赖于该表的其他对象
-- RESTRICT —— 如果其他对象依赖于该表，则不删除该表
```

## 数据表修改

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

## 约束

#### 主键

>- 主键是定义在表上的.
>- 一个表不强制定义主键,但最多只能定义一个主键.
>- 主键可以包含一个列或者多个列.
>- 主键列的值必须是唯一的.
>- 如果主键包含多个列,则这些列的值组合起来必须是唯一的.
>- 主键列中不能包含 `NULL` 值.

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

## 生成列

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

## 标识列

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

## 自增列

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

## 序列生成器

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

## 临时表

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

## 结果集创建表

```postgresql
/* 结果集创建表 */
-- 通过结果集创建表
SELECT * -- 指定复制列   
INTO TEMPORARY -- 是否为临时表 
    customer_test -- 指定表名
FROM
    customer;
```

## 事务

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

## 架构

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

## 清空数据表

```postgresql
-- 清空表
-- TRUNCATE 速度更快
-- 不需要扫描表中,直接回收磁盘空间
TRUNCATE TABLE users CASCADE;
-- ONLY 限制只清空当前表,不清空子表
-- CASCADE 如果外键关联,拒绝操作
```

## 数据操作表实例

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

## 插入数据

```postgresql
/* 插入数据 */
-- 插入单行数据库
INSERT
INTO
    -- 表名（列名）列名可以顺序可交换
    users
    (id , name , age)
VALUES
    -- 值
    (1 , '张三' , 18);
-- 插入多行数据
INSERT
INTO
    users
    (id , name , age)
VALUES
    (2 , '李四' , 20),
    (3 , '王五' , 22);
-- 返回插入的行信息
INSERT
INTO
    users
    (id , name , age)
VALUES
    (4 , '赵六' , 24)
-- RETURNING 返回插入的行信息
-- 可以指定返回的列和别名
RETURNING id;
-- 插入数据处理
INSERT
INTO
    users
    (id , name , age)
VALUES
    (4 , '李七' , 18)
ON CONFLICT (id) -- 指定冲突处理
-- DO NOTHING —— 什么都不做
-- DO UPDATE SET —— 更新数据
    DO UPDATE SET
                  name = EXCLUDED.name,
                  age  = EXCLUDED.age;
```

## 更新数据

```postgresql
/* 更新数据 */
UPDATE users -- 表名
SET
    -- 列名 = 值
    age = 20
WHERE
    -- 条件
    id = 1
-- 返回更新的行信息
RETURNING *;

-- 使用表达式更新数据
UPDATE users
SET
    -- 列名 = 表达式
    age = age + 1
WHERE
    id = 2;

-- 表达式函数
UPDATE orders
SET
    -- 替换全部域名
    email = REPLACE(email,'qq','163')
RETURNING *;

-- CASE 表达式
UPDATE users
SET
    -- CASE 表达式
    age = CASE
        -- WHEN 条件 THEN 值
              WHEN age > 21 THEN age + 1
        -- ELSE 值
              ELSE age - 1
        END;

-- 根据其他表更新数据
UPDATE orders
SET
    email = '5463541256@163.com'
FROM
    -- 其他表
    users
WHERE
      -- 条件
      users.age = 21
  AND orders.id = users.id
RETURNING *;
```

## 删除数据

```postgresql
/* 删除数据 */
DELETE
FROM
    users -- 表名
WHERE
    -- 条件
    -- 没有条件时，删除所有数据
    id = 4;
```

## 单表查询

```postgresql
-- 单表查询
-- 查询所有列
SELECT *
FROM
    users;

-- 查询指定列
SELECT
    name
FROM
    users;

-- 查询表达式
SELECT 5 * 3 AS result;
-- 可通过 AS 指定别名
```

## WHERE 过滤 

```postgresql
/* 过滤 */
SELECT *
FROM
    users
WHERE
    -- 过滤条件
    id > 2;

-- 过滤条件可以使用 AND 和 OR 连接
SELECT *
FROM
    users
WHERE
            id > 1 AND
            id > 5 OR
            name = '张三';

-- 过滤条件可以使用 IN 和 NOT IN 连接
SELECT *
FROM
    users
WHERE
    -- 匹配查询
    name IN ( '张三' , '李四' );
SELECT *
FROM
    users
WHERE
    -- 排除查询
    name NOT IN ('张三');

-- LIKE 模糊查询
-- % 任意字符
-- _ 单个字符
SELECT *
FROM
    users
WHERE
    name LIKE '%三';

-- BETWEEN 区间查询
SELECT *
FROM
    users
WHERE
    id BETWEEN 2 AND 3;
```

## ORDER BY 排序

```postgresql
/* 排序 */
SELECT *
FROM
    users
ORDER BY
    -- 排序列
    -- ASC 升序（默认）
    -- DESC 降序
    id DESC
    -- FIRST NULL 在非 NULL 值之前
    -- LAST NULL 在非 NULL 值之后
    NULLS FIRST;
-- 自定义排序
SELECT *
FROM
    users
ORDER BY
    CASE name
        WHEN '李四' THEN 1
        ELSE 2
        END;
```

## FETCH & LIMIT -- 限定行数

```postgresql
/* 限定行数 */
SELECT *
FROM
    users
    -- NEXT | FIRST 含义相同
    -- NEXT ROWS | ROW 含义相同
    FETCH NEXT 2 ROWS ONLY;
-- LIMIT 非标准语法
SELECT *
FROM
    users
LIMIT 5;
```

## OFFSET - 偏移行数

```postgresql
/* 偏移行数 */
SELECT *
FROM
    users
OFFSET 7;
```

## 组合分页

```postgresql
/* 分页 */
SELECT *
FROM
    users
OFFSET 3 * 2 FETCH FIRST 2 ROWS ONLY;
```

## DISTINCT - 排查重复

```postgresql
/* 排查重复数据 */
SELECT DISTINCT name
FROM
    users
ORDER BY
    name;
```

## 列别名

```postgresql
/* 列别名 */
SELECT
    -- 列名 AS 别名
    name AS user_name
FROM
    users;

-- 列别名表达式
SELECT
    -- 拼接列名和列值
    name || '的年龄是' || age AS user_age
FROM
    users;
```

## 表别名

```postgresql
/* 表别名 */
-- 避免列名冲突
SELECT
    u.id,
    u.age
FROM
    users AS u;
```

## 分组

```postgresql
/* 分组 */
SELECT
    -- 分组列
    name,
    -- 聚合函数
    COUNT(*) AS count
FROM
    users
-- 分组
GROUP BY
    name
-- 排序
ORDER BY
    count DESC;
```

## 分组过滤

```postgresql
/* 过滤分组 */
SELECT
    name,
    COUNT(*) AS count
FROM
    users
GROUP BY
    name
-- 过滤分组
HAVING
    COUNT(*) > 1
ORDER BY
    count DESC;
```

## IN - 包含指定值

```postgresql
/* IN 运算符 */
SELECT *
FROM
    users
WHERE
    -- 匹配查询
    name IN ( '张三' , '李四' );
```

## 子查询

```postgresql
/* 子查询 */
-- 一般用在 IN 和 EXISTS 中
SELECT *
FROM
    users
WHERE
        age IN (
        SELECT
            age
        FROM
            users
        WHERE
            age > 21
               );
```

## EXISTS - 检查子查询是否满足条件

```postgresql
/* EXISTS 检查子查询 */
SELECT *
FROM
    users
WHERE
    -- 子查询返回结果不为空 为真
    EXISTS
    (
        SELECT
            age
        FROM
            users
        WHERE
            age > 21
    );
```

## BETWEEN - 区间运算

```postgresql
/* BETWEEN 区间 */
SELECT *
FROM
    users
WHERE
    id BETWEEN 2 AND 6;
-- NOT BETWEEN 区间
SELECT *
FROM
    users
WHERE
    id NOT BETWEEN 2 AND 6;
```

## LIKE - 匹配运算

```postgresql
/* LIKE 模糊查询 */
SELECT *
FROM
    users
WHERE
    name LIKE '%三';
-- NOT LIKE 模糊查询
SELECT *
FROM
    users
WHERE
    name NOT LIKE '%三';
-- _ 单个字符
SELECT *
FROM
    users
WHERE
    name LIKE '_三';
-- ILIKE 忽略大小写
SELECT *
FROM
    users
WHERE
    name ILIKE '%三';
```

## IS NULL - 检查是否为NULL

```postgresql
/* IS NULL 空值 */
SELECT *
FROM
    users
WHERE
    name IS NULL;
-- IS NOT NULL 非空值
SELECT *
FROM
    users
WHERE
    name IS NOT NULL;
```

## ALL - 比较所有值

```postgresql
/* ALL 比较所有值 */
-- 比较所有值,全部满足才为真
SELECT 2 = ALL (ARRAY [ 1 , 2 , 3 ]) AS result;
-- 比较子查询所有值
SELECT
        18 > ALL (
        SELECT age
        FROM
            users
                 ) AS result;
```

## ANY - 比较所有值(任一满足)

```postgresql
/* ANY 比较任意值(任一满足) */
SELECT 2 = ANY (ARRAY [ 1 , 2 , 3 ]) AS result;
-- 比较子查询任意值
SELECT
        22 > ANY (
        SELECT age
        FROM
            users
                 ) AS result;
```

## GROUPING SETS - 分组集合

```postgresql
/* GROUPING SETS 分组集合 */
SELECT
    age,
    name,
    COUNT(*) AS count
FROM
    users
GROUP BY
    -- 分组集合
    GROUPING SETS (
    -- 分组列
    (age),
    (name), (
    ))
ORDER BY
    count DESC;
```

## ROLLUP - 多维分组集合

```postgresql
/* ROLLUP 多维分组集合 */
SELECT
    name,
    age,
    COUNT(*) AS count
FROM
    users
GROUP BY
    -- 多维分组集合
    ROLLUP (
    name,
    age)
ORDER BY
    name,
    age;
```

## JOIN 连接

+ 连接操作表

```postgresql
CREATE TABLE student (
  -- 学生ID
  student_id INTEGER NOT NULL,
  -- 姓名
  name varchar(45) NOT NULL,
  PRIMARY KEY (student_id)
);

CREATE TABLE student_score (
  -- 学生ID  
  student_id INTEGER NOT NULL,
  -- 科目  
  subject varchar(45) NOT NULL,
  -- 得分
  score INTEGER NOT NULL
);
```

+ 连接数据

```postgresql
INSERT INTO
  student (student_id, name)
VALUES
  (1,'Tim'),(2,'Jim'),(3,'Lucy');

INSERT INTO
  student_score (student_id, subject, score)
VALUES
  (1,'English',90),
  (1,'Math',80),
  (2,'English',85),
  (5,'English',92);
```

#### CROSS 交叉连接

```postgresql
/* JOIN 连接 */
-- CROSS 交叉连接
-- 返回两个集合的笛卡尔积
-- 返回所有可能的组合
SELECT
    student.*,
    student_score.*
FROM
    student
    CROSS JOIN student_score;
```

#### INNER 内连接

```postgresql
-- INNER 内连接
-- 基于连接条件返回组合
SELECT
    student.*,
    student_score.*
FROM
    student
    INNER JOIN student_score
    USING ( student_id );
-- 连接条件相同字段可使用 USING
```

#### NATURAL 自然连接

```postgresql
-- NATURAL 自然连接
-- 特殊的内连接
-- 连接的表所有同名列都将做等值比较
-- 这个连接等价于 INNER JOIN ... USING
SELECT *
FROM
    student
    NATURAL JOIN student_score;
```

#### LEFT 左连接

```postgresql
-- LEFT 左连接
-- 返回左表所有记录和右表匹配记录
SELECT
    student.*,
    student_score.*
FROM
    student
    LEFT JOIN student_score
    USING ( student_id );
```

#### RIGHT 右连接

```postgresql
-- RIGHT 右连接
-- 返回右表所有记录和左表匹配记录
SELECT
    student.*,
    student_score.*
FROM
    student
    RIGHT JOIN student_score
    USING ( student_id );
```

#### FULL 全连接

```postgresql
-- FULL 全连接
-- 返回左连接和右连接的并集
SELECT
    student.*,
    student_score.*
FROM
    student
    FULL JOIN student_score
    USING ( student_id );
```

## UNION 并集

```postgresql
/* UNION 合并查询 */
-- 返回两个集合的并集
SELECT *
FROM
    student
-- UNION ALL 不去重
UNION ALL
SELECT
    score,
    subject
FROM
    student_score;
```

## INTERSECT 交集

```postgresql
/* INTERSECT 交集查询 */
-- 返回两个集合的交集
SELECT generate_series(1, 10)
INTERSECT
SELECT generate_series(5, 15);
```

## EXCEPT 差集

```postgresql
/* EXCEPT 差集查询 */
-- 返回两个集合的差集
SELECT generate_series(1, 10)
EXCEPT
SELECT generate_series(5, 15);
```

## 通用表达式与递归查询

```postgresql
/* 通用表达式与递归查询 */
-- 语言级别的临时表
-- 使用 WITH 定义
WITH
    cte_name AS (
        -- 查询语句
        SELECT
            AVG(age) AS avg_age
        FROM
            users
        ORDER BY
            avg_age DESC
        -- 创建了一个年龄平均值的临时表
    )
-- 使用
SELECT
    u.id,
    u.age,
    c.avg_age,
    u.age > c.avg_age AS result
FROM
    users u,
    cte_name c;
```

+ 递归查询操作表

```postgresql
CREATE TABLE category
(
    id        SERIAL PRIMARY KEY ,
    name      VARCHAR NOT NULL ,
    parent_id INT ,
    CONSTRAINT fk_category
        FOREIGN KEY ( parent_id ) REFERENCES category ( id )
);
INSERT
INTO
    category
    (id , name , parent_id)
VALUES
    (1 , 'ROOT' , NULL),
    (2 , 'Baby' , 1),
    (3 , 'Home And Kitchen' , 1),
    (4 , 'Baby Care' , 2),
    (5 , 'Feeding' , 2),
    (6 , 'Gifts' , 2),
    (7 , 'Safety' , 2),
    (8 , 'Bedding' , 3),
    (9 , 'Bath' , 3),
    (10 , 'Furniture' , 3),
    (11 , 'Grooming' , 4),
    (12 , 'Hair Care' , 4),
    (13 , 'Baby Foods' , 5),
    (14 , 'Food Mills' , 5),
    (15 , 'Solid Feeding' , 5),
    (16 , 'Bed Pillows' , 8),
    (17 , 'Bed Skirts' , 8);
```

+ 递归查询

```postgresql
-- 递归查询
WITH
    RECURSIVE
    -- 递归查询
    cte_categories AS (
        SELECT
            id,
            name,
            parent_id
        FROM
            category
        WHERE
            id = 2
        -- 合并查询结果
        UNION
        SELECT
            c.id,
            c.name,
            c.parent_id
        FROM
            category c,
            cte_categories cs
        WHERE
            c.parent_id = cs.id
    )
SELECT *
FROM
    cte_categories;
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



## 



## DCL - 数据控制语言

