# jQuery 效果方法

### animate() —— 执行 CSS 属性集的自定义动画

```js
// 执行 CSS 属性集的自定义动画
$('div').click(function (){
    $(this).animate({
        // 动画
        height:'500px',
        width:'500px'
        // 动画时间，动画速度，动画后执行函数
    },1000,"linear",function (){
        console.log(1)
    })
})
```

### clearQueue() —— 从尚未运行的队列中移除所有项目

```js
// 从尚未运行的队列中移除所有项目
$('div').click(function (){
    $(this).animate({height:'250px'},1000);
    $(this).animate({width:'250px'},1000);
    $(this).animate({height:'20px'},1000);
    $(this).animate({width:'10px'},1000);
});
$('button').click(function (){
    $('div').clearQueue();
    console.log(1)
})
```

### queue() —— 显示被选元素上要执行的函数队列

```js
$('div').click(function (){
    $(this).animate({height:'250px'},1000);
    $(this).animate({width:'250px'},1000);
    $(this).animate({height:'20px'},1000);
    $(this).animate({width:'10px'},1000);
});
$('button').click(function (){
    // 显示被选元素上要执行的函数队列
    console.log($('div').queue())
})
```

### dequeue() —— 从队列中移除下一个函数，然后执行函数

```js
$('div').click(function (){
    $(this).animate({height:'250px'},1000);
    $(this).animate({width:'250px'},1000);
    // 从队列中移除下一个函数，然后执行函数
    $(this).dequeue()
    $(this).animate({height:'20px'},1000);
    $(this).animate({width:'10px'},1000);
});
```

### delay() —— 对队列中的下一项的执行设置延迟

```js
// 对队列中的下一项的执行设置延迟
$('button').click(function (){
    $('#div1').delay(2000).fadeIn()
    $('#div2').delay(1000).fadeIn()
})
```

### finish() —— 停止当前运行的动画，移除所有排队的动画，并为被选元素完成所有动画

```js
// 停止当前运行的动画，移除所有排队的动画，并为被选元素完成所有动画
$('div').click(function (){
    $(this).animate({height:'250px'},1000);
    $(this).animate({width:'250px'},1000);
    $(this).animate({height:'20px'},1000);
    $(this).animate({width:'10px'},1000);
});
$('button').click(function (){
    $('div').finish()
})
```

### stop() —— 被选元素停止当前正在运行的动画

```js
$('div').click(function (){
    $(this).animate({height:'250px'},1000);
    $(this).animate({width:'250px'},1000);
    $(this).animate({height:'20px'},1000);
    $(this).animate({width:'10px'},1000);
});
// 被选元素停止当前正在运行的动画
$('button').click(function (){
    $('div').stop(true)
})
```

### fadeIn() —— 逐渐改变被选元素的不透明度，从隐藏到可见

```js
// 逐渐改变被选元素的不透明度，从可见到隐藏
$('button').click(function (){
    $('.q1').fadeIn(500,'linear',function (){
        console.log(1)
    });
    $('.q2').fadeIn('slow','swing',function (){
        console.log(2)
    });
    $('.q3').fadeIn('fast','linear',function (){
        console.log(3)
    });
});
```

### fadeOut() —— 逐渐改变被选元素的不透明度，从可见到隐藏

```js
// 逐渐改变被选元素的不透明度，从可见到隐藏
$('button').click(function (){
    $('.q1').fadeOut(500,'linear',function (){
        console.log(1)
    });
    $('.q2').fadeOut('slow','swing',function (){
        console.log(2)
    });
    $('.q3').fadeOut('fast','linear',function (){
        console.log(3)
    });
});
```

### fadeTo() —— 逐渐改变被选元素的不透明度为指定的值

```js
// 逐渐改变被选元素的不透明度为指定的值
$('button').click(function (){
    $('.q1').fadeTo(500,0.5,'linear',function (){
        console.log(1)
    });
});
```

### fadeToggle() —— 在透明与不透明之间切换

```js
// 在透明与不透明之间切换
$('button').click(function (){
    $('.q1').fadeToggle(500,'linear',function (){
        console.log(1)
    });
});
```

### hide() —— 隐藏被选元素

```js
// 隐藏被选元素
$('button').click(function (){
    $('div').hide(1000,'linear',function (){
        console.log(1)
    })
})
```

### show() —— 显示隐藏的被选元素

```js
// 显示隐藏的被选元素
$('button').click(function (){
    $(this).next('div').show(1000,'linear',function (){
        console.log(1)
    })
})
```

### toggle() —— 在显示与隐藏之间切换

```js
// 在显示与隐藏之间切换
$('button').click(function (){
    $('div').stop().toggle(1000,'linear',function (){
        console.log(1)
    })
})
```

### slideDown() —— 以滑动方式显示被选元素

```js
// 以滑动方式显示被选元素
$('button').click(function (){
    $('div').slideDown(1000,'linear',function (){
        console.log(1)
    })
})
```

### slideUp() —— 以滑动方式隐藏被选元素

```js
// 以滑动方式隐藏被选元素
$('button').click(function (){
    $('div').slideUp(1000,'linear',function (){
        console.log(1)
    })
})
```

### slideToggle() —— 以滑动的方式切换

```js
// 以滑动的方式切换
$('button').click(function (){
    $('div').slideToggle(1000,'linear',function (){
        console.log(1)
    })
})
```







