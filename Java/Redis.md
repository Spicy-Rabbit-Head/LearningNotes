# Redis

------

### 连接测试

```sql
ping
-- 测试服务器是否启动
set name lucy
-- 存储键值对
get name
-- 取键值对
```

# 类型

```apl
String  	字符串
Hash 		哈希表
List 		链表
Set 		无序集合
SortedSet	排序集合
GEO			地理坐标
BitMap		位图
HyperLog	超对数
```

# 命令

### 通用命令

##### KEYS - 查询符合模板的所以键

```sql
KEYS *
-- 查询所以
KEYS *s
-- 查询任意头带指定字符的键
KEYS n???
-- 查询指定符合指定占位符数量的键
```

##### DEL - 删除指定键的值

```sql
DEL is
-- 删除单个
DEL k1 k2 k3
-- 删除多个
```

##### EXISTS - 判断键是否存在

```sql
EXISTS name
-- 判断键是否存在并返回数量
EXISTS list name map
-- 判断多个
```

##### EXPIRE - 设定键有效期

```sql
EXPIRE name 60
-- 给键设定有效期,超时指定删除
```

##### TTL - 查询有效期

```sql
TTL name
-- 查询指定键的剩余有效期
-- -1 为永久存在
-- -2 为已超时清除
```

### String类型命令

```apl
String包含:
string - 普通字符串
int - 整数,可自增自减
float - 浮点,可自增自减
```

##### SET - 添加或修改一个键值对

```sql
SET name 李四
SET age 18
SET height 178.5
-- 添加指定键值对或覆盖
SET list hhh EX 60
TTL list
-- 使用 EX 指定超时秒数
-- 使用 PX 指定超时毫秒数
-- 覆盖添加或刷新超时时间
SET name 小白 NX
SET name1 小白 NX
-- 使用 NX 指定键不存在时添加
-- 存在返回null
SET name 小白 XX
SET name2 小李 XX
-- 使用 XX 指定键存在时添加
-- 不存在返回null
SET name 小白 GET
-- 覆盖值并返回旧值
-- 不存在返回null
```

##### GET - 根据key获取值

```sql
GET name
GET name2
-- 根据键获取值
-- 键不存在返回null
```

##### MSET 批量添加

```sql
MSET k1 v1 k2 v2 k3 v3
-- 批量添加键值对
```

##### MGET - 批量获取 

```sql
MGET k1 k2 k3 k4
-- 批量获取值
-- 不存在返回null
```

##### INCR 整型自增

```sql
INCR age
-- 自增返回当前值
```

##### INCRBY 整型自增并指定步长

```sql
INCRBY age 5
-- 自增指定步长返回当前值
```

##### INCRBYFLOAT 浮点型自增并指定步长

```sql
INCRBYFLOAT h1 0.5
-- 自增指定步长返回当前值
```

##### SETNX 添加键值对-前提键不存在

```sql
SETNX name "小白"
-- 键存在不生效,返回 false
SETNX name1 "小白"
-- 键不存在生效,返回 true
```

##### SETEX 添加键值对-并指定有效期

```sql
SETEX name 60 "小白"
-- 添加或覆盖值并指定超时时间
```

### Hash类型命令

```apl
Hash : 无序字典
格式 : KEY {field : "value",age : 21}
```

##### HSET - 添加

```sql
HSET K1:user:1 name "lucy" age 21
-- 添加多个 field : value
```

##### HGET - 查询单个

```sql
HGET K1:user:1 age
HGET K1:user:1 h
-- 查询单个 field
-- 不存在返回null
```

##### HMGET - 查询多个

```sql
HMGET K1:user:1 name age h
-- 查询多个 field
-- 不存在返回null
```

##### HGETALL - 查询键的所以值

```sql
HGETALL K1:user:1
-- 查询指定键的所有 field : value
-- 不存在返回空
```

##### HKEYS - 查询field

```sql
HKEYS K1:user:1
-- 返回指定键的所有 field
```

##### HVALS - 查询value

```sql
HVALS K1:user:1
-- 返回指定键的所有 value
```

##### HINCRBY - 指定哈希表内field自增

```sql
HINCRBY K1:user:1 age -8
-- 指定键的field自增指定值
```

##### HSETNX - 添加,必须不存在

```sql
HSETNX K1:user:1 name "小白"
-- 指定field不存在添加值
-- 存在返回false 不存在返回true
```

### List类型命令

```apl
双向链表
有序 元素可重复 插入删除快 查询慢
```

##### LPUSH 头插入

```sql
LPUSH users 1 2 3
-- 头插法
-- 返回链表的长度
```

##### RPUSH 尾插入

```sql
RPUSH users 1 2 3
-- 尾插法
-- 返回链表的长度
```

##### LPOP 头取出

```sql
LPOP users 2
-- 头取法
-- 返回指定数量的值并在链表中删除
```

##### RPOP - 尾取出

```sql
RPOP users 2
-- 尾取法
-- 返回指定数量的值并在链表中删除
```

##### LRANGE - 范围查询

```sql
LRANGE users 1 3
-- 指定范围查询
```

##### BLPOP - 阻塞头获取

```sql
BLPOP list 100
-- 阻塞式获取
-- 等待超时前持续获取
```

##### BRPOP - 阻塞尾获取

```sql
BRPOP list 100
-- 阻塞式获取
-- 等待超时前持续获取
```

### Set类型命令

```apl
无序 元素不可重复 查询快 支持交集,并集,差集
```

##### SADD - 添加

```sql
SADD s1 a b c
-- 添加多个值,重复会被忽略
```

##### SREM - 删除

```sql
SREM  s1 a
-- 删除多个值,返回删除的数量
```

##### SISMEMBER - 判断是否存在

```sql
SISMEMBER s1 b
-- 判断是否存在指定值
```

##### SMEMBERS - 返回集合值

```sql
SMEMBERS  s1
-- 返回集合所有值
```

##### SCARD - 集合长度

```sql
SCARD s1
-- 返回集合长度
```

##### SINTER - 集合交集

```sql
SINTER s1 s2
-- 返回指定集合的交集
```

##### SDIFF - 集合差集

```sql
SDIFF s1 s2
-- 返回指定集合差集
```

##### SUNION - 集合并集

```sql
SUNION s1 s2
-- 返回指定集合并集
```

### SortedSet类型命令

```apl
可排序 元素不重复 查询快
```

##### ZADD 添加更新

```sql
ZADD s1 90 jack 87 lucy 46 yom
-- 添加排序集合
ZADD s1 NX 90 jack
-- NX 指定只添加新元素,不更新现用元素
ZADD s1 XX 100 moss
-- XX 指定只更新现用元素,不添加新元素
ZADD s1 LT 89 jack
-- LT 指定新分数低于旧分数,才更新元素,不阻止添加
ZADD s1 GT 89 jack
-- GT 指定新分数高于旧分数,才更新元素,不阻止添加
```

##### ZREM - 删除

```sql
ZREM s1 yom
-- 删除指定值
```

##### ZSCORE - 获取指定排序分数

```sql
ZSCORE s1 jack
-- 返回值
```

##### ZRANK - 获取序列号

```sql
ZRANK s1 jack
-- 返回指定值的序列号
```

##### ZCARD - 集合长度

```sql
ZCARD s1
-- 返回集合长度
```

##### ZCOUNT - 指定返回内元素数

```sql
ZCOUNT s1 0 89
-- 返回指定范围内元素数
```

##### ZINCRBY - 分数自增

```sql
ZINCRBY s1 2 jack
-- 指定值自增指定分数
```

##### ZRANGE - 返回指定数量排序

```sql
ZRANGE s1 0 1
-- 返回指定数的排序值
```

##### ZRANGEBYSCORE - 返回指定返回值

```sql
ZRANGEBYSCORE s1 0 80
-- 返回指定范围类值
```

