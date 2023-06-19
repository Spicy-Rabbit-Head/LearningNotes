# jQuery 遍历方法

### add() —— 把元素添加到已存在的元素组合中

```js
// 把元素添加到已存在的元素组合中
$('button').click(function (){
    $('div').add('p').css('background-color','coral')
})
```

### children() —— 返回被选元素的所有直接子元素

```js
// 返回被选元素的所有直接子元素
$('button').click(function (){
    console.log($('div').children())
})
```

### closest() —— 返回被选元素的第一个祖先元素

```js
// 返回被选元素的第一个祖先元素
$('button').click(function (){
    console.log($('.p1').closest())
})
```

### contents() —— 返回所有直接子元素，包括被选元素的文本和注释节点

```js
// 返回所有直接子元素，包括被选元素的文本和注释节点
$('button').click(function (){
    console.log($('div').contents())
})
```

### each() —— 为每个匹配元素规定要运行的函数

```js
// 为每个匹配元素规定要运行的函数
$('button').click(function (){
    $('li').each(function (){
        $(this).text(2)
    })
})
```

### eq() —— 返回带有被选元素的指定索引号的元素

```js
// 返回带有被选元素的指定索引号的元素
$('button').click(function (){
    $('li').eq(2).text(6)
})
```

### filter() —— 返回符合一定条件的元素

```js
// 返回符合一定条件的元素
$('button').click(function (){
    $('li').filter('.q3').text(5)
})
```

### find() —— 返回被选元素的后代元素

```js
// 返回被选元素的后代元素
$('button').click(function (){
    $('ul').find('li').text(6)
})
```

### first() —— 返回被选元素的第一个元素

```js
// 返回被选元素的第一个元素
$('button').click(function (){
    $('li').first().text(0)
})
```

### last() —— 返回被选元素的最后一个元素

```js
// 返回被选元素的最后一个元素
$('button').click(function (){
    $('li').last().text(0)
})
```

### has() —— 返回拥有匹配指定选择器的一个或多个元素在其内的所有元素

```js
// 返回拥有匹配指定选择器的一个或多个元素在其内的所有元素
$('button').click(function (){
    $('ul').has('li').text(5)
})
```

### is() —— 用于查看选择的元素是否匹配选择器

```js
// 用于查看选择的元素是否匹配选择器
$('button').click(function (){
    console.log($('.q3').is('li'))
})
```

### next() —— 返回被选元素的后一个同级元素

```js
// 返回被选元素的后一个同级元素
$('button').click(function (){
    $('.q3').next().text(0)
})
```

### nextAll() —— 返回被选元素之后的所有同级元素

```js
// 返回被选元素之后的所有同级元素
$('button').click(function (){
    $('.q3').nextAll().text(0)
})
```

### nextUntil() —— 返回介于两者之间的同级元素

```js
// 返回介于两者之间的同级元素
$('button').click(function (){
    $('.q3').nextUntil('.q4').text(0)
})
```

### not() —— 返回不符合一定条件的元素

```js
// 返回不符合一定条件的元素
$('button').click(function (){
    $('li').not('.q3').text(0)
})
```

### offsetParent() —— 返回第一个被定位的父元素

```js
// 返回第一个被定位的父元素
$('button').click(function (){
    console.log($('li').offsetParent())
})
```

### parent() —— 返回被选元素的直接父元素

```js
// 返回被选元素的直接父元素
$('button').click(function (){
    console.log($('.q3').parent())
})
```

### parents() —— 返回被选元素的所有祖先元素

```js
// 返回被选元素的所有祖先元素
$('button').click(function (){
    console.log($('.q3').parents())
})
```

### parentsUntil() —— 返回介于两者之间的所有祖先元素

```js
// 返回介于两者之间的所有祖先元素
$('button').click(function (){
    console.log($('.q3').parentsUntil('html'))
})
```

### prev() —— 返回被选元素的前一个同级元素

```js
// 返回被选元素的前一个同级元素
$('button').click(function (){
    $('.q4').prev().text(0)
})
```

### prevAll() —— 返回被选元素之前的所有同级元素

```js
// 返回被选元素之前的所有同级元素
$('button').click(function (){
    $('.q4').prevAll().text(0)
})
```

### prevUntil() —— 返回介于两者之间的所有同级元素

```js
// 返回介于两者之间的所有同级元素
$('button').click(function (){
    $('.q4').prevUntil('.q3').text(0)
})
```

### siblings() —— 返回被选元素的所有同级元素

```js
// 返回被选元素的所有同级元素
$('button').click(function (){
    $('.q4').siblings().text(0)
})
```

### slice() —— 选取基于索引的元素的子集

```js
// 选取基于索引的元素的子集
$('button').click(function (){
    $('li').slice(2,3).text(0)
})
```

