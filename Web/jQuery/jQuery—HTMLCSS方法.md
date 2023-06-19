# jQuery HTML及CSS方法

### addClass() —— 向被选元素添加一个或多个类名

```js
// 向被选元素添加一个或多个类名
$('button').click(function (){
    $('div').addClass('q2')
})
```

### after() —— 在被选元素后插入指定的内容

```js
// 在被选元素后插入指定的内容
$('button').click(function (){
    $('p').after('<p>2</p>')
})
```

### append() —— 在被选元素的结尾插入指定内容

```js
// 在被选元素的结尾插入指定内容
$('button').click(function (){
    $('p').append('<b>3</b>')
})
```

### prepend() —— 被选元素的开头插入指定内容

```js
// 被选元素的开头插入指定内容
$('button').click(function (){
    $('div').prepend('<p>1</p>')
})
```

### appendTo() —— 在被选元素的结尾插入 HTML 元素

```js
// 在被选元素的结尾插入 HTML 元素
$('button').click(function (){
    $('<span>Hello World!</span>').appendTo('p')
})
```

### prependTo() —— 被选元素的开头插入 HTML 元素

```js
// 被选元素的开头插入 HTML 元素
$('button').click(function (){
    $('<p>1</p>').prependTo('div')
})
```

### before() —— 在被选元素之前插入指定的内容

```js
// 在被选元素之前插入指定的内容
$('button').click(function (){
    $('p').before('<p>0</p>')
})
```

### detach() —— 移除被选元素，包括所有的文本和子节点。然后它会保留数据和事件

```js
// 移除被选元素，包括所有的文本和子节点。然后它会保留数据和事件
$('button').click(function (){
    $('p').detach()
})
```

### empty() —— 移除被选元素的所有子节点和内容

```js
// 移除被选元素的所有子节点和内容
$('button').click(function (){
    $('div').empty()
})
```

### remove() —— 移除被选元素，包括所有的文本和子节点

```js
// 移除被选元素，包括所有的文本和子节点
$('button').click(function (){
    $('div').remove()
})
```

### hasClass() —— 检查被选元素是否包含指定的类名称

```js
// 检查被选元素是否包含指定的类名称
$('button').click(function (){
    console.log($('div').hasClass('q1'))
})
```

### attr() —— 设置或返回被选元素的属性和值

```js
// 设置或返回被选元素的属性和值
$('button').click(function (){
    $('div').attr('class','q2')
})
```

### prop() —— 设置或返回被选元素的属性和值

```js
// 设置或返回被选元素的属性和值
$('button').click(function (){
    $('div').prop('class','q2')
})
```

### removeProp() —— 移除由 prop() 方法设置的属性

```js
$('p').removeProp('color')
```

### clone() —— 生成被选元素的副本，包含子节点、文本和属性

```js
// 生成被选元素的副本，包含子节点、文本和属性
$('button').click(function (){
    $('p').clone().appendTo('body')
})
```

### css() —— 被选元素设置或返回一个或多个样式属性

```js
// 被选元素设置或返回一个或多个样式属性
$('button').click(function (){
    $('p').css({'color':'red'})
})
```

### height() —— 设置或返回被选元素的高度

```js
console.log($('div').height())
// 设置或返回被选元素的高度
$('button').click(function (){
    $('div').height(100)
    console.log($('div').height())
})
```

### width() —— 设置或返回被选元素的宽度

```js
// 设置或返回被选元素的宽度
console.log($('div').width())
```

### outerHeight() —— 返回第一个匹配元素的外部高度,包含 padding 和 border

```js
console.log($('div').outerHeight())
// 返回第一个匹配元素的外部高度,包含 padding 和 border
$('button').click(function (){
    $('div').outerHeight(100)
})
```

### outerWidth() —— 返回第一个匹配元素的外部宽度,包含 padding 和 border

```js
console.log($('div').outerWidth())
// 返回第一个匹配元素的外部宽度,包含 padding 和 border
$('button').click(function (){
    $('div').outerWidth(100)
})
```

### innerHeight() —— 返回第一个匹配元素的内部高度，包含 padding

```js
console.log($('div').innerHeight())
// 返回第一个匹配元素的内部高度，包含 padding
$('button').click(function (){
    $('div').innerHeight(100)
})
```

### innerWidth() —— 返回第一个匹配元素的内部宽度，包含 padding

```js
console.log($('div').innerWidth())
// 返回第一个匹配元素的内部宽度，包含 padding
$('button').click(function (){
    $('div').innerWidth(100)
})
```

### html() —— 设置或返回被选元素的内容

```js
console.log($('div').html())
// 设置或返回被选元素的内容
$('button').click(function (){
    $('div').html(100)
})
```

### insertAfter() —— 在被选元素后插入 HTML 元素

```js
// 在被选元素后插入 HTML 元素
$('button').click(function (){
    $('<p>2</p>').insertAfter('.q1')
})
```

### insertBefore() —— 在被选元素前插入 HTML 元素

```js
// 在被选元素前插入 HTML 元素
$('button').click(function (){
    $('<p>2</p>').insertBefore('.q1')
})
```

### offset() —— 设置或返回被选元素相对于文档的偏移坐标

```js
// 设置或返回被选元素相对于文档的偏移坐标
$('button').click(function (){
    console.log($('div').offset())
})
```

### offsetParent() —— 返回第一个定位的祖先元素

```js
// 返回第一个定位的祖先元素
$('button').click(function (){
    console.log($('div').offsetParent())
})
```

### position() —— 返回第一个匹配元素的位置（相对于它的父元素）

```js
console.log($('div').position())
// 返回第一个匹配元素的位置（相对于它的父元素）
```

### removeAttr() —— 从被选元素移除一个或多个属性

```js
// 从被选元素移除一个或多个属性
$('button').click(function (){
    $('div').removeAttr('class')
})
```

### removeClass() —— 从被选元素移除一个或多个类

```js
// 从被选元素移除一个或多个类
$('button').click(function (){
    $('div').removeClass('q2')
})
```

### replaceAll() —— 把被选元素替换为新的 HTML 元素

```js
// 把被选元素替换为新的 HTML 元素
$('button').click(function (){
    $('<p>1</p>').replaceAll('p')
})
```

### replaceWith() —— 把被选元素替换为新的内容

```js
// 把被选元素替换为新的内容
$('button').click(function (){
    $('p').replaceWith('<p>2</p>')
})
```

### scrollLeft() —— 设置或返回被选元素的水平滚动条位置

```js
// 设置或返回被选元素的水平滚动条位置
console.log($('.q1').scrollLeft())
```

### scrollTop() —— 设置或返回被选元素的垂直滚动条位置

```js
// 设置或返回被选元素的垂直滚动条位置
console.log($('.q1').scrollTop())
```

### text() —— 设置或返回被选元素的文本内容

```js
// 设置或返回被选元素的文本内容
$('div').text('233')
```

### toggleClass() —— 对添加和移除被选元素的一个或多个类进行切换

```js
// 对添加和移除被选元素的一个或多个类进行切换
$('button').click(function (){
    $('div').toggleClass('q2')
})
```

### unwrap() —— 移除被选元素的父元素

```js
// 移除被选元素的父元素
$('button').click(function (){
    $('p').unwrap()
})
```

### val() —— 返回或设置被选元素的 value 属性

```js
// 返回或设置被选元素的 value 属性
$('button').click(function (){
    $('input:text').val('1223123')
})
```

### wrap() —— 使用指定的 HTML 元素来包裹每个被选元素

```js
// 使用指定的 HTML 元素来包裹每个被选元素
$('button').click(function (){
    $('p').wrap('<div></div>')
})
```

### wrapAll() —— 使用指定的 HTML 元素来包裹所有被选元素

```js
// 使用指定的 HTML 元素来包裹所有被选元素
$('button').click(function (){
    $('p').wrapAll('<div></div>')
})
```

### wrapInner() —— 使用指定的 HTML 元素来包裹每个被选元素中的所有内容

```js
// 使用指定的 HTML 元素来包裹每个被选元素中的所有内容
$('button').click(function (){
    $('p').wrapInner('<div></div>')
})
```

