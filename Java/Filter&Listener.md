# Filter

### Filter 使用

```java
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter("/*")
public class Filterdemo implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // 过滤处理
        System.out.println("过滤器执行了");
        // 放行
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
```

### 拦截配置

```java
// 拦截所有
@WebFilter("/*")
// 拦截指定资源
@WebFilter("/demo1")
// 目录拦截
@WebFilter("/maven_web_war/*")
// 后缀名拦截
@WebFilter("*.html")
```

### 过滤器链

```java
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

// 拦截所有
@WebFilter("/*")
public class Filterdemo1 implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("过滤器1执行前");
        filterChain.doFilter(servletRequest, servletResponse);
        System.out.println("过滤器1执行后");
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
```

```java
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter("/*")
public class Filterdemo2 implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("过滤器2执行前");
        filterChain.doFilter(servletRequest, servletResponse);
        System.out.println("过滤器2执行后");
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
```

# Listener

### Listener 使用

```java
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class Listener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // 初始化方法
        System.out.println("监听初始化执行");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // 销毁方法
        System.out.println("监听销毁执行");
    }
}
```

