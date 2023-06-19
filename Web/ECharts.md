### echarts 安装

```apl
npm install echarts -S
```

### 导入

```vue
<script setup>
// 在主界面导入
import * as echarts from 'echarts'
// 导入 provide 传播
import {provide} from "vue";
// 传播 ecbharts 实例
provide('echarts',echarts)
</script>
```

```vue
<template>
  <div ref="main">
  </div>
</template>
<script setup>
// 获取主界面传播
import {inject, ref} from "vue";
// 实例化
let a1 = inject('echarts')
// 获取DOM
const main = ref(null)
// 初始化DOM
var myChart = a1.init(main.value)
```

### 指定图表大小

```js
var myChart = a.init(main.value,null,{width:600,height:600})
```

