# System 标准输入输出流概述

```apl
无法实例化
包括标准输入，标准输出和错误输出流; 访问外部定义的属性和环境变量; 加载文件和库的方法; 以及用于快速复制阵列的一部分的实用方法
```

# System 成员类

### err - 标准错误输出流

### out - 标准输出流

```apl
io 包 PrintStream 类
```

### in - 标准输入流

```apl
io 包 InputStream 类
```

# System 方法

### console - 返回与当前JAVA虚拟机关联的唯一 Console对象

```java
public class Main {
    public static void main(String[] args) {
        // 返回与当前JAVA虚拟机关联的唯一 Console对象
        System.out.println(System.console());
    }
}
```

### currentTimeMillis - 返回当前时间

```java
public class Main {
    public static void main(String[] args) {
        // 返回当前时间
        System.out.println(System.currentTimeMillis());
    }
}
```

###

```java
```

