# JS BOM Window对象属性

### closed —— 返回一个布尔值，该值声明了窗口是否已经关闭

```js
// 打开新窗口
function Ace(){
    win = window.open('','窗口','width=400,height=200');
}
// 关闭窗口
function Bce(){
    win.close()
}
// 查询
function Cce(){
    alert(win.closed)
}
```

### opener —— 返回对创建此窗口的窗口的引用

```js
// 返回对创建此窗口的窗口的引用
console.log(window.opener)
```

### frames —— 返回窗口中所有命名的框架

```js
// 返回窗口中所有命名的框架
console.log(window.frames)
```

### innerHeight —— 返回窗口的文档显示区的高度

```js
// 返回窗口的文档显示区的高度
console.log(window.innerHeight)
```

### innerWidth —— 返回窗口的文档显示区的宽度

```js
// 返回窗口的文档显示区的宽度
console.log(window.innerWidth)
```

### outerHeight —— 设置或返回一个窗口的外部高度

```js
// 设置或返回一个窗口的外部高度
console.log(window.outerHeight)
```

### outerWidth —— 设置或返回一个窗口的外部宽度

```js
// 设置或返回一个窗口的外部宽度
console.log(window.outerWidth)
```

### localStorage —— 在浏览器长久保存键值对

```js
// 在浏览器长久保存键值对
// 保存数据语法
window.localStorage.setItem('uname','zhaozikui');
// 读取数据语法
console.log(window.localStorage.getItem('uname'));
// 删除数据语法
window.localStorage.removeItem('uname')
```

### sessionStorage —— 在浏览器储存键值对，关闭窗口数据自动删除

```js
// 在浏览器储存键值对，关闭窗口数据自动删除
// 保存数据语法
window.sessionStorage.setItem('uname','zhaozikui');
// 读取数据语法
console.log(window.sessionStorage.getItem('uname'));
// 删除数据语法
window.sessionStorage.removeItem('uname')
// 删除所有数据
window.sessionStorage.clear()
```

### length —— 设置或返回窗口中的框架数量

```js
// 设置或返回窗口中的框架数量
console.log(window.length)
```

### name —— 设置或返回窗口的名称

```js
// 设置或返回窗口的名称
console.log(window.name)
```

### pageXOffset —— 设置或返回当前页面相对于窗口显示区左上角的 X 位置

```js
// 设置或返回当前页面相对于窗口显示区左上角的 X 位置
console.log(window.pageXOffset)
```

### pageYOffset —— 设置或返回当前页面相对于窗口显示区左上角的 Y 位置

```js
// 设置或返回当前页面相对于窗口显示区左上角的 Y 位置
console.log(window.pageYOffset)
```

### parent —— 返回当前窗口的父窗口

```js
// 返回当前窗口的父窗口
console.log(window.parent)
```

### screenLeft —— 返回相对于屏幕窗口的x坐标

```js
// 返回相对于屏幕窗口的x坐标
console.log(window.screenLeft)
```

### screenTop —— 返回相对于屏幕窗口的y坐标

```js
// 返回相对于屏幕窗口的y坐标
console.log(window.screenTop)
```

### screenX —— 返回相对于屏幕窗口的x坐标

```js
// 返回相对于屏幕窗口的x坐标
console.log(window.screenX)
```

### screenY —— 返回相对于屏幕窗口的y坐标

```js
// 返回相对于屏幕窗口的y坐标
console.log(window.screenY)
```

### self —— 返回对当前窗口的引用

```js
// 返回对当前窗口的引用
console.log(window.self)
```

### top —— 返回最顶层的父窗口

```js
// 返回最顶层的父窗口
console.log(window.top)
```

# JS BOM  Window对象方法

### alert（）—— 显示带有一段消息和一个确认按钮的警告框

```js
// 显示带有一段消息和一个确认按钮的警告框
alert('警告')
```

### atob（）—— 解码 base-64 编码的字符串

```js
// 解码 base-64 编码的字符串
console.log(atob('RUNOOB'))
```

### btoa（）—— 创建 base-64 编码的字符串

```js
// 创建 base-64 编码的字符串
console.log(btoa('RUNOOB'))
```

### blur（）—— 把键盘焦点从顶层窗口移开

```js
// 把键盘焦点从顶层窗口移开
window.blur()
```

### focus（）—— 把键盘焦点给予一个窗口

```js
// 把键盘焦点给予一个窗口
window.focus()
```

### setInterval（）—— 按照指定的周期（以毫秒计）来调用函数或计算表达式

```js
// 按照指定的周期（以毫秒计）来调用函数或计算表达式
setInterval('alert("哈哈哈哈")',3000)
```

### clearInterval（）—— 取消由 setInterval() 函数设定的定时执行操作

```js
clearInterval(a)
```

### setTimeout（）—— 用于在指定的毫秒数后调用函数或计算表达式

```js
// 用于在指定的毫秒数后调用函数或计算表达式
setTimeout('alert("哈哈哈哈")',3000)
```

### clearTimeout（）—— 可取消由 setTimeout() 方法设置的定时操作

```js
// 可取消由 setTimeout() 方法设置的定时操作
clearTimeout(a)
```

### open（）—— 打开一个新的浏览器窗口或查找一个已命名的窗口

```js
window.open(URL,name,specs,replace)
// URL:打开指定的页面的URL
// name:指定的方式打开
// specs:设定新打开的窗口
// replace：创建条目
// https://www.runoob.com/jsref/met-win-open.html
```

### close（）—— 用于关闭浏览器窗口

```js
// 用于关闭浏览器窗口
xxx.close()
```

### confirm（）—— 显示一个带有指定消息和确认及取消按钮的对话框

```js
// 显示一个带有指定消息和确认及取消按钮的对话框
var a = confirm('请确认')
console.log(a)
```

### getSelection（）—— 用户选择的文本范围或光标的当前位置

```js
// 用户选择的文本范围或光标的当前位置
function Ace(){
    console.log(getSelection().toString())
}
```

### getComputedStyle（）—— 获取指定元素的 CSS 样式

```js
var a = document.querySelector('p');
// 获取指定元素的 CSS 样式
console.log(getComputedStyle(a));
```

### matchMedia（）—— 返回一个新的 MediaQueryList 对象，表示指定的媒体查询字符串解析后的结果

```js
console.log(matchMedia('(max-width:700px)').matches)
```

### moveBy（）—— 可相对窗口的当前坐标把它移动指定的像素

```js
window.moveBy(x,y)
```

### moveTo（）—— 把窗口的左上角移动到一个指定的坐标

```js
window.moveTo(x,y)
```

### print（）—— 打印当前窗口的内容

```js
// 打印当前窗口的内容
print()
```

### prompt（）—— 用于显示可提示用户进行输入的对话框

```js
// 用于显示可提示用户进行输入的对话框
prompt('请输入','哈哈哈')
```

### scrollBy（）—— 可把内容滚动指定的像素数

```js
// 可把内容滚动指定的像素数
window.scrollBy(x,y)
```

### resizeTo（）—— 把窗口大小调整为指定的宽度和高度

```js
// 把窗口大小调整为指定的宽度和高度
window.resizeTo(500,500)
```

### scrollTo（）—— 把内容滚动到指定的坐标

```js
// 把内容滚动到指定的坐标
window.scrollTo(x,y)
```

### stop（）—— 用于停止页面载入

```js
// 用于停止页面载入
window.stop()
```

# JS BOM Navigator 对象属性

### appCodeName —— 返回浏览器的代码名

```js
// 返回浏览器的代码名
console.log(navigator.appCodeName)
```

### appName —— 返回浏览器的名称

```js
// 返回浏览器的名称
console.log(navigator.appName)
```

### appVersion —— 可返回浏览器的平台和版本信息

```js
// 可返回浏览器的平台和版本信息
console.log(navigator.appVersion)
```

### cookieEnabled —— 返回指明浏览器中是否启用 cookie 的布尔值

```js
// 返回指明浏览器中是否启用 cookie 的布尔值
console.log(navigator.cookieEnabled)
```

### platform —— 返回运行浏览器的操作系统平台

```js
// 返回运行浏览器的操作系统平台
console.log(navigator.platform)
```

### userAgent —— 返回由客户机发送服务器的user-agent 头部的值

```js
// 返回由客户机发送服务器的user-agent 头部的值
console.log(navigator.userAgent)
```

# JS BOM Navigator 对象方法

### javaEnabled —— 指定是否在浏览器中启用Java

```js
// 指定是否在浏览器中启用Java
console.log(navigator.javaEnabled())
```

# JS BOM Screen 对象属性

### availHeight —— 返回显示浏览器的屏幕的可用高度

```js
// 返回显示浏览器的屏幕的可用高度
console.log(screen.availHeight)
```

### availWidth —— 返回显示浏览器的屏幕的可用宽度

```js
// 返回显示浏览器的屏幕的可用宽度
console.log(screen.availWidth)
```

### colorDepth —— 返回目标设备或缓冲器上的调色板的比特深度

```js
// 返回目标设备或缓冲器上的调色板的比特深度
console.log(screen.colorDepth)
```

### height —— 返回屏幕的总高度

```js
// 返回屏幕的总高度
console.log(screen.height)
```

### width —— 返回屏幕的总宽度

```js
// 返回屏幕的总宽度
console.log(screen.width)
```

### pixelDepth —— 返回屏幕的颜色分辨率（每象素的位数）

```js
// 返回屏幕的总宽度
console.log(screen.pixelDepth)
```

# JS BOM History 对象属性

### length —— 返回历史列表中的网址数

```js
// 返回历史列表中的网址数
console.log(History.length)
```

# JS BOM History 对象方法

### back（）—— 加载历史列表中的前一个 URL（如果存在）

```js
// 加载历史列表中的前一个 URL（如果存在）
console.log(history.back())
```

### forward（）—— 加载历史列表中的下一个 URL

```js
// 加载历史列表中的下一个 URL
console.log(history.forward())
```

### go（）—— 加载历史列表中的某个具体的页面

```js
// 加载历史列表中的某个具体的页面
console.log(history.go(2))
```

# JS BOM Location 对象属性

### hash —— 返回一个URL的锚部分

```js
// 返回一个URL的锚部分
console.log(location.hash)
```

### host —— 返回一个URL的主机名和端口

```js
// 返回一个URL的主机名和端口
console.log(location.host)
```

### hostname —— 设置或返回当前 URL 的主机名

```js
// 设置或返回当前 URL 的主机名
console.log(location.hostname)
```

### href —— 设置或返回当前显示的文档的完整 URL

```js
// 设置或返回当前显示的文档的完整 URL
console.log(location.href)
```

### pathname —— 设置或返回当前 URL 的路径部分

```js
// 设置或返回当前 URL 的路径部分
console.log(location.pathname)
```

### port —— 设置或返回当前 URL 的端口部分

```js
// 设置或返回当前 URL 的端口部分
console.log(location.port)
```

### protocol —— 设置或返回当前 URL 的协议

```js
// 设置或返回当前 URL 的协议
console.log(location.protocol)
```

### search —— 设置或返回当前 URL 的查询部分

```js
// 设置或返回当前 URL 的查询部分
console.log(location.search)
```

# JS BOM Location 对象方法

### assign（）—— 加载一个新的文档

```js
// 加载一个新的文档
location.assign('http://baidu.com')
```

### reload（）—— 刷新当前文档

```js
// 刷新当前文档
location.reload()
```

### replace（）—— 用一个新文档取代当前文档

```js
// 用一个新文档取代当前文档
location.replace('http://baidu.com')
```

