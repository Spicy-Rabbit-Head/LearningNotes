# Map 双列集合接口概述

```apl
将键映射到值的对象
不能包含重复的键,每个键最多可以映射一个值
public interface Map<K,V>
```

# 嵌套类

```apl
Map.Entry<K,V>
映射条目（键值对）
```

# 方法摘要

### size - 返回映射键值对的数量

```java
int size()
```

### isEmpty - 是否不包含键值对

```java
boolean isEmpty()
```

### containsKey - 是否包含指定键

```java
boolean containsKey(Object key)
// 包含返回true    
// key - 要测试其在此地图中的存在的密钥
```

### containsValue - 是否包含指定值

```java
boolean containsValue(Object value)
// 如果此映射将一个或多个键映射到指定值，则返回true 
// value - 要测试其在此映射中的存在的值    
```

### get - 返回指定键的值

```java
V get(Object key)
// 如果此映射不包含键的映射，则返回null     
// key - 要返回其关联值的键
```

### put - 添加键和值

```java
V put(K key, V value)
// 不存在则添加,存在则覆盖
// key - 与指定值关联的键
// value - 与指定键关联的值
```

### remove - 删除键和值

```java
V remove(Object key)
// key - 要从地图中删除其映射的键
```

### putAll - 将指定映射添加

```java
void putAll(Map<? extends K,? extends V> m)
// m - 要存储在此映射中的映射
```

### clear - 清空映射

```java
void clear()
```

### keySet - 返回映射中键的集合

```java
Set<K> keySet()
```

### values - 返回映射中值的集合

```java
Collection<V> values()
```

### entrySet - 返回映射的Set集合

```java
Set<Map.Entry<K,V>> entrySet()
```

### equals - 指定对象和映射比较

```java
boolean equals(Object o)
// o - 要与此映射进行相等性比较的对象
```

### hashCode - 返回映射的哈希值

```java
int hashCode()
```

### getOrDefault - 返回指定键映射到的值

```java
default V getOrDefault(Object key, V defaultValue)
// key - 要返回其关联值的键
// defaultValue - 密钥的默认映射
```

### forEach - 对映射每个条目执行给定操作

```java
default void forEach(BiConsumer<? super K,? super V> action)
// action - 要为每个条目执行的操作
```

### replaceAll - 将每个条目的值替换调用函数的结果

```java
default void replaceAll(BiFunction<? super K,? super V,? extends V> function)
// function - 适用于每个条目的功能
```

### putIfAbsent - 指定键是否未与值相连

```java
default V putIfAbsent(K key, V value)
// null其与给定值关联并返回 null ，否则返回当前值
// key - 与指定值关联的键
// value - 与指定键关联的值
```

### remove - 指定键是指定值时删除该条目

```java
default boolean remove(Object key, Object value)
// key - 与指定值关联的键
// value - 期望与指定密钥关联的值
```

### replace - 当前映射到指定值时替换指定键的条目

```java
default boolean replace(K key, V oldValue, V newValue)
default V replace(K key, V value)
// key - 与指定值关联的键
// oldValue - 期望与指定密钥关联的值
// newValue - 要与指定键关联的值
// value - 要与指定键关联的值
```

### computeIfAbsent - 指定键未与值关联则赋值

```java
default V computeIfAbsent(K key, Function<? super K,? extends V> mappingFunction)
// key - 与指定值关联的键
// mappingFunction - 用于计算值的映射函数
/*
如果指定的键尚未与值关联（或映射到null ），则尝试使用给定的映射函数计算其值并将其输入此映射，除非null 。
如果映射函数返回null ，则不记录映射。 如果映射函数本身抛出（未经检查的）异常，则重新抛出异常，并且不记录映射。 最常见的用法是构造一个新对象，用作初始映射值或记忆结果
*/
```

### computeIfPresent - 指定键存在计算新映射

```java
default V computeIfPresent(K key, BiFunction<? super K,? super V,? extends V> remappingFunction)
// key - 与指定值关联的键
// remappingFunction - 用于计算值的重映射函数
// 如果指定键的值存在且为非null，则尝试在给定键及其当前映射值的情况下计算新映射。
// 如果重映射函数返回null ，则删除映射。 如果重映射函数本身抛出（未经检查的）异常，则重新抛出异常，并保持当前映射不变。
```

### compute - 计算指定键及其当前映射值的映射

```java
default V compute(K key, BiFunction<? super K,? super V,? extends V> remappingFunction)
// key - 与指定值关联的键
// remappingFunction - 用于计算值的重映射函数
```

### merge - 指定的键尚未与值关联或与null关联则将其与给定的非空值关联

```java
default V merge(K key, V value, BiFunction<? super V,? super V,? extends V> remappingFunction)
// key - 与结果值关联的键
// value - 要与与键关联的现有值合并的非空值，或者，如果没有现有值或与键关联的空值，则与键关联
// remappingFunction - 重新映射函数，用于重新计算值（如果存在）
```

### of - 返回包含X映射的不可修改映射

```java
static <K,V> Map<K,V> of()
// 返回包含零映射的不可修改映射
static <K,V> Map<K,V> of(K k1, V v1)
// 返回包含单个映射的不可修改的映射    
static <K,V> Map<K,V> of(K k1, V v1, K k2, V v2)    
// 返回包含两个映射的不可修改的映射    
static <K,V> Map<K,V> of(K k1, V v1, K k2, V v2, K k3, V v3)    
// 返回包含三个映射的不可修改的映射    
static <K,V> Map<K,V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4)    
// 返回包含四个映射的不可修改的映射    
static <K,V> Map<K,V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5)    
// 返回包含五个映射的不可修改的映射
static <K,V> Map<K,V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5, K k6, V v6)    
// 返回包含六个映射的不可修改的映射    
static <K,V> Map<K,V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5, K k6, V v6, K k7, V v7) // 返回包含七个映射的不可修改的映射    
static <K,V> Map<K,V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5, K k6, V v6, K k7, V v7, K k8, V v8)    
// 返回包含八个映射的不可修改的映射    
static <K,V> Map<K,V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5, K k6, V v6, K k7, V v7, K k8, V v8, K k9, V v9)    
// 返回包含九个映射的不可修改的映射    
static <K,V> Map<K,V> of(K k1, V v1, K k2, V v2, K k3, V v3, K k4, V v4, K k5, V v5, K k6, V v6, K k7, V v7, K k8, V v8, K k9, V v9, K k10, V v10)
// 返回包含十个映射的不可修改的映射   
// k - 映射的密钥
// v - 映射的值 
```

### ofEntries - 返回包含从给定条目中提取的键和值的不可修改的映射

 ```java
 @SafeVarargs static <K,V> Map<K,V> ofEntries(Map.Entry<? extends K,? extends V>... entries)
 // entries - Map.Entry s包含填充地图的键和值 
 ```

### entry - 返回包含给定键和值的不可修改的 Map.Entry

```java
static <K,V> Map.Entry<K,V> entry(K k, V v)
// k - 钥匙
// v - 该值 
```

### copyOf - 返回包含给定Map的条目的 unmodifiable Map

```java
static <K,V> Map<K,V> copyOf(Map<? extends K,? extends V> map)
// K - 这是关键字的 Map
// V - Map的值类型
```





















