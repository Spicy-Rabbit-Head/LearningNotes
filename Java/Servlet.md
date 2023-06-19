# Searvlet

### 基本使用

##### 接口实现

```java
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

@WebServlet("/demo") // 定义访问地址
// 继承Servlet接口
public class seraoi implements Servlet {
    // 初始化,只调用一次
    public void init(ServletConfig servletConfig) throws ServletException {
        System.out.println("欢迎!");
    }
    // 获得 Servlet 配置对象
    public ServletConfig getServletConfig() {
        return null;
    }
    // 提供服务方法,访问一次调用一次
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        System.out.println("服务调用");
    }
    // 返回 Servlet 信息
    public String getServletInfo() {
        return null;
    }
    // 销毁方法,生命周期结束调用
    public void destroy() {
        System.out.println("销毁了");
    }
}
```

##### 配置导入

```xml
<dependency>
    <groupId>jakarta.servlet</groupId>
    <artifactId>jakarta.servlet-api</artifactId>
    <version>5.0.0</version>
    <scope>provided</scope>
</dependency>
```

# Servlet 体系结构

### HttpServlet 接口实现

```java
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/demo") // 定义访问地址
// 继承HttpServlet接口
public class seraoi extends HttpServlet {
    // 重写 get 方法
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("调用get");
    }
    
    // 重写 post 方法
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("调用post");
    }
}
```

# Servlet urlPattern 配置

### 访问路径

```java
@WebServlet(urlPatterns = {"/demo", "/demo1"}) // 多访问路径
```

### 匹配机制

```java
@WebServlet(urlPatterns = "/demo/2333") // 精准匹配

@WebServlet(urlPatterns = "/demo/*") // 目录匹配
// 指定路径下皆可访问

@WebServlet(urlPatterns = "*.demo") // 扩展名方法
// 任意路径下指定路径皆可访问

@WebServlet(urlPatterns = "/*") // 任意匹配
// 任意路径访问
```

# XML 配置 Servlet

### 配置

```xml
<web-app>
    <display-name>Archetype Created Web Application</display-name>
    <!--设定全类名-->
    <servlet>
        <servlet-name>seraoi</servlet-name>
        <servlet-class>seraoi</servlet-class>
    </servlet>
    <!--设定代理地址-->
    <servlet-mapping>
        <servlet-name>seraoi</servlet-name>
        <url-pattern>/demo</url-pattern>
    </servlet-mapping>
</web-app>
```

```java
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
public class seraoi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("调用get");
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("调用post");
    }
}
```

# 请求&响应

### 请求

```java
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/demo")

public class seraoi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Request 请求行数据
        // 获取请求方式
        System.out.println(req.getMethod());
        // 获取访问路径
        System.out.println(req.getContextPath());
        // 获取统一资源定位符(URL)
        System.out.println(req.getRequestURL());
        // 获取统一资源定位符(URI)
        System.out.println(req.getRequestURI());
        // 获取请求参数
        System.out.println(req.getQueryString());
        // Request 请求头数据
        // 请求头:浏览器版本信息
        System.out.println(req.getHeader("user-agent"));
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Request:请求体数据
        BufferedReader re = req.getReader();
        String s = re.readLine();
        System.out.println(s);
    }
}
```

### 通用方式请求

```java
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/demo")

public class seraoi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取所以参数Map集合
        Map<String, String[]> map = req.getParameterMap();
        for (String key : map.keySet()) {
            System.out.print(key + ":");
            // 获取值
            String[] values = map.get(key);
            for (String value : values) {
                System.out.println(value + " ");
            }
        }
        System.out.println("_______________");
        // 根据 key 获取值(数组)
        String[] names = req.getParameterValues("name");
        for (String string : names) {
            System.out.println(string);
        }
        // 根据 key 获取值(单个)
        String id = req.getParameter("id");
        System.out.println(id);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
```

### 请求转发

```java
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/demo1")

public class seraoi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("dome1执行...");
        // 请求转发
        req.getRequestDispatcher("/demo2").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
```

```java
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/demo2")
public class seraod extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("demo2执行...");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
```

### 请求资源共享

```java
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/demo1")

public class seraoi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("dome1执行...");
        // 共享资源
        req.setAttribute("name","小白");
        // 请求转发
        req.getRequestDispatcher("/demo2").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
```

```java
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/demo2")
public class seraod extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("demo2执行...");
        // 获取共享数据
        Object name = request.getAttribute("name");
        System.out.println(name);
        // 删除共享数据
        request.removeAttribute("name");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
```

### 响应重定向

```java
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/demo1")

public class seraoi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("demo1 无法处理,进行重定向");
        // 重定向
        // 设置响应状态码
        resp.setStatus(302);
        // 设置重定向响应头
        // resp.setHeader("Location","/maven_web_war/demo2");
        // 简化方式
        // resp.sendRedirect("/maven_web_war/demo2");
        // 动态获取虚拟目录
        String contextPath = req.getContextPath();
        resp.sendRedirect(contextPath + "/demo2");
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
```

```java
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/demo2")
public class seraod extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("demo2 进行处理");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
```

### 响应字符数据

```java
```





