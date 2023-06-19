[TOC]

------

# String 类概述

```apl
String 类代表字符串。Java 程序中的所有字符串字面值（如 "abc" ）都作为此类的实例实现。
字符串是常量
String 类包括的方法可用于检查序列的单个字符、比较字符串、搜索字符串、提取子字符串、创建字符串副本并将所有字符全部转换为大写或小写
```

# 字符串构造

```java
public class Main {
    public static void main(String[] args) {
        // 赋值构造
        String str1 = "Hello";
        System.out.println(str1);
        // 无参构造
        String str2 = new String();
        System.out.println("- " + str2 + " -");
        // 传入构造
        String str3 = new String("World");
        System.out.println(str3);
        // 字符数组构造
        char[] chs = {'a', 'b', 'c', 'd'};
        String str4 = new String(chs);
        System.out.println(str4);
        // 字符数组构造指定
        // (原数组,初始偏移值,长度)
        String str5 = new String(chs, 1, 2);
        System.out.println(str5);
        // int数组构造
        int[] arr = {104, 105, 99, 100};
        // (原数组,初始偏移值,长度)
        String str6 = new String(arr, 1, 2);
        System.out.println(str6);
        // 字节数组构造
        byte[] byt = {97, 98, 99, 100};
        // (原数组,初始偏移值,长度)
        String str7 = new String(byt, 1, 2);
        System.out.println(str7);
    }
}
```

# 字符串方法

### length - 字符串长度

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "Hello";
        // 字符串长度
        System.out.println(str1.length());
    }
}
```

### isEmpty - 字符串长度判断

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "Hello";
        // 字符串是否为空
        System.out.println(str1.isEmpty());
    }
}
```

### charAt - 字符串取字符

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "Hello";
        // 取索引位置字符
        System.out.println(str1.charAt(2));
    }
}
```

### codePointAt - 取索引位置字符 ASCII 值

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "Hello";
        // 取索引位置字符 ASCII 表值
        System.out.println(str1.codePointAt(2));
    }
}
```

### codePointBefore - 取索引位置前一个字符的 ASCII 值

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDE";
        // 取索引位置前一个字符的 ASCII 表值
        System.out.println(str1.codePointAt(2));
    }
}
```

### getChars - 指定字符复制到新字符串

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDE";
        char[] chars = new char[str1.length()];
        // 将指定字符复制到新字符串
        // (开始位置,结束位置,输出,起始偏移量)
        str1.getChars(1, 3, chars, 0);
        for (char x : chars) {
            System.out.println(x);
            // 输出为 char 字符
        }
    }
}
```

### getBytes - 获得字符串 byte 数组

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDE";
        // 返回字符串 byte 数组
        byte[] bytes = str1.getBytes();
        for (byte x : bytes) {
            System.out.println(x);
            // 输出为 ASCII 表值
        }
    }
}
```

### equals - 比较字符串 

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDE"; // 串区构建
        String str2 = "ABCDE";
        String str3 = new String("ABCDE"); // 堆区构建
        // 比较字符串 
        System.out.println(str1.equals(str2)); // 返回bool
        System.out.println(str1.equals(str3));
    }
}
```

### contentEquals - 比较线程安全的可变字符序列

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDE";
        StringBuffer str2 = new StringBuffer("ABCDE");
        // 比较线程安全的可变字符序列
        System.out.println(str1.contentEquals(str2)); // 返回bool
    }
}
```

### equalsIgnoreCase - 比较字符串(不考虑大小写)

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDE";
        String str2 = "abcde";
        // 比较字符串(不考虑大小写)
        System.out.println(str1.equalsIgnoreCase(str2)); // 返回bool
    }
}
```

### compareTo - 按字典顺序比较字符串(返回int)

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDE";
        String str2 = "ABCDE";
        // 按字典顺序比较字符串(返回int)
        int i = str1.compareTo(str2);
        System.out.println(i);
    }
}
```

### compareToIgnoreCase - 按字典顺序比较字符串(不考虑大小写)

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDE";
        String str2 = "abcde";
        // 按字典顺序比较字符串(不考虑大小写)
        int i = str1.compareToIgnoreCase(str2);
        System.out.println(i);
    }
}
```

### regionMatches - 字符串指定区域是否相等

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        String str2 = "D";
        // 字符串指定区域是否相等
        // (起始偏移量,比较字符串,比较字符串起始偏移量,比较的字符数)
        boolean b = str1.regionMatches(3, str2, 0, 1);
        System.out.println(b);
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        String str2 = "d";
        // 字符串指定区域是否相等
        // (不区分大小写标识,起始偏移量,比较字符串,比较字符串起始偏移量,比较的字符数)
        boolean b = str1.regionMatches(true, 3, str2, 0, 1);
        System.out.println(b);
    }
}
```

### startsWith - 是否为指定前缀

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        String str2 = "A";
        String str3 = "C";
        // 是否为指定前缀
        // (前缀,查找开始位置)
        boolean b1 = str1.startsWith(str2, 0);
        boolean b2 = str1.startsWith(str3, 2);
        System.out.println(b1);
        System.out.println(b2);
        
        // (前缀)
        b1 = str1.startsWith(str2);
        b2 = str1.startsWith(str3);
        System.out.println(b1);
        System.out.println(b2);
    }
}
```

### endsWith - 是否为指定后缀

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        String str2 = "F";
        String str3 = "G";
        // 是否为指定后缀
        // (后缀)
        boolean b1 = str1.endsWith(str2);
        boolean b2 = str1.endsWith(str3);
        System.out.println(b1);
        System.out.println(b2);
    }
}
```

### hashCode - 获取哈希值

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        // 获取哈希值
        System.out.println(str1.hashCode());
    }
}
```

### indexOf - 获取指定字符的索引

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        // 获取指定字符的第一次出现索引
        // (char 字符)
        System.out.println(str1.indexOf('E'));
        // (char 字符,指定开始位置)
        System.out.println(str1.indexOf('E', 2));
        // (string 字符串)
        System.out.println(str1.indexOf("G"));
        // (string 字符串,指定开始位置)
        System.out.println(str1.indexOf("G", 2));
    }
}
```

### lastIndexOf - 获取指定字符的索引

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "AGBCDEFGE";
        // 获取指定字符的最后一次出现索引
        // (char 字符)
        System.out.println(str1.lastIndexOf('E'));
        // (char 字符,指定开始位置倒叙查找)
        System.out.println(str1.lastIndexOf('E', 6));
        // (string 字符串)
        System.out.println(str1.lastIndexOf("G"));
        // (string 字符串,指定开始位置倒叙查找)
        System.out.println(str1.lastIndexOf("G", 6));
    }
}
```

### substring - 截取为新字符串

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        // 返回新字符串
        // (指定开始索引(包括))
        String str2 = str1.substring(4);
        System.out.println(str2);
        // (指定开始索引(包括),结束索引(不包括))
        String str3 = str1.substring(2, 6);
        System.out.println(str3);
    }
}
```

### concat - 拼接字符串

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        String str2 = "1234567";
        // 拼接字符串
        System.out.println(str1.concat(str2));
    }
}
```

### replace - 字符替换

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        // 字符替换
        // (被替换字符,替换字符)
        System.out.println(str1.replace('B', '2'));
    }
}
```

### matches - 返回正则表达式状态

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        // 返回正则表达式状态
        System.out.println(str1.matches("(.*)D(.*)"));
        System.out.println(str1.matches("(.*)V(.*)"));
    }
}
```

### contains - 返回是否有指定字符

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        // 返回是否有指定字符
        System.out.println(str1.contains("B"));
        System.out.println(str1.contains("V"));
    }
}
```

### replace - 匹配的区域替换首字符串

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEFG";
        // 匹配的区域替换字符
        System.out.println(str1.replace("B", "@"));
    }
}
```

### replaceAll - 匹配的区域替换全部字符串

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEBG";
        // 匹配的区域替换全部字符串
        System.out.println(str1.replaceAll("B", "@"));
    }
}
```

### join - 标志字符串拼接

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEBG";
        // 标志字符串拼接
        System.out.println(String.join("-", str1, "1", "2", "3"));
    }
}
```

### toLowerCase - 字符串转小写

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "ABCDEBG";
        // 字符串转小写
        System.out.println(str1.toLowerCase());
    }
}
```

### trim - 删除字符串头尾空白符

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "  abcdefg  ";
        // 删除字符串头尾空白符
        System.out.println(str1.trim());
    }
}
```

### toString - 返回字符串本身

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "  abcdefg  ";
        // 返回字符串本身
        System.out.println(str1.toString());
    }
}
```

### toCharArray - 将字符串转换为字符数组

```java
public class Main {
    public static void main(String[] args) {
        String str1 = "abcdefg";
        // 将字符串转换为字符数组
        char[] c = str1.toCharArray();
        for (int x : c) {
            System.out.println(x);
        }
    }
}
```

### valueOf - 返回指定类型的字符串

```java
public class Main {
    public static void main(String[] args) {
        boolean G1 = true;
        char[] G2 = {'1', 135, 'v'};
        double G3 = 3.1415926;
        float G4 = 45.012F;
        int G5 = 54411;
        long G6 = 9999999L;
        // 返回指定类型的字符串
        System.out.println(String.valueOf(G1));
        System.out.println(String.valueOf(G2));
        System.out.println(String.valueOf(G3));
        System.out.println(String.valueOf(G4));
        System.out.println(String.valueOf(G5));
        System.out.println(String.valueOf(G6));
    }
}
```

### repeat - 重复字符串

```java
public class Main {
    public static void main(String[] args) {
        String str = "2333";
        // 重复N次
        System.out.println(str.repeat(3));
    }
}
```

### getClass - 返回此对象运行时类

```JAVA
public class Main {
    public static void main(String[] args) {
        String str = "233";
        // 返回此对象运行时类
        System.out.println(str.getClass());
    }
}
```





