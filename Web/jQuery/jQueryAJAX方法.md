# jQuery AJAX方法

### ajax() —— 用于执行 AJAX（异步 HTTP）请求

```html
<!doctype html>
<html lang="zh" xmlns:v-bind="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>666666</title>
</head>
<body>

<button>点击POST</button>

<script src="js/jQuery.js"></script>
<script>
    // 用于执行 AJAX（异步 HTTP）请求
    $('button').click(function () {
        $.ajax({
            // 请求方式
            type: 'get',
            // 请求地址
            url: 'H.json',
            // 请求指定数据
            data: {},
            // 预期返回的数据类型
            dataType: 'jsonp',

            jsonp: 'callback',

            // 请求成功调用的函数，形参为返回的数据
            success: function (aa) {
                console.log(aa)
            },
            // 是否异步处理，默认为true
            async: true,
            // 发生给服务器的内容类型
            contentType: 'application/x-www-form-urlencoded',
            // 请求失败运行的函数
            error: function () {
                console.log('请求失败了')
            },
            complete: function () {
                console.log('发送了请求，但我不知道成功没')
            }
        })
    })
</script>
</body>
</html>
```

### get() —— 使用 HTTP GET 请求从服务器加载数据

```js
// 使用 HTTP GET 请求从服务器加载数据
$('button').click(function (){
    $.get({
        url:'H.json',
        success:function (aa){
            console.log(aa)
        }
    })
})
```

### getJSON() —— 使用 AJAX 的 HTTP GET 请求获取 JSON 数据

```js
// 使用 AJAX 的 HTTP GET 请求获取 JSON 数据
$('button').click(function (){
    $.getJSON({
        url:'H.json',
        success:function (aa){
            console.log(aa)
        }
    })
})
```

### post() —— 使用 HTTP POST 请求从服务器加载数据

### load() —— 从服务器加载数据，并把返回的数据放置到指定的元素中

```js
// 从服务器加载数据，并把返回的数据放置到指定的元素中
$('button').click(function (){
    $('div').load('H.json')
})
```



