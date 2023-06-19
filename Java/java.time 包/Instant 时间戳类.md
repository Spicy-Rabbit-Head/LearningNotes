# Instant 时间戳类概述

```apl
时间线上的瞬时点
该类在时间线上模拟单个瞬时点
用于在应用程序中记录事件时间戳
瞬间的范围需要存储大于long
```

# Instant 字段

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 时间基准点时刻的常数
        System.out.println(Instant.EPOCH);
        // 支持最小值
        System.out.println(Instant.MIN);
        // 支持最大值
        System.out.println(Instant.MAX);
    }
}
```

# Instant 方法

### now - 从系统时钟获取当前瞬间

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 从系统时钟获取当前瞬间
        Instant now = Instant.now();
        System.out.println(now);
    }
}
```

### ofEpochSecond - 使用数值获得时刻 

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 使用秒数获取时刻
        Instant now = Instant.ofEpochSecond(1L);
        System.out.println(now);
        // 使用秒数和纳秒
        Instant now1 = Instant.ofEpochSecond(1L, 1000000000L);
        System.out.println(now1);
    }
}
```

### ofEpochMilli - 使用毫秒数获取时刻

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 使用毫秒数获取时刻
        Instant now = Instant.ofEpochMilli(1000L);
        System.out.println(now);
    }
}
```

### from

```java
```

### parse - 解析字符获取时刻

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 解析字符获取时刻
        Instant now = Instant.parse("2007-12-03T10:15:30.00Z");
        System.out.println(now);
    }
}
```

### isSupported

```java
```

### range

```java
```

### get

```java
```

### getLong

```java
```

### getEpochSecond - 获得基准时间到当前的秒数

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 获得基准时间到当前的秒数
        Instant now = Instant.now();
        System.out.println(now.getEpochSecond());
    }
}
```

### getNano - 获得当前的纳秒数

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 获得当前的纳秒数
        Instant now = Instant.now();
        System.out.println(now.getNano());
    }
}
```

### with

```java
```

### truncatedTo

```java
```

### plus

```java
```

### plusSeconds - 获得添加指定时间的副本(秒)

### plusMillis - 获得添加指定时间的副本(毫秒)

### plusNanos - 获得添加指定时间的副本(纳秒)

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 获得添加指定时间的副本(秒)
        System.out.println(Instant.now().plusSeconds(28800L));
        // 获得添加指定时间的副本(毫秒)
        System.out.println(Instant.now().plusMillis(28800000L));
        // 获得添加指定时间的副本(纳秒)
        System.out.println(Instant.now().plusNanos(28800000000000L));
    }
}
```

### minus

```java
```

### minusSeconds - 获得减去指定时间的副本(秒)

### minusMillis - 获得减去指定时间的副本(毫秒)

### minusNanos - 获得减去指定时间的副本(纳秒)

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 获得减去指定时间的副本(秒)
        System.out.println(Instant.now().minusSeconds(1000L));
        // 获得减去指定时间的副本(毫秒)
        System.out.println(Instant.now().minusMillis(1000L));
        // 获得减去指定时间的副本(纳秒)
        System.out.println(Instant.now().minusNanos(1000L));
    }
}
```

### query

```java

```

### adjustInto

```java
```

### until

```java
```

### atOffset

```java
```

### atZone - 将现时刻与时区结合

```java
import java.time.Instant;
import java.time.ZoneId;

public class Main {
    public static void main(String[] args) {
        ZoneId zoneId = ZoneId.systemDefault();
        // 将现时刻与时区结合
        System.out.println(Instant.now().atZone(zoneId));
    }
}
```

### toEpochMilli - 获得基准时间到现时刻的毫秒数

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 获得基准时间到现时刻的毫秒数
        System.out.println(Instant.now().toEpochMilli());
    }
}
```

### compareTo - 比较时刻

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 比较时刻
        // 返回相差时间
        System.out.println(Instant.now().compareTo(Instant.now().minusMillis(1L)));
    }
}
```

### isAfter - 判断现时刻是否在指定时刻之后

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 判断现时刻是否在指定时刻之后
        System.out.println(Instant.now().isAfter(Instant.now().minusMillis(1L)));
    }
}
```

### isBefore - 判断现时刻是否在指定时刻之前

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 判断现时刻是否在指定时刻之前
        System.out.println(Instant.now().isBefore(Instant.now().minusMillis(1L)));
    }
}
```

### equals

```java
```

### hashCode - 返回哈希值

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 返回哈希值
        System.out.println(Instant.now().hashCode());
    }
}
```

### toString - 返回此刻时间戳字符串

```java
import java.time.Instant;

public class Main {
    public static void main(String[] args) {
        // 返回此刻时间戳字符串
        System.out.println(Instant.now().toString());
    }
}
```





