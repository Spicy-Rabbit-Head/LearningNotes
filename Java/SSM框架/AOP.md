# AOP - 切片

------

# 基于JDK的动态代理

### 目标接口

```java
package AOP.JDK;

// 目标接口
public interface TargetInterface {
    public void save();
}
```

### 目标实现类

```java
package AOP.JDK;

// 接口实现
public class Target implements TargetInterface {
    @Override
    public void save() {
        System.out.println("save running...");
    }
}
```

### 增强类

```java
package AOP.JDK;

// 增强类
public class Advance {
    public void before() {
        System.out.println("前置增强...");
    }

    public void afterReturning() {
        System.out.println("后置增强...");
    }
}
```

### 测试动态代理

```java
package AOP.JDK;

import org.junit.Test;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

// 测试类
public class ProxyText {
    @Test
    public void proxy1() {
        // 目标对象
        final Target target = new Target();
        // 增强对象
        Advance advance = new Advance();
        // 返回值:动态生成的代理对象
        TargetInterface proxy = (TargetInterface) Proxy.newProxyInstance(
                target.getClass().getClassLoader(), // 目标对象类加载器
                target.getClass().getInterfaces(), // 目标对象相同接口字节码对象数组
                new InvocationHandler() {
                    // 调用代理对象的方法,执行invoke方法
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        // 前置增强
                        advance.before();
                        // 执行目标方法
                        Object invoke = method.invoke(target, args);
                        // 后置增强
                        advance.before();
                        return invoke;
                    }
                }
        );

        // 调用代理对象
        proxy.save();
    }
}
```

# 基于cglib的动态代理

### 目标实现类

```java
package AOP.cglib;

public class Target {
    public void save() {
        System.out.println("save running...");
    }
}
```

### 增强类

```java
package AOP.cglib;

public class Advance {
    public void before() {
        System.out.println("前置增强...");
    }

    public void afterReturning() {
        System.out.println("后置增强...");
    }
}
```

### 测试实现类

```java
package AOP.cglib;

import org.junit.Test;
import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

import java.lang.reflect.Method;

public class ProxyText2 {
    @Test
    public void proxy2() {
        // 目标对象
        final Target target = new Target();
        // 增强对象
        Advance advance = new Advance();
        // 返回值:动态生成的代理对象
        // 创建增强器
        Enhancer enhancer = new Enhancer();
        // 设置父类
        enhancer.setSuperclass(Target.class);
        // 设置回调
        enhancer.setCallback(new MethodInterceptor() {
            @Override
            public Object intercept(Object obj, Method method, Object[] args, MethodProxy proxy) throws Throwable {
                // 执行前置
                advance.before();
                // 执行目标方法
                Object invoke = method.invoke(target, args);
                advance.afterReturning();
                return invoke;
            }
        });
        // 创建代理对象
        Target o = (Target) enhancer.create();
        o.save();
    }
}
```

# 基于XML的AOP

### xml配置

```xml
<!-- 目标对象 -->
<bean id="target" class="AOP.springaop.Target"/>
<!-- 切面对象 -->
<bean id="aspect" class="AOP.springaop.Aspect"/>
<!-- 配置织入:那些方法(切点)需要那些增强(前置...) -->
<aop:config>
    <!-- 声明切面 -->
    <aop:aspect ref="aspect">
        <!-- 抽取切点表达式 -->
        <aop:pointcut id="Pointcut" expression="execution(* AOP.springaop.Target.*(..))"/>
        <!-- 配置通知方法给那个切点 -->
        <!-- <aop:before method="before" pointcut="execution(public void AOP.springaop.Target.save())"/> -->
        <!-- 前置 -->
        <aop:before method="before" pointcut="execution(* AOP.springaop.Target.*(..))"/>
        <!-- 后置 -->
        <aop:after-returning method="afterReturning" pointcut="execution(* AOP.springaop.Target.*(..))"/>
        <!-- 环绕 -->
        <aop:around method="around" pointcut-ref="Pointcut"/> <!-- 引用切点表达式 -->
        <!-- 异常抛出 -->
        <aop:after-throwing method="afterThrowing" pointcut-ref="Pointcut"/>
        <!-- 最终 -->
        <aop:after method="after" pointcut-ref="Pointcut"/>
    </aop:aspect>
</aop:config>
```

### 目标接口

```java
package AOP.springaop;

// 目标接口
public interface TargetInterface {
    public void save();

    public void anomaly();
}
```

### 目标实现类

```java
package AOP.springaop;

// 接口实现
public class Target implements TargetInterface {
    @Override
    public void save() {
        System.out.println("save running...");
    }

    @Override
    public void anomaly() {
        int i = 1 / 0;
        System.out.println("anomaly running...");
    }
}
```

### 切面

```java
package AOP.springaop;

import org.aspectj.lang.ProceedingJoinPoint;

// 切面类
public class Aspect {
    public void before() {
        System.out.println("前置增强...");
    }

    public void afterReturning() {
        System.out.println("后置增强...");
    }

    public Object around(ProceedingJoinPoint point) throws Throwable {
        System.out.println("环绕前增强...");
        // 切点
        Object proceed = point.proceed();
        System.out.println("环绕后增强...");
        return proceed;
    }

    public void afterThrowing() {
        System.out.println("异常抛出增强...");
    }

    public void after() {
        System.out.println("最终增强...");
    }
}
```

### 测试

```java
package AOP.springaop;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class AOPText {
    @Autowired
    private TargetInterface target;

    @Test
    public void AOPText1() {
        target.save();
    }

    @Test
    public void AOPText2() {
        target.anomaly();
    }
}
```

# 基于注解的AOP

### xml配置

```xml
<!-- 组件扫描 -->
<context:component-scan base-package="AOP.annotationaop"/>
<!-- AOP自动代理 -->
<aop:aspectj-autoproxy/>
```

### 目标接口

```java
package AOP.annotationaop;

// 目标接口
public interface TargetInterface {
    public void save();

    public void anomaly();
}
```

### 实现类

```java
package AOP.annotationaop;

import org.springframework.stereotype.Component;

// 接口实现
// 注解注入
@Component("anno_target")
public class Target implements TargetInterface {
    @Override
    public void save() {
        System.out.println("save running...");
    }

    @Override
    public void anomaly() {
        int i = 1 / 0;
        System.out.println("anomaly running...");
    }
}
```

### 注解切面类

```java
package AOP.annotationaop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

@Component("anno_Aspect")
@org.aspectj.lang.annotation.Aspect // 标志位切面类
public class Aspect {
    // 切点表达式抽取
    @Pointcut("execution(* AOP.annotationaop.Target.*(..))")
    public void expression() {
    }

    @Before("execution(* AOP.annotationaop.Target.*(..))")
    public void before() {
        System.out.println("前置增强...");
    }

    @AfterReturning("execution(* AOP.annotationaop.Target.*(..))")
    public void afterReturning() {
        System.out.println("后置增强...");
    }

    @Around("expression()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        System.out.println("环绕前增强...");
        // 切点
        Object proceed = point.proceed();
        System.out.println("环绕后增强...");
        return proceed;
    }

    @AfterThrowing("expression()")
    public void afterThrowing() {
        System.out.println("异常抛出增强...");
    }

    @After("expression()")
    public void after() {
        System.out.println("最终增强...");
    }
}
```

### 测试

```java
package AOP.annotationaop;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:annotationContext.xml")
public class AnnText {
    @Autowired
    private TargetInterface target;

    @Test
    public void AnnText1() {
        target.save();
    }

    @Test
    public void AnnText2() {
        target.anomaly();
    }
}
```

