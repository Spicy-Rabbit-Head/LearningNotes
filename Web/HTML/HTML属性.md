# 全局属性

### accesskey —— 设置访问元素的键盘快捷键

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
    </head>
    <body>
        <!--设置为 alt + h-->
        <a href="http://baidu.com" accesskey="h">百度</a>
    </body>
</html>
```

### class —— 定义了元素的类名

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
        <style>
            .p1 {
                color: coral;
            }
        </style>
    </head>
    <body>
        <!--定义链接的类名，使用空格间隔可定义多个类-->
        <p class="p1">23333</p>
    </body>
</html>
```

### id —— 规定元素的唯一 id

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
        <style>
            #q1 {
                color: coral;
            }
        </style>
    </head>
    <body>
        <!--规定元素的唯一 id-->
        <p id="q1">112</p>
    </body>
</html>
```

### contenteditable —— 指定元素内容是否可编辑

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
    </head>
    <body>
        <!--定义元素是否可编辑-->
        <p contenteditable="true">112</p>
    </body>
</html>
```

### dir —— 规定元素内容的文本方向

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
    </head>
    <body>
        <!--规定元素内容的文本方向-->
        <p dir="rtl">112</p>
    </body>
</html>
```

### draggable —— 规定元素是否可拖动

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
    </head>
    <body>
        <!--规定元素是否可拖动-->
        <p draggable="true">112</p>
    </body>
</html>
```

### hidden —— 规定对元素进行隐藏

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
    </head>
    <body>
        <!--规定对元素进行隐藏-->
        <p hidden>112</p>
    </body>
</html>
```

### lang —— 规定元素内容的语言

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
    </head>
    <body>
        <!--规定元素内容的语言-->
        <p lang="fr">112</p>
    </body>
</html>
```

### spellcheck —— 规定是否对元素内容进行拼写检查

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
    </head>
    <body>
        <!--规定是否对元素内容进行拼写检查-->
        <p spellcheck="true" contenteditable="true">1</p>
    </body>
</html>
```

### style —— 规定元素的行内样式

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
    </head>
    <body>
        <!--规定元素的行内样式-->
        <p style="color: coral">1</p>
    </body>
</html>
```

### title —— 规定关于元素的额外信息

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
    </head>
    <body>
        <!--规定元素的行内样式-->
        <p title=" 不要点我呀">1</p>
    </body>
</html>
```

# a 链接标签属性

### download —— 定义了下载链接的地址

```html
<!--定义了下载链接的地址-->
<a href="#" download="2.jpg">2</a>
```

### href —— 用于指定超链接目标的 URL

 ```html
 <!--用于指定超链接目标的 URL-->
 <a href="http://baidu.com">点</a>
 ```

### hreflang —— 用于指定被链接文档的语言

```html
<!--用于指定被链接文档的语言-->
<a href="http://baidu.com" hreflang="en">点</a>
```

### target —— 链接打开方式

```html
<!--链接打开方式-->
<a href="http://baidu.com" target="_self">点</a>
<!--_blank:在新窗口中打开被链接文档-->
<!--_self:在相同的框架中打开被链接文档-->
<!--_parent:在父框架集中打开被链接文档-->
<!--_top:在整个窗口中打开被链接文档-->
```

# audio 音频标签属性

### src —— 音频文件的地址

```html
<audio src="xx.mp3"></audio>
```

### autoplay —— 规定一旦音频就绪马上开始播放

```html
<audio src="xx.mp3" autoplay></audio>
```

### controls —— 指定音频控件的显示方式

```html
<audio src="xx.mp3" controls></audio>
```

### loop —— 音频循环播放

```html
<audio src="xx.mp3" loop></audio>
```

### muted —— 规定输出应该被静音

```html
<audio src="xx.mp3" muted></audio>
```

### preload —— 是否在页面加载后载入音频

```js
<audio src="xx.mp3" preload="none"></audio>
<!--auto - 当页面加载后载入整个音频-->
<!--meta - 当页面加载后只载入元数据-->
<!--none - 当页面加载后不载入音频-->
```

# button —— 按钮标签属性

### type —— 规定按钮的类型

```html
<button type="button"></button>
<!--button - 可点击按钮-->
<!--submit - 表单提交按钮-->
<!--reset - 表单重置按钮-->
```

### name —— 为按钮规定名称

```html
<button name="txt"></button>
```

### value —— 按钮的初始值

```html
<button value="233"></button>
```

### autofocus —— 当页面加载时按钮应当自动地获得焦点

```html
<button autofocus></button>
```

### disabled —— 禁用按钮

```html
<button disabled></button>
```

### form —— 规定按钮属于一个或多个表单

```html
<button form="nameform"></button>
```

### formaction —— 规定将表单数据发送到的地址

```html
<button formaction="demo_admin.html"></button>
```

# form 表单标签属性

### action —— 向何处发送表单数据

```html
<form action="xxx,html"></form>
```

### method —— 规定如何发送表单数据

```html
<form action="xxx,html" method="get"></form>
<!--get - 表单数据以名称/值对的形式附加到 URL 中-->
<!--post - 以 HTTP post 事务的形式发送表单数-->
```

### autocomplete —— 规定表单是否应该启用自动填充功能

```html
<form autocapitalize="off"></form>
```

### name —— 规定表单的名称

```html
<form name="233"></form>
```

# img 图片标签属性

### src —— 规定图像的 URL

```html
<img src="2.jpg">
```

### height —— 规定图像的高度

### width —— 规定图像的宽度

```html
<img src="2.jpg" width="200" height="200">
```

### alt —— 规定在图像无法显示时的替代文本

```html
<img src="2.jpg" alt="图片消失了">
```

### loading —— 应立即加载图像还是延迟加载图像

```html
<img src="2.jpg" loading="lazy">
<!--lazy - 图像延迟加载，只有鼠标滚动到该图片所在位置才会显示-->
<!--eager - 图像立即加载-->
```

# input 表单元素标签属性

### type 显示的 input 元素的类型

```html
<!--定义可点击的按钮-->
<input type="button">
<!--定义复选框-->
<input type="checkbox">
<!--定义拾色器-->
<input type="color">
<!--定义 date 控件（包括年、月、日，不包括时间）-->
<input type="date">
<!--定义 date 和 time 控件-->
<input type="datetime-local">
<!--定义用于 e-mail 地址的字段-->
<input type="email">
<!--定义文件选择字段和 "浏览..." 按钮，供文件上传-->
<input type="file">
<!--定义隐藏输入字段-->
<input type="hidden">
<!--定义图像作为提交按钮-->
<input type="image">
<!--定义 month 和 year 控件-->
<input type="month">
<!--定义用于输入数字的字段-->
<input type="number">
<!--定义密码字段-->
<input type="password">
<!--定义单选按钮-->
<input type="radio">
<!--定义用于精确值不重要的输入数字的控件-->
<input type="range">
<!--义重置按钮-->
<input type="reset">
<!--定义用于输入搜索字符串的文本字段-->
<input type="search">
<!--定义提交按钮-->
<input type="submit">
<!--定义用于输入电话号码的字段-->
<input type="tel">
<!--定义一个单行的文本字段-->
<input type="text">
<!--定义用于输入时间的控件-->
<input type="time">
<!--定义用于输入 URL 的字段-->
<input type="url">
<!--定义 week 和 year 控件-->
<input type="week">
```

### value —— 规定 input 元素的值

```html
<input type="text" value="2333">
```

### autofocus —— 元素应该自动获得焦点

```html
<input type="text" autofocus>
```

### checked —— 加载时应该被预先选定的 input 元素

```html
<input type="checkbox" checked>
```

### disabled —— 禁用

```html
<input type="checkbox" disabled>
```

### maxlength —— 元素中允许的最大字符数

```html
<input type="text" maxlength="10">
```

### required —— 必需在提交表单之前填写输入字段

```html
<input type="text" required>
```

# video 视频标签属性

### src —— video 文件的本地路径

```html
<video src="xxx.mp4"></video>
```

### width —— 指定视频播放器的宽度

### height —— 指定视频播放器的高度

```html
<video src="xxx.mp4" width="200" height="200"></video>
```

### autoplay —— 一旦视频就绪马上开始播放

```html
<video src="xxx.mp4" autoplay></video>
```

### controls —— 浏览器应该为视频提供播放控件

```html
<video src="xxx.mp4" controls></video>
```

### loop —— 当视频结束后将重新开始播放

```html
<video src="xxx.mp4" loop></video>
```

### muted —— 设置或返回音频/视频是否应该被静音

```html
<video src="xxx.mp4" muted></video>
```

### poster —— 指定视频下载时显示的图像，或者在用户点击播放按钮前显示的图像

```html
<video src="xxx.mp4" poster="2.jpg"></video>
```

