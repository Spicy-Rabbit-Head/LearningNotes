# JS DOM Document 对象属性及方法

### activeElement（）—— 返回文档中当前获得焦点的元素

```html
<!doctype html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <title>666666</title>
    </head>
    <body onclick="hh()">
        <button>233</button>
        <script>
            function hh() {
                // 返回文档中当前获得焦点的元素
                console.log(document.activeElement)
            }
        </script>
    </body>
</html>
```

### addEventListener（）—— 向文档添加事件句柄

 ```html
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>666666</title>
</head>
<body>
<button>233</button>
<script>
    // 向文档添加点击句柄
    document.addEventListener('click',hh) //(触发事件，执行函数)
    // 在文档的任意位置点击触发函数
    function hh() {
        console.log(1)
    }
</script>
</body>
</html>
 ```

### removeEventListener（）—— 向文档移除事件句柄

```js
// 移除事件句柄
document.removeEventListener('click',hh) //(触发事件，执行函数)
```

### baseURI（）—— 返回 HTML 文档的基础URI

```js
// 返回 HTML 文档的基础URI
console.log(document.baseURI)
```

### body（）—— 用于设置或返回文档体 body

 ```js
// 返回：返回当前文档的 <body> 元素
console.log(document.body)
// 设置：会覆盖所有在 <body> 元素中的子元素, 并用新的内容来替换它
document.body.style.backgroundColor = 'red'
 ```

### cookie（）—— 返回当前文档所有 **键/值** 对的所有 cookies

```js
// 返回当前文档所有 键/值 对的所有 cookies
console.log(document.cookie)
```

### doctype（）—— 返回与文档相关的文档类型声明

```js
console.log(document.doctype)
```

### documentURI（）—— 可设置或返回文档的位置

```js
// 可设置或返回文档的位置
console.log(document.documentURI)
```

### documentElement（）—— 返回一个文档的文档元素

```js
// 返回一个文档的文档元素
console.log(document.documentElement)
```

### domain（）—— 返回当前文档的域名

```js
// 返回一个文档的文档元素
console.log(document.domain)
```

### getElementsByTagName（）—— 返回带有指定标签名的对象的集合

```js
// 返回带有指定标签名的对象的集合
console.log(document.getElementsByTagName('p')[0])
```

### getElementById（）—— 返回对拥有指定 ID 的第一个对象的引用

```js
// 返回对拥有指定 ID 的第一个对象的引用
console.log(document.getElementById('p1'))
```

### getElementsByClassName（）—— 返回文档中所有指定类名的元素集合

```js
// 返回文档中所有指定类名的元素集合
console.log(document.getElementsByClassName('p1')[1])
```

### getElementsByName（）—— 返回带有指定名称的对象集合

```js
// 返回带有指定名称的对象集合
console.log(document.getElementsByName('233'))
```

### forms（）—— 返回当前页面所有表单的数组集合

```js
// 返回当前页面所有表单的数组集合
console.log(document.forms)
```

### images （）—— 返回当前文档中所有图片的数组

```js
// 返回当前文档中所有图片的数组
console.log(document.images)
```

### inputEncoding（）—— 返回文档的编码

```js
// 返回当前页面所有表单的数组集合
console.log(document.inputEncoding)
```

### lastModified（）—— 返回文档最后被修改的日期和时间

```js
// 返回文档最后被修改的日期和时间
console.log(document.lastModified)
```

### normalize（）—— 删除空的文本节点

```js
// 删除空的文本节点
document.normalize()
```

### querySelector（）—— 返回文档中匹配指定选择器的一个元素

```js
// 返回文档中匹配指定 CSS 选择器的一个元素
console.log(document.querySelector('img'))
```

### querySelectorAll（）—— 返回文档中匹配指定选择器的所有元素

```js
// 返回文档中匹配指定 CSS 选择器的一个元素
var a = document.querySelectorAll('p');
// 可更换
a[0].style.color = 'red'
```

### readyState（）—— 返回当前文档的状态

```js
// 返回当前文档的状态
console.log(document.readyState)
// uninitialized - 还未开始载入
// loading - 载入中
// interactive - 已加载，文档与用户可以开始交互
// complete - 载入完成
```

### title（）—— 返回当前文档的标题

```js
console.log(document.title)
```

### URL（）—— 回当前文档的 URL

```js
console.log(document.URL)
```

### write（）—— 向文档写入 HTML 表达式或 JavaScript 代码

```js
console.log(document.write('Hello'))
```

### writeln（）—— 向文档写入 HTML 表达式或 JavaScript 代码，加换行

```js
console.log(document.writeln('Hello'))
```

### createTextNode（）—— 创建文本节点

```js
var b = document.createTextNode('2333');
```

### createAttribute（）—— 创建一个属性节点

```js
// 创建一个属性节点
var a = document.createAttribute('class');
a.nodeValue = 'p1';
// 设置属性节点
document.getElementById('p1').setAttributeNode(a)
```

### createComment（）—— 创建注释节点

```js
// 创建注释节点
var a = document.createComment('hhhh');
// 设置注释节点
document.body.appendChild(a)
```

### createElement（）—— 创建元素节点

```js
// 创建元素节点
var a = document.createElement('button');
// 设置元素节点
document.body.appendChild(a)
```

# JS DOM 元素对象属性方法

### accessKey（）—— 设置或返回访问单选按钮的快捷键

```js
function hh(){
    // 设置为 alt 加 w 跳转到 a标签上
    document.getElementsByTagName('a')[0].accessKey='w';
}
```

### addEventListener（）—— 向指定元素添加事件句柄

```js
// 向p元素添加点击句柄
document.getElementsByTagName('p')[0].addEventListener('click',hh);
// 点击p触发函数
function hh(){
    console.log(1);
}
```

### removeEventListener（）—— 向指定元素移除事件句柄

```js
// 向p元素添加点击句柄
document.getElementsByTagName('p')[0].addEventListener('click',hh);
// 点击p触发函数
function hh(){
    console.log(1);
}
// 点击按钮移除句柄
function ww(){
    document.getElementsByTagName('p')[0].removeEventListener('click',hh);
}
```

### appendChild（）—— 为元素添加一个新的子元素

```js
function ww(){
    // 查询列表
    var a = document.getElementById('p1');
    // 定义文本节点
    var b = document.createTextNode('2333');
    // 将节点添加到列表中
    document.getElementById('p1').appendChild(b)
}
```

### attributes（）—— 返回指定节点属性的集合

```js
// 返回指定节点属性的集合
console.log(document.getElementById('p1').attributes)
```

### childNodes（）—— 返回包含被选节点的子节点

```js
// 返回包含被选节点的子节点
console.log(document.body.childNodes)
```

### children（）—— 返回元素的子元素的集合

```js
// 返回元素的子元素的集合
console.log(document.body.children)
```

### classList（）—— 返回元素的类名，在元素中添加，移除及切换 CSS 类

```js
var a = document.getElementById('q1')
// 添加一个或多个类名
a.classList.add('p1','p2','p3')
// 移除一个或多个类
a.classList.remove('p2')
// 判断类名是否存在
console.log(a.classList.contains('p2'))
// 返回索引对应的类名
console.log(a.classList.item(1))
// 返回元素的类名，在元素中添加，移除及切换 CSS 类
console.log(a.classList)
// 切换类
function hh(){
    a.classList.toggle('p4')
}
```

```html
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>666666</title>
    <style>
        .p1{
            color: darkorange;
        }
        .p2{
            background-color: pink;
        }
        .p3{
            font-size: 22px;
        }
        .p4{
            border: 1px solid red;
        }
    </style>
</head>
<body>
<p id="q1">233</p>
<button onclick="hh()">22</button>
<script src="233.js">
</script>
</body>
</html>
```

### className（）—— 设置或返回元素的 class 属性

```js
// 返回元素的 class 属性
console.log(document.getElementById('q1').className)
// 设置元素的 class 属性
console.log(document.getElementById('q1').className = 'p4')
```

### clientTop（）—— 返回元素的顶部边框的宽度

```js
// 返回元素的顶部边框的宽度
var a = document.getElementById('q1');
console.log(a.clientTop)
```

### clientLeft（）—— 返回元素的左部边框的宽度

```js
// 返回元素的左部边框的宽度
var a = document.getElementById('q1');
console.log(a.clientLeft)
```

### clientHeight（）—— 返回该元素的像素高度，包含内边距

```js
// 返回该元素的像素高度，包含内边距
console.log(document.getElementById('q1').clientHeight)
```

### clientWidth（）—— 返回该元素的像素宽度，包含内边距

```js
// 返回该元素的像素宽度，包含内边距
console.log(document.getElementById('q1').clientWidth)
```

### offsetHeight（）—— 返回该元素的像素高度，高度包含内边距和边框

```js
// 返回该元素的像素高度，高度包含内边距（padding）和边框
console.log(document.getElementById('P1').offsetHeight)
```

### offsetWidth（）—— 返回该元素的像素宽度，宽度包含内边距和边框

``` js
// 返回该元素的像素宽度，宽度包含内边距（padding）和边框
console.log(document.getElementById('P1').offsetWidth)
```

### offsetLeft（）—— 返回当前元素相对于左边界的偏移像素值

```js
// 返回当前元素相对于 offsetParent 节点左边界的偏移像素值
console.log(document.getElementById('P1').offsetLeft)
```

### offsetTop（）—— 当前元素相对于顶部边界的偏移像素值

```js
// 当前元素相对于 offsetParent 节点顶部边界的偏移像素值
console.log(document.getElementById('P1').offsetTop)
```

### scrollHeight（）—— 返回该元素的像素高度，高度包含内边距

```js
// 返回该元素的像素高度，高度包含内边距
var a = document.getElementById('p1');
console.log(a.scrollHeight)
```

### scrollWidth（）—— 返回该元素的像素宽度，宽度包含内边距

```js
// 返回该元素的像素宽度，宽度包含内边距
var a = document.getElementById('p1');
console.log(a.scrollWidth)
```

### offsetParent（）—— 获得被定位的最近祖先元素

```js
// 获得被定位的最近祖先元素
console.log(document.getElementById('P1').offsetParent)
```

### cloneNode（）—— 创建指定的节点的精确拷贝

```js
var a = document.getElementById('p1'),
    b = a.cloneNode(true);
document.getElementById('p2').appendChild(b)
```

### compareDocumentPosition（）—— 按照文档顺序，比较当前节点与指定节点的文档位置

```js
// 按照文档顺序，比较当前节点与指定节点的文档位置
console.log(document.getElementById('p1').
compareDocumentPosition(document.getElementById('p2')))
// 1：没有关系，这两个节点不属于同一个文档。
// 2： 第一节点（P1）位于第二个节点后（P2）。
// 4：第一节点（P1）定位在第二节点（P2）前。
// 8： 第一节点（P1）位于第二节点内（P2）。
// 16： 第二节点（P2）位于第一节点内（P1）。
// 32:没有关系的，或是两个节点在同一元素的两个属性。
```

### contentEditable（）—— 用于设置或返回元素的内容是否可编辑

```js
// 用于设置或返回元素的内容是否可编辑
console.log(document.getElementById('p1').contentEditable=true)
```

### dir（）—— 设置或返回元素的文字方向

```js
// 设置或返回元素的文字方向
console.log(document.getElementById('p1').dir)
```

### firstElementChild（）—— 返回指定元素的第一个子元素

```js
// 返回指定元素的第一个子元素
console.log(document.getElementById('p1').firstElementChild.tagName)
```

### lastElementChild（）—— 返回指定元素的最后一个子元素

```js
// 返回指定元素的最后一个子元素
console.log(document.getElementById('p1').lastElementChild)
```

### firstChild（）—— 返回被选节点的第一个子节点

```js
// 返回被选节点的第一个子节点
console.log(document.firstChild)
```

### lastChild（）—— 返回文档的最后一个子节点

```js
// 返回文档的最后一个子节点
console.log(document.getElementById('p1').lastChild)
```

### nextSibling（）—— 返回某个元素之后紧跟的节点

```js
// 返回某个元素之后紧跟的节点
console.log(document.getElementById('P1').nextSibling.id)
```

### parentNode（）—— 可返回某节点的父节点

```js
// 可返回某节点的父节点
console.log(document.getElementById('P1').parentNode)
```

### previousSibling（）—— 返回某节点之前紧跟的节点

```js
// 返回某节点之前紧跟的节点
console.log(document.getElementById('p2').previousElementSibling)
```

### previousElementSibling（）—— 指定元素的前一个兄弟元素

```js
// 指定元素的前一个兄弟元素
console.log(document.getElementById('p2').previousElementSibling)
```

### nextElementSibling（）—— 返回指定元素之后的下一个兄弟元素

```js
// 返回指定元素之后的下一个兄弟元素
console.log(document.getElementById('P1').nextElementSibling)
```

### focus（）—— 为元素设置焦点

```js
// 为元素设置焦点
document.getElementById('p1').focus()
```

### getAttribute（）—— 通过名称获取属性的值

```js
// 通过名称获取属性的值
console.log(document.getElementById('p1').getAttribute('type'))
```

### getAttributeNode（）—— 通过名称获取属性节点

```js
// 通过名称获取属性节点
console.log(document.getElementById('p1').getAttributeNode('type'))
```

### hasAttribute（）—— 判断是否有指定的属性存在

```js
// 判断是否有指定的属性存在
console.log(document.getElementById('p1').hasAttribute('type'))
```

### hasAttributes（）—— 判断某节点是否有任何属性

```js
// 判断某节点是否有任何属性
console.log(document.getElementById('p1').hasAttributes())
```

### hasChildNodes（）—— 返回一个元素是否有子元素

```js
// 返回一个元素是否有子元素
console.log(document.getElementById('p1').hasChildNodes())
```

### hasFocus（）—— 返回布尔值，用于检测元素是否获得焦点

```js
setInterval('hh()',1);
function hh(){
    if (document.hasFocus()) {
        console.log(1);
    } else {
        console.log(2);
    }
}
```

### id（）—— 设置或者返回元素的 id

```js
// 返回元素的 id
var a = document.getElementById('p1');
// 设置元素的 id
console.log(a.id = 'p2')
```

### innerHTML（）—— 设置或返回表格行的开始和结束标签之间的 HTML

```js
// 返回标签的文本
console.log(document.getElementById('p1').innerHTML)
// 设置标签的文本
document.getElementById('p1').innerHTML = '2333'
```

### insertBefore（）—— 现有的子元素之前插入一个新的子元素

```js
var a = document.createElement("LI");
var b = document.createTextNode("Water")
a.appendChild(b)
var c = document.getElementById('p1');
c.insertBefore(a,c.childNodes[0])
```

### isContentEditable（）—— 返回元素的内容是否可编辑

```js
// 返回元素的内容是否可编辑
console.log(document.getElementById('p1').isContentEditable)
```

### isDefaultNamespace（）—— 指定的命名空间是默认的，返回True

```js
// 指定的命名空间是否是默认的
console.log(document.isDefaultNamespace('2333.html'))
```

### namespaceURI（）—— 被选节点返回命名空间的 URI

```js
// 被选节点返回命名空间的 URI
console.log(document.getElementById('p1').namespaceURI)
```

### isEqualNode（）—— 用于检查两个节点是否相等

```js
// 用于检查两个节点是否相等
var a = document.getElementById('p1').firstChild,
    b = document.getElementById('p2').firstChild,
    c = document.getElementById('p3').firstChild;
console.log(a.isEqualNode(b))
console.log(a.isEqualNode(c))
```

### isSameNode（）—— 检查两个元素所有有相同节点

```js
// 用于检查两个节点是否相等
var a = document.getElementById('p1'),
    b = document.getElementsByTagName('p')[0];
console.log(a.isSameNode(b))
```

### lang（）—— 设置或返回元素的语言

```js
// 设置或返回元素的语言
console.log(document.getElementsByTagName('html')[0].lang)
```

### matches（）—— 检测元素是否匹配指定的CSS选择器

```js
// 检测元素是否匹配指定的CSS选择器
console.log(document.getElementById('p1').matches('.q1'))
// 检测元素是否匹配指定其中一个CSS选择器
console.log(document.getElementById('p2').matches('.q1,.q2'))
```

### nodeName（）—— 依据节点的类型返回其名称

```js
// 依据节点的类型返回其名称
console.log(document.getElementById('P1').nodeName)
```

### nodeType（）—— 返回节点类型

```js
// 返回节点类型
console.log(document.getElementById('P1').nodeType)
// 如果节点是一个元素节点，nodeType 属性返回 1。
// 如果节点是属性节点, nodeType 属性返回 2。
// 如果节点是一个文本节点，nodeType 属性返回 3。
// 如果节点是一个注释节点，nodeType 属性返回 8。
```

### nodeValue（）—— 根据节点的类型设置或返回节点的值

```js
// 根据节点的类型设置或返回节点的值
console.log(document.getElementById('P1').firstChild.nodeValue)
```

### ownerDocument（）—— 返回某元素的根元素

```js
// 获得被定位的最近祖先元素
console.log(document.getElementById('P1').ownerDocument)
```

### querySelector（）—— 返回匹配指定 CSS 选择器元素的第一个子元素

```js
// 返回匹配指定 CSS 选择器元素的第一个子元素
console.log(document.getElementsByTagName('body')[0].querySelector('.q1'))
```

### querySelectorAll（）—— 返回匹配指定 CSS 选择器元素的所有子元素

```js
// 返回匹配指定 CSS 选择器元素的所有子元素
console.log(document.getElementsByTagName('body')[0].querySelectorAll('.q1'))
```

### removeAttribute（）—— 删除指定的属性

```js
// 删除指定的属性
var a = document.getElementsByTagName('li')[0];
a.removeAttribute('class')
```

### removeAttributeNode（）—— 从元素中删除指定的属性节点

```js
// 从元素中删除指定的属性节点
var a = document.getElementsByTagName('li')[0],
    b = a.getAttributeNode('class')
a.removeAttributeNode(b)
```

### removeChild（）—— 删除一个子元素节点

```js
// 从元素中删除指定的属性节点
var a = document.getElementById('p1');
a.removeChild(a.childNodes[1])
```

### replaceChild（）—— 某个子节点替换为另一个节点

```js
// 某个子元素替换为另一个元素
var a = document.getElementById('p1'),
    b = document.createTextNode('3')
a.replaceChild(b,a.childNodes[1])
```

### setAttribute（）—— 设置或者改变指定属性并指定值

```js
// 创建或改变某个新属性
var a = document.getElementsByTagName('input')[0];
a.setAttribute('type','button')
```

### setAttributeNode（）—— 设置或者改变指定属性节点

```js
// 设置或者改变指定属性节点
var a = document.createAttribute('class');
a.nodeValue = 'p1';
document.getElementsByTagName('p')[0].setAttributeNode(a);
```

### tabIndex（）—— 设置或返回元素的标签顺序

```js
// 设置或返回元素的标签顺序
var a = document.getElementsByTagName('p');
a[0].tabIndex = '2'
a[1].tabIndex = '3'
a[2].tabIndex = '1'
console.log(a[0],a[1],a[2])
```

### tagName（）—— 返回元素的标签名

```js
// 返回元素的标签名
console.log(document.getElementById('p1').tagName)
```

### textContent（）—— 设置或者返回指定节点的文本内容

```js
// 设置或者返回指定节点的文本内容
console.log(document.getElementById('p1').textContent)
```

### title（）—— 设置或返回元素的标题

```js
// 设置或返回元素的标题
console.log(document.getElementsByTagName('body')[0].title)
```

### item（）—— 返回某个元素基于文档树的索引

```js
// 返回某个元素基于文档树的索引
console.log(document.body.childNodes.item(1))
```

### length（）—— 返回节点列表的节点数目

```js
// 返回节点列表的节点数目
console.log(document.body.childNodes.length)
```

# JS DOM 属性对象属性方法

### name（）—— 返回属性名称

```js
// 返回属性名称
console.log(document.getElementById('p1').attributes[0].name)
```

### value（）—— 用于设置或者返回属性的值

```js
// 用于设置或者返回属性的值
console.log(document.getElementById('p1').attributes[0].value)
```

### specified（）—— 检索是否设定了该属性值

```js
// 如果在文档中设置了属性值，则 specified 属性返回 true，如果是 DTD/Schema 中的默认值，则返回 false
console.log(document.getElementById('p1').attributes[0].specified)
```

### getNamedItem（）—— 返回节点列表中指定属性名的值

```js
// 返回节点列表中指定属性名的值
console.log(document.getElementById('p1').attributes.getNamedItem('id'))
```

### item（）—— 返回节点列表中处于指定索引号的节点

```js
// 返回节点列表中处于指定索引号的节点
console.log(document.getElementById('p1').attributes.item(0).name)
```

### length —— 返回集合中节点的选项数目

```js
// 返回集合中节点的选项数目
console.log(document.getElementById('p1').attributes.length)
```

### removeNamedItem（）—— 删除指定的节点

```js
// 删除指定的节点
console.log(document.getElementById('p1').attributes.removeNamedItem('class'))
```

### setNamedItem（）—— 添加指定节点

```js
// 添加指定节点
var a = document.getElementById('p1'),
    b = document.createAttribute('class');
b.nodeValue = 'q1';
a.attributes.setNamedItem(b);
```

# JS DOM Console对象方法

### assert（）—— 在第一个参数为 false 的情况下会在控制台输出信息

```js
console.assert(false,'输出了')
console.assert(true,'没输出')
```

### assert（）—— 用于清除控制台所有信息

```js
console.clear()
```

### count（）—— 调用时会将数字（调用次数）写入到控制台

```js
console.count()
console.count()
console.count()
```

### error（）—— 用于输出错误信息到控制台

```js
console.error('错误')	
```

### grou（）—— 用于设置分组信息的起始位置，该位置之后的所有信息将写入分组

```js
console.group();
console.log(1)
console.log(2)
```

### groupCollapsed（）—— 用于设置折叠的分组信息

```js
console.groupCollapsed();
console.log(1)
console.log(2)
```

### groupEnd（）—— 用于结束分组标签

```js
console.group();
console.log(1)
console.log(2)
console.groupEnd()
console.log(3)
```

### info（）—— 用于在控制台输出信息

```js
console.info('Hello')
```

### log（）—— 用于在控制台输出信息

```js
console.log('Hello')
```

### table（）—— 用于在控制台输出表格信息

```js
console.table(['A','B','C'])
```

### time（）—— 作为计算器的起始方法

### timeEnd（）—— 作为计算器的结束方法

```js
// 开始
console.time()
for (i = 0;i<100000;i++){
    console.log(i)
}
// 结束
console.timeEnd()
```

### trace（）—— 显示当前执行的代码在堆栈中的调用路径

```js
function Ace(){
    console.log(1)
    console.trace()
}
Ace()
```

### warn（）—— 用于在控制台输出警告信息

```js
console.warn('警告')
```

# JS DOM CSS 样式声明对象

### cssText（）—— 用于设置或者返回元素声明的内联样式

```js
var a = document.querySelector('p');
console.log(a.style.cssText)
```

### length（）—— 返回指定元素的样式声明数目

```js
var a = document.querySelector('p');
console.log(a.style.length)
```

### parentRule（）—— 返回 CSS 声明的样式及 CSS 选择器

```js
var a = document.styleSheets[0].rules[0].style;
console.log(a.parentRule)
```

# JS DOM Collection属性方法

### item（）—— 对象中指定索引位置的元素

```js
var a = document.getElementsByTagName('p').item(0);
console.log(a)
```

### length —— 对象中元素的数量

```js
var a = document.getElementsByTagName('p').length;
console.log(a)
```

### namedItem（）—— 对象中指定 ID 或 name 的元素

```js
var a = document.getElementsByTagName('p').namedItem('p1');
console.log(a)
```







