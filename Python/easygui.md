# easygui

+ 简单的图像化界面
+ 对于 **EasyGui** 的所有对话框而言，前两个参数都是 **消息主体** 和 **对话框标题**

## egdemo

```py
import easygui

easygui.egdemo()
# 将 Easygui 拥有的各种功能打印至控制台
```

## msgbox

+ 消息弹窗

```py
import easygui as eg

print(eg.msgbox(msg='Holle Word',title='一个简单的GUI',ok_button='确认',image='shock.ico',root=None))
# msg=需要显示的内容   title=窗口的标签   ok_button=按钮显示的文本   image=显示图片   root=顶级 Tk 小部件
# 返回值：OK返回按钮文本，图片返回图片路径，关闭返回None
```

## ccbox

+ 双向选择

```py
print(eg.ccbox(msg='Holle Word',title='一个简单的GUI',choices=('确认','放弃'),image='shock.ico'))
# msg=需要显示的内容   title=窗口的标签   choices=元祖类型两个选项   image=显示图片
# 返回值：按钮1返回True，按钮2返回False,关闭返回None
```

## ynbox

+ 双向选择——按钮快捷键

```py
import easygui as eg

print(eg.ynbox(msg='Holle Word',title='一个简单的GUI',choices=('[<F1>]Yes','[<F2>]No'),default_choice='[<F1>]Yes',cancel_choice='[<F2>]No',image=None))
# msg=需要显示的内容   title=窗口的标签   choices=元祖类型2个选项   image=显示图片   default_choice=按钮1快捷键   cancel_choice=按钮2快捷键
# 返回值：返回判断值，关闭返回None
```

## buttonbox

+ 多项选择

```py
	a = ('石头','剪刀','布')
print(eg.buttonbox(msg='Holle Word',title='一个简单的GUI',choices=a,image='shock.ico'))
# msg=需要显示的内容   title=窗口的标签   choices=元祖类型多个选项   image=显示图片
# 返回值：返回按钮文本，关闭返回None
```



