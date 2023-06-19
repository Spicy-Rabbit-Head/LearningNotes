# jQuery

### jQuery语法

```apl
$(selector.action()
$ 定义 jQuery
selector 定义 查询和查找 HTML 元素
action 定义执行对元素的操作
```

### $ —— jQuery

```js
// $顶级对象
$(document).ready(function (){
    $('div').hide();
})
// $等于jQuery
jQuery(document).ready(function (){
    jQuery('div').hide();
})
```

### 下拉框

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
        <style>
            a {
                text-decoration: none;
                color: black;
            }
            ul {
                float: left;
                list-style-type: none;
            }
            ul li {
                display: none;
            }
        </style>
        <script src="jQuery.js"></script>
        <script>
            $(document).ready(function (){
                $('ul a').mouseenter(function (){
                    $(this).nextAll('li').show()
                })
                $('ul a').mouseleave(function (){
                    $(this).nextAll('li').hide()
                })
            })
        </script>
    </head>
    <body>
        <ul>
            <a href="#">1</a>
            <li>2</li>
            <li>3</li>
        </ul>
        <ul>
            <a href="#">1</a>
            <li>2</li>
            <li>3</li>
        </ul>
    </body>
</html>
```

# jQuery 选择器

### * —— 所有元素

```js
// 选择所有元素
$('*').css('background-color','yellow')
```

### #id —— 选取带有指定 id 的元素

```js
// 选取带有指定 id 的元素
$('#p1').css('background-color','yellow')
```

### .class —— 选取带有指定 class 的所有元素

```js
// 选取带有指定 class 的所有元素
$('.p2').css('background-color','yellow')
```

```js
// 选取多个 class
$('.p1,.p3').css('background-color','yellow')
```

### element —— 选取带有指定元素名称的所有元素

```js
// 选取带有指定元素名称的所有元素
$('p').css('color','red')
```

```js
// 选取多个 element
$('p,em,i').css('color','red')
```

### :first —— 选择指定元素的第一个元素

```js
// 选择指定元素的第一个元素
$('p:first').css('color','red')
```

### :last —— 选择指定元素的最后一个元素

```js
// 选择指定元素的最后一个元素
$('p:last').css('color','red')
```

### :even —— 选取带有偶数索引号的每个元素

```js
// 选取带有偶数索引号的每个元素
$('p:even').css('color','red')
```

### :odd —— 选取带有奇数索引号的每个元素

```js
// 选取带有奇数索引号的每个元素
$('p:odd').css('color','red')
```

### :first-child —— 选取属于其父元素的第一个子元素

```js
// 选取属于其父元素的第一个子元素
$('p:first-child').css('color','red')
```

### :first-of-type —— 选取属于其父元素的特定类型的第一个子元素的所有元素

```js
// 选取属于其父元素的特定类型的第一个子元素的所有元素
$('p:first-of-type').css('color','red')
```

### :last-child —— 选取属于其父元素的最后一个子元素

```js
// 选取属于其父元素的最后一个子元素
$('p:last-child').css('color','red')
```

### :last-of-type —— 选取属于其父元素的特定类型的最后一个子元素的所有元素

```js
// 选取属于其父元素的特定类型的最后一个子元素的所有元素
$('p:last-of-type').css('color','red')
```

### :nth-child() —— 选取属于其父元素的不限类型的第 *n* 个子元素的所有元素

```js
// 选取属于其父元素的不限类型的第 n 个子元素的所有元素
$('p:nth-child(1)').css('color','red')
```

### :nth-last-child() —— 选取属于其父元素的不限类型的第 *n* 个子元素的所有元素，从最后一个子元素开始计数

```js
// 选取属于其父元素的不限类型的第 n 个子元素的所有元素，从最后一个子元素开始计数
$('p:nth-last-child(1)').css('color','red')
```

### :nth-of-type() —— 选取属于其父元素的特定类型的第 *n* 个子元素的所有元素

```js
// 选取属于其父元素的特定类型的第 n 个子元素的所有元素
$('p:nth-of-type(1)').css('color','red')
```

### :only-child —— 选取属于其父元素的唯一子元素的每个元素

```js
// 选取属于其父元素的唯一子元素的每个元素
$('p:only-child').css('color','red')
```

### :only-of-type —— 选取属于其父元素的特定类型的唯一子元素的每个元素

```js
// 选取属于其父元素的特定类型的唯一子元素的每个元素
$('p:only-of-type').css('color','red')
```

### 后代选择器

```js
// 选取指定元素的直接子元素的所有元素
$('.p1>p').css('color','red')
```

### 父后代选择器

```js
// 选取指定元素的后代的所有元素
$('div p').css('color','red')
```

### 兄弟选择器

```js
// 每个元素相邻的下一个元素
$('i + p').css('color','red')
```

```js
// 选取指定元素同级的所有元素
$('i ~ p').css('color','red')
```

### :eq() —— 选取带有指定 index 值的元素

```js
// 选取带有指定 index 值的元素
$('p:eq(2)').css('color','red')
```

### :gt() —— 选取 index 值大于指定数字的元素

```js
// 选取 index 值大于指定数字的元素
$('p:gt(2)').css('color','red')
```

### :lt() —— 选取 index 值小于指定数字的元素

```js
// 选取 index 值小于指定数字的元素
$('p:lt(2)').css('color','red')
```

### :not() —— 选取除了指定元素以外的所有元素

```js
// 选取 index 值小于指定数字的元素
$('p:not(.p1)').css('color', 'red')
```

### :header —— 选取所有标题元素

```js
// 选取所有标题元素
$(':header').css('color', 'red')
```

### :animated —— 选取当前的所有动画元素

```js
// 选取当前的所有动画元素
$(':animated')
```

### :focus —— 选取当前具有焦点的元素

```js
// 选取当前具有焦点的元素
$('input').focus()
$(':focus').css('background-color','red')
```

### :contains() —— 选取包含指定字符串的元素

```js
// 选取包含指定字符串的元素
$('p:contains(1)').css('background-color','red')
```

### :has() —— 选取所有包含一个或多个元素在其内的元素，匹配指定的选择器

```js
// 选取所有包含一个或多个元素在其内的元素，匹配指定的选择器
$('div:has(p)').css('background-color','red')
```

### :empty —— 选取空的元素

```js
// 选取空的元素
$(':empty').css('background-color','red')
```

### :parent —— 选取所有包含子节点或文本节点的父元素

```js
// 选取所有包含子节点或文本节点的父元素
$('div:parent').css('background-color','red')
```

### :hidden —— 选取隐藏的元素

```js
// 选取隐藏的元素
$(':hidden')
```

### :visible —— 选取当前可见的每个元素

```js
// 选取当前可见的每个元素
$('div:visible').css('background-color','red')
```

### :root —— 选取文档的根元素

```js
// 选取文档的根元素
$(':root').css('background-color','red')
```

### :lang() —— 选取指定语言属性(lang)的元素

```js
// 选取指定语言属性(lang)的元素
$('div:lang(zz)').css('background-color','red')
```

### [attribute] —— 选取带有指定属性的每个元素

```js
// 选取带有指定属性的每个元素
$('[la]').css('background-color','red')
```

```js
// 选取带有指定属性和值的每个元素
$('[la=aa]').css('background-color','red')
```

```js
// 选取每个不带有指定属性和值的元素
$('div[la!=aa]').css('background-color','red')
```

```js
// 选取每个带有指定属性且以指定字符串结尾的元素
$('div[la$="a"]').css('background-color','red')
```

```js
// 选取每个带有指定属性的元素，该元素的值等于指定字符串或以该字符串后跟连接符作为开头的字符串
$('div[la|="aa"]').css('background-color','red')
```

```js
// 选取每个带有指定属性且以指定字符串开头的元素
$('div[la^="a"]').css('background-color','red')
```

```js
// 选取每个带有指定属性且值包含指定单词的元素
$('div[la~="aa"]').css('background-color','red')
```

```js
// 选取每个带有指定属性且值包含指定字符串的元素
$('div[la*="a"]').css('background-color','red')
```

### :input —— 选取 input 表单元素

```js
// 选取input 表单元素
$(':input').css('background-color','red')
```

### :text —— 选取 text 表单元素

```js
// 选取 text 表单元素
$(':text').css('background-color','red')
```

### :password —— 选取 password 表单元素

```js
// 选取 password 表单元素
$(':password').css('background-color','red')
```

### :radio —— 选取 radio 表单元素

```js
// 选取 radio 表单元素
$(':radio').hide()
```

### :checkbox —— 选取 checkbox 表单元素

```js
// 选取 checkbox 表单元素
$(':checkbox').hide()
```

### :submit —— 选取 submit 表单元素

```js
// 选取 submit  表单元素
$(':submit').hide()
```

### :reset —— 选取 reset 表单元素

```js
// 选取 reset 表单元素
$(':reset').hide()
```

### :button —— 选取 button 表单元素

```js
// 选取 button 表单元素
$(':button').hide()
```

### :image —— 选取 image 表单元素

```js
// 选取 image 表单元素
$(':image').hide()
```

### :file —— 选取 file 表单元素

```js
// 选取 file 表单元素
$(':file').hide()
```

### :enabled —— 选取所有启用的表单元素

```js
// 选取所有启用的表单元素
$(':enabled').hide()
```

### :disabled —— 选取所有禁用的表单元素

```js
// 选取所有禁用的表单元素
$(':disabled').hide()
```

### :selected —— 选取预先选定的选项元素

```js
// 选取预先选定的选项元素
$(':selected').hide()
```

### :checked —— 选取所有选中的复选框或单选按钮

```js
// 选取所有选中的复选框或单选按钮
$(':checked').hide()
```

