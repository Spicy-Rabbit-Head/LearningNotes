# 关键字

## abstract - 创建抽象相关

```c#
abstract class Shape
{
    public abstract int GetArea();
}
```

## as - 强制转换

```c#
E as T
```

## base - 指向父类

```c#
base.xxxx();
```

## bool - 表示一个布尔值

```c#
bool check = true;
```

## break - 循环跳出

```c#
int[] numbers = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
foreach (int number in numbers)
{
    if (number == 3)
    {
        break;
    }
}
```

## byte - 无符号的 8 位整数

```c#
byte a = 17;
```

## case - 分支

```c#
case < 0:
```

## catch - 异常处理

```c#
// 异常类型对象声明
catch (IndexOutOfRangeException e)
{
    // 出现此异常时的处理方式
    Console.WriteLine("出现数组下标异常");
}
```

## char - 字符文本

```c#
var chars = new[]
{
    'j',
    '\u006A',
    '\x006A',
    (char)106,
};
```

## checked - 指定整型算术运算和转换的溢出检查上下文

```c#
uint a = uint.MaxValue;
try
{
    checked
    {
        Console.WriteLine(a + 1);
    }
}
```

## class - 声明类

```c#
class TestClass
{
    
}
```

## const - 声明某个常量字段或常量局部变量

```c#
const int X = 0;
```

## continue - 跳过最近的迭代

```c#
for (int i = 0; i < 5; i++)
{
    Console.Write($"Iteration {i}: ");
    
    if (i < 3)
    {
        Console.WriteLine("skip");
        continue;
    }
    
    Console.WriteLine("done");
}
```

## decimal - 128 位精确的十进制值

```c#
decimal b = 2.1m;
```

## default - 生成类型的默认值

```c#
int myInt = default(int)
```

## delegate - 定义委托

```c#
delegate int jisuan(int i1, int i2);
```

## do - 预执行

```c#
do
{
    Console.Write(n);
    n++;
} while (n < 5);
```

## decimal - 双精度浮点型

```c#
double a = 12.3;
```

## else - 判断失败执行

```c#
if (tempInCelsius < 20.0)
{
    Console.WriteLine("Cold.");
}
else
{
    Console.WriteLine("Perfect!");
}
```

## enum - 枚举

```c#
enum Season
{
    Spring,
    Summer,
    Autumn,
    Winter
}
```

## event - 事件

```c#
```

## explicit - 强制转换用户自定义的类型转换运算符

```c#
public static explicit operator B(A a)
```

## extern - 声明在外部实现的方法

```c#

```

## true - 真

## false - 假

## finally - 异常处理必定执行事务

```c#
finally
{
    Console.WriteLine("异常处理完毕");
}
```

## fixed - 禁止垃圾回收器重定位可移动的变量

```c#

```

## float - 单精度浮点型

```c#
float a = 12F;
```

## for - 循环

```c#
for (int i = 0; i < 3; i++)
{
    Console.Write(i);
}
```

## foreach - 遍历迭代对象

```c#
var fibNumbers = new List<int> { 0, 1, 1, 2, 3, 5, 8, 13 };
foreach (int element in fibNumbers)
{
    Console.Write($"{element} ");
}
```

## goto - 控制权转交给带有标签的语句

```c#
```

## if - 判断

```c#
if (tempInCelsius < 20.0)
{
    Console.WriteLine("Cold.");
}
```

### implicit - 用于声明隐式的用户定义类型转换运算符

```c#
```

## in - 成员运算

```c#
foreach (int element in fibNumbers)
{
    Console.Write($"{element} ");
}
```

## int - 整型

```c#
int a = 123;
```

## interface - 接口定义协定

```c#
```

## internal - 在同一程序集的文件中，内部类型或成员才可访问

```c#
internal static int x = 0;
```

## is - 检查表达式的结果是否与给定的类型相匹配

```c#
```

## lock - 获取给定对象的互斥 lock，执行语句块

```c#
```

## long - 长整型

```c#
long a = 123;
```

## namespace - 命名空间

```c#
namespace Samp;
```

## new - 创建类型的新实例

```c#
var numbers = new int[3];
```

## null - 表示不引用任何对象的空引用的文字值

```c#
string s = null;
```

## object - 对象

```c#
object obj;
obj = 100; // 这是装箱
```

## operator - 运算符重载

```c#

```

## out - 通过引用传递参数

```c#
```

## override - 重新父类函数

```c#
public override void Fun1()
```

## params - 指定采用数目可变的参数的方法参数

```c#
// 将接收自动构建
static int aww(params int[] list)
{
    var sun = 0;
    foreach (var i in list)
    {
        sun += i;
    }

    return sun;
}
```

## private - 声明它们的类和结构体中才是可访问

```c#
private int _i;
```

## protected - 受保护成员在其所在的类中可由派生类实例访问

```c#
protected int x = 123;
```

## public - 对访问公共成员没有限制

```c#
public int x;
```

## readonly - 声明只读只读字段

```c#
// 只在初始化时能赋值
private readonly int _year;
```

## ref - 指示变量是引用或另一个对象的别名

```c#
```

## return - 终止它所在的函数的执行

```c#
void DisplayIfNecessary(int number)
{
    if (number % 2 == 0)
    {
        return;
    }

    Console.WriteLine(number);
}
```

## sbyte - 8 位有符号整数类型

```c#
sbyte num = -120;
```

## sealed - 阻止其他类继承自该类

```c#
sealed class BaseClass{}
```

## short - 16 位有符号整数类型

```c#
short num = -120;
```

## sizeof - 返回给定类型的变量所占用的字节数

```c#
sizeof(T)
```

## stackalloc - 在堆栈上分配内存块

```c#
```

## static - 声明属于类型本身而不是属于特定对象的静态成员

```c#
static class CompanyEmployee
```

## string - 字符串类型

```c#
string a = "hello";
```

## struct - 定义结构类型

```c#
struct Stud
{
    // 权限修饰符 数据类型 名称
    public string name;
    public int age;
    public string sex;
}
```

## switch - 分支判断

```c#
switch (measurement)
    {
        case < 0.0:
            break;

        case > 15.0:
            break;

        case double.NaN:
            break;

        default:
            break;
    }
```

### this - 指向自己

```c#
this.name = name;
```

## throw - 发出程序执行期间出现异常的信号

```c#
```

## try - 捕获异常

```c#
try
{
    int i2 = (int)o2;  
}
```

## typeof - 返回 class 的类型

```c#
typeof(List<string>)
```

## uint - 32 位无符号整数类型

```c#
uint a = 12;
```

## ulong - 64 位无符号整数类型

```c#
ulong a = 12;
```

## unchecked - 指定整型算术运算和转换的溢出检查上下文

```c#
```

## unsafe - 表示不安全上下文

```c#
```

## ushort - 16 位无符号整数类型

```c#
ushort a = 23;
```

## using - 引入命名空间

```c#
using System;   //引入命名空间
```

## virtual - 声明虚方法

```c#
// 父方法中声明虚方法 virtual
public virtual void Fun1()
```

### void - 返回类型来指定该方法不返回值

```c#
public static void Display(IEnumerable<int> numbers)
```

## volatile - 指示一个字段可以由多个同时执行的线程修改

```c#
```

## while - 循环 

```c#
while (n < 5)
{
    Console.Write(n);
    n++;
}
```

# 上下文关键字







