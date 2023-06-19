# jQuery 事件方法

### noConflict() —— 释放变量 $ 的 jQuery 控制权

```js
var a = $.noConflict();
```

### on() —— 在被选元素及子元素上添加一个或多个事件处理程序

```js
// 在被选元素及子元素上添加一个或多个事件处理程序
$('div p').on('click',function (){
    alert('点击了')
})
```

### off() —— 用于移除通过 on()方法添加的事件处理程序

```js
// 用于移除通过 on() 方法添加的事件处理程序
$('div p').off('click')
```

### one() —— 为被选元素添加一个或多个一次性事件处理程序

```js
// 在被选元素及子元素上添加一个或多个事件一次性处理程序
$('div p').one('click',function (){
    alert('点击了')
})
```

### ready() —— 加载完毕且页面完全加载（包括图像）时发生事件

```js
// 加载完毕且页面完全加载（包括图像）时
$(document).ready(function (){
    alert(1)
})
```

### focus() —— 元素获得焦点时发生事件

```js
// 元素获得焦点时发生事件
$('input').focus(function (){
    alert('获得焦点')
})
```

### blur() —— 元素失去焦点时发生事件

```js
// 元素失去焦点时发生 blur 事件
$('input').blur(function (){
    alert('失去焦点')
})
```

### focusin() —— 当元素（或在其内的任意元素）获得焦点时发生事件

```js
// 当元素（或在其内的任意元素）获得焦点时发生事件
$('div').focusin(function (){
    $(this).css("background-color","#FFFFCC")
})
```

### focusout() —— 当元素（或在其内的任意元素）失去焦点时发生事件

```js
// 当元素（或在其内的任意元素）失去焦点时发生事件
$('div').focusout(function (){
    $(this).css("background-color","#FFFFCC")
})
```

### hover() —— 当鼠标指针悬停在被选元素上时要运行的两个函数

```js
// 当鼠标指针悬停在被选元素上时要运行的两个函数
$('input').hover(function (){
    $(this).css("background-color","#FFFFCC")
},function (){
    $(this).css("background-color","red")
})
```

### change() —— 当元素的值改变时发生事件

```js
// 当元素的值改变时发生事件
$('input').change(function (){
    alert('文本改变')
})
```

### click() —— 单击元素发生事件

```js
// 单击元素发生事件
$('p').click(function (){
    alert('点击标签')
})
```

### dblclick() —— 双击元素触发事件

```js
// 双击元素触发事件
$('p').dblclick(function (){
    alert('双击标签')
})
```

### keydown() —— 键盘键被按下的过程发生事件

```js
// 键盘键被按下时发生事件
$('input').keydown(function (){
    $(this).css("background-color","#FFFFCC")
})
```

### keypress() —— 键盘键被按下发生事件

```js
// 键盘键被按下时发生事件
$('input').keypress(function (){
    $(this).css("background-color","#FFFFCC")
})
```

### keyup() —— 键盘键被松开时发生事件

```js
// 键盘键被松开时发生事件
$('input').keyup(function (){
    $(this).css("background-color","#FFFFCC")
})
```

### mousedown() —— 鼠标指针移动到元素上方，并按下鼠标左键发生事件

```js
// 鼠标指针移动到元素上方，并按下鼠标左键发生事件
$('div').mousedown(function (){
    $(this).css("background-color","#FFFFCC")
})
```

### mouseenter() —— 鼠标指针穿过（进入）被选元素时发生事件

```js
// 鼠标指针穿过（进入）被选元素时发生事件
$('div').mouseenter(function (){
    $(this).css("background-color","#FFFFCC")
})
```

### mouseleave() —— 鼠标指针离开被选元素时发生事件

```js
// 鼠标指针离开被选元素时发生事件
$('div').mouseleave(function (){
    $(this).css("background-color","#FFFFCC")
})
```

### mousemove() —— 鼠标指针在指定的元素中移动时发生事件

```js
// 鼠标指针在指定的元素中移动时发生事件
$('div').mousemove(function (){
    console.log('1')
})
```

### mouseout() —— 鼠标指针离开被选元素时发生事件

```js
// 鼠标指针离开被选元素时发生事件
$('div').mouseout(function (){
    console.log('1')
})
```

### mouseover() —— 鼠标指针位于元素上方时发生事件

```js
// 鼠标指针位于元素上方时发生事件
$('div').mouseover(function (){
    console.log('1')
})
```

### mouseup() —— 当鼠标指针移动到元素上方，并松开鼠标左键时发生事件

```js
// 当鼠标指针移动到元素上方，并松开鼠标左键时发生事件
$('div').mouseup(function (){
    console.log('1')
})
```

### resize() —— 调整浏览器窗口大小时，发生事件

```js
// 调整浏览器窗口大小时，发生事件
$(window).resize(function (){
    console.log(1)
})
```

### scroll() —— 当用户滚动指定的元素时，会发生事件

```js
// 当用户滚动指定的元素时，会发生事件
$(window).scroll(function (){
    console.log(1)
})
```

### select() —— 文本域文本被选中发生事件

```js
// 目标文本被选中发生事件
$('input').select(function (){
    console.log(1)
})
```

### submit() —— 提交表单时发生事件

```js
// 提交表单时发生事件
$(document).ready(function (){
    $('form').submit(function (){
        console.log(1)
    })
})
```

# jQuery event 属性方法

### event.currentTarget —— 在事件冒泡阶段内的当前 DOM 元素

```js
// 在事件冒泡阶段内的当前 DOM 元素
$('p').click(function (){
    alert(event.currentTarget === this)
})
```

### event.delegateTarget —— 返回当前调用的 jQuery 事件处理程序所添加的元素

```js
// 返回当前调用的 jQuery 事件处理程序所添加的元素
$('div p').on('click',{x:2},function (event){
    console.log(event.data.x)
})
```

### event.preventDefault() —— 阻止元素发生默认的行为

```js
// 阻止元素发生默认的行为
$('a').click(function (event){
    console.log(event.preventDefault())
})
```

### event.isDefaultPrevented() —— 检查指定的事件上是否调用阻止默认事件

```js
// 检查指定的事件上是否调用阻止默认事件
$('div p').click(function (event){
    console.log(event.isDefaultPrevented())
})
```

### event.stopImmediatePropagation() —— 阻止事件在 DOM 树中向上冒泡

```js
// 阻止事件在 DOM 树中向上冒泡
$('div p').click(function (event){
    console.log(1)
    event.stopImmediatePropagation()
})
```

### event.isImmediatePropagationStopped() —— 检测是否阻止事件在 DOM 树中向上冒泡

```js
// 检测是否阻止事件在 DOM 树中向上冒泡
$('div p').click(function (event){
    console.log(event.isImmediatePropagationStopped())
})
```

### event.stopPropagation() —— 阻止事件冒泡到父元素，阻止任何父事件处理程序被执行

```js
// 阻止事件冒泡到父元素，阻止任何父事件处理程序被执行
$('div p').click(function (event){
    console.log(1)
    event.stopPropagation()
})
```

### event.isPropagationStopped() —— 检测是否阻止事件冒泡到父元素,阻止任何父事件处理程序被执行

```js
// 检测是否阻止事件冒泡到父元素,阻止任何父事件处理程序被执行
$('div p').click(function (event){
    console.log(event.isPropagationStopped())
})
```

### event.pageX —— 返回鼠标指针的位置，相对于文档的左边缘

```js
// 返回鼠标指针的位置，相对于文档的左边缘
$('div p').click(function (event){
    console.log(event.pageX)
})
```

### event.pageY —— 返回鼠标指针的位置，相对于文档的上边缘

```js
// 返回鼠标指针的位置，相对于文档的上边缘
$('div p').click(function (event){
    console.log(event.pageY)
})
```

### event.relatedTarget —— 当鼠标移动时哪个元素进入或退出

```js
// 当鼠标移动时哪个元素进入或退出
$('div').mouseenter(function (event){
    console.log(event.relatedTarget)
})
```

### event.result —— 被指定事件触发的事件处理程序返回的最后一个值

```js
// 被指定事件触发的事件处理程序返回的最后一个值
$("button").click(function(){
    return "Hello world!";
});
$("button").click(function(event){
    $("p").html(event.result);
});
```

### event.target —— 返回哪个 DOM 元素触发了事件

```js
// 返回哪个 DOM 元素触发了事件
$('p,i,em').click(function (event){
    console.log(event.target.nodeName)
})
```

### event.timeStamp —— 返回鼠标左键第一次按下到最后一次抬起所消耗的毫秒数

```js
// 返回鼠标左键第一次按下到最后一次抬起所消耗的毫秒数
$('button').click(function (event){
    console.log(event.timeStamp)
})
```

### event.type —— 返回哪种事件类型被触发

```js
// 返回哪种事件类型被触发
$('button').click(function (event){
    console.log(event.type)
})
```

### event.which —— 返回指定事件上哪个键盘键或鼠标按钮被按下

```js
// 返回指定事件上哪个键盘键或鼠标按钮被按下
$('input').keydown(function (event){
    console.log(event.which)
})
```

