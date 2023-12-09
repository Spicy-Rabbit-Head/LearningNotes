# 概述

> WPF是基于 XAML 、.NET 、向量绘画计算的表现层开发框架

# 架构

### 三层架构

> 以高内聚 、低耦合的思想将程序的功能模块划分为3块

![image-20231022092040045](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022092040045.png)

### 数据操作层的划定

> 数据操作层包含公共数据访问代码,是用于操作和交互数据库中数
> 据的逻辑代码
>
> > 将数据操作的逻辑代码置于业务逻辑层时,数据访问成为一种
> > 业务逻辑
> >
> > 表示层对于数据的访问与业务逻辑层对于数据的操
> > 作调用的是相同的方法
>
> > 将所有的数据读取操作存放在数据层时,只需要在业务层再定
> > 义一个方法供表示层调用。

>数据操作在业务逻辑层是应设定数据库操作类
>
>并在业务层定义图书操作类及方法
>
>表示层和业务层都应调用该操作类来驱动数据层
>
>![image-20231022093255663](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022093255663.png)

>数据操作在数据层时应在数据层设定数据操作类
>
>在业务层操作数据层操作类来获取数据
>
>在表现层操作业务层来获取数据
>
>![image-20231022093749435](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022093749435.png)

### 数据交互容器与载体

+ `实体类`

> 在三层架构的各层模块之间,通过对象模型的实体类(Mod)作为数据传
> 递的载体,不同的对象模型的实体类一般对应于数据库的不同表,实体类的属性与数据库表的字段名一致。

> 实体类库是数据表映射的对象,在系统软件开发过程当中,需要建立对象的实例,将关系数据库表采用对象实例化的表示方法来使用,辅助软件开发中对各个系统功能的控制和操作执行,并把数据库表中所有的字段映射为系统对象,进而实现各个层的参数传输

###  三层架构的优点

> + 高内聚、低耦合,可以降低层与层之间的依赖
> + 各层互相独立,完成自己该完成的任务,项目可以多人同
>   时开发,开发人员可以只关注整个结构中的其中某一层
> + 容易移植、维护,如B/S转C/S、SQL Server转Oracle、
>   添加、修改、删除等
> + 有利于标准化和各层逻辑的复用
> + 安全性高,用户端只能通过业务逻辑层来调用数据访问层,
>   减少了入口点

# MVC 和 MVVM 模式

### 表现模式和架构模式

##### 表现模式(Presentation Pattern)

> 通过分离关注点来改进代码的组织方式
>
> 表现模式侧重于解决代码组织,往往使用了多种设计模式,因此其也称作复合设计模式

##### 架构模式(Architecture Pattern)

> 描述软件系统里的基本的结构组织或纲要
>
> 架构模式提供一些呈现定义好的子系统,指定它们的责任,并给出把它们组织在一起的法则和指南

### MVC模式

> MVC模式是GUI界面开发的指导模式
>
> 它基于表现层功能划分的思想把程序分为三大部分：Model--View-Controller,呈三角形结构
>
> Model是数据模型,View是用户界面,Controller是控制器
>
> MVC的设计目的是实现功能结构的规划

+ `模型(Mode)`：处理程序逻辑;获取和存放数据
+ `视图(View)`:显示数据;提供用户交互界面
+ `控制器(Controller)`:处理用户交互;从View读取数据;向Model发送数据

##### MVC之间通信

> 用户请求被路由到控制器,后者负责使用模型来执行用户操作或
> 检索查询结果
>
> 控制器选择要显示给用户的视图,并为其提供所需的任何模型数据

![image-20231022100657352](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022100657352.png)

##### MVC和三层架构的关系

> MVC是表现模式(Presentation Pattern),三层架构是典型的架构模式(Architecture Pattern),三层架构的分层模式是典型的上下关系,上层依赖于下层
>
> 但MVC作为表现模式是不存在上下关系的,而是相互协作关系
>
> MVC和三层架构基本没有可比性,是应用于不同领域的技术

![image-20231022104434593](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022104434593.png)

### MVVM模式

> MVVM即Model--View-ViewModel,它是一种基于前端开发的表现模式,其核心是提供对 View 和 ViewModel 的双向数据绑定,这使得 ViewModel 的状态改变可以自动传递给View

> ViewModel是MVVM模式的核心,它是连接View和Modell的桥梁
>
> 它有两个方向：
>
> + 将Model转化成View,即将后端传递的数据转化成所看到的页面：`数据绑定`
>
> + 将View转化成Model,即将所看到的页面转化成后端的数据：`事件监听`
>
> 这两个方向都实现的,称之为数据的双向绑定
>
> MVVM在概念上是真正将页面与数据逻辑分离的模式,View和Model彻底分离。

![image-20231022122937946](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022122937946.png)

##### MVVM 优点

+ `低耦合`：视图View可以独立于Model变化和修改,一个ViewModel
  可以绑定到不同的View上,当View变化的时候Model可以不变,当
  Model变化的时候View也可以不变
+ `可重用性`：可以把一些视图逻辑放在ViewModel里面,让很多view重用这段视图逻辑
+ `独立开发`：开发人员可以专注业务逻辑和数据的开发,设计人员可以
  专注页面设计
+ `可测试`：界面向来比较难预测时,测试可针对ViewModel来写

### MVC 与 MVVM 的区别

> MVC模型关注的是页面功能的划分,将UI层面上的代码和数据逻辑相
> 关的代码分开,但并不是完全分离,且在于强调控制器的作用

> MVVM在概念上是真正将页面与数据逻辑分离的模式,View和Model
> 彻底分离,核心在于提供对View和ViewModel的双向数据绑定,使
> 得Mode和View数据状态的改变可以自动变更

# 驱动

### 事件驱动

> 事件驱动通过`事件一订阅一事件处理`的关系组织应用程序
>
> 事件驱动下,用户进行每一个操作会激发程序发生的一个事件,事件发生后,用于响应事件的事件处理器就会执行。
>
> MVC模式即使用事件驱动
>
> 事件驱动下界面控件是处于主动地位的,界面逻辑和业务逻辑的桥梁是事件,界面逻辑和业务逻辑间多少会有关联性、依赖性
>
> 而数据是被动的、静态的,等待控件的事件去驱动

### 数据驱动

> MVVM模式则是典型的数据驱动模式
>
> 数据驱动的理念下,数据占主动地位,也就是由内容决定形式
>
> 数据驱动的桥梁是双向数据绑定,通过Data Binding可以实现数据流向界面,界面也可以将数据流回数据源

# XAML

> XAML(Extensible Application Markup Language)是微软创造的一种新的可扩展应用程序标记语言,是WPF中专门用于设计UI的语言,是一种单纯的声明型语言

### 初始默认结构

+ 定义页面 - MainWindow.xaml

```xaml
<Window x:Class="StandardTest.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:StandardTest"
        mc:Ignorable="d"
        Title="MainWindow" Height="450" Width="800">
    <Grid>

    </Grid>
</Window>
```

>- `<Window>` 
>
>  元素表示一个窗口
>
>- `x:Class="StandardTest.MainWindow"`
>
>  属性指定窗口的代码访问名称,即隐藏代码文件,在编译时XAML会和指定类合并
>
>- `xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"` 
>
>  属性指定 XAML 命名空间
>
>- `xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"` 
>
>  属性指定 XAML 扩展命名空间
>
>- `xmlns:d="http://schemas.microsoft.com/expression/blend/2008"` 
>
>  属性指定 Blend 命名空间
>
>- `xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"` 
>
>  属性指定标记兼容性命名空间
>
>- `xmlns:local="clr-namespace:StandardTest"` 
>
>  属性指定本地命名空间
>
>- `mc:Ignorable="d"` 
>
>  属性指定 Blend 设计器应忽略 `d` 命名空间中的元素
>
>- `Title="MainWindow"` 
>
>  属性指定窗口的标题。
>
>- `Height="450"` 
>
>  属性指定窗口的高度。
>
>- `Width="800"` 
>
>  属性指定窗口的宽度。
>
>- `<Grid>` 
>
>  元素表示一个网格布局。

+ 代码隐藏文件 - MainWindow.xaml.cs

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace StandardTest
{
    /// <summary>
    /// MainWindow.xaml 的交互逻辑
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            // 初始化组件
            InitializeComponent();
        }
    }
}
```

### 标签声明

> 在XAML语言中,使用标签声明一个元素,每个元素对应内存中的一个对象
>
> 可以通过标签的语法进一步声明元素的特征(Attribute)和内容物

### xmlns

> xmlns即XML-Namespace,其一个使用优点是,当要引用的来源不同类重名时,可以使用命名空间加以区分
>
> XAML中命名空间的语法与C#是不同的,在C#中,我们使用usig关键字在代码顶部调用命名空间,在XAML当中的语法格式是：
>
> + xmLns="[命名空间]”  无映射前缀
> + xmlns:[映射前缀]="[命名空间]”  有映射前缀

> 在使用XAML语法声明元素标签时,其对应声明的对象与对象之间的关系要么是包含,要么是并列关系,所以我们又说,XAML的语法结构是一种树形的包含或并列结构
>
> + 界面
>
> ![image-20231022131703634](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022131703634.png)
>
> + 元素表达
>
> ![image-20231022131910105](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022131910105.png)
>
> + 树型关系图
>
> ![image-20231022131941851](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022131941851.png)

### 元素属性赋值

> WPF中用于绘制矩形的类为Rectangle类,该类有一个Fill属性用于对矩形进行颜色填充
>
> Rectangle.Fill的赋值类型式Brush
>
> Brush是画刷,是一个抽象类,其派生类有单色画刷(SolidColorBrush)、线性渐变画刷(LinearGradientBrush)和位图画刷(ImageBrush)等等

```xaml
<Rectangle x:Name="rectangle1 "Width="200" Height="120" Fill="BLue"/>
```

![image-20231022152124133](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022152124133.png)

+ 对应的表达形式:

```c#
SolidColorBrush SCB1 new SolidColorBrush();
SCB1.Color = Colors.Blue;
this.rectangle.Fill = SCB1;
```

+ 需要进行复杂赋值时需要精确命中

```xaml
<Rectangle Width="200" Height="120">
    <Rectangle.Fill>
        <SolidColorBrush Color="BLue" />
    </Rectangle.Fill>
</Rectangle>
```

+ 进行镜像渐变填充

```xaml
<Rectangle Width="200" Height="120">
    <Rectangle.Fill>
        <LinearGradientBrush>
            <LinearGradientBrush.StartPoint>
                <Point X="0" Y="1"></Point>
            </LinearGradientBrush.StartPoint>
            <LinearGradientBrush.EndPoint>
                <Point X="1" Y="0"></Point>
            </LinearGradientBrush.EndPoint>
            <LinearGradientBrush.GradientStops>
                <GradientStopCollection>
                    <GradientStop Color="Red" Offset="0"></GradientStop>
                    <GradientStop Color="Yellow" Offset="0.5"></GradientStop>
                    <GradientStop Color="Blue" Offset="1"></GradientStop>
                </GradientStopCollection>
            </LinearGradientBrush.GradientStops>
        </LinearGradientBrush>
    </Rectangle.Fill>
</Rectangle>
```

![image-20231022153142697](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022153142697.png)

### XAML属性赋值的简化

+ 能使用直接特征赋值就不使用元素属性赋值的形式
+ 充分利用默认值
+ 允许使用XAML的简写形式

### 标记扩展 - TODO

> XAML标记扩展构成了XAML中的一项重要功能,允许将属性设置为从其他源间接引用的对象或值
>
> XAML标记扩展对于共享对象和引用整个应用程序中使用的常量特别重要,但它们在数据绑定中找到了最大的效用

### 事件处理

> NET的事件处理机制中,可以为对象的某个事件指定一个能与该事件匹配的成员方法,当这个事件发生时,NET运行时就会去调用这个方法,表示对这个事件的响应和处理

```xaml
<!-- Click对应的事件 -->
<Button Click="ShowDialog">点击触发事件</Button>
```

```c#
// 事件处理函数
private void ShowDialog(object sender, RoutedEventArgs e)
{
    Console.WriteLine(sender.ToString());
    Console.WriteLine(e.ToString());
    MessageBox.Show("触发事件!");
}
```

### XAML的注释

+ XAML的注释只能出现在标签的内容区域
+ XAML的注释不能用于注释掉标签的特征赋值
+ XAML的注释不能嵌套

```xaml
<!-- 这是注释 -->
```

### XAML命名空间

> XAML命名空间是一种用于在XAML标记中引用不同的类型和属性的机制
>
> XAML命名空间可以将XAML元素和属性与对应的.NET类和成员映射,从
> 而实现对象构造和属性赋值

| 特征            | 标记扩展 | 指令元素 |
| --------------- | -------- | -------- |
| x:Class         | x:Array  | x:Code   |
| x:ClassModifier | x:Null   | x:XData  |
| x:Name          | x:Static |          |
| x:FieldModifier | x:Type   |          |
| x:Key           |          |          |
| x:Shared        |          |          |
| x:Subclass      |          |          |
| x:TypeArguments |          |          |
| x:Uid           |          |          |

#### 特征功能

---

##### x:Class

> 这个特征功能,适用于告诉编译器将当前XAML标签的编译结果与后台中
> 指定的类进行合并
>
> 在使用这个功能声明时需要满足以下要求：
>
> + 此特征功能仅能在根节点声明
> + 根节点类型要与所指示的合并类型保持一致
> + 所指示的类型在声明时必须使用partial关键字

##### x:ClassModifier

> 告诉XAML编译器该便签生成的类具有怎样的访问级别
>
> 对于整个程序集来说,internal和orivate是等价的

##### x:Name

> 告诉XAML编译器为当前的标签生成一个实例,并为这个
> 实例声明一个引用变量

```xaml
<!-- 在XAML为当前标签声明一个名字 -->
<TextBox x:Name="TextBox"></TextBox>
<Button Click="ButtonBase_OnClick">点击</Button>
```

```c#
private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
{
    // 在这里可以直接引用XAML中的控件名,比如这里的TextBox
    TextBox.Text = "Hello World";
}
```

> ![image-20231022214658381](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022214658381.png)

##### x:FieldModifier

> 为引用变量设置访问级别
>
> 默认情况下,字段的访问级别按照面向对象的封装原则被设置成了internal

##### x:Key 与 x:Shared

> 为XAML定义的资源指定一个唯一的标识符,以便在XAML中引用它
>
> 当多次检索到一个对象时,若得到的都是同一个对象,则x:Shared的值为true
>
> 若得到的是该对象的多个副本,则x:Shared的值为false
>
> XAML编译器会为资源隐式添加x:Shared=“true”



#### 标记扩展功能

---

##### x:Type

> 用于一些需要指定类型的属性或参数
>
> 当需要引用的不是数据类型的实例,而是数据类型本身是使用

+ 主页

```xaml
<Window x:Class="StandardTest.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:StandardTest"
        mc:Ignorable="d"
        xmlns:wins="clr-namespace:StandardTest.pages"
        xmlns:pre="clr-namespace:StandardTest.presetUI"
        Title="主页" MinHeight="200" MaxHeight="200" MinWidth="200" MaxWidth="200">
    <!-- 首先声明窗口的命名空间 -->
    <!-- 再声明功能性按钮的命名空间 -->
    <StackPanel>
        <!-- 传入页面类型 -->
        <pre:FeedbackButton pagesWindow="{x:Type TypeName=wins:SuggestionComment}">建议页面</pre:FeedbackButton>
        <pre:FeedbackButton pagesWindow="{x:Type TypeName=wins:PositiveComment}">赞赏页面</pre:FeedbackButton>
    </StackPanel>
</Window>
```

+ presetUI下

按钮实例

```c#
using System;
using System.Windows;
using System.Windows.Controls;

namespace StandardTest.presetUI;

// 继承自Button,这样在XAML中就可以直接使用了
public class FeedbackButton : Button
{
    // 定义 Type 为 FeedbackButton 的附加属性
    public Type pagesWindow { get; set; }

    // 创建激发事件
    protected override void OnClick()
    { 
        // 调用父类的OnClick方法
        base.OnClick();
        // 通过反射创建窗口实例
        var window = Activator.CreateInstance(pagesWindow) as Window;
        // 显示窗口
        if (window != null)
        {
            window.Show();
        }
    }
}
```

+ pages下

赞赏页面

```xaml
<Window x:Class="StandardTest.pages.SuggestionComment"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:local="clr-namespace:StandardTest.pages"
        mc:Ignorable="d"
        Title="SuggestionComment" Height="100" Width="100">
    <Grid>
        <TextBox>这是建议窗口</TextBox>
    </Grid>
</Window>
```

建议页面

```xaml
<Window x:Class="StandardTest.pages.PositiveComment"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:local="clr-namespace:StandardTest.pages"
        mc:Ignorable="d"
        Title="PositiveComment" Height="100" Width="100">
    <Grid>
        <TextBox>这是展示界面</TextBox>
    </Grid>
</Window>
```

![image-20231022222536808](D:\.work_documents\Syncdisk\LearningNotes\C#\WPF\assets\image-20231022222536808.png)

##### x:Null

> 可以显式地对一个特征或属性赋一个空值,常用于清除一些设置
>
> 比如将按钮的背景颜色清空
>
> ```xaml
> <Button Content="Cancel" Background="{x:Null}"/>
> ```

##### x:Static

> 用于一些需要使用静态字段或属性的属性或参数

```c#
// 声明静态成员
// 在隐藏代码文件中声明
public static string staticTitle = "静态标题";
```

```xaml
<Window x:Class="StandardTest.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:StandardTest"
        mc:Ignorable="d"
        Title="{x:Static local:MainWindow.staticTitle}" MinHeight="200" MaxHeight="200" MinWidth="200" MaxWidth="200">
    <!-- local 表示的是引用空间,就是你需要引用类所在的namespace -->
    <!-- MainWindow 表示的是你需要的值所在的类名称 -->
    <!-- staticTitle 表示的是那个有你需要值的公共静态属性或字段 -->

    <StackPanel>
        <Button Click="ButtonBase_OnClick">1</Button>
    </StackPanel>
</Window>
```

#### 指令元素功能

---

##### x:Code

> 可以将本该放置在.Cs文件中的后置代码搬移到XAML中,且需要使用XML语言的<[CDATA[...]>转移标签,写法为：
>
> ```apl
> <Window>
> 	<Grid>
> 	</Grid>
>     
> 	<x:Code>
> 		<![CDATA[
> 		 	..代码内容.…
> 		]>
> 	</x:Code>
> </Window>
> ```

##### x:Data

> 在XAML中定义一个XML数据源,以便在XAML中使用数据绑定或数据模板
>
> x:Data可以用于一些需要指定数据源的属性或数,例如 
>
> + XmlDataProvider.Source
> + XmlDataProvider.XPath
> + XmlDataProvider.Document 
>
> 等

### 资源

> 每个WPF的界面元素都具有(Resources)属性,这个属性的类型为ResourceDictionary类型,其能够以键值对的形式存储资源,当我们需要某个资源时,使用键值对可以索引到资源对象
>
> 我们可以在任何元素上去定义资源,可通过：Ky指令来分配唯一键。

#### 静态和动态资源

+ 静态资源使用(StaticResource)指的是在程序载入内存时,对资源的一次性使用,之后就不再去访问这个资源了
+ 动态资源使用(DynamicResource)指的是在程序运行过程中,仍然会去访问该资源

#### 资源管理形式

+ 直接在窗口对应的xaml中定义资源,这样可以方便地在主窗口中使用资源,但是如果资源很多或者需要在其他窗口或用户控件中使用,就不太合适
+ 在App.xaml中定义资源,这样可以让资源在整个应用程序的范围内共享,实现一致的主题和外观,但是如果资源很多或者需要根据不同的窗口或用户控件进行区分,就不太合适
+ 创建文件夹并创建内容元素为ResourceDictionary的xaml页面,这样可以将资源分组和模块化,方便管理和维护,也可以根据需要在不同的窗口或用户控件中引用或合并资源

> ```apl
> 资源定义的位置:
> 定义在 app.xaml 中,则全局可用
> 定义在 window.xaml 中,则只在当前窗口及其子控件中可用
> 定义在 资源字典.xaml 中,则在引用该资源字典的窗口及其子控件中可用
> ```

> ```xaml
> <!-- 全局资源 -->
> <Application.Resources>
>     <SolidColorBrush x:Key="PresetColor1" Color="Wheat"></SolidColorBrush>
>     <SolidColorBrush x:Key="PresetColor2" Color="Sienna"></SolidColorBrush>
> </Application.Resources>
> 
> <!-- 页面资源 -->
> <Window.Resources>
>     <SolidColorBrush x:Key="PresetColor1" Color="Wheat"></SolidColorBrush>
>     <SolidColorBrush x:Key="PresetColor2" Color="Sienna"></SolidColorBrush>
> </Window.Resources>
> 
> <!-- 定义专用的文件夹结构 存放资源 -->
> <ResourceDictionary xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
>                     xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml">
>     <SolidColorBrush x:Key="PresetColor1" Color="Wheat"></SolidColorBrush>
>     <SolidColorBrush x:Key="PresetColor2" Color="Sienna"></SolidColorBrush>
> </ResourceDictionary>
> 
> <!-- 以相对路径的方式引用并合并资源字典 -->
> <ResourceDictionary>
>     <ResourceDictionary.MergedDictionaries>
>         <ResourceDictionary Source="/Resources/BrushResources/SolidColorBrush.xaml"></ResourceDictionary>
>     </ResourceDictionary.MergedDictionaries>
> </ResourceDictionary>
> ```

#### 资源定义

##### 静态资源

```xaml
<Window x:Class="StandardTest.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:StandardTest"
        mc:Ignorable="d"
        Title="主页" MinHeight="200" MaxHeight="200" MinWidth="200" MaxWidth="200">
    <Window.Resources>
        <!-- 定义页面资源 -->
        <SolidColorBrush x:Key="PresetColor1" Color="Wheat"></SolidColorBrush>
        <SolidColorBrush x:Key="PresetColor2" Color="Sienna"></SolidColorBrush>
    </Window.Resources>
    <Grid ShowGridLines="True">
        <Grid.RowDefinitions>
            <RowDefinition></RowDefinition>
            <RowDefinition></RowDefinition>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition></ColumnDefinition>
            <ColumnDefinition></ColumnDefinition>
        </Grid.ColumnDefinitions>

        <!-- 使用静态资源 -->
        <Border Background="{StaticResource PresetColor1}"></Border>
        <Border Grid.Row="0" Grid.Column="1" Background="{StaticResource PresetColor2}"></Border>
        <Border Grid.Row="1" Grid.Column="0" Background="{StaticResource PresetColor2}"></Border>
        <Border Grid.Row="1" Grid.Column="1" Background="{StaticResource PresetColor1}"></Border>

    </Grid>
</Window>
```

![image-20231028133704263](assets/image-20231028133704263.png)

##### 动态资源

```xaml
<Window x:Class="StandardTest.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:StandardTest"
        mc:Ignorable="d"
        Title="主页" MinHeight="200" MaxHeight="200" MinWidth="200" MaxWidth="200">
    <Window.Resources>
        <!-- 定义页面资源 -->
        <SolidColorBrush x:Key="PresetColor1" Color="Wheat"></SolidColorBrush>
        <SolidColorBrush x:Key="PresetColor2" Color="Sienna"></SolidColorBrush>
    </Window.Resources>
    <Grid ShowGridLines="True">
        <Grid.RowDefinitions>
            <RowDefinition></RowDefinition>
            <RowDefinition></RowDefinition>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition></ColumnDefinition>
            <ColumnDefinition></ColumnDefinition>
        </Grid.ColumnDefinitions>

        <!-- 使用静态资源 -->
        <Border Grid.Row="0" Grid.Column="0" Background="{DynamicResource PresetColor1}">
            <StackPanel>
                <!-- 切换资源定义 -->
                <Button Click="ChangeToTopic1">切换主题1</Button>
                <Button Click="ChangeToTopic2">切换主题2</Button>
            </StackPanel>
        </Border>
        <Border Grid.Row="0" Grid.Column="1" Background="{DynamicResource PresetColor2}"></Border>
        <Border Grid.Row="1" Grid.Column="0" Background="{DynamicResource PresetColor2}"></Border>
        <Border Grid.Row="1" Grid.Column="1" Background="{DynamicResource PresetColor1}"></Border>

    </Grid>
</Window>
```

![image-20231028140722255](assets/image-20231028140722255.png)

![image-20231028140739034](assets/image-20231028140739034.png)

```c#
// 触发事件
private void ChangeToTopic1(object sender, RoutedEventArgs e)
{
    // 更改动态资源
    Resources["PresetColor1"] = new SolidColorBrush(Colors.SeaGreen);
    Resources["PresetColor2"] = new SolidColorBrush(Colors.HotPink);
}

private void ChangeToTopic2(object sender, RoutedEventArgs e)
{
    Resources["PresetColor1"] = new SolidColorBrush(Colors.Wheat);
    Resources["PresetColor2"] = new SolidColorBrush(Colors.Sienna);
}
```

#### Style 资源

> 样式(Style)是一种将一组特征属性值应用到多个元素的方法,用于设置控件的外观属性如长宽、颜色、字体、大小等
>
> WPF中的各类控件元素,都可以自由的设置其样式
>
> 在设定 Style 时,我们需要使用 x:Key 声明键名,并设置目标类型 TargetType ,使用 x:Type 将类型传入
>
> 在 Style 标签的内容区通过 Setter 标签,设置 Property 属性和属性值 Value

```xaml
<Application x:Class="StandardTest.App"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:local="clr-namespace:StandardTest"
             StartupUri="MainWindow.xaml">
    <Application.Resources>
        <!-- 定义样式键及目标类型 -->
        <Style x:Key="EasyBorder" TargetType="{x:Type Border}">
            <!-- 设置样式 -->
            <Setter Property="BorderBrush" Value="Red" />
            <Setter Property="BorderThickness" Value="2" />
            <Setter Property="CornerRadius" Value="5" />
            <Setter Property="Padding" Value="5" />
        </Style>
    </Application.Resources>
</Application>
```

```xaml
<Window x:Class="StandardTest.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:StandardTest"
        mc:Ignorable="d"
        Title="主页" MinHeight="200" MaxHeight="200" MinWidth="200" MaxWidth="200">
    <Grid ShowGridLines="True">
        <Grid.RowDefinitions>
            <RowDefinition></RowDefinition>
            <RowDefinition></RowDefinition>
        </Grid.RowDefinitions>
        <!-- 受影响的控件 -->
        <!-- 使用资源 -->
        <Border Grid.Row="0" Style="{StaticResource EasyBorder}">
        </Border>
        <Border Grid.Row="1"></Border>

    </Grid>
</Window>
```

### 控件模板及触发器

> WPF的ControlTemplate是一种用于定义和自定义控件的外观和结构的模板,它可以完全替换控件的默认模板,实现个性化和复杂的效果
>
> WPF的ControlTemplate有以下几个特点：
>
> + ControlTemplate是一个XAML元素,它可以包含任何类型的UI元素,如布局、形状、图像、文本等,这些元素构成了控件的视觉树(VisualTree)
> + ControlTemplate可以使用TemplateBinding或Binding来绑定控件的属性或数据,从而实现动态的显示和更新
> + ControlTemplate可以使用Triggers来定义控件对不同的条件或事件的响应,如改变属性、播放动画、执行操作等
> + ControlTemplate可以使用ContentPresenter或ItemsPresenter来呈现控件的内容或子元素,从而保留控件的基本功能
> + ControlTemplate可以在Style或ResourceDictionary中定义,并应用到一个或多个控件上,从而实现资源的重用和管理

> WPF的Trigger是一种用于定义和管理XAML资源的触发器,它可以根据不同的条件或事件来改变控件的属性或行为。以下是触发器的类型：
>
> + 基本触发器(Trigger):这种触发器是根据控件自身的依赖属性的值来触发的,例如,当鼠标移动到按钮上时,改变按钮的背景色
> + 数据触发器(DataTrigger):这种触发器是根据绑定的数据的值来触发的,例如,当绑定的数据为真时,显示一个图标
> + 事件触发器(EventTrigger):这种触发器是根据控件的路由事件来触发的,例如,当按钮被点击时,播放一个动画
> + 多条件触发器（MultiTrigger、MultiDataTrigger):这种触发器是根据多个条件的组合来触发的,例如,当控件的属性和绑定的数据同时满足某些值时,改变控件的样式

```xaml
<Application x:Class="StandardTest.App"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:local="clr-namespace:StandardTest"
             StartupUri="MainWindow.xaml">
    <Application.Resources>
        <!-- Button 的控件模板 -->
        <Style x:Key="ButtonTemplate" TargetType="{x:Type Button}">
            <Setter Property="FontSize" Value="16"></Setter>
            <Setter Property="FontFamily" Value="Microsoft YaHei"></Setter>
            <Setter Property="Background" Value="Red"></Setter>
            <!-- 编辑模板 -->
            <!-- 被编辑的模板其默认值、绑定、触发器、样式、事件等都会被清空 -->
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <!-- 使用 TemplateBinding 或 Binding 来绑定模板中的属性 -->
                        <Border Background="{TemplateBinding Background}"
                                BorderBrush="{TemplateBinding BorderBrush}"
                                CornerRadius="22">
                            <ContentPresenter HorizontalAlignment="Center"
                                              VerticalAlignment="Center" />
                        </Border>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
            <!-- 编辑触发器 -->
            <Style.Triggers>
                <!-- 定义鼠标悬浮时的触发器 -->
                <Trigger Property="IsMouseOver" Value="True">
                    <Setter Property="Background" Value="Blue"></Setter>
                    <Setter Property="Foreground" Value="Red"></Setter>
                </Trigger>
            </Style.Triggers>

        </Style>
    </Application.Resources>
</Application>
```

```xaml
<Window x:Class="StandardTest.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:StandardTest"
        mc:Ignorable="d"
        Title="主页" MinHeight="200" MaxHeight="200" MinWidth="200" MaxWidth="200">
    <Grid ShowGridLines="True">
        <Grid.RowDefinitions>
            <RowDefinition></RowDefinition>
            <RowDefinition></RowDefinition>
        </Grid.RowDefinitions>
        <!-- 绑定控件模板 -->
        <Button Style="{StaticResource ButtonTemplate}">1</Button>
        <Button Grid.Row="1">2</Button>
    </Grid>
</Window>
```

# 数据绑定

### 数据绑定模型

> WPF中的Binding更多地是表达一种桥梁关系
>
> Binding对象的两端分别是源(Source)和目标(Target)
>
> ![image-20231102145607240](assets/image-20231102145607240.png)
>
> 通常情况下,每个绑定具有四个组件：
>
> + 绑定目标对象(Binding Target-Dependency Object)
> + 目标属性(Dependency Property)
> + 绑定源(Binding Source-Object)
> + 指向绑定源中要使用的值的路径(Path-Property)

#### 使源实现通知能力

> 让数据源的类实现 INotifyPropertyChanged 接口,在属性的set块中激发一个 PropertyChanged 事件
>
> 当我们绑定到这个数据源上时,Binding 对象就会自动侦听来自这个接口的 PropertyChanged 事件
>
> ![image-20231102151742351](assets/image-20231102151742351.png)
>
> 封装 PropertyChanged 数据通知
>
> ```c#
> using System.Collections.Generic;
> using System.ComponentModel;
> using System.Runtime.CompilerServices;
> 
> namespace StandardTest.Tools;
> 
> /// <summary>
> /// 可观察对象
> /// </summary>
> public class ObservableObject : INotifyPropertyChanged
> {
>     /// <summary>
>     /// 属性改变事件
>     /// </summary>
>     public event PropertyChangedEventHandler? PropertyChanged;
> 
>     /// <summary>
>     /// 属性改变事件
>     /// </summary>
>     /// <param name="propertyName">属性名称</param>
>     private void OnPropertyChanged([CallerMemberName] string? propertyName = null)
>     {
>         PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
>     }
> 
>     /// <summary>
>     /// 设置字段
>     /// </summary>
>     /// <param name="field">字段</param>
>     /// <param name="value">值</param>
>     /// <param name="propertyName">属性名称</param>
>     /// <typeparam name="T">类型</typeparam>
>     /// <returns>是否设置成功</returns>
>     protected bool SetField<T>(ref T field, T value, [CallerMemberName] string? propertyName = null)
>     {
>         if (EqualityComparer<T>.Default.Equals(field, value)) return false;
>         field = value;
>         OnPropertyChanged(propertyName);
>         return true;
>     }
> }
> ```

#### 实现绑定的后置代码

> 实例化Binding对象,并设置源和路径,使用BindingOperations.SetBinding()实现数据源与目标链接,其三个参数为：目标对象、目标的依赖属性、Binding对象
>
> ![image-20231102151815554](assets/image-20231102151815554.png)
>
> 在实现数据绑定时,我们需要注意下面的要点：
>
> + 建立绑定需要使用Binding对象
> + 在建立绑定时,需要设置源和路径,然后将绑定目标绑定到绑定源
> + 目标属性必须为依赖属性
> + 绑定源对象不限于自定义.NET对象

#### 数据流的方向

> 可以通过设置Binding.Mode来控制数据流：
>
> + OneWay:对源属性的更改会自动更新目标属性,但对目标属性的更改不会传播回源属性
> + TwoWay:更改源属性或目标属性时会自动更新另一方,也就是双向数据绑定
> + OneWayToSource:当目标属性更改时,它会更新源属性,反之则不会
> + OneTime:会使源属性初始化目标属性,但不传播后续更改
>
> ![image-20231102152446792](assets/image-20231102152446792.png)

#### 触发源更新的因素

|           更新源触发器            |       源值更新时间       |
| :-------------------------------: | :----------------------: |
| LostFocus( TextBox.Text 的默认值) |  TextBox 控件失去焦点时  |
|          PropertyChanged          |     键入 TextBox 时      |
|             Explicit              | 应用调用 UpdateSource 时 |

![image-20231102165027726](assets/image-20231102165027726.png)

### Binding源的指定

> 一个对象只要通过属性公开自己的数据,就可以作为Binding的源
>
> 作为 Binding 源的对象需要实现 INotifyPropertyChanged 接口并激发 PropertyChanged? 事件才能使属性具有自动通知 Binding 发生了变化的能力
>
> 除了使用自定义类作为源以外,还有其他不同的形式

#### 将控件作为源

```xaml
<StackPanel>
    <!-- 绑定滑动条的值 -->
    <!-- Path 指定绑定的属性 -->
    <TextBox BorderBrush="BLack" Text="{Binding Path=Value,ElementName=Slider}" />
    <!-- 被绑定的滑动条 -->
    <Slider x:Name="Slider" Minimum="0" Maximum="100" Margin="10" />
    <!-- 反过来绑定 -->
    <TextBox x:Name="TextBox" BorderBrush="Black"></TextBox>
    <Slider Minimum="0" Maximum="100" Margin="10" Value="{Binding Path=Text,ElementName=TextBox}" />
</StackPanel>
```

#### DataContext 作为源

> DataContext是数据上下文,它用于将数据模型与UI元素进行绑定
>
> 每个U元素都有一个DataContext属性,它指定了该元素的数据模型当我们使用DataContextf作为数据源时,它会自动将UI元素的数据源设置为当前窗口或用户控件的DataContext属性
>
> 所以在XAML文件中使用{Binding}语法来绑定时而无需指定任何其他源,因此这种形式也称作无源数据绑定

```c#
// 数据类
public class Employee
{
    public string? Name { get; set; }
}
```

+ 视图声明

```xaml
<Window.DataContext>
    <!-- 在视图中声明数据上下文 -->
    <local:Employee Name="小红"></local:Employee>
</Window.DataContext>
<StackPanel>
    <!-- 绑定数据 -->
    <TextBox Text="{Binding Path=Name}"></TextBox>
</StackPanel>
```

```c#
public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
    }

    private void Button_Click(object sender, RoutedEventArgs e)
    {
        // 读取数据上下文
        var employee = (Employee)DataContext;
        Console.WriteLine(employee.Name);
    }
}
```

+ 后置声明

```xaml
<StackPanel>
    <!-- 绑定数据 -->
    <TextBox Text="{Binding Path=Name}"></TextBox>
    <!-- 触发后置输出 -->
    <Button Content="输出" Click="Button_Click"></Button>
</StackPanel>
```

```c#
public partial class MainWindow : Window
{
    private readonly Employee employee = new() { Name = "小白" };

    public MainWindow()
    {
        InitializeComponent();
        DataContext = employee;
    }

    private void Button_Click(object sender, RoutedEventArgs e)
    {
        // 输出数据上下文的值
        Console.WriteLine(employee.Name);
    }
}
```

> **属性值向下传递**
> 在Binding通过元素树向根结点处方向寻找DataContext的现象,其实只是一种描述效果
>
> 真正的过程其实是结点上的属性值向下传递了,这是因为DataContext,是一个依赖属性,而依赖属性有一个特性,当你没有为控件的某个属性显式地赋值时,它就会把自己所在容器的属性值拿过来,当作自己的属性值

#### 将集合对象作为列表控件的源

![image-20231206164117315](assets/image-20231206164117315.png)

```xaml
<StackPanel>
    <TextBlock>当前选择的年龄为:</TextBlock>
    <TextBox x:Name="AgeText"></TextBox>
    <!-- 选择列表项会将选中的对象属性绑定给上面 -->
    <TextBlock>列表项:</TextBlock>
    <ListBox x:Name="ListBox"></ListBox>
</StackPanel>
```

```c#
// 没有通知能力
public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
        List<Employee> employees = new List<Employee>()
        {
            new() { Username = "小白", Age = 23 },
            new() { Username = "小黑", Age = 24 },
            new() { Username = "小红", Age = 25 },
        };
        // 指定条目控件的源和路径来实现绑定
        ListBox.ItemsSource = employees;
        ListBox.DisplayMemberPath = "Username";
        // 使用后置代码实现控件间绑定
        Binding binding = new Binding("SelectedItem.Age") { Source = ListBox };
        AgeText.SetBinding(TextBox.TextProperty, binding);
    }
}
// 有通知能力
public partial class MainWindow : Window
{
    /**
     *  ObservableCollection 实现了  INotifyCollectionChanged,INotifyPropertyChanged
     *  在集合更新时通知视图
     */
    private readonly ObservableCollection<Employee> employees;

    public MainWindow()
    {
        InitializeComponent();
        employees = new ObservableCollection<Employee>()
        {
            new() { Username = "小白", Age = 23 },
            new() { Username = "小黑", Age = 24 },
            new() { Username = "小红", Age = 25 },
        };
        // 指定条目控件的源和路径来实现绑定
        ListBox.ItemsSource = employees;
        ListBox.DisplayMemberPath = "Username";
        // 使用后置代码实现控件间绑定
        Binding binding = new Binding("SelectedItem.Age") { Source = ListBox };
        AgeText.SetBinding(TextBox.TextProperty, binding);
    }

    private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
    {
        // 添加
        employees.Add(new Employee() { Username = "小绿", Age = 21 });
    }
}
```

#### ADO.NET 对象作为源

> 在.NET项目开发时,我们使用ADO.NET类对数据进行操作
>
> 常见的形式是从数据库把数据读到 DataTable 中,再把 DataTable 展示在Ul列表控件里
>
> 在实际的项目中,我们一般会先把 DataTable 转换为自定义的集合类型,不过WPF的 Binding 仍然也会支持列表控件直接与 DataTable 之间直接建立 Binding

#### 使用 DataSourceProvider 类的子类成员作为源

> DataSourceProvider 类是一个抽象基类,它定义了一些公共属性和方法,用来执行某些查询,生成可以用作绑定源的单个对象或对象列表
>
> DataSourceProvider 类支持标准的Windows窗体数据绑定模型,可以处理不同类型的数据源,例如SQL数据库,XML文档,数组集合等
>
> DataSourceProvider 类还实现了 INotifyPropertyChanged 和 ISupportInitialize 接口,用来提供对绑定和初始化的支持

##### XmlDataProvider

> XML是一种可扩展标记语言,它可以用来存储和传输数据
>
> XML的特点是它可以自定义标签,用来描述数据的结构和含义
>
> XML可以与其他技术一起使用来处理和转换数据
>
> XML也可以用作配置文件,元数据,富文档等
>
> .NET提供了DOM (Document Object Model) 文档对象模型类库用于处理XML数据,包括KmlDoucument、XmlElement等类,是传统的、功能强大的类库

```xml
<?xml version="1.0" encoding="utf-8"?>
<!--xml测试数据-->
<GoondsList>
    <Goods Id="1">
        <Name>小白</Name>
        <Age>21</Age>
    </Goods>
    <Goods Id="2">
        <Name>小绿</Name>
        <Age>22</Age>
    </Goods>
    <Goods Id="3">
        <Name>小红</Name>
        <Age>23</Age>
    </Goods>
</GoondsList>
```

```xaml
<StackPanel>
    <ListView x:Name="List">
        <ListView.View>
            <GridView>
                <!-- 每一列都绑定xml的一个属性 -->
                <GridViewColumn Header="Id" Width="100" DisplayMemberBinding="{Binding XPath=@Id}" />
                <GridViewColumn Header="Name" Width="100" DisplayMemberBinding="{Binding XPath=Name}" />
                <GridViewColumn Header="Age" Width="100" DisplayMemberBinding="{Binding XPath=Age}" />
            </GridView>
        </ListView.View>
    </ListView>
</StackPanel>
```

```c#
public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();

        // XmLDataProvider用于支持对 xml 数据的访问,以便于数据绑定
        var xmlProvider = new XmlDataProvider
        {
            // xml 地址
            Source = new Uri(@"D:\.work_documents\Syncdisk\ProjectCode\C#\EquipmentRandomTesting\Goods.xml"),
            // 数据路径
            XPath = "/GoodsList/Goods"
        };
        // 设置数据上下文
        List.DataContext = xmlProvider;
        // 绑定属性
        List.SetBinding(ListView.ItemsSourceProperty, new Binding());
    }
}
```

##### ObjectDataProvider

> ObjectDataProvider 能够将对象进行包装,作为数据源提供给Binding
>
> 被包装的对象作为 ObjectDataProvider 的Objectlnstance 属性,我们可以通过 MethodName 属性来指明要调用的方法,使用 MethodParameters 属性来传入参数,其是一个集合,因此可以使用下标形式指定和访问
>
> 运行方法的结果会保存在 Data 属性中。
>
> ![image-20231207083428469](assets/image-20231207083428469.png)

```c#
/// <summary>
/// 计算类
/// </summary>
public class Calculator
{
    public string Add(string para1, string para2)
    {
        if (double.TryParse(para1, out var arg1) && double.TryParse(para2, out var arg2))
        {
            var outcome = arg1 + arg2;
            return outcome.ToString(CultureInfo.InvariantCulture);
        }

        return "非法输入";
    }
}
```

```xaml
<StackPanel>
    <!-- 输入控件 -->
    <TextBox x:Name="TextBox1"></TextBox>
    <TextBox x:Name="TextBox2"></TextBox>
    <!-- 触发包装对象方法 -->
    <Button Content="相加" Click="ButtonBase_OnClick"></Button>
    <!-- 输出包装对象值 -->
    <TextBox x:Name="OutText"></TextBox>
</StackPanel>
```

```c#
public partial class MainWindow : Window
{
    private ObjectDataProvider objectDataProvider;

    public MainWindow()
    {
        InitializeComponent();
        SetBinding();
    }

    private void SetBinding()
    {
        // 实例化
        objectDataProvider = new ObjectDataProvider
        {
            // 实例化包装对象
            ObjectInstance = new Calculator(),
            // 设置要调用的方法
            MethodName = "Add",
            // 要传入的参数占位
            MethodParameters = { "0", "0" }
        };
        // 设定输入绑定,指定绑定到第几个占位
        Binding bindingPara1 = new Binding("MethodParameters[0]")
        {
            Source = objectDataProvider,
            Mode = BindingMode.OneWayToSource,
            BindsDirectlyToSource = true
        };
        Binding bindingPara2 = new Binding("MethodParameters[1]")
        {
            Source = objectDataProvider,
            Mode = BindingMode.OneWayToSource,
            BindsDirectlyToSource = true
        };
        TextBox1.SetBinding(TextBox.TextProperty, bindingPara1);
        TextBox2.SetBinding(TextBox.TextProperty, bindingPara2);
    }

    // 触发
    private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
    {
        // 读取包装对象数据
        OutText.Text = objectDataProvider.Data.ToString();
    }
}
```

> 我们通常把数据的来源定为 Binding 的 Source,去往哪里定为 Target
>
> - 非依赖属性不能作为 Binding 的目标
> - 数据驱动的理念要求应尽可能选择数据对象作为源,UI元素作为目标

#### LINQ 查询结果作为源

> LNQ的查询结果是可以作为数据绑定的数据源的,这是因为其查询结果是一个 IEnumerable<T> 对象,所以可以作为列表控件的 ltemSource 来使用

```xaml
<StackPanel>
    <ListView x:Name="View">
        <ListView.View>
            <GridView>
                <GridViewColumn Header="Name" DisplayMemberBinding="{Binding Name}"></GridViewColumn>
                <GridViewColumn Header="Name" DisplayMemberBinding="{Binding Age}"></GridViewColumn>
            </GridView>
        </ListView.View>
    </ListView>
</StackPanel>
```

```c#
public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
        List<Employee> employees = new List<Employee>()
        {
            new() { Name = "John", Age = 25 },
            new() { Name = "Mary", Age = 30 },
            new() { Name = "Peter", Age = 35 },
        };
        // LINQ 语法查询结果绑定源
        View.ItemsSource = from v in employees where v.Age > 25 select v;
    }
}
```

#### RelativeSource

> 当我们不能确定源对象的名称,但是能知道其与目标对象在U儿布局上有层级关系时,可以使用 RelativeSource 属性
>
> RelativeSource 属性数据类型为 RelativeSource 类,其 Mode 属性的类型是 RelativeSourceMode 枚举,其取值有 PreviousData 、TemplateParent 、Self 和 FindAncestor
>
> 对于前三个枚举值还有同名的静态属性,它们的类型是 RelativeSource 类
>
> ---
>
> - PreviousData 绑定到集合中当前项的前一项的数据
> - TemplateParent 绑定到应用了控件模板的控件的属性
> - Self 绑定到绑定目标本身的属性
> - FindAncestor 绑定到绑定目标的某个祖先元素（结点或根元素）的属性

```xaml
<DockPanel Background="Aquamarine">
    <Grid Background="Bisque" Margin="10">
        <DockPanel Background="Pink" Margin="10">
            <Grid Background="Coral" Margin="10">
                <!-- 将背景颜色绑定到父级的属性 -->
                <!-- Mode 指定查找模式,这里是查找祖先元素 -->
                <!-- AncestorType 指定查找的祖先元素类型 -->
                <!-- AncestorLevel 指定查找的祖先元素层级 -->
                <TextBox
                    Background="{Binding RelativeSource={
                    RelativeSource Mode=FindAncestor,
                    AncestorType={x:Type DockPanel},
                    AncestorLevel=2},Path=Background}">
                </TextBox>
            </Grid>
        </DockPanel>
    </Grid>
</DockPanel>
```

### Binding 路径的指定

> - Binding 支持多级路径
> - 无需指定路径时,在XAML代码中绑定时可以省略不写,但在C#代码中需要使用 . 代替

### 数据校验与数据转换

> 若在数据传输的过程中,需要对数据进行限制,可以在 Binding 上设置数据校验
>
> 若要对数据类型进行转换,可以在 Binding 上设置数据转换,编写数据转换器
>
> WPF在 Binding 上提供了 Validation 进行校验, Converter 进行转换

#### 数据校验

> Binding 用于数据校验的属性是 ValidationRules ,在WPF中,要实现 Binding 的数据校验,需要以下几个步骤：
>
> - 定义一个继承自 ValidationRule 的类,重写其 Validate 方法,根据自己的逻辑和条件,返回一个 ValidationResult 对象,表示数据是否有效,以及无效时的错误信息
> - 在Binding对象中添加一个或多个 ValidationRule 对象,表示要对数据应用哪些校验规则
> - 可以设置 ValidationRule s属性的 ValidatesOnTargetUpdated 属性为 true,表示要在目标更新时也进行校验
> - 在 Binding 对象中设置 NotifyOnValidationError 属性为true,表示当数据校验失败时,要通知绑定目标或其祖先元素
> - 编写校验失败时执行的事件处理器（方法）,获取事件参数,获取错误信息,编写显示错误信息的代码或其它执行内容
> - 在目标或祖先元素上添加一个事件处理器,用于处理 Validation.ErrorEvent 事件,传入委托并指定方法
>
> ---
>
> 简化如下:
>
> - 编写校验规则类
> - 为Binding添加校验规则
> - 打开校验通知开关
> - 编写校验失败事件处理器
> - 处理校验失败事件

```xaml
<StackPanel Background="LightBlue">
    <TextBox x:Name="Box1"></TextBox>
    <TextBox x:Name="Box2"></TextBox>
    <Button Content="触发校验" Click="ButtonBase_OnClick"></Button>
    <Label Content="结果:"></Label>
    <TextBlock x:Name="Block"></TextBlock>
</StackPanel>
```

```c#
/// <summary>
/// 计算类
/// </summary>
public class Calculator
{
    public string Divide(string para1, string para2)
    {
        if (double.TryParse(para1, out var arg1) && double.TryParse(para2, out var arg2))
        {
            var outcome = arg1 / arg2;
            return outcome.ToString(CultureInfo.InvariantCulture);
        }

        return "非法输入";
    }
}
```

```c#
/// <summary>
/// 校验规则类
/// </summary>
public class ParasCheck : ValidationRule
{
    public override ValidationResult Validate(object? value, CultureInfo cultureInfo)
    {
        // 判断是否为0
        if (double.TryParse(value?.ToString(), out var num))
        {
            if (num == 0)
            {
                // 校验异常返回校验结果和异常信息
                return new ValidationResult(false, "除数不能为0");
            }
        }

        // 检验没问题返回正常
        return ValidationResult.ValidResult;
    }
}
```

```c#
public partial class MainWindow : Window
{
    private ObjectDataProvider odp;

    public MainWindow()
    {
        InitializeComponent();
        SetBinding();
    }

    private void SetBinding()
    {
        // 包装Calculator类
        odp = new ObjectDataProvider
        {
            ObjectInstance = new Calculator(),
            MethodName = "Divide",
            MethodParameters = { "0", "0" },
        };
        // 绑定到TextBox
        Binding binding1 = new Binding("MethodParameters[0]")
        {
            Source = odp,
            Mode = BindingMode.OneWayToSource,
            BindsDirectlyToSource = true,
        };
        Binding binding2 = new Binding("MethodParameters[1]")
        {
            Source = odp,
            Mode = BindingMode.OneWayToSource,
            BindsDirectlyToSource = true,
            UpdateSourceTrigger = UpdateSourceTrigger.Explicit
        };
        // 实例化校验规则对象
        var psc = new ParasCheck
        {
            // 设定在更新源时也进行校验
            ValidatesOnTargetUpdated = true
        };
        // 添加校验规则
        binding2.ValidationRules.Add(psc);
        // 启用校验失败时的通知能力
        binding2.NotifyOnValidationError = true;
        // 添加校事件处理器
        Box2.AddHandler(Validation.ErrorEvent, new RoutedEventHandler(OnError));

        // 绑定源
        Box1.SetBinding(TextBox.TextProperty, binding1);
        Box2.SetBinding(TextBox.TextProperty, binding2);
    }

    // 触发校验
    private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
    {
        // 获取绑定表达式
        var boxEx = Box2.GetBindingExpression(TextBox.TextProperty);
        // 更新源
        boxEx?.UpdateSource();
        // 如果校验通过
        if (!Validation.GetHasError(Box2))
        {
            Block.Text = odp.Data.ToString();
        }
    }

    // 监听校验失败事件
    private void OnError(object sender, RoutedEventArgs e)
    {
        // 获取校验失败事件参数
        var args = e as ValidationErrorEventArgs;
        // 获取错误信息
        var error = args?.Error.ErrorContent.ToString();
        // 处理错误
        Block.Text = error;
    }
}
```

> ![image-20231207101726933](assets/image-20231207101726933.png)
>
> 使用WPF数据检验可以提高代码的质量和效率,增强用户体验和交互性
>
> - WPF数据检验将校验功能独立出来,可以将验证逻辑和视图逻辑分离,使得代码更加清晰和可维护
> - 利用 Binding 对象的各种属性和事件,实现数据的自动更新和错误的通知
> - 数据检验可以使用不同的验证规则,实现不同的验证需求,使用预定好的类来编写验证功能更加规范和方便,也可以为一个绑定添加多个规则,实现重用
> - WPF数据检验可以使用 ErrorTemplate 属性,实现对验证失败时的视觉反馈,例如显示红色的感叹号或边框等

#### 数据转换

> WPF提供了两种数据转换的方式：
>
> > 值转换器方法(Converter),绑定后,触发转换器,转换器负责把值转换成需要的内容,转换器需要实现 System.Vindows.Data 命名空间的 IValueConverter 接口或 IMultiValueConverter 接口,分别用于单值转换和多值转换
> >
> > 转换器可以在XAML中定义为资源,并在绑定中引用
>
> >DataTrigger方法,直接在XAML里面对数据进行处理,展示所需要的内容
> >
> >DataTrigger 可以根据绑定的数据的值或条件来改变控件的属性或样式
> >
> >DataTrigger 可以在 Style 或 ControlTemplate 中定义

+ Converter - 值转换器

> ```c#
> /// <summary>
> /// 数据转换类
> /// </summary>
> public class ShowConversion : IValueConverter
> {
>     // 用于将数据从源绑定转换为目标绑定时调用
>     public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
>     {
>         // 将 bool 转换为 Visibility 枚举
>         return value is true ? Visibility.Visible : Visibility.Collapsed;
>     }
> 
>     // 用于将数据从目标绑定转换为源绑定时调用
>     public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
>     {
>         throw new NotImplementedException();
>     }
> }
> ```
>
> ```xaml
> <Window.Resources>
>     <!-- 声明转换器资源 -->
>     <local:ShowConversion x:Key="ShowConversion"></local:ShowConversion>
> </Window.Resources>
> <StackPanel Background="LightBlue">
>     <StackPanel Orientation="Horizontal">
>         <RadioButton Content="Add" IsChecked="{Binding AddIsVisible}"></RadioButton>
>         <RadioButton Content="Divide" IsChecked="{Binding DivideIsVisible}"></RadioButton>
>     </StackPanel>
>     <StackPanel Orientation="Horizontal">
>         <!-- 绑定对应的标志位及转换器 -->
>         <Button Content="Add" Visibility="{Binding AddIsVisible,Converter={StaticResource ShowConversion}}">
>         </Button>
>         <Button Content="Divide" Visibility="{Binding DivideIsVisible,Converter={StaticResource ShowConversion}}">
>         </Button>
>     </StackPanel>
> </StackPanel>
> ```
>
> ```c#
> public partial class MainWindow : Window
> {
>     private readonly ButtonVisible buttonVisible = new();
> 
>     public MainWindow()
>     {
>         InitializeComponent();
>         DataContext = buttonVisible;
>         buttonVisible.AddIsVisible = true;
>         buttonVisible.DivideIsVisible = false;
>     }
> }
> ```
>
> ```c#
> /// <summary>
> /// 按钮可见性
> /// </summary>
> public class ButtonVisible : ObservableObject
> {
>     private bool addIsVisible;
> 
>     public bool AddIsVisible
>     {
>         get => addIsVisible;
>         set
>         {
>             SetField(ref addIsVisible, value);
>             if (value)
>             {
>                 DivideIsVisible = false;
>             }
>         }
>     }
> 
>     private bool divideIsVisible;
> 
>     public bool DivideIsVisible
>     {
>         get => divideIsVisible;
>         set
>         {
>             SetField(ref divideIsVisible, value);
>             if (value)
>             {
>                 AddIsVisible = false;
>             }
>         }
>     }
> }
> ```

+ DataTrigger - 数据触发器

> ```xaml
> <Window.Resources>
>  <!-- DataTrigger式 -->
>  <Style x:Key="AddButton" TargetType="Button">
>      <!-- 设置按钮默认不可见 -->
>      <Setter Property="Visibility" Value="Collapsed"></Setter>
>      <!-- 设置触发器 -->
>      <Style.Triggers>
>          <DataTrigger Binding="{Binding IsChecked,ElementName=Add}" Value="true">
>              <Setter Property="Visibility" Value="Visible"></Setter>
>          </DataTrigger>
>      </Style.Triggers>
>  </Style>
>  <Style x:Key="DivButton" TargetType="Button">
>      <!-- 设置按钮默认不可见 -->
>      <Setter Property="Visibility" Value="Collapsed"></Setter>
>      <!-- 设置触发器 -->
>      <Style.Triggers>
>          <DataTrigger Binding="{Binding IsChecked,ElementName=Divide}" Value="true">
>              <Setter Property="Visibility" Value="Visible"></Setter>
>          </DataTrigger>
>      </Style.Triggers>
>  </Style>
> </Window.Resources>
> <StackPanel Background="LightBlue">
>  <StackPanel Orientation="Horizontal">
>      <RadioButton x:Name="Add" Content="Add" IsChecked="{Binding AddIsVisible}"></RadioButton>
>      <RadioButton x:Name="Divide" Content="Divide" IsChecked="{Binding DivideIsVisible}"></RadioButton>
>  </StackPanel>
>  <StackPanel Orientation="Horizontal">
>      <!-- 绑定对应的标志位及转换器 -->
>      <Button Content="Add" Style="{StaticResource AddButton}">
>      </Button>
>      <Button Content="Divide" Style="{StaticResource DivButton}">
>      </Button>
>  </StackPanel>
> </StackPanel>
> ```

### MultiBinding

> WPF的MultiBinding是一种数据绑定的方法,它可以将多个数据源的值绑定到一个目标属性上,也就是说需要显示的信息不止由一个数据源来决定,例如将多个字符串拼接成一个文本,或者将多个布尔值进行逻辑运算得到一个可见性值
>
> 多路绑定一般都需要使用到多值转换器,MultiBinding需要使用一个实现了IMultiValueConverter接口的转换器,来定义如何将多个源值转换为目标值,以及如何将目标值转换回源值

```xaml
<Window.Resources>
    <!-- 评价转换器 -->
    <local:RatingConverter x:Key="RatingConverter" />
</Window.Resources>
<Grid>
    <!-- 绑定产品列表 -->
    <ListView ItemsSource="{Binding products}">
        <ListView.ItemContainerStyle>
            <Style TargetType="ListViewItem">
                <Setter Property="Height" Value="30" />
                <Setter Property="HorizontalContentAlignment" Value="Center" />
            </Style>
        </ListView.ItemContainerStyle>
        <ListView.View>
            <GridView>
                <GridView.ColumnHeaderContainerStyle>
                    <Style TargetType="GridViewColumnHeader">
                        <Setter Property="Height" Value="30" />
                    </Style>
                </GridView.ColumnHeaderContainerStyle>
                <GridViewColumn Header="名称" Width="100" DisplayMemberBinding="{Binding Name}" />
                <GridViewColumn Header="质量" Width="100" DisplayMemberBinding="{Binding Score}" />
                <GridViewColumn Header="服务" Width="100" DisplayMemberBinding="{Binding Service}" />
                <GridViewColumn Header="评价" Width="100">
                    <GridViewColumn.DisplayMemberBinding>
                        <!-- 多值绑定到评价转换器 -->
                        <MultiBinding Converter="{StaticResource RatingConverter}">
                            <Binding Path="Score" />
                            <Binding Path="Service" />
                        </MultiBinding>
                    </GridViewColumn.DisplayMemberBinding>
                </GridViewColumn>
            </GridView>
        </ListView.View>
    </ListView>
</Grid>
```

```c#
public partial class MainWindow : Window
{
    // 产品列表
    public List<object> products { get; set; }

    public MainWindow()
    {
        InitializeComponent();
        products = new List<object>();
        InitializeComponent();
        products.Add(new { Name = "产品一", Score = 90, Service = 40 });
        products.Add(new { Name = "产品二", Score = 70, Service = 70 });
        products.Add(new { Name = "产品三", Score = 50, Service = 80 });
        DataContext = this;
    }
}
```

```c#
/// <summary>
/// 评价转换器
/// </summary>
public class RatingConverter : IMultiValueConverter
{
    // 用于将数据从源绑定转换为目标绑定时调用
    public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
    {
        if (int.Parse(values[0].ToString()) >= 60 && int.Parse(values[1].ToString()) >= 60)
            return "✔";
        return "✘";
    }

    // 用于将数据从目标绑定转换为源绑定时调用
    public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}
```

# 依赖属性与附加属性

### CLR属性

> CLR属性主要实现了面向对象的封装
>
> CLR属性是通过get和set访问器方法来实现的,这些方法允许你在读取或写入属性时执行自定义代码

```c#
private string? name;

// CLR 属性
public string? Name
{
    get => name;
    set => name = value;  
}
```

### 依赖属性

#### 对内存的使用机制

> > CLR属性是常见的.NET属性类型,每个对象实例都有自己的一套CLR属性
> >
> > 每当创建一个新的对象实例时,都会为该实例的所有CL属性分配内存
>
> > 依赖属性是WPF中的特殊属性类型,它的设计目标是减少内存使用
> >
> > 依赖属性并不为每个对象实例分配内存,而是将属性值存储在全局的哈希表中 
> >
> > 对于拥有依赖属性的类来说,其实例化的对象可以称作为依赖对象(Dependency Object)),WPF中允许依赖对象在被创建时并不包含用于数据存储的空间,只保留在需要用到数据时能够获得默认值或借用其他对象的数据,具有实施分配空间的能力

#### 自定义依赖属性

> 在编写一般属性时,通常是声明字段,然后添加get和set块封装为CLR属性
>
> 而在编写依赖属性时,需要进行下面四个步骤

```c#
public class Student : DependencyObject
{
     // 依赖属性 声明静态只读字段
     public static readonly DependencyProperty NameProperty = DependencyProperty.Register(
         nameof(Name), typeof(string), typeof(Student), new PropertyMetadata(default(string)));
     
     // CLR属性包装器
     public string Name
     {
         get => (string) GetValue(NameProperty);
         set => SetValue(NameProperty, value);
     }
}z
```

> 依赖属性声明参数
>
> `DependencyProperty.Register( Para1 , Para2 , Para3 , Para4 , Para5 );`
>
> + Para1 : 指定依赖属性的 CLR 属性包装器
> + Para2 : 指定依赖属性储存什么类型的值
> + Para3 : 指定依赖属性的宿主类型
> + Para4 : 指定依赖属性功能,如:默认值、回调函数、继承、绑定等
> + Para5 : 委托校验器

#### 只读依赖属性

> 在WPF中只读的依赖属性的定义方式与一般依赖属性的定义方式基本一样,只读依赖属性仅仅是用 DependencyProperty.RegisterReadonly 替换了 DependencyProperty.Register

```c#
public class Member : DependencyObject
{
    public void Initialize()
    {
        SetValue(NameKey, 9);
    }

    // 依赖属性 声明静态只读字段
    private static readonly DependencyPropertyKey NameKey =
        DependencyProperty.RegisterReadOnly(nameof(Name),
            typeof(string),
            typeof(Member),
            new PropertyMetadata(0));

    // 属性包装器,只提供 GetValue ,也可以设置 private 的 SetValue 进行限制
    public string Name
    {
        get => (string)GetValue(NameKey.DependencyProperty);
    }
}
```

#### 依赖属性的继承

> 元素可以从其在对象树中的父级继承依赖属性的值
>
> 属性值继承是一种机制,通过这种机制,依赖属性值可以在包含该属性的元素树中从父元素传播到子元素

```xaml
<Window x:Class="EquipmentRandomTesting.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:EquipmentRandomTesting"
        mc:Ignorable="d"
        Title="主页" Height="450" Width="800"
        FontSize="16">
    <!-- 在根部声明 字体大小 依赖属性 -->
    <StackPanel>
        <!-- 接收元素树的依赖属性传播 -->
        <TextBlock>txt1</TextBlock>
        <Canvas>
            <TextBlock Canvas.Top="100">txt2</TextBlock>
        </Canvas>
        <!-- 显示定义自己的依赖属性 -->
        <!-- 继承被打断 -->
        <TextBlock TextElement.FontSize="32">txt3</TextBlock>
    </StackPanel>
</Window>
```

#### 依赖属性的优先级

> WPF属性系统中任何基于属性的输入都可以设置依赖属性的值
>
> 由于存在依赖属性值优先级,使得属性获取值的方式的各种方案得以按可预测的方式交互

```xaml
<StackPanel> 
    <StackPanel.Resources>
        <!-- 声明资源并指定控件元素 -->
        <Style TargetType="{x:Type Button}">
            <Setter Property="Background" Value="Orange"></Setter>
        </Style>
    </StackPanel.Resources>
    <!-- 默认使用资源指定样式 -->
    <Button>按钮1</Button>
    <!-- 对属性设定值提升优先级 -->
    <Button Background="DarkGreen">按钮2</Button>
</StackPanel>
```

> WPF每访问一个依赖属性,它都会按照下面的顺序由高到底处理该值
>
> 具体优先级`从最高到最低`排序如下：
>
> + 动画
> + 绑定
> + 本地值
> + 自定义 Style Trigger
> + 自定义 Template Trigger
> + 自定义 Style Setter
> + 默认 Style Trigger
> + 默认 Style Setter
> + 继承值
> + 默认值

### 附加属性

> 附加是一种特殊的依赖属性。附加属性是说,一个属性本来不属于某个对象,但是由于某种需求而被后来附加上,表现出来的就是被环境赋予的属性
>
> 它允许给一个对象添加一个值,而该对象可能对这个值一无所知
>
> 附加属性的作用就是将属性与数据类型,也就是宿主,进行解耦,让数据类型的设计更加灵活

```xaml
<Grid>
    <Grid.ColumnDefinitions>
        <ColumnDefinition></ColumnDefinition>
        <ColumnDefinition></ColumnDefinition>
    </Grid.ColumnDefinitions>
    <!-- 将Border置于Grid中,其就拥有了Grid.Column等附加属性 -->
    <Border Grid.Column="1" Background="Red"></Border>
</Grid>
```

### 自定义附加属性

> 自定义附加属性和定义一般的依赖属性一样没什么区别,只是用RegisterAttached方法代替了Register方法

```c#
/// <summary>
/// 自定义附加属性类
/// </summary>
public class AttachedPropertyClass
{
    /**
     * 1. 附加属性的名称
     * 2. 附加属性的类型
     * 3. 附加属性所属的类
     * 4. 附加属性的元数据
     */
    // 通过使用 RegisterAttached 来注册一个附加属性
    public static readonly DependencyProperty IsAttachedProperty =
        DependencyProperty.RegisterAttached
        ("IsAttached", typeof(bool), typeof(AttachedPropertyClass),
            new FrameworkPropertyMetadata(false));

    // 通过静态方法的形式暴露读的操作
    public static bool GetIsAttached(DependencyObject dpo)
    {
        return (bool)dpo.GetValue(IsAttachedProperty);
    }

    public static void SetIsAttached(DependencyObject dpo, bool value)
    {
        dpo.SetValue(IsAttachedProperty, value);
    }
}
```

