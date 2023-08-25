# UTC

>协调世界时（Coordinated Universal Time,缩写为UTC）是国际时间标准,用于协调世界各地的时间
>
>UTC 是一种基于原子钟的时间测量,旨在提供高度精确的时间参考

### 闰秒

```apl
闰秒是在UTC中插入的一秒,用于校正地球自转的变化
如果地球自转变慢,将会插入一个正的闰秒
如果地球自转变快,将会插入一个负的闰秒
闰秒的目的是确保UTC与地球日的长度相匹配
```

### **时区和UTC的关系**

```apl
UTC是一种无时区的时间标准
各个时区的本地时间通常通过在UTC时间上添加或减去一定数量的小时和分钟来计算
例如,东部标准时间（EST）是UTC时间加5小时,太平洋标准时间（PST）是UTC时间减8小时
```

### **表示方式**

```apl
UTC的表示方式采用24小时制,不使用AM和PM
UTC时间通常以以下格式表示：YYYY-MM-DDTHH:mm:ss.sssZ,其中YYYY表示年份,MM表示月份,DD表示日期,THH表示小时,mm表示分钟,ss表示秒,sss表示毫秒,Z表示UTC时间
```

# UTC 使用

### PostgreSQL

+ 会话时区

```postgresql
-- 查询当前时区
SHOW TIMEZONE;

-- 查询支持的时区
SELECT *
FROM
    pg_timezone_names;

-- 设置当前会话时区
SET TIMEZONE = 'Asia/Shanghai';

-- 通过UTC格式设置当前会话时区
SET TIMEZONE = 'UTC+8';
```

+ 全局时区

```apl
# 设置全局时区
"...\PostgreSQL\data\postgresql.conf"
# 设置项
log_timezone = 'Asia/Shanghai'
timezone = 'Asia/Shanghai'
```

+ 类型

```postgresql
-- 带时区的时间
SELECT TIME WITH TIME ZONE '20:55:25.1231+08:00';

-- 不带时区的时间
SELECT TIME WITHOUT TIME ZONE '20:55:25.1231';

-- 带时区的时间戳
SELECT TIMESTAMP WITH TIME ZONE '2022-05-16 20:55:25.1231+08:00';

-- 不带时区的时间戳
SELECT TIMESTAMP WITHOUT TIME ZONE '2022-05-16 20:55:25.1231';
```

