# JS 查询

### typeof —— 检测数据类型

```js
// 查询数据类型
var a = 2;
console.log(typeof a)
```

# JS 全局属性

### Infinity（）—— 代表正的无穷大的数值

```js
// 代表正的无穷大的数值
var a = 1E+308;
console.log(a * 2)
```

### NaN（）—— 指示某个值是不是数字值

```js
// 指示某个值是不是数字值
console.log(NaN)
```

### undefined（）—— 指示未定义的值

```js
// 指示未定义的值
var a;
console.log(a)
```

# JS 全局方法

### decodeURI（）—— 解码某个编码的 URI

```js
// 解码某个编码的 URI
console.log(decodeURI('刘佳辉'))
```

### decodeURIComponent（）—— 解码一个编码的 URI 组件

```js
// 解码一个编码的 URI 组件
console.log(decodeURIComponent('刘佳辉'))
```

### encodeURI（）—— 把字符串编码为 URI

```js
// 把字符串编码为 URI
console.log(encodeURI('刘佳辉'))
```

### encodeURIComponent（）—— 把字符串编码为 URI 组件

```js
// 把字符串编码为 URI 组件
console.log(encodeURIComponent('刘佳辉'))
```

### eval（）—— 计算 JavaScript 字符串，并把它作为脚本代码来执行

```js
// 计算 JavaScript 字符串，并把它作为脚本代码来执行
eval('console.log(1)')
```

### isFinite（）—— 检查某个值是否为有穷大的数

```js
// 检查某个值是否为有穷大的数
console.log(isFinite(123))
console.log(isFinite(0/0))
console.log(isFinite('Hello'))
```

### isNaN（）—— 检查其参数是否是非数字值

```js
// 检查其参数是否是非数字值
console.log(isNaN(123))
console.log(isNaN('123'))
console.log(isNaN('Hello'))
```

### Number（）—— 把对象的值转换为数字

```js
// 把对象的值转换为数字
var a = '123'
console.log(Number(a))
```

### parseFloat（）—— 解析一个字符串并返回一个浮点数

```js
// 解析一个字符串并返回一个浮点数
console.log(parseFloat('12'))
console.log(parseFloat('Hello'))
console.log(parseFloat('40yes'))
```

### parseInt（）—— 解析一个字符串并返回一个整数

```js
// 解析一个字符串并返回一个整数
console.log(parseInt('123'))
console.log(parseInt('Hello'))
console.log(parseInt('40yes'))
```

### String（）—— 把对象的值转换为字符串

```js
// 把对象的值转换为字符串
var a = 123;
console.log(String(a))
```

# JS Number 对象属性

### constructor —— 返回对创建此对象的 Number 函数的引用

```js
// 返回对创建此对象的 Number 函数的引用
var a = Number(233);
console.log(a.constructor);
```

### MAX_VALUE —— 可表示的最大的数

```js
// 返回JavaScript 中可表示的最大的数
console.log(Number.MAX_VALUE);
```

### MIN_VALUE —— 可表示的最小的数

```js
// 返回JavaScript 中可表示的最小的数（接近 0 ，但不是负数）
console.log(Number.MIN_VALUE);
```

### NEGATIVE_INFINITY —— 表示负无穷大

```js
// 返回表示负无穷大
console.log(Number.NEGATIVE_INFINITY);
```

### NaN —— 代表非数字值的特殊值

```js
// 返回指示某个值不是数字
console.log(Number.NaN);
```

### POSITIVE_INFINITY —— 代表正无穷大

```js
// 返回代表正无穷大
console.log(Number.POSITIVE_INFINITY);
```

### EPSILON —— 表示 1 和比最接近 1 且大于 1 的最小 Number 之间的差别

```js
// 表示 1 和比最接近 1 且大于 1 的最小 Number 之间的差别
console.log(Number.EPSILON)
```

### MIN_SAFE_INTEGER —— 表示在 JavaScript中最小的安全的 integer 型数字

```js
// 表示在 JavaScript中最小的安全的 integer 型数字
console.log(Number.MIN_SAFE_INTEGER)
```

### MAX_SAFE_INTEGER —— 表示在 JavaScript 中最大的安全整数

```js
// 表示在 JavaScript 中最大的安全整数
console.log(Number.MAX_SAFE_INTEGER)
```

### prototype —— 允许您可以向对象添加属性和方法

```js
Number.prototype.Ace = function () {
    // 返回
    this.b = this.valueOf()/2;
}
var n =new Number(50);
n.Ace();
console.log(n.b)
```

# JS Number 对象方法

### isFinite( ) —— 检测指定参数是否为无穷大

```js
// 检测是否为无限大
// 检测数值
console.log(isFinite(233))
// 检测字符串数值
console.log(isFinite('233'))
// 检测字符串
console.log(isFinite('hhh'))
// 检测无穷大
console.log(isFinite(Infinity))
// 检测分数
console.log(isFinite(0/0))
```

### isNaN( ) —— 检测指定参数是否为 NaN

```js
/*用于判断传递的值是否为 NaN，并且检查其类型是否为 Number，
如果值为 NaN 且类型为 Number，则返回 true，否则返回 false*/
var a = Number(21),
    b = 0/0;
console.log(isNaN(a),isNaN(b));
```

### isInteger（）—— 检测是否为整数

```js
// 正数
console.log(Number.isInteger(123))
// 负数
console.log(Number.isInteger(-123))
// 字符数字
console.log(Number.isInteger('123'))
// 分数
console.log(Number.isInteger(4 / 2))
// 表达式
console.log(Number.isInteger(3 - 1))
// 小数
console.log(Number.isInteger(1.3))
```

 ### isSafeInteger（）—— 检测数值是否为安全整数，即双精度数值

```js
// 正数
console.log(Number.isSafeInteger(123))
// 负数
console.log(Number.isSafeInteger(-212))
// 字符数字
console.log(Number.isSafeInteger('123'))
// 分数
console.log(Number.isSafeInteger(2/3))
// 零
console.log(Number.isSafeInteger(0))
// 小数
console.log(Number.isSafeInteger(0.5))
```

### toExponential（）—— 将值转换为指数计数法

```js
var a = 31231,
    b=2.31231;
console.log(a.toExponential())
console.log(b.toExponential())
// 规定指数计数法中的小数位数
console.log(a.toExponential(2))
```

### toFixed（）—— 把数字转换为字符串，结果的小数点后有指定位数的数字

```js
// 可把 Number 四舍五入为指定小数位数的数字
var a = 5.31312;
console.log(a.toFixed(2))
```

### toLocaleString（）—— 返回数字在特定语言环境下的表示字符串

```js
var a = 5.31312;
console.log(a.toLocaleString('zh-CN'))
console.log(a.toLocaleString('pt-PT'))
```

### toPrecision（）—— 返回指定长度的数值字符串

```js
// 返回指定长度的数值字符串
var a = 5.31312;
console.log(a.toPrecision(2))
```

### toString（）—— 数字转换为字符串

```js
// 数字转换为字符串
var a = 5.31312;
// 二进制
console.log(a.toString(2))
// 八进制
console.log(a.toString(8))
// 十六进制
console.log(a.toString(16))
```

### valueOf（）—— 返回一个 Number 对象的基本数字值

```js
// 返回一个 Number 对象的基本数字值
var a = 5.31312;
console.log(a.valueOf())
```

# JS String 对象属性

### constructor（）—— 对创建String对象的函数的引用

```js
// 返回对 String 对象属性创建的函数
var a = '123'
console.log(a.constructor)
```

### length（）—— 返回字符串的长度(字符数)

```js
var a = '123 456';
// 空格也算字符数
console.log(a.length)
```

### prototype（）—— 向String对象添加属性和方法

```js
// 向String对象添加属性和方法
String.prototype.Ace = function () {
    this.b = this.valueOf()
}
var a = new String('刘佳辉')
a.Ace()
console.log(a.b)
```

# JS String 对象方法

### charAt（）—— 返回指定位置的字符

```js
var a = '123456';
// 返回在指定位置的字符
console.log(a.charAt(2))
```

### charCodeAt（）—— 返回指定位置的字符的 Unicode 编码

```js
var a = 'Hello';
// 返回指定位置的字符的 Unicode 编码
console.log(a.charCodeAt(2))
```

### concat（）—— 连接两个或多个字符串

```js
var a = 'Hello',
    b = '-'
    c = 'world';
// 连接两个或多个字符串
console.log(a.concat(b,c))
```

### startsWith（）—— 检测字符串是否以指定的子字符串开始

```js
var a = 'like';
// 检测字符串是否以指定的子字符串开始
console.log(a.startsWith('l'))
console.log(a.startsWith('i'))
```

### endsWith（）—— 判断当前字符串是否是以指定的子字符串结尾

```js
var a = 'Hello';
// 判断当前字符串是否是以指定的子字符串结尾
console.log(a.endsWith('o'))
console.log(a.endsWith('e'))
```

### fromCharCode（）—— 指定的 Unicode 值，然后返回一个字符串

```js
// 指定的 Unicode 值，然后返回一个字符串
var a = String.fromCharCode(121,43,222,53)
console.log(a)
```

### indexOf（）—— 返回某个指定的字符串值在字符串中出现的位置

```js
var a = 'a b c d e f';
// 返回某个指定的字符串值在字符串中出现的位置
console.log(a.indexOf('b'))
// 指定从哪里开始
console.log(a.indexOf('b',5))
// 如果没有找到匹配的字符串则返回 -1
```

### includes（）—— 判断字符串是否包含指定的子字符串

```js
var a = 'Hello like a is';
// 判断字符串是否包含指定的子字符串
console.log(a.includes('like'))
// 指定从哪里开始
console.log(a.includes('like',10))
```

### lastIndexOf（）—— 返回一个指定的字符串值最后出现的位置

```js
var a = 'a b c d e f';
// 返回一个指定的字符串值最后出现的位置
console.log(a.lastIndexOf('e'))
// 指定从哪里开始
console.log(a.lastIndexOf('e',6))
// 如果没有找到匹配的字符串则返回 -1
```

### match（）—— 检索指定的值，或找到一个或多个正则表达式的匹配

```js
// 检索指定的值，或找到一个或多个正则表达式的匹配
var a = 'a is taa abc ace',
    b = a.match(/a/g);
console.log(b)
```

### repeat（）—— 字符串复制指定次数

```js
var a = 'like';
console.log(a.repeat(3))
```

### replace（）—— 在字符串中查找匹配的子串，并替换匹配的子串

```js
// 在字符串中查找匹配的子串，并替换与正则表达式匹配的子串
var a = 'a is taa abc ace',
    b = a.replace('is','te');
console.log(b)
```

### replaceAll（）—— 在字符串中查找匹配的子串，并替换匹配的所有子串

```js
// 在字符串中查找匹配的子串，并替换与正则表达式匹配的所有子串
var a = 'a is taa is ace',
    b = a.replaceAll('is','te');
console.log(b)
```

### search（）—— 查找字符串与表达式相匹配的值

```js
// 查找字符串与正则表达式相匹配的值
var a = 'a is taa is ace';
console.log(a.search('is'))
```

### slice（）—— 提取字符串的某个部分

```js
var a = 'like';
console.log(a.slice(1,3))
```

### split（）—— 把一个字符串分割成字符串数组

```js
// 把一个字符串分割成字符串数组
var a = 'a is taa is ace',
    b = a.split(' ');
console.log(b)
```

### substr（）—— 抽取从指定下标开始的指定数目的字符

```js
var a = 'like is fack';
// 抽取从指定下标开始的指定数目的字符
console.log(a.substr(5,2))
```

### substring（）—— 提取字符串中介于两个指定下标之间的字符

```js
var a = 'like is fack';
// 提取字符串中介于两个指定下标之间的字符
console.log(a.substring(5,7))
```

### toLowerCase（）—— 把字符串转换为小写

### toLocaleLowerCase（） 根据本地主机的语言环境把字符串转换为小写

```js
var a = 'ABCD abcd';
// 把字符串转换为小写
console.log(a.toLowerCase())
// ——————————————————————————————————
// 根据本地主机的语言环境把字符串转换为小写
console.log(a.toLocaleLowerCase())
```

### toUpperCase（）—— 把字符串转换为大写

### toLocaleUpperCase（）—— 根据本地主机的语言环境把字符串转换为大写

```js
var a = 'ABCD abcd';
// 把字符串转换为大写
console.log(a.toUpperCase())
// ——————————————————————————————————
// 根据本地主机的语言环境把字符串转换为大写
console.log(a.toLocaleUpperCase())
```

### trim（）—— 删除字符串的头尾空白符

```js
var a = '       a       ';
console.log(a)
// 删除字符串的头尾空白符
console.log(a.trim())
```

### valueOf（）—— 返回 String 对象的原始值

```js
var a = '1';
console.log(a.valueOf())
```

### toString（）—— 返回一个表示 String 对象的值

```js
var a = '1';
console.log(a.toString())
```

# JS Math 对象属性

### E —— 算术常量 e，即自然对数的底数

```js
// 返回算术常量 e，即自然对数的底数（约等于2.718）
console.log(Math.E)
```

### LN2 —— 返回 2 的自然对数

```js
// 返回 2 的自然对数（约等于0.693）
console.log(Math.LN2)
```

### LN10 —— 返回 10 的自然对数

```js
// 返回 10 的自然对数（约等于2.302）
console.log(Math.LN10)
```

### LOG2E —— 返回以 2 为底的 e 的对数

```js
// 返回以 2 为底的 e 的对数（约等于 1.4426950408889634）
console.log(Math.LOG2E)
```

### LOG10E —— 返回以 10 为底的 e 的对数

```js
// 返回以 10 为底的 e 的对数（约等于0.434）
console.log(Math.LOG10E)
```

### PI —— 返回圆周率

```js
// 返回圆周率（约等于3.14159）
console.log(Math.PI)
```

### SQRT1_2 —— 返回2的平方根的倒数

```js
// 返回 2 的平方根的倒数（约等于 0.707）
console.log(Math.SQRT1_2)
```

### SQRT2 —— 返回2的平方根

```js
// 返回 2 的平方根（约等于 1.414）
console.log(Math.SQRT2)
```

# JS Math 对象方法

### abs（）—— 返回一个数的绝对数

```js
// 返回绝对数
console.log(Math.abs(-21))
console.log(Math.abs(21))
// 如果x不是数值则返回NaN，如果是null返回0
```

### acos（）—— 返回数值的反余弦，即0到PI之间的弧度值

```js
// 返回数值的反余弦，即0到PI之间的弧度值
console.log(Math.acos(-0.5))
console.log(Math.acos(0.2))
// 参数x超过 -1~1 则返回NaN，参数 x 为 -1 则返回 PI
```

### asin （）—— 返回数组反正余弦，即 -PI/2 到 PI/2 之间的弧度值

 ```js
 // 返回数组反正余弦，即 -PI/2 到 PI/2 之间的弧度值
 console.log(Math.asin(-1))
 console.log(Math.asin(1))
 // 参数 x 超过 -1~1 则返回NaN，如果 x 为 1 则返回PI/2
 ```

### atan（）—— 返回指定数的反正切值

```js
// 返回指定数的反正切值
console.log(Math.atan(-2))
console.log(Math.atan(1.2))
// 以介于 -PI/2 与 PI/2 弧度之间的数值来返回 x 的反正切值
```

### atan2（）—— 返回从 x 轴到点 (x,y) 的角度（介于 -PI/2 与 PI/2 弧度之间）

```js
// 返回从 x 轴到点 (x,y) 的角度（介于 -PI/2 与 PI/2 弧度之间）
console.log(Math.atan2(-2,1))
console.log(Math.atan2(1.2,12))
// 返回从原点(0,0) 到 (x,y) 点的线段与 x 轴正方向之间的平面角度(弧度值)
// y 坐标是作为第一个参数传递， x 坐标作为第二个参数传递
```

### ceil（）—— 对数值进行上舍入

```js
// 对一个数进行上舍入
console.log(Math.ceil(-1.5))
console.log(Math.ceil(1.12))
// 向高取整
```

### floor（）—— 对数值进行下舍入

```js
// 进行下舍入
console.log(Math.floor(-1.5))
console.log(Math.floor(1.12))
```

### cos（）—— 返回数值的余弦

```js
// 返回数值的余弦
console.log(Math.cos(-1.5))
console.log(Math.cos(1.12))
```

### exp（）—— 返回 Ex 的指数

```js
// 返回 e 的 x 次幂的值
console.log(Math.exp(-1.5))
console.log(Math.exp(1.12))
```

### log（）—— 返回数的自然对数

```js
// 返回数的自然对数
console.log(Math.log(12))
```

### max（）—— 返回N个指定的数中最大的值

```js
// 返回N个指定的数中最大的值
console.log(Math.max(1,23,532,32,321,321,2))
```

### min（）—— 返回N个指定的数中最小的值

```js
// 返回N个指定的数中最小的值
console.log(Math.min(1,23,532,32,321,321,2))
```

### pow（）—— 返回 x 的 y 次幂

```js
// 返回 x 的 y 次幂
console.log(Math.pow(2,4))
```

### random（）—— 返回介于 0（包含） ~ 1（不包含） 之间的一个随机数

```js
// 返回介于 0（包含） ~ 1（不包含） 之间的一个随机数
console.log(Math.random())
```

### round（）—— 将数字舍入为最接近的整数

```js
// 将数字舍入为最接近的整数
console.log(Math.round(12.132))
```

### sin（）—— 返回数的正弦

```js
// 返回数的正弦
console.log(Math.sin(1))
```

### sqrt（）—— 返回数的平方根

```js
// 返回数的平方根
console.log(Math.sqrt(2))
```

### tan（）—— 返回角的正切

```js
// 返回角的正切
console.log(Math.tan(90))
```

# JS Array 对象属性

### length —— 设置或返回数组元素的个数

```js
var a = [1,2,3,4,5];
// 返回数组元素个数
console.log(a.length)

var b = []
// 设置数组元素个数
b.length = 2
console.log(b.length)
```

### constructor —— 返回创建数组对象的原型函数

```js
// 返回创建数组对象的原型函数
var a = [1,2,3,4,5];
console.log(a.constructor)
```

### prototype —— 向对象添加属性和方法

```js
// 向对象添加属性和方法
Array.prototype.Ace = function () {
    for (i = 0; i < this.length; i++) {
        this[i] = this[i].toUpperCase();
    }
}
var a = ['abvd','adasd','dsada'];
a.Ace()
console.log(a)
```

# JS Array 对象方法

### concat（）—— 连接数组，并返回结果

```js
var a = [1,2,3],
    b = [4,5,6];
// 连接多个数组，但是并不会改变原数组值
console.log(a.concat(b));
```

### copyWithin（）—— 从数组的指定位置拷贝元素到数组的另一个指定位置中

```js
var a = [1,2,3,4];
// console.log(数组.copyWithin(复制到的位置,复制的起始位,复制的停止位))
console.log(a.copyWithin(2,0,2))
```

### entries（）—— 返回数组的可迭代对象

```js
// 返回可迭代对象
var a = ['a','b','c','d'],
    b = a.entries();
// 输出值
console.log(b.next().value);
console.log(b.next().value);
console.log(b.next().value);
console.log(b.next().value);
console.log(b.next().value);
```

### every（）—— 检索数组所有元素是否符合指定条件

```js
// 检索数组所有元素是否符合指定条件
var a = [32, 13, 23, 12];
function Ace(age) {
    return age >= 18;
}
console.log(a.every(Ace))
```

### fill（）—— 将一个固定值替换数组的元素

```js
var a = [1,2,3,4,5];
// a.fill(填充的值,开始填充的位置,停止填充的位置);
a.fill(66,0,3);
console.log(a)
```

### filter（）—— 检查指定数组中符合条件的所有元素并赋值给新数组

```js
// 检查指定数组中符合条件的所有元素并赋值给新数组
var a = [32, 13, 23, 12];
function Ace(age) {
    return age >= 18;
}
console.log(a.filter(Ace))
```

### find（）—— 检索数组所有的值，判断成功返回值，后续值不再判断

```js
// 检索数组所有的值，判断成功返回值，后续值不再判断
var a = [32, 13, 23, 12];
function Ace(age) {
    return age >= 18;
}
console.log(a.find(Ace))
```

### findIndex（）—— 检索数组所有值，判断成功返回索引，后续不再判断

```js
// 检索数组所有值，判断成功返回索引，后续不再判断
var a = [32, 13, 23, 12];
function Ace(age) {
    return age >= 18;
}
console.log(a.findIndex(Ace))
```

### forEach（）—— 数组每个元素都执行一次回调函数

```js
// 数组每个元素都执行一次回调函数
var a = [32, 13, 23, 12];
function Ace(age) {
    console.log(age >= 18)
}
a.forEach(Ace)
```

### from（）—— 通过给定的对象中创建一个数组

```js
// 通过给定的对象中创建一个数组
var a = Array.from('Hello')
console.log(a)
```

### includes（）—— 判断一个数组是否包含一个指定的值

```js
var a = [1,2,3,4,5,6];
// 查找全部
console.log(a.includes(2))
console.log(a.includes(8))	
// 设定查找开始位置
console.log(a.includes(2,3))
```

### indexOf（）—— 搜索数组中的元素，并返回它所在的位置

```js
var a = [1,2,3,4,5,6];
// 查找全部
console.log(a.indexOf(3))
// 未找到元素返回 -1
console.log(a.indexOf(8))
// 设定查找开始位置
console.log(a.indexOf(2,3))
```

### isArray（）—— 判断对象是否为数组

```js
var a = [1, 2, 3, 4, 5, 6],
    b = 21;
console.log(Array.isArray(a))
console.log(Array.isArray(b))
```

### join（）—— 把数组的所有元素放入一个字符串

```js
var a = [1, 2, 3, 4, 5, 6];
// 转换输出字符串
console.log(a.join())
// 可指定字符间隔样式
console.log(a.join('-'))
```

### toString（）—— 把数组转换为字符串，并返回结果

```js
var a = [1,2,3,4,5,6];
console.log(a.toString())
```

### keys（）—— 返回数组的可迭代对象，包含原始数组的键(key)

```js
var a = [1, 2, 3, 4, 5, 6],
// 转换为可迭代对象
    b = a.keys();
console.log(b.next().value);
console.log(b.next().value);
console.log(b.next().value);
console.log(b.next().value);
```

### lastIndexOf（）—— 搜索数组中的元素，并返回它最后出现的位置

```js
var a = [1, 2, 3, 4, 5, 6];
console.log(a.lastIndexOf(4));
// 可指定开始位置
console.log(a.lastIndexOf(4, 2));
```

### map（）—— 通过指定函数处理数组的每个元素，并返回处理后的数组

```js
// 通过指定函数处理数组的每个元素，并返回处理后的数组
var a = [4, 9, 16, 25]
function Ace() {
    console.log(a.map(Math.sqrt))
}
Ace()
```

### pop（）—— 删除数组的最后一个元素并返回删除的元素

```js
var a = [1, 2, 3, 4, 5, 6];
// 删除最后一个并返回删除的值
console.log(a.pop())
// 删除后的数组元素及长度都发送了变化
console.log(a)
```

### push（）—— 向数组的末尾添加一个或更多元素，并返回新的长度

```js
var a = [1, 2, 3, 4, 5, 6];
// 向数组尾部添加元素并返回长度
console.log(a.push(7,'8'))
console.log(a)
```

### shift（）—— 删除并返回数组的第一个元素

```js
var a = [1, 2, 3, 4, 5, 6];
// 删除第一个并返回删除的值
console.log(a.shift())
console.log(a)
```

### unshift（）—— 向数组的开头添加一个或更多元素，并返回新的长度

```js
var a = [1, 2, 3, 4, 5, 6];
// 向数组头部添加元素并返回长度
console.log(a.unshift(-1,'0'))
console.log(a)
```

### reduce（）—— 将数组元素计算为一个值（从左到右）

```js
// 将数组元素计算为一个值（从左到右）
var a = [4, 9, 16, 25]
function Ace(b, c) {
    return b + c
}
console.log(a.reduce(Ace))
```

### reduceRight（）—— 将数组元素计算为一个值（从右到左）

```js
// 将数组元素计算为一个值（从右到左）
var a = [4, 9, 16, 25]
function Ace(b, c) {
    return b + c
}
console.log(a.reduceRight(Ace))
```

### reverse（）—— 反转数组的元素顺序

```js
var a = [1, 2, 3, 4, 5, 6];
// 反转数组
console.log(a.reverse());
```

### slice（）—— 选取数组的一部分，并返回一个新数组

```js
var a = [1, 2, 3, 4, 5, 6];
// 根据指定截取数组元素
console.log(a.slice(2,4));
// 原数组不会被影响
console.log(a);
```

### some（）—— 检测数组元素中是否有元素符合指定条件

```js
var a = [1, 2, 3, 4, 5, 6];
// 创建检测函数
function Age(age){
    // 判断是否满足条件并返回
    return age >= 4;
}
// 调用检测函数检测，并输出结果
console.log(a.some(Age))
```

### sort（）—— 对数组的元素进行升降排序

```js
var a = [423, 23, 44, 1, 12, 31];
// 创建升序比较函数
function shen(a,b){
    return a-b;
}
// 对数组的元素进行升序
console.log(a.sort(shen))
// 创建降序比较函数
function jiang(a,b){
    return b-a;
}
// 对数组的元素进行降序
console.log(a.sort(jiang))
```

### splice（）—— 从数组中添加或删除元素

```js
var a = [1,2,3,4,5,6];
// 从指定位置删除N个元素
console.log(a.splice(2,2))
console.log(a)
// 从指定位置添加N个元素
console.log(a.splice(2,0,1,2,1))
console.log(a)
```

### valueOf（）—— 返回数组对象的原始值

```js
var a = [1,2,3,4,5,6];
console.log(a.valueOf())
```

# JS Booleam 对象属性

### constructor（）—— 返回对创建此对象的 Boolean 函数的引用

```js
// 返回对创建此对象的 Boolean 函数的引用
var a = new Boolean(1)
console.log(a.constructor)
```

### prototype（）—— 向对象添加属性和方法

```js
// 向对象添加属性和方法
Boolean.prototype.Ace = function () {
    if (this.valueOf() == true) {
        this.age = 'geern'
    } else {
        this.age = 'red'
    }
}
var a = new Boolean(1);
a.Ace();
console.log(a.age)
```

# JS Booleam 对象方法

### toString（）—— 把一个逻辑值转换为字符串，并返回结果

```js
// 把一个逻辑值转换为字符串，并返回结果
var a = true;
console.log(a.toString())
```

### valueOf（）—— 返回 Boolean 对象的原始值

```js
// 返回 Boolean 对象的原始值
var a = true;
console.log(a.valueOf())
```

# JS Date 对象属性

### constructor —— 返回对创建此对象的 Date 函数的引用

```js
// 返回对创建此对象的 Date 函数的引用
var a =Date;
console.log(a.constructor)
```

### prototype —— 向对象添加属性和方法

```js
// 向对象添加属性和方法
Date.prototype.Ace=function(){
    if (this.getMonth()==0){this.myProp="一月"};
    if (this.getMonth()==1){this.myProp="二月"};
    if (this.getMonth()==2){this.myProp="三月"};
    if (this.getMonth()==3){this.myProp="四月"};
    if (this.getMonth()==4){this.myProp="五月"};
    if (this.getMonth()==5){this.myProp="六月"};
    if (this.getMonth()==6){this.myProp="七月"};
    if (this.getMonth()==7){this.myProp="八月"};
    if (this.getMonth()==8){this.myProp="九月"};
    if (this.getMonth()==9){this.myProp="十月"};
    if (this.getMonth()==10){this.myProp="十一月"};
    if (this.getMonth()==11){this.myProp="十二月"};
}
var d = new Date();
d.Ace()
console.log(d)
```

# JS Date 对象方法

### getDate（）—— 返回月份的某一天

### getUTCDate（）—— 返回协调世界时月份的某一天

```js
// 实例化
var a = new Date();
// 返回天数 (1 ~ 31)
console.log(`今天${a.getDate()}号`)
// ————————————————————————————————————————————
// 返回世界时天数 (1 ~ 31)
console.log(`协调世界时${a.getUTCDate()}号`)
```

### getDay（）—— 返回一周的某一天

### getUTCDay（）—— 返回协调世界时一周的某一天

```js
// 实例化
var a = new Date();
// 返回星期数(0 ~ 6)
console.log(`今天星期${a.getDay()}`)
// ————————————————————————————————————————————
// 返回世界时星期数(0 ~ 6)
console.log(`协调世界时星期${a.getUTCDay()}`)
```

### getFullYear（）—— 以四位数字返回年份

### getUTCFullYear（）—— 以四位数字返回协调世界时年份

```js
// 实例化
var a = new Date();
// 返回年份
console.log(`今年是${a.getFullYear()}年`)
// ————————————————————————————————————————————
// 返回世界时年份
console.log(`协调世界时是${a.getUTCFullYear()}年`)
```

### getHours（）—— 返回 Date 对象的小时

### getUTCHours（）—— 返回协调世界时 Date 对象的小时

```js
// 实例化
var a = new Date();
// 返回小时(0 ~ 23)
console.log(`现在是${a.getHours()}时`)
// ————————————————————————————————————————————
// 返回小时(0 ~ 23)
console.log(`协调世界时现在是${a.getUTCHours()}时`)
```

### getMilliseconds（）—— 返回 Date 对象的毫秒

### getUTCMilliseconds（）—— 返回协调世界时 Date 对象的毫秒

```js
// 实例化
var a = new Date();
// 返回毫秒(0 ~ 999)
console.log(`当前实际的毫秒是${a.getMilliseconds()}`)
// ————————————————————————————————————————————
// 返回毫秒(0 ~ 999)
console.log(`当前协调世界时毫秒是${a.getUTCMilliseconds()}`)
```

### getMinutes（）—— 返回 Date 对象的分钟

### getUTCMinutes（）—— 返回协调世界时 Date 对象的分钟

```js
// 实例化
var a = new Date();
// 返回分钟 (0 ~ 59)
console.log(`当前时间的分钟是${a.getMinutes()}`)
// ————————————————————————————————————————————
// 返回分钟 (0 ~ 59)
console.log(`当前协调世界时分钟是${a.getUTCMinutes()}`)
```

### getMonth（）—— 返回 Date 对象的月份

### getUTCMonth（）—— 返回协调世界时 Date 对象的月份

```js
// 实例化
var a = new Date();
// 返回月份 (0 ~ 11)
console.log(`现在的是${a.getMonth() + 1}月`)
// ————————————————————————————————————————————
// 返回月份 (0 ~ 11)
console.log(`现在协调世界时是${a.getUTCMonth() + 1}月`)
```

### getSeconds（）—— 返回 Date 对象的秒数

### getUTCSeconds（）—— 返回协调世界时 Date 对象的秒数

```js
// 实例化
var a = new Date();
// 返回秒数 (0 ~ 59)
console.log(`现在的是${a.getSeconds()}秒`)
// ————————————————————————————————————————————
// 返回秒数 (0 ~ 59)
console.log(`现在协调世界时是${a.getUTCSeconds()}秒`)
```

### getTime（）—— 返回 1970 年 1 月 1 日至今的毫秒数

```js
// 实例化
var a = new Date();
// 返回 1970 年 1 月 1 日至今的毫秒数
console.log(`到现在已经${a.getTime()}毫秒了`)
```

### getTimezoneOffset（）—— 返回本地时间和格林威治时间差

```js
// 实例化
var a = new Date();
// 返回本地时间和格林威治时间差
console.log(`当前时间和格林威治时间差为${a.getTimezoneOffset()}分钟`)
```

### parse（）—— 返回 1970 年 1 月 1 日到指定时间的毫秒数

```js
// 返回 1970 年 1 月 1 日午夜到指定时间的毫秒数
var a = Date.parse('3 21, 2012');
console.log(`到指定时间的毫秒数是${a}`)
```

### setDate（）—— 设置 Date 对象中月的某一天

### setUTCDate（）—— 设定协调世界时 Date 对象的某一天

```js
var a = new Date()
console.log(a)
// 设置 Date 对象中月的某一天(1 ~ 31)
a.setDate(11)
console.log(a)
// ————————————————————————————————————————————
// 设置协调世界时 Date 对象中月的某一天(1 ~ 31)
a.setUTCDate(10)
console.log(a)
```

### setFullYear（）—— 设置 Date 对象中的年份

### setUTCFullYear（）—— 设置协调世界时 Date 对象中的年份

```js
var a = new Date()
console.log(a)
// 设置 Date 对象中的年份（四位数字）
a.setFullYear(2035,5,12)
// (年，月，日)
console.log(a)
// ————————————————————————————————————————————
// 设置协调世界时 Date 对象中的年份（四位数字）
a.setUTCFullYear(2050,5,12)
// (年，月，日)
console.log(a)
```

### setHours（）—— 设置 Date 对象中的小时

### setUTCHours（）—— 设置协调世界时 Date 对象中的小时

```js
var a = new Date()
console.log(a)
// 设置 Date 对象中的小时 (0 ~ 23)
a.setHours(12,0,0,0)
// (时，分，秒，毫秒)
console.log(a)
// ————————————————————————————————————————————
// 设置协调世界时 Date 对象中的小时 (0 ~ 23)
a.setUTCHours(13,1,1)
// (时，分，秒，毫秒)
console.log(a)
```

### setMilliseconds（）—— 设置 Date 对象中的毫秒

### setUTCMilliseconds（）—— 设置协调世界时 Date 对象中的毫秒

```js
var a = new Date()
console.log(a.getMilliseconds())
// 设置 Date 对象中的毫秒 (0 ~ 999)
a.setMilliseconds(500)
console.log(a.getMilliseconds())
// ————————————————————————————————————————————
// 设置协调世界时 Date 对象中的毫秒 (0 ~ 999)
a.setUTCMilliseconds(600)
console.log(a.getMilliseconds())
```

### setMinutes（）—— 设置 Date 对象中的分钟

### setUTCMinutes（）—— 设置协调世界时 Date 对象中的分钟

```js
var a = new Date()
console.log(a)
// 设置 Date 对象中的分钟 (0 ~ 59)
a.setMinutes(24,24,24)
// (分，秒，毫秒)
console.log(a)
// ————————————————————————————————————————————
// 设置协调世界时 Date 对象中的分钟 (0 ~ 59)
a.setUTCMinutes(25,25,25)
// (分，秒，毫秒)
console.log(a)
```

### setMonth（）—— 设置 Date 对象中月份

### setUTCMonth（）—— 设置协调世界时 Date 对象中月份

```js
var a = new Date()
console.log(a)
// 设置 Date 对象中月份 (0 ~ 11)
a.setMonth(3,3)
// (月，天)
console.log(a)
// ————————————————————————————————————————————
// 设置协调世界时 Date 对象中月份 (0 ~ 11)
a.setUTCMonth(4,4)
// (月，天)
console.log(a)
```

### setSeconds（）—— 设置 Date 对象中的秒钟

### setUTCSeconds（）—— 设置协调世界时 Date 对象中的秒钟

```js
var a = new Date()
console.log(a)
// 设置 Date 对象中的秒钟 (0 ~ 59)
a.setSeconds(3,3)
// (秒，毫秒)
console.log(a)
// ————————————————————————————————————————————
// 设置协调世界时 Date 对象中的秒钟 (0 ~ 59)
a.setUTCSeconds(4,4)
// (秒，毫秒)
console.log(a)
```

### setTime（）—— 以毫秒添加 Date 对象

```js
var a = new Date()
console.log(a)
// 向 1970 年 01 月 01 日 添加 xx毫秒，并显示新的日期和时间
a.setTime(10000000000000)
console.log(a)
```

### toDateString（）—— 把对象的日期部分转换为字符串

```js
var a = new Date()
// 日期部分转换为可读字符串
console.log(a.toDateString())
```

### toISOString（）—— 使用 ISO 标准返回字符串的日期格式

```js
var a = new Date()
// 使用 ISO 标准返回字符串的日期格式
console.log(a.toISOString())
```

### toJSON（）—— 以 JSON 数据格式返回日期字符串

```js
var a = new Date()
// 以 JSON 数据格式返回日期字符串
console.log(a.toJSON())
```

### toLocaleDateString（）—— 根据本地时间格式，把日期部分转换为字符串

```js
var a = new Date()
// 根据本地时间格式，把日期部分转换为字符串
console.log(a.toLocaleDateString())
```

### toLocaleTimeString（）—— 根据本地时间格式，把时间部分转换为字符串

```js
var a = new Date()
// 根据本地时间格式，把时间部分转换为字符串
console.log(a.toLocaleTimeString())
```

### toLocaleString（）—— 根据本地时间格式，把 Date 对象转换为字符串

```js
var a = new Date()
// 根据本地时间格式，把 Date 对象转换为字符串
console.log(a.toLocaleString())
```

### toString（）—— 把 Date 对象转换为字符串

```js
var a = new Date()
// 把 Date 对象转换为字符串
console.log(a.toString())
```

### toTimeString（）—— 把 Date 对象的时间部分转换为字符串

```js
var a = new Date()
// 把 Date 对象的时间部分转换为字符串
console.log(a.toTimeString())
```

### toUTCString（）—— 根据协调世界时，把 Date 对象转换为字符串

```js
var a = new Date()
// 根据协调世界时，把 Date 对象转换为字符串
console.log(a.toUTCString())
```

### UTC（）—— 根据协调世界时返回 1970 年 1 月 1 日 到指定日期的毫秒数

```js
// 根据协调世界时返回 1970 年 1 月 1 日 到指定日期的毫秒数
var a = Date.UTC(2022,7,14,20,41,40,500)
// (年，月，日，时，分，秒，毫秒)
console.log(a)
```

### valueOf（）—— 返回 Date 对象的原始值

```js
var a = Date();
// 返回 Date 对象的原始值
console.log(a.valueOf())
```
