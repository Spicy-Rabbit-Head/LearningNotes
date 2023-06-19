[TOC]

# Date 基础时间类概述

```apl
表示特定的时刻精度为毫秒
它允许将日期解释为年，月，日，小时，分钟和秒值。 它还允许格式化和解析日期字符串
API不适合国际化
```

# Date 构造

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        // 创建并初始化到系统当前时间
        Date date = new Date();
        System.out.println(date);
        // 创建并指定从标准基准时间以来的毫秒数
        Date date1 = new Date(1000L);
        System.out.println(date1);
        // 创建并初始化为指定指定时间开始
        // Date(年,0-11月,1-31日)
        Date date2 = new Date(10, 3, 3);
        System.out.println(date2);
        // 创建并初始化为指定指定时间开始
        // Date(年,0-11月,1-31日,0-23时,0-59分)
        Date date3 = new Date(10, 3, 3, 3, 33);
        System.out.println(date3);
        // 创建并初始化为指定指定时间开始
        // Date(年,0-11月,1-31日,0-23时,0-59分,0-59秒)
        Date date4 = new Date(10, 3, 3, 3, 33, 33);
        System.out.println(date4);
    }
}
```

# Date 方法

### clone - 返回克隆

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 返回为 Object 类型的克隆
        Object clone = date.clone();
        System.out.println(date);
        System.out.println(clone);
    }
}
```

### getYear - 返回基准时间到现在的年份

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 返回基准时间到现在的年份
        System.out.println(date.getYear());
    }
}
```

### setYear - 设置基准年份加指定时间

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 设置基准年份加指定时间
        date.setYear(10);
        System.out.println(date);
    }
}
```

### getMonth - 返回对象此刻的月份

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 返回对象此刻的月份
        System.out.println(date.getMonth()); // 0-11
    }
}
```

### setMonth - 设置对象此刻的月份

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(date);
        // 设置对象此刻的月份
        date.setMonth(3);
        System.out.println(date);
    }
}
```

### getDate - 返回对象当前天数

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 返回对象当前天数
        System.out.println(date.getDate()); // 1-31
    }
}
```

### setDate - 设置对象当前天数

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(date);
        // 设置对象当前天数
        date.setDate(2);
        System.out.println(date);
    }
}
```

### getDay - 返回对象当前星期数

```java
public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 返回对象当前星期数
        System.out.println(date.getDay());
    }
}
```

### getHours - 返回对象当前小时数

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 返回对象当前小时数
        System.out.println(date.getHours());
    }
}
```

### setHours - 设置对象当前小时数

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(date);
        // 设置对象当前小时数
        date.setHours(12);
        System.out.println(date);
    }
}
```

### setMinutes - 设置对象当前分钟数

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(date);
        // 设置对象当前分钟数
        date.setMinutes(12);
        System.out.println(date);
    }
}
```

### getMinutes - 返回对象当前分钟数

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 返回对象当前分钟数
        System.out.println(date.getMinutes());
    }
}
```

### setSeconds - 设置对象当前秒数

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(date);
        // 设置对象当前秒数
        date.setSeconds(23);
        System.out.println(date);
    }
}
```

### getTime - 返回基准时间到现在时间的毫秒数

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 返回基准时间到现在时间的毫秒数
        System.out.println(date.getTime());
    }
}
```

### setTime - 设置基准时间到指定毫秒数时间

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        System.out.println(date);
        // 设置基准时间到指定毫秒数时间
        date.setTime(1000);
        System.out.println(date);
    }
}
```

### before - 判断时间是否在指定时间前

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        Date date1 = new Date(0);
        // 判断时间是否在指定时间前
        System.out.println(date1.before(date));
    }
}
```

### after - 判断时间是否在指定时间后

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        Date date1 = new Date(0);
        // 判断时间是否在指定时间后
        System.out.println(date.after(date1));
    }
}
```

### hashCode - 返回对象哈希值

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 返回对象哈希值
        System.out.println(date.hashCode());
    }
}
```

### toString - 返回对象字符串格式

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 返回对象字符串格式
        System.out.println(date.toString());
    }
}
```

### toInstant - 将对象装换为 Instant 对象

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 将对象装换为 Instant 对象
        System.out.println(date.toInstant());
    }
}
```

### getClass - 返回调用类

```java
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Date date = new Date();
        // 返回调用类
        System.out.println(date.getClass());
    }
}
```

