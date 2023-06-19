# C # 程序结构

命名空间声明（Namespace declaration）

一个 class

Class 方法

Class 属性

一个 Main 方法

语句（Statements）& 表达式（Expressions）

注释

```c#
using System;   //引入命名空间

namespace app //定义命名空间
{
    class and   //创建类
    {
        static void Main() //定义方法
            // Main方法为唯一入口方法
        {
            Console.WriteLine("Hello \nword");
            Console.WriteLine("Hello\tword");
            Console.WriteLine("\\\"");
        }
    }
}
```

# 注释

+ 单行注释

```c#
//xxxxxxxxxxxxxxx
```

+ 多行注释

```c#
/*
 *1
 *2
 *3
 *4
 */
```

+ 快捷键

```c#
CTRL + K  |  CTRL + C		//注释快捷键
CTRL + K  |  CTRL + U		//取消注释快捷键
```

# 变量

```c#
using System;  

namespace app 
{
    class and   
    {
        static void Main() 
        {
            int a;  // 创建类型变量，声明变量
            a = 10; // 变量赋值
        }
    }
}
```

# 常量

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            // 声明常量
            const int i = 100;
            const double PI = 3.14;
            
        }
    }
}
```

# 基本数据类型

### 数值类型

![image-20220508152016986](../picture\image-20220508152016986.png)

+ 32 位有符号整数类型-int

```c#
int a; 
a = 10; 
```

+ 64 位双精度浮点型-double

```c#
double b;
b = 2.5;
```

+ 16 位 Unicode 字符-char

```c#
char c;
c = 'c';
```

+ 8 位无符号整数-byte

```c#
byte d;
d = 25;
```

+ 布尔值

```c#
bool e;
e = true;
```

### 引用类型

+ 对象类型

**对象（Object）类型** 是 C# 通用类型系统（Common Type System - CTS）中所有数据类型的终极基类。Object 是 System.Object 类的别名。所以对象（Object）类型可以被分配任何其他类型（值类型、引用类型、预定义类型或用户自定义类型）的值。但是，在分配值之前，需要先进行类型转换。

```c#
object obj;
obj = 100; // 这是装箱
```

+ 动态类型

您可以存储任何类型的值在动态数据类型变量中。这些变量的类型检查是在运行时发生的。

```c#
dynamic d = 20;
```

+ 字符串类型

允许您给变量分配任何字符串值。字符串（String）类型是 System.String 类的别名。它是从对象（Object）类型派生的。字符串（String）类型的值可以通过两种形式进行分配：引号和 @引号。

```c#
String str = "runoob.com";
```

### 指针类型

+ 指针类型

指针类型变量存储另一种类型的内存地址。C# 中的指针与 C 或 C++ 中的指针有相同的功能。

```c#
char* cptr;
int* iptr;
```

# 字符数字装换

![image-20220508152244691](../picture\image-20220508152244691.png)

```c#
using System;  

namespace app 
{
    class and   
    {
        static void Main()
        {
            char a = 'a';
            int b = a;
            Console.Write(b);
        }  
    }
}
//小容器转大容器
```

```c#
using System;  

namespace app 
{
    class and   
    {
        static void Main()
        {
            int a = 99;
            char b = (char)a;
            Console.Write(b);
        }  
    }
}
//通过强制类型装换可从大容器转小容器
```

# 字符串声明及拼接

```c#
using System;  

namespace app 
{
    class and
    {
        static void Main()
        {
            String str = "runoob.com";
            Console.WriteLine(str + "233");
        }
    }
}
```

## 可通过@定义多行字符串

```c#
using System;  

namespace app 
{
    class and
    {
        static void Main()
        {
            String str = @"runo
adsad
dsa
dsasd
wasadob.com";
            Console.WriteLine(str + "233");
        }
    }
}
```

## 字符串输出特殊字符

```c#
using System;  

namespace app 
{
    class and
    {
        static void Main()
        {
            string a = @"123""2333";
            // 输入两个引号来输出一个引号
            Console.WriteLine(a);
        }
    }
}
```

# 变量值交换

```c#
using System;

namespace app 
{
    class and
    {
        static void Main()
        {
            int a = 30;
            int b = 5;
            (a, b) = (b, a);
            Console.WriteLine(a);
            Console.WriteLine(b);
        }
    }
}
```

# 字符串格式化

```c#
using System;

namespace app 
{
    class and
    {
        static void Main()
        {
            int a = 30;
            int b = 5;
            Console.WriteLine("{0}+{1}={2}", a, b, a+b);
            // 引用变量
        }
    }
}
```

# 运算符

## 算数运算符

![image-20220522105152962](../picture\image-20220522105152962.png)

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = 30;
            double b = 4;
            Console.WriteLine(a + b);
            // 加法运算
            Console.WriteLine(a - b);
            // 减法运算
            Console.WriteLine(a * b);
            // 乘法运算
            Console.WriteLine(a / b);
            // 除法运算
            Console.WriteLine(a % b);
            // 取模运算
            Console.WriteLine(++a);
            // 自增运算-先自增后赋值
            Console.WriteLine(a++);
            // 自增运算-先赋值后自增
            Console.WriteLine(--a);
            // 自减运算-先自减后赋值
            Console.WriteLine(a--);
            // 自减运算-先赋值后自减
        }
    }
}
```

## 赋值运算符

![image-20220523103437165](../picture\image-20220523103437165.png)

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = 60;
            Console.WriteLine(a += 1);
            // 加等于：a = a + b
            Console.WriteLine(a -= 1);
            // 减等于：a = a - b
            Console.WriteLine(a *= 2);
            // 乘等于：a = a * b
            Console.WriteLine(a /= 2);
            // 除等于：a = a / b
            Console.WriteLine(a %= 2);
            // 取模等于：a = a % b
            a = 60;
            Console.WriteLine(a <<= 2);
            // 左移并赋值：a <<= x
            Console.WriteLine(a >>= 3);
            // 右移并赋值：a >>= x
            Console.WriteLine(a &= 15);
            // 按位与并赋值：a &= x
            Console.WriteLine(a ^= 17);
            // 按位异或并赋值：a ^= x
            Console.WriteLine(a |= 47);
            // 按位或并赋值：a |= x
        }
    }
}
```

## 关系运算符

![image-20220523111559278](../picture\image-20220523111559278.png)

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = 10;
            int b = 15;
            Console.WriteLine(a == b);
            // 等于：相同为True，不同为False
            Console.WriteLine(a != b);
            // 不等于：相同为False，不同为True
            Console.WriteLine(a < b);
            // 小于：左小于右为True，否则为False
            Console.WriteLine(a > b);
            // 大于：左大于右为True，否则为False
            Console.WriteLine(a <= b);
            // 小于等于：左小于等于右为True，否则为False
            Console.WriteLine(a >= b);
            // 大于等于：左大于等于右为True，否则为False
        }
    }
}
```

## 逻辑运算符

![image-20220523112918738](../picture\image-20220523112918738.png)

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            bool a = true;
            bool b = true;
            bool c = false;
            bool d = false;
            Console.WriteLine(a && b);
            Console.WriteLine(a && c);
            // 逻辑与：全1为1，有0为0
            Console.WriteLine(a || b);
            Console.WriteLine(a || c);
            Console.WriteLine(c || d);
            // 逻辑或：有1为1，全0为0
            Console.WriteLine(!a);
            Console.WriteLine(!c);
            // 逻辑非：取反
        }
    }
}
```

## 位运算符

![image-20220523115005922](../picture\image-20220523115005922.png)

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = 60;
            int b = 30;
            int c;
            Console.WriteLine(c = a & b);
            // 与：全1出1，有0出0
            Console.WriteLine(c = a | b);
            // 或：有1出1，全0出0
            Console.WriteLine(c = a ^ b);
            // 异或：不同出1，相同出0
            Console.WriteLine(c = ~a);
            // 位取反：按位取反
            Console.WriteLine(c = a<<2);
            // 左移：按位左移N位
            Console.WriteLine(c = a >> 2);
            // 右移：按位右移N位
        }
    }
}
```

# 其他运算符

+ 返回数据类型的大小

```c#
Console.WriteLine(sizeof(int));
```

+ 返回 class 的类型

```c#
Console.WriteLine(typeof(and));
```

# 判断

## if

+ 如果布尔表达式为 **true**，则 if 语句内的代码块将被执行。如果布尔表达式为 **false**，则 if 语句结束后的第一组代码（闭括号后）将被执行

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = int.Parse(Console.ReadLine());
            if (a == 1)
            {
                Console.WriteLine("ON");
            }
            Console.WriteLine("结束");
        }
    }
}
```

## if...else

+ 一个 **if 语句** 后可跟一个可选的 **else 语句**，else 语句在布尔表达式为假时执行

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = int.Parse(Console.ReadLine());
            if (a == 1)
            {
                Console.WriteLine("NO");
            }
            else
            {
                Console.WriteLine("OFF");
            }
        }
    }
}

```

## if...else if

+ if判断失败执行else if

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = int.Parse(Console.ReadLine());
            if (a <= 10)
            {
                Console.WriteLine("1ON");
            }else if (a <= 20)
            {
                Console.WriteLine("2ON");
            }else if (a <= 30)
            {
                Console.WriteLine("3ON");
            }else if (a <= 40)
            {
                Console.WriteLine("4ON");
            }else
            {
                Console.WriteLine("OFF");
            }
        }
    }
}
```



## 嵌套if

+ 可以在一个 **if** 或 **else if** 语句内使用另一个 **if** 或 **else if** 语

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = int.Parse(Console.ReadLine());
            int b = int.Parse(Console.ReadLine());
            if (a == 1)
            {
                Console.WriteLine("1ON");
                if (b == 1)
                {
                    Console.WriteLine("2ON");
                }
                else
                {
                    Console.WriteLine("2OFF");
                }

            }
            else
            {
                Console.WriteLine("1OFF");
            }
        }
    }
}
```

## switch判断

+ 一个 **switch** 语句允许测试一个变量等于多个值时的情况。每个值称为一个 case，且被测试的变量会对每个 **switch case** 进行检查。

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = int.Parse(Console.ReadLine());
            switch (a)
            {
                case <=10:
                    Console.WriteLine("1");
                    break;
                case <=20:
                    Console.WriteLine("2");
                    break;
                case <=30:
                    Console.WriteLine("3");
                    break;
                default:
                    Console.WriteLine("4");
                    break;
            }
        }
    }
}
```

## switch判断--变形

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = int.Parse(Console.ReadLine());
            switch (a)
            {
                case 1:
                case 2:
                    Console.WriteLine("YES");
                    break;
                case 3:
                case 4:
                    Console.WriteLine("NO");
                    break;
                default:
                    Console.WriteLine("None");
                    break;
            }
        }
    }
}
```

## while循环

+ 只要给定的条件为真，C# 中的 **while** 循环语句会重复执行一个目标语句

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = 1;
            while (a <= 100)
            {
                Console.WriteLine(a);
                a++;
            }
           
        }
    }
}
```

## while循环---3N+1练习

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = int.Parse(Console.ReadLine());

            while (a != 1)
            {
                if (a % 2 == 1)
                {
                    a = 3 * a + 1;
                    Console.WriteLine(a);
                }else if (a % 2 == 0)
                {
                    a = a / 2;
                    Console.WriteLine(a);
                }
            }          
        }
    }
}
```

## for循环

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            for (int i = 0; i <= 10; i++)
                // 初始化代码 + 判断 + 自增公式
            {
                Console.WriteLine(i);
            }
           
        }
    }
}
```

## foreach循环

+ 可用于遍历

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int[] a = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
            foreach (int i in a)
            {
                Console.WriteLine(i);
            }

        }
    }
}
```

## do...while 循环

+ 先执行一次后判断

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = 1;
            do
            {
                Console.WriteLine(a);
                a++;
            }while (a < 11);

        }
    }
}
```

# 循环控制语句

### continue

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            for (int i = 1; i < 21; i++)
            {
                if (i == 15)
                {
                    continue;
                    // 跳过本次循环，直接开始下一次
                }
                Console.WriteLine(i);
            }

        }
    }
}
```

### break

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            for (int i = 1; i < 21; i++)
            {
                if (i == 15)
                {
                    break;
                    // 跳出最近循环
                }
                Console.WriteLine(i);
            }

        }
    }
}
```

# 变量作用域

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int a = 1;
            Console.WriteLine(a);
            if (a = 1)
            {
                // 局部变量
                int b = 10;
                // 局部可访问父数据
                Console.WriteLine(a);
                Console.WriteLine(b);
            }
            // 会报警
            Console.WriteLine(b);
        }
    }
}
```

# 函数

### 函数定义使用

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            string arr = "Hello Worid！";
            // 调用函数并返回值
            bool i = print(arr);
            if (i)
            {
                Console.WriteLine(i);
            }
        }

        // 定义
        // 静态修饰符 返回值类型 函数名 （参数）
        static bool print(string i)
        {
            Console.WriteLine(i);
            // 返回对应类型值
            return true;
        }
    }
}
```

### 参数数组

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            // 构建并传入参数数组
            int i = add(new[] { 2, 4, 8 });
            Console.WriteLine(i);
            // 添加了自动构建
            int w = aww(2, 4, 8);
            Console.WriteLine(w);
        }

        // 接收数组
        static int add(int[] list)
        {
            var sun = 0;
            foreach (var i in list)
            {
                sun += i;
            }

            return sun;
        }

        // 接收数组
        // 添加自动构建 params 关键字
        static int aww(params int[] list)
        {
            var sun = 0;
            foreach (var i in list)
            {
                sun += i;
            }

            return sun;
        }
    }
}
```

### 函数重载

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            Console.WriteLine(add(new int[] { 1, 2, 3, 4, 5 }));
            Console.WriteLine(add(new double[] { 1.2, 2.2, 3.2, 4.2 }));
        }

        // 整型求和
        static int add(int[] list)
        {
            int sun = 0;
            foreach (var i in list)
            {
                sun += i;
            }

            return sun;
        }

        // 浮点求和
        static double add(double[] list)
        {
            double sun = 0;
            foreach (var i in list)
            {
                sun += i;
            }

            return sun;
        }
    }
}
```

# 数组

### 数组使用

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            // 创建int类型数组
            int[] arr = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
            // 使用下标索引输出
            Console.WriteLine(arr[0]);
            // 指定容器长度
            int[] ages;
            ages = new int[10]; // 长度为10的数组
            Console.WriteLine(ages[5]); // 默认值为零
            // 指定并赋值
            int[] age;
            age = new int[5] { 1, 2, 3, 4, 5 };
            Console.WriteLine(age[4]);
        }
    }
}
```

### 数组操作

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            // 创建数组
            int[] arr;
            arr = new int[] { 1, 2, 3, 4, 5 };
            Console.WriteLine(arr[2]);
            // 修改数组值
            arr[2] = 20;
            Console.WriteLine(arr[2]);
            // 通过数组索引遍历数组
            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine(arr[i]);
            }
            // 通过迭代遍历数组
            foreach (var i in arr)
            {
                Console.WriteLine(i);
            }
        }
    }
}
```

### 二维数组

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            // 创建二维数组
            int[,] a = new int[3, 3]
            {
                { 1, 2, 3 },
                { 4, 5, 6 },
                { 7, 8, 9 }
            };
            // 访问2行3列
            Console.WriteLine(a[1, 2]);
        }
    }
}
```

### 交错数组

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            // 创建交错数组
            int[][] arr = new int[2][] { new int[] { 1, 2 }, new int[] { 3, 4, 5 } };
            Console.WriteLine(arr[0][0]);
            Console.WriteLine(arr[1][2]);
        }
    }
}
```

# 字符串

### 字符串使用

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            // 创建字符串
            string name = "World";
            Console.WriteLine(name);
            // 字符串本质为字符数组
            // 遍历字符串
            foreach (var i in name)
            {
                Console.WriteLine(i);
            }
        }
    }
}
```

# 枚举

```c#
using System;

namespace app
{
    class and
    {	// 一组命名整型常量
        // 创建枚举
        enum Day // 枚举名字
        {
            i1, // 枚举值
            i2,
            i3,
            i4,
            i5,
            i6,
            i7
        }

        static void Main()
        {
            // 调用
            Console.WriteLine((int)Day.i2);
            // 输出1
        }
    }
}
```

```c#
using System;

namespace app
{
    class and
    {
        enum Day // 枚举名字
        {
            i1 = 10, // 修改枚举默认值
            i2,
            i3,
            i4,
            i5,
            i6,
            i7
        }

        static void Main()
        {
            // 调用
            Console.WriteLine((int)Day.i2);
            // 输出11
        }
    }
}
```

# 结构体

### 结构体使用

```c#
using System;

namespace app
{
    class and
    {
        // 结构体是值类型数据结构
        // 创建结构体
        struct Stud
        {
            // 权限修饰符 数据类型 名称
            public string name;
            public int age;
            public string sex;
        }

        static void Main()
        {
            // 赋值
            Stud xs1;
            xs1.name = "小明";
            xs1.age = 19;
            xs1.sex = "男";
            Console.WriteLine(xs1.age);
        }
    }
}
```

### 结构体数组

```c#
using System;

namespace app
{
    class and
    {
        struct Stud
        {
            public float x;
            public float y;
            public float z;
            // 定义函数
            public void print()
            {
                Console.WriteLine(x);
                Console.WriteLine(y);
                Console.WriteLine(z);
            }
        }

        static void Main()
        {
            // 实例化
            Stud zuobiao;
            // 赋值
            zuobiao.x = 3.14F;
            zuobiao.y = 0.7F;
            zuobiao.z = 23F;
            // 调用结构体函数
            zuobiao.print();
        }
    }
}
```

# 委托

```c#
using System;

namespace app
{
    class and
    {
        // 定义二个函数
        static int add(int i1, int i2)
        {
            return i1 + i2;
        }

        static int acc(int i1, int i2)
        {
            return i1 - i2;
        }

        // 将函数指定给一个变量
        // 定义委托
        delegate int jisuan(int i1, int i2);

        static void Main()
        {
            // 实例化变量  变量指向某个实例函数
            jisuan ji1 = add;
            Console.WriteLine(ji1(2, 5));
        }
    }
}
```

```c#
using System;

namespace app
{
    class and
    {
        // 定义委托
        delegate void diao();

        // 将委托以参数形式传入
        static void play(diao d)
        {
            Console.WriteLine("开始");
            if (d != null)
            {
                // 调用传入委托
                d();
            }
        }

        static void stop()
        {
            Console.WriteLine("结束");
        }


        static void Main()
        {
            // 将函数以参数传入
            play(stop);
            play(null);
        }
    }
}
```

# 异常

### 异常错误

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int[] arr = { 1, 2, 3, 4 };
            int temp = arr[4]; // 触发错误
            Console.WriteLine("Hello");
            // 错误后代码不会运行
        }
    }
}
```

### 异常捕获

```c#
using System;

namespace app
{
    class and
    {
        static void Main()
        {
            int[] arr = { 1, 2, 3, 4 };
            // 异常捕获
            try
            {
                int temp = arr[4]; // 触发错误
            }
            // 异常类型对象声明
            catch (IndexOutOfRangeException e)
            {
                // 出现此异常时的处理方式
                Console.WriteLine("出现数组下标异常");
            }
            catch (FieldAccessException e)
            {
                Console.WriteLine("出现FieldAccessException异常");
            }
            // 有无异常都执行
            finally
            {
                Console.WriteLine("有没有异常都会执行");
            }

            // 异常出现后面代码也可执行
            Console.WriteLine("结束");
        }
    }
}
```

# 类

### 创建类

```c#
// 创建类文件
namespace app;

class Customer
{
    public string name;
    public int age;
    public string time;

    public void print()
    {
        Console.WriteLine("名字:" + name);
        Console.WriteLine("年级:" + age);
        Console.WriteLine("加入时间:" + time);
    }
}
```

```c#
// 主类中实例化并调用
using System;

namespace app
{
    class Program
    {
        static void Main()
        {
            // 实例化对象
            Customer c1 = new Customer();
            c1.name = "siki";
            c1.age = 19;
            c1.time = "2022.6.15";
            // 调用
            c1.print();
        }
    }
}
```

### 类读取及写入

```c#
namespace app;

class Customer
{
    private string name;
    public int age;
    public string time;

    // 自己定义
    public void setname(string setname)
    {
        name = setname;
    }
}
```

```c#
using System;

namespace app;

class Program
{
    static void Main()
    {
        // 实例化对象
        Customer c1 = new Customer();
        c1.name = "hhh";
        Console.WriteLine(c1.name);
    }
}
```

### 构造函数

```c#
namespace app;

class Customer
{
    public string name;
    public string time;
    public int age;

    // 构造函数
    public Customer(string name, string time, int age)
    {
        // this 指向对象自己
        this.name = name;
        this.time = time;
        this.age = age;
    }

    public void print()
    {
        Console.WriteLine(name);
        Console.WriteLine(time);
        Console.WriteLine(age);
    }
}
```

```c#
using System;

namespace app;

class Program
{
    static void Main()
    {
        // 实例化对象并执行构造函数
        Customer c1 = new Customer("zs", "2022.15.15", 23);
        c1.print();
    }
}
```

# 属性

```c#
namespace app;

class Customer
{
    // 生成类get及set
    public string name { get; set; }
}
```

# 继承

### 实现继承

+ 由基类派生出多个子类,也叫派生类

**Main**

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            // 实例化父类
            BaseClass bc = new BaseClass();
            // 使用父类函数
            bc.Fun1();
            bc.Fun2();
            // 实例化派生类
            DrivedClass1 d1 = new DrivedClass1();
            // 使用继承函数
            d1.Fun1();
            d1.Fun2();
            d1.Fun3();
        }
    }
}
```

**父类**

```c#
namespace app;

public class BaseClass
{
    // 父数据
    private int date1;
    private string date2;

    // 父方法
    public void Fun1()
    {
        Console.WriteLine("父方法1");
    }

    public void Fun2()
    {
        Console.WriteLine("父方法2");
    }
}
```

**派生类**

```c#
namespace app;

// 派生类1
public class DrivedClass1 : BaseClass // 继承父类
{
    // 派生类自己的方法
    public void Fun3()
    {
        Console.WriteLine("子方法1");
    }
}
```

### 类关键字

```apl
this 指向自己访问自己
base 指向父类访问父类
```

# 类方法重写

### 虚方法

```c#
using System;


namespace app
{
    public class main
    {
        static void Main()
        {
            // 实例化父类
            BaseClass bc = new BaseClass();
            // 使用父类函数
            bc.Fun1();
            // 实例化派生类
            DrivedClass1 d1 = new DrivedClass1();
            // 使用重写的函数
            d1.Fun1();
        }
    }
}
```

```c#
namespace app;

public class BaseClass
{
    // 父方法中声明虚方法 virtual
    public virtual void Fun1()
    {
        Console.WriteLine("父方法1");
    }

    public void Fun2()
    {
        Console.WriteLine("父方法2");
    }
}
```

```c#
namespace app;

// 派生类
public class DrivedClass1 : BaseClass // 继承父类
{
    // 派生类重写方法 override  
    public override void Fun1()
    {
        Console.WriteLine("派生类重写的方法");
    }
}
```

### 隐藏方法

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            // 实例化父类
            BaseClass bc = new BaseClass();
            // 使用父类函数
            bc.Fun1();
            // 实例化派生类
            DrivedClass1 d1 = new DrivedClass1();
            // 使用重写的函数
            d1.Fun1();
        }
    }
}
```

```c#
namespace app;

public class BaseClass
{
    public void Fun1()
    {
        Console.WriteLine("父方法1");
    }

    public void Fun2()
    {
        Console.WriteLine("父方法2");
    }
}
```

```c#
namespace app;

// 派生类
public class DrivedClass1 : BaseClass // 继承父类
{
    // 添加 new 隐藏父函数
    public new void Fun1()
    {
        Console.WriteLine("子方法");
    }
}
```

### 抽象类

```c#
using System;


namespace app
{
    public class main
    {
        static void Main()
        {
            BaseClass e = new DrivedClass1();
            e.fun();
            e.Attack();
        }
    }
}
```

```c#
namespace app;

// 创建抽象类 abstract
// 抽象类不能实例化
public abstract class BaseClass
{
    // 普通函数
    public void fun()
    {
        Console.WriteLine("方法");
    }

    // 抽象方法
    public abstract void Attack();
}
```

```c#
namespace app;

// 派生类
// 继承抽象类必须编写抽象函数
public class DrivedClass1 : BaseClass // 继承父类
{
    // 关键字 override
    public override void Attack()
    {
        Console.WriteLine("攻击");
    }
} 
```

### 密封类和密封方法

+ 密封类

```c#
namespace app;

// 创建密封类 sealed
// 密封类不能继承
sealed class BaseClass
{
    
}
```

+ 密封方法

```c#
namespace app;

public class BaseClass
{
    // 定义为虚方法
    public virtual void fun()
    {
    }
}
```

```c#
namespace app;

// 派生类
public class DrivedClass1 : BaseClass
{
    // 密封方法
    // 将方法定义为不能再次重写
    public sealed override void fun()
    {
    }
}
```

# 子类的构造

```c#
using System;


namespace app
{
    public class main
    {
        static void Main()
        {
            // 父子构造函数都会输出
            DrivedClass1 e = new DrivedClass1();
            // 传参构造
            DrivedClass1 w = new DrivedClass1(10, 23);
        }
    }
```

```c#
namespace app;

// 父类
public class BaseClass
{
    // 参数
    private int hp;
    
    public BaseClass(int hp)
    {
        this.hp = hp;
    }

    public BaseClass()
    {
        Console.WriteLine("父输出");
    }
} 
```

```c#
namespace app;

// 派生类
public class DrivedClass1 : BaseClass
{
    private int atack;
    // 子类构造函数
    public DrivedClass1(int atack)
    {
        this.atack = atack;
    }
    // 构造并传参给父类构造函数
    public DrivedClass1(int hp, int atack) : base(hp)
    {
        this.atack = atack;
    }

    // 添加 base 调用父类构造函数
    public DrivedClass1() : base()
    {
        Console.WriteLine("子输出");
    }
}
```

# 修饰符

```apl
public：所有对象都可以访问；
private：对象本身在对象内部可以访问；
protected：只有该类对象及其子类对象可以访问
internal：同一个程序集的对象可以访问；
protected internal：访问限于当前程序集或派生自包含类的类型；
```

# 命名空间引用

```c#
using System;
using a233;
```

# 可空类型

```c#
using System;
// 表示其基础值类型正常范围内的值，再加上一个 null 值
namespace app
{
    public class main
    {
        static void Main()
        {
            // 创建可空类型
            int? i = null;
        }
    }
}
```

# 合并运算符

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            // 合并运算符
            // 用于定义可空类型和引用类型的默认值
            // 如果第一个操作数的值为 null，则运算符返回第二个操作数的值，否则返回第一个操作数的值
            double? num1 = null;
            double? num2 = 3.14157;
            double num3;
            num3 = num1 ?? 5.34;
            Console.WriteLine(num3);
        }
    }
}
```

# 接口

### 接口实现

**主函数**

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            // 实例化使用
            Plane p = new Plane();
            p.Fly();
            p.Attack();
            // 多态
            // 接口指向那个子类，就具有相当于的功能
            IFly fly = new Bird();
            fly.Fly();
            fly.Attack();

            fly = new Plane();
            fly.Fly();
            fly.Attack();
        }
    }
}
```

**接口**

```c#
namespace app;

// 创建接口
interface IFly
{
    // 接口中默认为 public 公共的
    // 创建接口函数
    void Fly();
    void Attack();
}
```

**类**

```c#
namespace app;

class Plane : IFly
{
    public void Fly()
    {
        Console.WriteLine("飞机在飞");
    }

    public void Attack()
    {
        Console.WriteLine("飞机攻击");
    }
}
```

```c#
namespace app;

public class Bird : IFly
{
    public void Fly()
    {
        Console.WriteLine("小鸟在飞");
    }

    public void Attack()
    {
        Console.WriteLine("小鸟攻击");
    }
}
```

### 接口继承

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            sx s = new sx();
            s.F1();
            s.F2();
        }
    }
}
```

```c#
namespace app;

// 父接口
interface IFly1
{
    void F1();
}
```

```c#
namespace app;

// 子接口
interface IFly2 : IFly1
{
    void F2();
}
```

```c#
namespace app;

public class sx : IFly2
{
    public void F1()
    {
        Console.WriteLine("我是从接口1继承的");
    }

    public void F2()
    {
        Console.WriteLine("我是从接口2继承的");
    }
}
```

# 索引器

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            sx t = new sx();
            t[0] = "你好";
            t[1] = "世界";
            Console.WriteLine(t[0] + t[1]);
        }
    }
}
```

```c#
namespace app;

public class sx
{
    private string[] name = new string[10];

    // 索引器定义
    public string this[int index]
    {
        get { return name[index]; }
        set { name[index] = value; }
    }
}
```

# 集合

### 列表

```c#
using System;


namespace app
{
    public class main
    {
        static void Main()
        {
            // 创建列表 不需要设定长度 并且可添加
            List<int> list = new List<int>() { 1, 2, 3, 4, 5 };
            // 列表数据添加
            list.Add(900);
            Console.WriteLine(list[5]);
            // 列表长度
            Console.WriteLine(list.Count);
        }
    }
}
```

# 泛型

### 泛式类

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            // 实例化时传入数据类型
            Class<int> a = new Class<int>();
            Console.WriteLine(a.Sun(1, 2));
        }
    }

    // 声明泛式
    public class Class<T> // 数据类型不确定，由实例化是的参数决定
    {
        public T Sun(T a, T b)
        {
            // dynamic 动态类型
            dynamic nun1 = a;
            dynamic nun2 = b;
            return nun1 + nun2;
        }
    }
}
```

### 泛式方法

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            Console.WriteLine(Sun(10,20));
        }

        public static T Sun<T>(T a, T b)
        {
            dynamic nun1 = a;
            dynamic nun2 = b;
            return nun1 + nun2;
        }
    }
}
```

# 多线程

### 线程创建使用

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            // 创建线程
            ThreadStart start = new ThreadStart(xc1);
            // 创建线程对象
            Thread chuildstart1 = new Thread(start);
            // 线程运行
            chuildstart1.Start();
            // 链式
            Thread chuildstart2 = new Thread(new ThreadStart(xc2));
            chuildstart2.Start();
            Console.WriteLine("我是主线程");
        }

        public static void xc1()
        {
            Console.WriteLine("我是子线程1");
        }

        public static void xc2()
        {
            Console.WriteLine("我是子线程2");
        }
    }
}
```

### 线程操作

```c#
using System;

namespace app
{
    public class main
    {
        static void Main()
        {
            // 创建线程
            ThreadStart start = new ThreadStart(xc1);
            // 创建线程对象
            Thread chuildstart1 = new Thread(start);
            // 线程运行
            chuildstart1.Start();
            // 链式
            Thread chuildstart2 = new Thread(new ThreadStart(xc2));
            chuildstart2.Start();

            Console.WriteLine("我是主线程,在播放音乐");
            // 暂停10毫秒
            Thread.Sleep(10);
            Thread.Sleep(2000);
            // 中断线程
            chuildstart1.Abort();
            chuildstart2.Abort();
        }

        public static void xc1()
        {
            while (true)
            {
                Console.WriteLine("我是子线程1,聊天中");
                Thread.Sleep(10);
            }
        }

        public static void xc2()
        {
            while (true)
            {
                Console.WriteLine("我是子线程2,播放视频中");
                Thread.Sleep(10);
            }
        }
    }
}
```























