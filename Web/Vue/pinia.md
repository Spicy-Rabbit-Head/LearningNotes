### 初始化

```js
import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import {createPinia} from 'pinia'

const pinia = createPinia()

createApp(App).use(pinia).mount('#app')

```

```js
import {defineStore} from 'pinia/dist/pinia.js'
// 定义并导出容器
// 参数1：容器的ID必须唯一
// 参数2：选项对象
export const usemain = defineStore('main', {
    // 相当于组件的data，储存全局状态
    state: () => {
        com:100
    },
    // 封装计算属性，有缓冲功能
    getters: {},
    // 封装逻辑，修改state
    actions: {}
})
```

### 导入pinia

```vue
<template>
<!--展示-->
  <h1>{{ att.com }}</h1>
</template>
<script setup>
// 导入定义对象
import {usemain} from './store/index.js'
// 获取对象内值
const att = usemain()

</script>
```

### 修改值

```vue
<template>
  <h1>{{ att.com }}</h1>
  <button @click="gaibian">++</button>
</template>
<script setup>
import {usemain} from './store/index.js'
const att = usemain()
// 修改pinia内对象值
const gaibian = () => {
  att.com++
}
</script>
```

### 解决解构后无法响应式

```vue
<template>
  <h1>{{ att.com }}</h1>
  <h1>{{com}}</h1>
  <h1>{{da}}</h1>
  <button @click="gaibian">++</button>
</template>
<script setup>
import {usemain} from './store/index.js'
// 导入torefs
import {storeToRefs} from 'pinia'
const att = usemain()
// 解构pinia对象
const {com,da}=storeToRefs(att)
const gaibian = () => {
  att.com++
  // 可响应式读取，但不能修改
  da++
}
</script>
```

### 状态更新

```vue
<template>
  <h1>{{ att.com }}</h1>
  <h1>{{ att.da }}</h1>
  <h1>{{ att.ts }}</h1>
  <button @click="gaibian">++</button>
</template>
<script setup>
import {usemain} from './store/index.js'

const att = usemain()

const gaibian = () => {
  // 修改个别数据时使用
  att.com++
  // 修改多个数据时使用
  att.$patch({
    com: att.com + 1,
    da: att.da + 1
  })
  //修改复杂数据类型
  att.$patch(stat=>{
    stat.com++
    stat.da++
    stat.ts.push(stat.com)
  })
  // 逻辑复杂的修改封装到actions中
  att.xiugai()
}
</script>
```

```js
// 封装逻辑，修改state
actions: {
    xiugai(){
        this.com++
        this.da++
        this.ts.push(this.da)
    }
}
```

### getters 使用

```js
// 封装计算属性，有缓冲功能
getters: {
    comct(state) {
        return state.com + 100
    }
},
```

```vue
<template>
  <h1>{{ att.com }}</h1>
  <h1>{{ att.da }}</h1>
  <h1>{{ att.ts }}</h1>
  <h1>{{ att.comct }}</h1>
</template>
```

### 重置

```vue
<script lang="ts" setup>
import {uslist} from '/src/store/index.js'

const shee1 = uslist()
shee1.$reset()
</script>
```

### 持久化

```vue
```













