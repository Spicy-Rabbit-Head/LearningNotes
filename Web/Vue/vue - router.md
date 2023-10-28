###  vue - router 安装

```apl
vue2包
npm i vue-router@3.5.2 -S
```

### 创建路由模块

```apl
src 目录下创建 router 文件夹
文件夹中创建 index.js 文件
```

```js
// 导入依赖包
import Vue from 'vue'
import VueRouter from 'vue-router'
// 将路由安装为Vue插件
Vue.use(VueRouter)
// 创建路由实例对象
const router = new VueRouter()
// 共享路由实例对象
export default router
```

```js
import Vue from 'vue'
import App from './App.vue'
// 导入main
import index from '@/router/index'

Vue.config.productionTip = false

new Vue({
    render: h => h(App),
    // 挂载
    router: index
}).$mount('#app')
```

### 路由使用

```js
// 导入依赖包
import Vue from 'vue'
import VueRouter from 'vue-router'
// 导入组件
import shuliang from '@/components/shuliang'
import kuang from '@/components/kuang'
import daohang from '@/components/daohang'
// 将路由安装为Vue插件
Vue.use(VueRouter)
// 创建路由实例对象
const router = new VueRouter({
    // 定义哈希地址与组件的对应关系
    routes: [
        // 哈希地址：组件
        {path: '/A', component: shuliang},
        {path: '/B', component: kuang},
        {path: '/C', component: daohang},
    ]
})
// 共享路由实例对象
export default router
```

```vue
<template>
  <div>
    <!--router 链接-->
    <router-link to="/A">主</router-link>
    <router-link to="/B">副1</router-link>
    <router-link to="/C">副2</router-link>
    <hr>
    <!--router 路由占位符-->
    <router-view></router-view>
  </div>
</template>
```

### 路由重定向

```js
const router = new VueRouter({
    routes: [
        // 路由重定向
        // 防止空页面
        {path: '/', redirect: '/A'},
        {path: '/A', component: shuliang},
        {path: '/B', component: kuang},
        {path: '/C', component: daohang}
    ]
})
```

### 嵌套路由

```js
import Vue from 'vue'
import App from './App.vue'

// 导入main
import index from '@/router/index'

Vue.config.productionTip = false

new Vue({
    render: h => h(App),
    // 挂载
    router: index
}).$mount('#app')
```

```js
import Vue from 'vue'
import VueRouter from 'vue-router'
import shuliang from '@/components/shuliang'
import kuang from '@/components/kuang'
import daohang from '@/components/daohang'
import tab1 from '@/components/tabs/tab1'
import tab2 from '@/components/tabs/tab2'

Vue.use(VueRouter)
const router = new VueRouter({
    routes: [
        {path: '/', redirect: '/A'},
        {path: '/A', component: shuliang},
        // 在嵌套的路由下建立子路由
        {
            path: '/B', component: kuang,
            // 使用 children 创建子路由
            children: [
                // 创建子路由重定向
                {path: '/B', redirect: 'tab1'},
                {path: 'tab1', component: tab1},
                {path: 'tab2', component: tab2}
            ]
        },
        {path: '/C', component: daohang}
    ]
})
export default router
```

```vue
<template>
  <div>
    <h1>我是B组件</h1>
    <!--子级路由-->
    <router-link to="/B/tab1">tab1</router-link>
    <router-link to="/B/tab2">tab1</router-link>
    <hr>
    <router-view></router-view>
  </div>
</template>
```

### 动态路由

```js
import Vue from 'vue'
import VueRouter from 'vue-router'
import shuliang from '@/components/shuliang'

Vue.use(VueRouter)
const router = new VueRouter({
    routes: [
        {path: '/med', redirect: '/med/1'},
        // 使用 : 指定多个相同组件
        {path: '/med/:id', component: shuliang},
    ]
})
export default router
```

```vue
<template>
  <div>
    <router-link to="/med/1">电影1</router-link>
    <router-link to="/med/2">电影2</router-link>
    <router-link to="/med/3">电影3</router-link>
    <hr>
    <router-view></router-view>
  </div>
</template>
```

### 组件对象 $route

```vue
<template>
  <div>
    <!--获取当前组件对象-->
    <h1>我是电影组件 {{ this.$route.params.id }}</h1>
  </div>
</template>
```

### props 传参

```js
const router = new VueRouter({
    routes: [
        {path: '/med', redirect: '/med/1'},
        // 开启 props 传参
        {path: '/med/:id', component: shuliang, props: true},
    ]
})
```

```vue
<template>
  <div>
    <!--获取当前组件对象 使用props-->
    <h1>我是电影组件 {{ id }}</h1>
  </div>
</template>
<script>
export default {
  // 接收 props 传参
  props: ['id']
}
</script>
```

### 路由 $router 方法

##### push - 指定URL跳转并产生一个历史记录

```vue
<template>
  <div>
    <button @click="Ace">到C</button>
    <router-link to="/A">主</router-link>
    <router-link to="/B">副1</router-link>
    <hr>
    <router-view></router-view>
  </div>
</template>
<script>
export default {
  methods: {
    Ace() {
      this.$router.push('/C')
    }
  }
}
</script>
```

##### replace - 跳转到指定URL并替代当前历史记录

```vue
<template>
  <div>
    <button @click="Ace">到C</button>
    <router-link to="/A">主</router-link>
    <router-link to="/B">副1</router-link>
    <hr>
    <router-view></router-view>
  </div>
</template>
<script>
export default {
  methods: {
    Ace() {
      this.$router.replace('/C')
    }
  }
}
</script>
```

##### go - 前进或后退指定数值

```vue
<template>
  <div>
    <button @click="Ace">后退</button>
    <router-link to="/A">主</router-link>
    <router-link to="/B">副1</router-link>
    <hr>
    <router-view></router-view>
  </div>
</template>
<script>
export default {
  methods: {
    Ace() {
      // 可前进可后退
      this.$router.go(-1)
    }
  }
}
</script>
```

##### back - 固定后退一个页面

##### forward - 固定前进一个页面

```vue
<template>
  <div>
    <button @click="Ace">后退</button>
    <button @click="Bce">前进</button>
    <router-link to="/A">主</router-link>
    <router-link to="/B">副1</router-link>
    <hr>
    <router-view></router-view>
  </div>
</template>
<script>
export default {
  methods: {
    Ace() {
      // 固定后退一个页面
      this.$router.back()
    },
    // 固定前进一个页面
    Bce() {
      this.$router.forward()
    }
  }
}
</script>
```

##### 全局前置守卫

```js
import Vue from 'vue'
import VueRouter from 'vue-router'
import shuliang from '@/components/shuliang'
import kuang from '@/components/kuang'
import daohang from '@/components/daohang'

Vue.use(VueRouter)
const router = new VueRouter({
    routes: [
        {path: '/', redirect: '/A'},
        {path: '/A', component: shuliang},
        {path: '/B', component: kuang},
        {path: '/C', component: daohang},
    ]
})

// 在全局实例对象上创建全局前置守卫，所有跳转皆会调用
// 形参 to ：将要访问的路由对象
// 形参 from ：将要离开的路由对象
// 形参 next ：放行函数，调用即允许从次路由
router.beforeEach((to, from, next) => {
    console.log(to)
    // next中可指定去往地址，或直接false不跳转
    next()
})


export default router
```

# 



​	
