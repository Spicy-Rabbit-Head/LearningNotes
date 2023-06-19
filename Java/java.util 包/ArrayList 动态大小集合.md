[TOC]

------

# ArrayList 动态大小集合概述

```apl
实现所有可选列表操作，并允许所有元素
每个ArrayList实例都有一个容量 。 容量是用于存储列表中元素的数组的大小。 它始终至少与列表大小一样大
```

# ArrayList 构造方法

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        // 构造一个初始容量为10的空列表
        ArrayList list = new ArrayList<>();
        // 构建一个指定初始容量的空列表
        ArrayList list1 = new ArrayList<>(20);
        // 创建指定泛型的空列表
        ArrayList<String> list2 = new ArrayList<>();
    }
}
```

# ArrayList 方法

### trimToSize - 调整列表为实际大小

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList list = new ArrayList<>();
        // 将列表实例容量调整调整到实际大小
        list.trimToSize();
    }
}
```

### ensureCapacity - 调整列表最小容量

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList list = new ArrayList<>();
        System.out.println(list.size());
        // 调整列表最小容量
        list.ensureCapacity(20);
    }
}
```

### size - 返回列表中元素数

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList list = new ArrayList<>();
        // 返回列表中元素数
        System.out.println(list.size());
    }
}
```

### isEmpty - 判断是否不包含任何元素

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList list = new ArrayList<>();
        // 判断是否不包含任何元素
        // 不包含返回 true
        System.out.println(list.isEmpty());
    }
}
```

### add - 添加指定元素

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList list = new ArrayList<>();
        // 将指定元素添加列表尾部
        list.add("233");
        System.out.println(list);
        // 将指定元素添加到指定位置
        list.add(0, "666");
        System.out.println(list);
    }
}
```

### contains - 判断是否包含指定元素

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList list = new ArrayList<>();
        list.add("233");
        // 判断是否包含指定元素
        System.out.println(list.contains("2333"));
        System.out.println(list.contains("233"));
    }
}
```

### indexOf - 返回指定元素第一次出现的索引

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList list = new ArrayList<>();
        list.add("233");
        list.add("2333");
        // 返回指定元素第一次出现的索引
        System.out.println(list.indexOf("2333"));
    }
}
```

### lastIndexOf - 返回指定元素最后一次出现的索引

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList list = new ArrayList<>();
        list.add("233");
        list.add("666");
        list.add("233");
        // 返回指定元素最后一次出现的索引
        System.out.println(list.lastIndexOf("233"));
    }
}
```

### clone - 返回列表的浅拷贝

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList list = new ArrayList<>();
        list.add("233");
        // 返回列表的浅拷贝
        System.out.println(list.clone());
    }
}
```

### toArray - 以适当的顺序返回列表内值的数组

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(2);
        list.add(1);
        list.add(6);
        // 以适当的顺序返回列表内值的数组
        Object[] objects = list.toArray();
        for (Object x : objects) {
            System.out.println(x);
        }
        // 泛式返回
        Integer[] arr = new Integer[3];
        list.toArray(arr);
        for (int x : arr) {
            System.out.println(x);
        }
    }
}
```

### get - 返回指定索引的元素

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(2);
        list.add(1);
        list.add(6);
        // 返回指定索引的元素
        System.out.println(list.get(2));
    }
}
```

### set - 替换指定索引元素

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(2);
        list.add(1);
        list.add(6);
        System.out.println(list);
        // 替换指定索引元素
        list.set(2, 3);
        System.out.println(list);
    }
}
```

### remove - 删除指定元素

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(2);
        list.add(1);
        list.add(6);
        System.out.println(list);
        // 删除指定索引元素
        list.remove(2);
        System.out.println(list);
        // 删除指定元素的第一个匹配项
        Integer i = 1;
        list.remove(i);
        System.out.println(list);
    }
}
```

### clear - 删除所有元素

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(2);
        list.add(1);
        list.add(6);
        System.out.println(list);
        // 删除所有元素
        list.clear();
        System.out.println(list);
    }
}
```

### removeAll - 删除列表中包含的指定集合元素

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        ArrayList<Integer> list1 = new ArrayList<>();
        list1.add(2);
        list1.add(3);
        System.out.println(list);
        // 删除列表中包含的指定集合元素
        list.removeAll(list1);
        System.out.println(list);
    }
}
```

### addAll - 添加指定集合

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        ArrayList<Integer> list1 = new ArrayList<>();
        list1.add(2);
        list1.add(3);
        System.out.println(list);
        // 添加指定集合
        list.addAll(list1);
        System.out.println(list);
        // 在指定位置添加指定集合
        list.addAll(0, list1);
        System.out.println(list);
    }
}
```

### subList - 截取指定范围元素

```java
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        // 截取指定范围元素
        List<Integer> arr = list.subList(1, 2);
        System.out.println(arr);
    }
}
```

### forEach - 对个元素执行特定操作

```java
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        // 对个元素执行特定操作
        list.forEach((e) -> {
            e = e * 5;
            System.out.println(e);
        });
    }
}
```

### removeIf - 删除满足特定条件的元素

```java
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        // 删除满足特定条件的元素
        list.removeIf(integer -> integer == 3);
        System.out.println(list);
    }
}
```

### equals - 比较对象是否相等

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        ArrayList<Integer> list1 = new ArrayList<>();
        list1.add(1);
        // 比较对象是否相等
        System.out.println(list.equals(list1));
    }
}
```

### hashCode - 返回对象哈希值

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        // 返回对象哈希值
        System.out.println(list.hashCode());
    }
}
```

### toString - 返回字符串

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        // 返回字符串
        System.out.println(list.toString());
    }
}
```

### containsAll - 是否包含指定集合

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        ArrayList<Integer> list1 = new ArrayList<>();
        list.add(1);
        // 是否包含指定集合
        System.out.println(list.containsAll(list1));
    }
}
```

### getClass - 返回运行时类

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        // 返回运行时类
        System.out.println(list.getClass());
    }
}
```

### stream - 返回此集合为源的顺序Stream

```java
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        // 返回此集合为源的顺序Stream
        System.out.println(list.stream());
    }
}
```

### sort - 列表排序

```java
import java.util.ArrayList;
import java.util.Comparator;

public class Main {
    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(3);
        list.add(1);
        list.add(2);
        // 列表升排序
        list.sort(Comparator.naturalOrder());
        System.out.println(list);
        // 列表降排序
        list.sort(Comparator.reverseOrder());
        System.out.println(list);
    }
}
```











