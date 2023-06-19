### axios 基础

### axios 常见配置项

```apl
+ 请求路径
url:''           
+ 请求方法
method:'get' ---- method:'post'
+ 设置请求头
headers:{'xxxxx':'xxxxx'}
+ 设置 url query参数
params:{
	id:123,
	name:'Jack'
}
+ 设置请求体
data:{
	name:'Jack'
}
+ 请求超时
timeout:1000
+ 响应数据类型
responseType:'json'
+ 响应数据的编码规则
responseEncoding:'utf8'
```

### get 请求

```js
axios({
    // 定义请求地址
    url: 'http://www.liulongbin.top:3006/api/get',
    // 默认为get请求
    method: 'get'
    // 接收并执行函数
}).then(res => {
    console.log(res)
})
```

### post 请求

```js
axios({
    url: 'http://www.liulongbin.top:3006/api/post',
    method: 'post',
}).then(res => {
    console.log(res)
})
```

### vue挂载

```js
// 挂载到vue原型上
Vue.prototype.axios = axios
```

```vue
<template>
  <div>
    <button @click="Ace">+++</button>
  </div>
</template>
<script>
export default {
  methods: {
    Ace() {
      // 可直接使用
      this.axios.get('http://www.liulongbin.top:3006/api/get').then(res => {
        console.log(res)
      })
    }
  }
}
</script>
```

### axios 全局配置

```js
// 全局配置axios的请求根路径
axios.defaults.baseURL = 'http://www.liulongbin.top:3006'
```

