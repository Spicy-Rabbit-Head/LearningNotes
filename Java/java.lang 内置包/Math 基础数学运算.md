[TOC]

# Math 基础数学运算概述

```apl
执行基本数字运算的方法,例如基本指数，对数，平方根和三角函数
所有函数都是静态函数无需构造
```

# Mate 字段

```java
public static final double E
// 自然对数的基数
public static final double PI
// 园的园周与其直径的比率
```

# Math 方法

### sin -  返回角度的三角正弦值

```java
public class Main {
    public static void main(String[] args) {
        // 返回角度的三角正弦值
        System.out.println(Math.sin(2.24));
    }
}
```

### cos - 返回角度的三角余弦值

```java
public class Main {
    public static void main(String[] args) {
        // 返回角度的三角余弦值
        System.out.println(Math.cos(2.24));
    }
}
```

### tan - 返回角度的三角正切

```java
public class Main {
    public static void main(String[] args) {
        // 返回角度的三角正切
        System.out.println(Math.tan(2.24));
    }
}
```

### asin - 返回值的反正弦值

```java
public class Main {
    public static void main(String[] args) {
        // 返回值的反正弦值
        System.out.println(Math.asin(0.5));
        // (值大于0 小于 1)
    }
}
```

### acos - 返回值的反余弦值 

```java
public class Main {
    public static void main(String[] args) {
        // 返回值的反余弦值
        System.out.println(Math.acos(0.5));
        // (值小于 1)
    }
}
```

### atan - 返回值的反正切值

```java
public class Main {
    public static void main(String[] args) {
        // 返回值的反正切值
        System.out.println(Math.atan(0.5));
        // (值大于0)
    }
}
```

### toRadians - 度角度转换弧度近似等效角度

```java
public class Main {
    public static void main(String[] args) {
        // 度角度转换弧度近似等效角度
        System.out.println(Math.toRadians(45));
    }
}
```

### toDegrees - 弧角度转换度近似等效角度

```java
public class Main {
    public static void main(String[] args) {
        // 弧角度转换度近似等效角度
        System.out.println(Math.toDegrees(45));
    }
}
```

### exp - 返回自然对数的基数

```java
public class Main {
    public static void main(String[] args) {
        // 返回自然对数的基数
        System.out.println(Math.exp(6));
    }
}
```

### log - 返回自然对数

```java
public class Main {
    public static void main(String[] args) {
        // 返回自然对数
        System.out.println(Math.log(6));
    }
}
```

### log10 - 返回基数为10对数

```java
public class Main {
    public static void main(String[] args) {
        // 返回基数10对数
        System.out.println(Math.log10(6));
    }
}
```

### sqrt - 返回正确舍入的正平方根

```java
public class Main {
    public static void main(String[] args) {
        // 返回正确舍入的正平方根
        System.out.println(Math.sqrt(6));
    }
}
```

### cbrt - 返回多维数据集根

```java
public class Main {
    public static void main(String[] args) {
        // 返回多维数据集根
        System.out.println(Math.cbrt(6));
    }
}
```

### IEEEremainder - 计算两个数的余数

```java
public class Main {
    public static void main(String[] args) {
        // 计算两个数的余数
        // (根据 IEEE 754标准)
        System.out.println(Math.IEEEremainder(5, 3));
    }
}
```

### ceil - 返回大于等于值且数学整数最小的值

```java
public class Main {
    public static void main(String[] args) {
        // 返回大于等于值且数学整数最小的值
        System.out.println(Math.ceil(2.4));
    }
}
```

### floor - 返回小于等于值且数学整数最大的值

```java
public class Main {
    public static void main(String[] args) {
        // 返回小于等于值且数学整数最大的值
        System.out.println(Math.floor(2.4));
    }
}
```

### rint - 返回最接近值的整数值

```java
public class Main {
    public static void main(String[] args) {
        // 返回最接近值的整数值
        System.out.println(Math.rint(2.4));
    }
}
```

### atan2 - 返回从直角坐标为极坐标

```java
public class Main {
    public static void main(String[] args) {
        // 返回从直角坐标为极坐标
        // 装换角度 x,y 为 (R,角度)
        System.out.println(Math.atan2(2.4, 2.6));
    }
}
```

### pow - 返回 N1 的 N2 次幂

```java
public class Main {
    public static void main(String[] args) {
        // 返回 N1 的 N2 次幂
        System.out.println(Math.pow(2, 3));
    }
}
```

### round - 返回值的四舍五入整数值

```java
public class Main {
    public static void main(String[] args) {
        // 返回值的四舍五入整数值
        System.out.println(Math.round(2.5));
    }
}
```

### random - 返回 0 到 1 之间的随机值

```java
public class Main {
    public static void main(String[] args) {
        // 返回 0 到 1 之间的随机值
        System.out.println(Math.random());
    }
}
```

### addExact - 返回两值总和

```java
public class Main {
    public static void main(String[] args) {
        // 返回两值总和
        System.out.println(Math.addExact(5, 5));
    }
}
```

### subtractExact - 返回两值相减

```java
public class Main {
    public static void main(String[] args) {
        // 返回两值相减
        System.out.println(Math.subtractExact(5, 4));
    }
}
```

### multiplyExact - 返回两值相乘

```java
public class Main {
    public static void main(String[] args) {
        // 返回两值相乘
        System.out.println(Math.multiplyExact(5, 4));
    }
}
```

### incrementExact - 返回递增1的值

```java
public class Main {
    public static void main(String[] args) {
        // 返回递增1的值
        System.out.println(Math.incrementExact(2));
    }
}
```

### decrementExact - 返回递减1的值

```java
public class Main {
    public static void main(String[] args) {
        // 返回递减1的值
        System.out.println(Math.decrementExact(2));
    }
}
```

### negateExact - 返回值的负值

```java
public class Main {
    public static void main(String[] args) {
        // 返回值的负值
        System.out.println(Math.negateExact(2));
    }
}
```

### toIntExact - 返回 long 的 int 值

```java
public class Main {
    public static void main(String[] args) {
        // 返回 long 的 int 值
        System.out.println(Math.toIntExact(200000000L));
    }
}
```

### multiplyFull - 返回参数的确切数学乘积

```java
public class Main {
    public static void main(String[] args) {
        // 返回参数的确切数学乘积
        System.out.println(Math.multiplyFull(2, 3));
    }
}
```

### floorDiv - // 返回最大的小于或等于代商数

```java
public class Main {
    public static void main(String[] args) {
        // 返回最大的小于或等于代商数
        // (股息,除数)
        System.out.println(Math.floorDiv(10, 3));
    }
}
```

### floorMod - 返回值的模数

```java
public class Main {
    public static void main(String[] args) {
        // 返回值的模数
        System.out.println(Math.floorMod(10, 3));
    }
}
```

### abs - 返回值的绝对值

```java
public class Main {
    public static void main(String[] args) {
        // 返回值的绝对值
        System.out.println(Math.abs(9));
    }
}
```

### max - 返回两值中较大的值

```java
public class Main {
    public static void main(String[] args) {
        // 返回两值中较大的值
        System.out.println(Math.max(3, 5));
    }
}
```

### min - 返回两值中较小的值

```java
public class Main {
    public static void main(String[] args) {
        // 返回两值中较小的值
        System.out.println(Math.min(3, 5));
    }
}
```

### fma - 返回 值1乘值2加值3

```java
public class Main {
    public static void main(String[] args) {
        // 返回 值1乘值2加值3
        System.out.println(Math.fma(2.0, 3.0, 4.0));
    }
}
```

### ulp - 返回值的 ulp 大小

```java
public class Main {
    public static void main(String[] args) {
        // 返回值的 ulp 大小
        System.out.println(Math.ulp(3.5));
    }
}
```

### sinh - 返回双曲正弦值

```java
public class Main {
    public static void main(String[] args) {
        // 返回双曲正弦值
        System.out.println(Math.sinh(3.5));
    }
}
```

### cosh - 返回双曲余弦值

```java
public class Main {
    public static void main(String[] args) {
        // 返回双曲余弦值
        System.out.println(Math.cosh(3.5));
    }
}
```

### tanh - 返回双曲正切值

```java
public class Main {
    public static void main(String[] args) {
        // 返回双曲正切值
        System.out.println(Math.tanh(3.5));
    }
}
```

### hypot - 返回 (x平方 + y平方)

```java
public class Main {
    public static void main(String[] args) {
        // 返回 (x平方 + y平方)
        System.out.println(Math.hypot(3, 3));
    }
}
```

### expm1 - 返回 e 的 x次方 -1

```java
public class Main {
    public static void main(String[] args) {
        // 返回 e 的 x次方 -1
        System.out.println(Math.expm1(6));
    }
}
```

### log1p - 返回参数之和1注的自然对数

```java
public class Main {
    public static void main(String[] args) {
        // 返回参数之和1注的自然对数
        System.out.println(Math.log1p(2.5));
    }
}
```

### copySign - 返回带有值2的参数符号的值1值

```java
public class Main {
    public static void main(String[] args) {
        // 返回带有值2的参数符号的值1值
        System.out.println(Math.copySign(2.5, -3.5));
    }
}
```

### getExponent - 返回值的无偏指数

```java
public class Main {
    public static void main(String[] args) {
        // 返回值的无偏指数a
        System.out.println(Math.getExponent(2.5F));
    }
}
```

### nextAfter - 返回值2方向上值1旁边的值

```java
public class Main {
    public static void main(String[] args) {
        // 返回值2方向上值1旁边的值
        System.out.println(Math.nextAfter(2.45, 3.5));
    }
}
```

### nextUp - 返回正无穷大方向上与值相邻的值

```java
public class Main {
    public static void main(String[] args) {
        // 返回正无穷大方向上与值相邻的值
        System.out.println(Math.nextUp(2.5F));
    }
}
```

### nextDown - 返回负无穷大方向上与值相邻的值

```java
public class Main {
    public static void main(String[] args) {
        // 返回负无穷大方向上与值相邻的值
        System.out.println(Math.nextDown(2.5F));
    }
}
```





