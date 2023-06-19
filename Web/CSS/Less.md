### Less

```apl
向后兼容的 CSS 扩展语言
```

### 变量

```less
//定义变量
@cor: pink;
@mar: height;
div {
  //在less语法中使用
    @{mar}: 100px;
  background-color: @cor;
}
```

### 变量作用域

```less
@cor: red;
div {
  //块级作用域
  @cor:pink;
  background-color: @cor;
}
```

 ### 嵌套

```less
//嵌套
div {
  height: 100px;
  background-color: pink;

  div {
    height: 50px;
    background-color: coral;
    //添加 & 可省略嵌套空格
    &:hover {
      background-color: aqua;
    }
  }
}
```

### 混合

```less
//定义混合及形参默认值
.hunhe (@b:1px,@c:red,@h:50px) {
  border: @b solid red;
  color: @c;
  height: @h;
}

div {
  height: 200px;

  .q1 {
    //使用混合，定义形参
    .hunhe(2px, pink, 50px)
  }

  .q2 {
    .hunhe(1px, red, 50px)
  }
}
```

### 计算

```less
@h: 10;
div {
  height: 50+50px;
  background-color: coral;
}
```

```less
@h: 10;
div {
  height: 50px+@h;
  background-color: coral;
}
```

### 函数

[函数手册](https://less.bootcss.com/functions/)

```less
@w: 0.5;
div {
  //将0.5转换为50%
  width: percentage(@w);
}
```

