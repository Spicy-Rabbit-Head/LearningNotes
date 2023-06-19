[TOC]

------

# StringBuilder 可变字符串序列类概述

```apl
一个可变的字符序列
非线程安全,速度快
每个字符串构建器都有容量。 只要字符串生成器中包含的字符序列的长度不超过容量，就不必分配新的内部缓冲区。 如果内部缓冲区溢出，它会自动变大
```

# 可变字符串序列构造

```java
public class Main {
    public static void main(String[] args) {
        // 构造一个字符缓冲区,初始容量为16字符
        StringBuilder str1 = new StringBuilder();
        // 构造字符缓冲区定义初始容量
        StringBuilder str2 = new StringBuilder(32);
        // 构造字符缓冲区,添加字符,初始容量为16加添加字符长度
        StringBuilder str3 = new StringBuilder("abc");
        // 构造字符缓冲区,添加字符缓冲区,初始容量为16加添加字符缓冲区容量
        StringBuilder str4 = new StringBuilder(str3);
    }
}
```

# 可变字符串序列方法

### compareTo - 比较序列

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123");
        StringBuilder str2 = new StringBuilder("123");
        StringBuilder str3 = new StringBuilder("142");
        StringBuilder str4 = new StringBuilder("100");
        // 比较字符序列,相同返回0,小于返回负数,大于返回正整数
        System.out.println(str1.compareTo(str2));
        System.out.println(str1.compareTo(str3));
        System.out.println(str1.compareTo(str4));
    }
}
```

### append - 添加各种数据

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("1");
        System.out.println(str1);
        // 添加字符串对象
        String str2 = "2";
        str1.append(str2);
        System.out.println(str1);
        // 添加 StringBuilder 对象
        StringBuilder str3 = new StringBuilder("3");
        str1.append(str3);
        System.out.println(str1);
        // 添加字符数组
        char[] str4 = {'4', '5'};
        str1.append(str4);
        System.out.println(str1);
        // 添加字符数组限制范围
        char[] str5 = {'1', '3', '6', '7'};
        // (输入字符数组,开始索引,添加数量)
        str1.append(str5, 2, 1);
        System.out.println(str1);
        // 添加bool值
        str1.append(true);
        System.out.println(str1);
        // 添加字符
        str1.append('7');
        System.out.println(str1);
        // 添加整数
        str1.append(8);
        System.out.println(str1);
        // 添加长整数
        str1.append(9101112L);
        System.out.println(str1);
        // 添加浮点数
        str1.append(13.45F);
        System.out.println(str1);
        // 添加双精度浮点数
        str1.append(14.56);
        System.out.println(str1);
    }
}
```

### delete - 删除序列指定索引之间的值

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("12345");
        System.out.println(str1);
        // 删除此序列的子字符串中的字符
        // (开始索引(包含),结束索引(不包含))
        str1.delete(2, 3);
        System.out.println(str1);
    }
}
```

### deleteCharAt - 删除指定索引的值

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("12345");
        System.out.println(str1);
        // 按此顺序删除指定位置的char
        str1.deleteCharAt(2);
        System.out.println(str1);
    }
}
```

### replace - 替换指定索引之间的值

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("12345");
        System.out.println(str1);
        // 使用指定 String 替换序列指定字符
        str1.replace(2, 3, "X");
        System.out.println(str1);
    }
}
```

### insert - 插入指定数据类型值

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("12345");
        System.out.println(str1);
        // 指定索引插入 char 数组
        char[] c = {'X', 'W', 'Q'};
        // (插入位置,char数组,插入char开始索引,插入char数量)
        str1.insert(2, c, 1, 1);
        System.out.println(str1);
        // 插入字符串
        // (偏移量,字符串)
        str1.insert(3, "Q");
        System.out.println(str1);
        // 插入 char 数组
        // (偏移量,char 数组)
        str1.insert(4, c);
        System.out.println(str1);
        // 插入 bool 值
        // (偏移量,布尔类型)
        str1.insert(7, true);
        System.out.println(str1);
        // 插入 char
        // (偏移量,char)
        str1.insert(11, 'A');
        System.out.println(str1);
        // 插入 int
        // (偏移量,int)
        str1.insert(12, 66);
        System.out.println(str1);
        // 插入 long
        // (偏移量,long)
        str1.insert(14, 9999L);
        System.out.println(str1);
        // 插入 float
        // (偏移量,float)
        str1.insert(18, 12.5F);
        System.out.println(str1);
        // 插入 double
        // (偏移量,double)
        str1.insert(22, 14.2);
        System.out.println(str1);
    }
}
```

### indexOf - 搜索字符串首次出现的索引

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("12345345");
        // 搜索字符串首次出现的索引
        System.out.println(str1.indexOf("3"));
        // 搜索字符串在指定索引范围首次出现的索引
        System.out.println(str1.indexOf("3", 3));
    }
}
```

### lastIndexOf - 搜索字符串最后出现的索引

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("12345345");
        // 搜索字符串最后出现的索引
        System.out.println(str1.lastIndexOf("3"));
        // 搜索字符串在指定索引范围最后出现的索引
        System.out.println(str1.lastIndexOf("3", 3));
    }
}
```

### reverse - 翻转字符串序列

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123456");
        // 翻转字符串序列
        System.out.println(str1.reverse());
    }
}
```

### length - 返回字符串序列长度

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123456");
        // 返回字符串序列长度
        System.out.println(str1.length());
    }
}
```

### capacity - 返回字符串序列容量

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123456");
        // 返回字符串序列容量
        System.out.println(str1.capacity());
    }
}
```

### ensureCapacity - 设置字符串序列的最小容量

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder();
        System.out.println(str1.capacity());
        // 设置字符串序列的最小容量
        // 序列容量小于给定值,新容量为旧容量 x 2 + 2
        str1.ensureCapacity(22);
        System.out.println(str1.capacity());
    }
}
```

### trimToSize - 降低字符串序列的容量

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123");
        System.out.println(str1.capacity());
        // 降低字符串序列的容量
        str1.trimToSize();
        // 将数量降至内容物大小
        System.out.println(str1.capacity());
    }
}
```

### setLength - 设定序列长度

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123");
        System.out.println(str1.length());
        System.out.println(str1);
        // 设定序列长度
        str1.setLength(20);
        // 空字符为 "\u0000" 占位
        System.out.println(str1);
    }
}
```

### charAt - 取索引处字符

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123");
        // 取索引处字符
        System.out.println(str1.charAt(1));
    }
}
```

### codePointAt - 取索引处字符 ASCII 值

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123");
        // 取索引处字符 ASCII 值
        System.out.println(str1.codePointAt(1));
    }
}
```

### codePointBefore - 取索引处前一字符 ASCII 值

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123");
        // 取索引处前一字符 ASCII 值
        System.out.println(str1.codePointBefore(1));
    }
}
```

### offsetByCodePoints - 返回输入索引的指定偏移值索引

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123");
        // 返回输入索引的指定偏移值索引
        System.out.println(str1.offsetByCodePoints(1, 1));
    }
}
```

### getChars - 复制指定字符到字符数组

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123");
        char[] c = new char[3];
        // (开始位置, 停止位置, 输出数组, 输出数组开始位置)
        str1.getChars(0, 3, c, 0);
        System.out.println(c);
    }
}
```

### setCharAt - 修改指定索引处值

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("123");
        // (修改的字符索引,新字符)
        str1.setCharAt(1, 'A');
        System.out.println(str1);
    }
}
```

### substring - 返回指定索引之间为字符串

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str1 = new StringBuilder("1234567");
        // 返回指定索引的后面为字符串
        System.out.println(str1.substring(2));
        // 返回指定索引之间字符为字符串
        System.out.println(str1.substring(1, 3));
    }
}
```

### getClass - 返回此对象运行时类

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str = new StringBuilder("abc");
        // 返回此对象运行时类
        System.out.println(str.getClass());
    }
}
```

### equals - 判断对象是否等于自己

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str = new StringBuilder("abc");
        // 判断对象是否等于自己
        System.out.println(str.equals(str));
    }
}
```

### hashCode - 返回对象的哈希码值

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str = new StringBuilder("abc");
        // 返回对象的哈希码值
        System.out.println(str.hashCode());
    }
}
```

### subSequence - 返回截取

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str = new StringBuilder("abc");
        // 返回截取
        System.out.println(str.subSequence(1, 2));
    }
}
```

### toString - 返回字符串

```java
public class Main {
    public static void main(String[] args) {
        StringBuilder str = new StringBuilder("abc");
        // 返回字符串
        System.out.println(str.toString());
    }
}
```





