# Spring 框架

### 快速入门

##### Dao接口

```java
package org.zzk;

// Dao层接口
public interface UserDao {
    public void save();
}
```

##### Dao实现类

```java
package org.zzk;

// Dao实现类
public class UserDaoimpl implements UserDao {
    @Override
    public void save() {
        System.out.println("save 执行------");
    }
}
```

##### bean配置文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
    <!-- bean配置 -->
    <bean id="userDao" class="org.zzk.UserDaoimpl"></bean>
    <!-- id:唯一标识 -->
    <!-- class:Dao具体实现类 -->
</beans>
```

##### 测试

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] args) {
        // 读取 bean 配置文件
        ApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        // 获取指定 bean
        UserDao userDao = (UserDao) app.getBean("userDao");
        // bean 类方法
        userDao.save();
    }
}
```

# Spring 配置文件

### Bean 属性 scope(范围)

##### 单例模式

```xml
<!-- bean配置为 单例模式 -->
<bean id="userDao" class="org.zzk.UserDaoimpl" scope="singleton"></bean>
```

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] args) {
        // 单例模式
        // 读取配置文件时即刻创建对象
        ApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        UserDao userDao1 = (UserDao) app.getBean("userDao");
        UserDao userDao2 = (UserDao) app.getBean("userDao");
        // 返回对象为唯一的
        System.out.println(userDao1);
        System.out.println(userDao2);
    }
}
```

##### 多例模式

```xml
<!-- bean配置为 多例模式 -->
<bean id="userDao" class="org.zzk.UserDaoimpl" scope="prototype"></bean>
```

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] args) {
        // 多例模式
        // 读取配置文件时不创建对象
        ApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        // 获取对象时创建
        UserDao userDao1 = (UserDao) app.getBean("userDao");
        UserDao userDao2 = (UserDao) app.getBean("userDao");
        // 返回对象不同
        System.out.println(userDao1);
        System.out.println(userDao2);
    }
}
```

### Bean 生命周期

##### 生命周期方法

```java
package org.zzk;

// Dao实现类
public class UserDaoimpl implements UserDao {
    @Override
    public void save() {
        System.out.println("save 执行------");
    }

    public void init() {
        System.out.println("初始化执行");
    }

    public void destory() {
        System.out.println("销毁执行");
    }
}
```

##### 生命周期方法配置

```xml
<bean id="userDao" class="org.zzk.UserDaoimpl" init-method="init" destroy-method="destory"></bean>
```

##### 实现

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] args) {
        // 不使用接口接收,使用实现类接收
        ClassPathXmlApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        // 获取 Bean
        UserDao userDao1 = (UserDao) app.getBean("userDao");
        // 销毁方法来不及执行,需强制等待
        // 强转为实现
        app.close();
    }
}
```

### Bean 实例化方式

##### 无参构造方式

```apl
上面使用的,就是无参构造方式
```

##### 工厂静态方法

+ 静态方法类

```java
package org.zzk.factory;

import org.zzk.Dao.UserDao;
import org.zzk.Dao.UserDaoimpl;

// 工厂静态方法实例化
public class StaicFactory {
    // 静态方法返回 Dao 实现
    public static UserDao getUserDao() {
        return new UserDaoimpl();
    }
}
```

+ xml 配置

```xml
<!-- 工厂静态方法实例化 -->
<bean id="userDao" class="org.zzk.factory.StaicFactory" factory-method="getUserDao"></bean>
<!-- class:指向静态方类 -->
<!-- factory-method:指向静态构造方法 -->
```

+ 实现

```java
package org.zzk;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zzk.Dao.UserDao;

public class Main {
    public static void main(String[] args) {
        ClassPathXmlApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        // 工厂静态实例化方法
        UserDao userDao1 = (UserDao) app.getBean("userDao");
        userDao1.save();
    }
}
```

##### 工厂实例方式

+ 实例类

```java
package org.zzk.factory;

import org.zzk.Dao.UserDao;
import org.zzk.Dao.UserDaoimpl;

// 工厂实例实例化方式
public class DynamicFactory {
    public UserDao getUserDao() {
        return new UserDaoimpl();
    }
}
```

+ xml 配置

```xml
<!--class 设置为工厂实例类-->
<bean id="factory" class="org.zzk.factory.DynamicFactory"></bean>
<!--实现-->
<bean id="userDao" factory-bean="factory" factory-method="getUserDao"></bean>
<!--factory-bean:调用设定工厂的实例构造方法-->
<!--factory-method:设置工厂方法-->
```

+ 实现

```java
package org.zzk;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zzk.Dao.UserDao;

public class Main {
    public static void main(String[] args) {
        ClassPathXmlApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        // 工厂实例实例化方法
        UserDao userDao1 = (UserDao) app.getBean("userDao");
        userDao1.save();
    }
}
```

# 业务层依赖注入

### 基本注入

##### 业务层接口

```java
package org.zzk.service;

public interface UserService {
    public void save();
}
```

##### 业务层实现类

```java
package org.zzk.service.impl;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zzk.Dao.UserDao;
import org.zzk.service.UserService;

public class UserServiceImpl implements UserService {
    @Override
    public void save() {
        // 调用 Dao 层实例化
        ClassPathXmlApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        UserDao userDao = (UserDao) app.getBean("userDao");
        userDao.save();
    }
}
```

##### xml 配置

```xml
<!-- Dao 层 -->
<bean id="userDao" class="org.zzk.Dao.UserDaoimpl"></bean>
<!-- 业务层 -->
<bean id="userService" class="org.zzk.service.impl.UserServiceImpl"></bean>
```

##### 测试

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zzk.Dao.UserDao;
import org.zzk.service.UserService;
import org.zzk.service.impl.UserServiceImpl;

public class Main {
    public static void main(String[] args) {
        // 读取配置文件
        ApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        // 读取业务层 Bean
        UserService userService = (UserService) app.getBean("userService");
        userService.save();
    }
}
```

### set 方法注入

##### xml 配置

```xml
<!-- Dao 层 -->
<bean id="userDao" class="org.zzk.Dao.UserDaoimpl"></bean>
<!-- 业务层 -->
<bean id="userService" class="org.zzk.service.impl.UserServiceImpl">
    <!-- 将 Dao 通过set 方法注入 -->
    <property name="userDao" ref="userDao"></property>
</bean>
```

##### 业务层实现类

```java
package org.zzk.service.impl;

import org.zzk.Dao.UserDao;
import org.zzk.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDao userDao;

    // set 方法注入
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public void save() {
        userDao.save();
    }
}
```

##### 测试

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zzk.Dao.UserDao;
import org.zzk.service.UserService;
import org.zzk.service.impl.UserServiceImpl;

public class Main {
    public static void main(String[] args) {
        // 读取配置文件
        ApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        // 读取业务层 Bean
        UserService userService = (UserService) app.getBean("userService");
        userService.save();
    }
}
```

### 构造方法注入

##### xml 配置

```xml
<!-- Dao 层 -->
<bean id="userDao" class="org.zzk.Dao.UserDaoimpl"></bean>
<!-- 业务层 -->
<bean id="userService" class="org.zzk.service.impl.UserServiceImpl">
    <!-- 将构造方法注入 -->
    <constructor-arg name="userDao" ref="userDao"></constructor-arg>
</bean>
```

##### 业务层实现类

```java
package org.zzk.service.impl;

import org.zzk.Dao.UserDao;
import org.zzk.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public UserServiceImpl() {
    }

    // 构造方法注入
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public void save() {
        userDao.save();
    }
}
```

##### 测试

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zzk.Dao.UserDao;
import org.zzk.service.UserService;
import org.zzk.service.impl.UserServiceImpl;

public class Main {
    public static void main(String[] args) {
        // 读取配置文件
        ApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        // 读取业务层 Bean
        UserService userService = (UserService) app.getBean("userService");
        userService.save();
    }
}
```

### 基本数据类型注入

##### xml 配置

```xml
<bean id="userService" class="org.zzk.service.impl.UserServiceImpl">
    <!-- set 注入 -->
    <!-- 注入基本数据类型 -->
    <property name="username" value="张三"></property>
    <property name="age" value="19"></property>
</bean>
```

##### 实现类

```java
package org.zzk.service.impl;

import org.zzk.service.UserService;

public class UserServiceImpl implements UserService {
    private String username;
    private int age;

    public void setUsername(String username) {
        this.username = username;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public void save() {
        System.out.println(this.username + "===" + this.age);
    }
}
```

##### 测试

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zzk.Dao.UserDao;
import org.zzk.service.UserService;
import org.zzk.service.impl.UserServiceImpl;

public class Main {
    public static void main(String[] args) {
        ApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        UserService userService = (UserService) app.getBean("userService");
        userService.save();
    }
}
```

### 集合数据注入

##### xml 配置

```xml
<bean id="userService" class="org.zzk.service.impl.UserServiceImpl">
    <!-- 注入List -->
    <property name="strlist">
        <list>
            <value>666</value>
            <value>233</value>
        </list>
    </property>
    <!-- 注入Map -->
    <property name="userMap">
        <map>
            <entry key="q1" value-ref="user1"></entry>
            <entry key="q2" value-ref="user2"></entry>
        </map>
    </property>
    <!-- 注入 properties -->
    <property name="properties">
        <props>
            <prop key="aaa">233</prop>
            <prop key="bbb">233</prop>
            <prop key="ccc">233</prop>
        </props>
    </property>
</bean>
<!-- 注入 Map 数据 -->
<bean id="user1" class="org.zzk.service.impl.User">
    <property name="name" value="tom"></property>
    <property name="age" value="22"></property>
</bean>
<bean id="user2" class="org.zzk.service.impl.User">
    <property name="name" value="fack"></property>
    <property name="age" value="12"></property>
</bean>
```

##### 实现类

```java
package org.zzk.service.impl;

import org.zzk.service.UserService;

import java.util.List;
import java.util.Map;
import java.util.Properties;

public class UserServiceImpl implements UserService {
    private List<String> strlist;
    private Map<String, User> userMap;
    private Properties properties;

    public void setStrlist(List<String> strlist) {
        this.strlist = strlist;
    }

    public void setUserMap(Map<String, User> userMap) {
        this.userMap = userMap;
    }

    public void setProperties(Properties properties) {
        this.properties = properties;
    }

    @Override
    public void save() {
        System.out.println(strlist);
        System.out.println(userMap);
        System.out.println(properties);
    }
}
```

```java
package org.zzk.service.impl;

public class User {
    private String name;
    private int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}
```

##### 测试

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zzk.Dao.UserDao;
import org.zzk.service.UserService;
import org.zzk.service.impl.UserServiceImpl;

public class Main {
    public static void main(String[] args) {
        ApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        UserService userService = (UserService) app.getBean("userService");
        userService.save();
    }
}
```

### 引入其他配置文件

```xml
<!-- 分层次配置文件引入 -->
<import resource="Test.xml"></import>
```

# Spring 基本 API

### 配置文件加载

```apl
ClassPathXmlApplicationContext
# 从类的根路径下加载配置文件
FileSystemXmlApplicationContext
# 从磁盘路径上加载配置文件
AnnotationConfigApplicationContext
# 使用注解配置容器对象时使用
```

### getBean - 获取 Bean 对象

```java
// getBean(Bean ID) 获取 Bean 对象
UserService userService = (UserService) app.getBean("userService");
// getBean(类型) 通过类型获取 Bean 对象
UserService bean = app.getBean(UserService.class);
```

# Spring 配置数据源

### xml 配置

```xml
<!-- druid 注入 -->
<bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource">
    <property name="driverClassName" value="com.mysql.jdbc.Driver"></property>
    <property name="url" value="jdbc:mysql://127.0.0.1:2333/list?useSSL=false"></property>
    <property name="username" value="root"></property>
    <property name="password" value="666666"></property>
    <property name="initialSize" value="3"></property>
    <property name="maxActive" value="10"></property>
    <property name="maxWait" value="3000"></property>
</bean>
```

### 测试

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;
import java.sql.Connection;

public class Main {
    public static void main(String[] args) throws Exception {
        ApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        // 导入
        DataSource bean = app.getBean(DataSource.class);
        // 获取连接
        Connection connection = bean.getConnection();
        System.out.println(connection);
        connection.close();
    }
}
```

### xml 加载 properties

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context  http://www.springframework.org/schema/context/spring-context.xsd">
    <!-- 导入 -->
    <context:property-placeholder location="classpath:jdbc.properties"/>
    <!-- druid 注入 -->
    <bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource">
        <property name="driverClassName" value="${driverClassName}"></property>
        <property name="url" value="${url}"></property>
        <property name="username" value="${usedname}"></property>
        <property name="password" value="${password}"></property>
        <property name="initialSize" value="${initialSize}"></property>
        <property name="maxActive" value="${maxActive}"></property>
        <property name="maxWait" value="${maxWait}"></property>
    </bean>
</beans>
```

# Spring 原始注解开发

### Dao 实例

```java
package org.zzk.Dao;

import org.springframework.stereotype.Component;

// <bean id="userDao" class="org.zzk.Dao.UserDaoimpl"></bean>
@Component("userDao") // 注解定义 Dao Bean
public class UserDaoimpl implements UserDao {
    @Override
    public void save() {
        System.out.println("save 执行------");
    }
}
```

### Service 实例

```java
package org.zzk.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.zzk.Dao.UserDao;
import org.zzk.service.UserService;

// <bean id="userService" class="org.zzk.service.impl.UserServiceImpl">
// <property name="userDao" ref="userDao"></property>
// </bean>
@Component("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    @Qualifier("userDao") // Dao 注入
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public void save() {
        userDao.save();
    }
}
```

### xml 组件扫描

```xml
<!-- 配置组件扫描 -->
<context:component-scan base-package="org.zzk"/>
```

### 测试

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zzk.service.UserService;

import javax.sql.DataSource;
import java.sql.Connection;

public class Main {
    public static void main(String[] args) throws Exception {
        ApplicationContext app = new ClassPathXmlApplicationContext("context.xml");
        UserService userService = app.getBean(UserService.class);
        userService.save();
    }
}
```

### 注解API

```java
@Component
// 使用在类上用于实例化Bean
@Controller
// 使用在Web层上用于实例化Bean
@Service
// 使用在Service层上用于实例化Bean
@Repository
// 使用在Dao层上用于实例化Bean
@Qualifier
// 结合@Autowired一起使用用于根据名称进行依赖注入
@Resource
// 相对于@Autowired+@Qualifier,按名称注入
@Value
// 注入普通属性
@Scope
// 标志Bean的作用范围
@PostConstruct
// 使用在方法上标志该方法是Bean的初始化方法
@PreDestroy
// 使用在方法上标志该方法是Bean的销毁方法
```

# Spring 新注解开发

### 使用

```java
package org.zzk.config;

import org.springframework.context.annotation.*;

// 标志该类为Spring的核心配置类
@Configuration
// 配置组件扫描
@ComponentScan("org.zzk")
// 导入非配置类
@Import(DataConfig.class)
public class SpringConfig {

}
```

```java
package org.zzk.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;

import javax.sql.DataSource;

// 加载properties文件
@PropertySource("classpath:jdbc.properties")
public class DataConfig {
    @Value("${driverClassName}")
    private String driver;
    @Value("${url}")
    private String url;
    @Value("${usedname}")
    private String username;
    @Value("${password}")
    private String password;
    @Value("${initialSize}")
    private int initialSize;
    @Value("${maxActive}")
    private int maxActive;
    @Value("${maxWait}")
    private long maxWait;

    @Bean("dataSource") // 将当前方式返回值以指定名称储存到Spring容器中
    public DataSource getdataSource() throws Exception {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        dataSource.setInitialSize(initialSize);
        dataSource.setMaxActive(maxActive);
        dataSource.setMaxWait(maxWait);
        return dataSource;
    }
}
```

```java
package org.zzk;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zzk.config.SpringConfig;
import org.zzk.service.UserService;

import javax.sql.DataSource;
import java.sql.Connection;

public class Main {
    public static void main(String[] args) throws Exception {
        // 导入Spring核心配置类
        ApplicationContext app = new AnnotationConfigApplicationContext(SpringConfig.class);
        UserService userService = app.getBean(UserService.class);
        userService.save();
    }
}
```

### 注解API

```java
@Configuration
// 用于指定当前类是Spring配置类,当创建容器时会从该类加载注解
@ComponentScan
// 用于指定Spring在初始化容器时进行包扫描
@Bean
// 使用在方法上,标志该方法的返回值储存到Spring容器中
@PropertySource
// 用于加载.properties文件
@Import
// 用于导入其他配置类
```

# Spring 框架搭建

### Dao层

```java
package org.zzk.Dao;

// Dao层接口
public interface UserDao {
    public void save();
}
```

```java
package org.zzk.Dao.Impl;

import org.zzk.Dao.UserDao;

// Dao实现类
public class UserDaoImpl implements UserDao {
    @Override
    public void save() {
        System.out.println("Dao层执行");
    }
}
```

### Service层

```java
package org.zzk.service;

// Service层接口
public interface UserService {
    public void save();
}
```

```java
package org.zzk.service.Impl;

import org.zzk.Dao.UserDao;
import org.zzk.service.UserService;

// Service层实现
public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public void save() {
        System.out.println("Service层执行");
        userDao.save();
    }
}
```

### Web层

```java
package org.zzk.web;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.zzk.service.UserService;

import java.io.IOException;

@WebServlet("/text/demo")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        // 获取上下文对象
        ServletContext servletContext = this.getServletContext();
        // 获取容器中指定名属性
        WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(servletContext);
        // 获取Bean
        UserService userService = app.getBean(UserService.class);
        System.out.println("Web层调用");
        userService.save();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
```

### 过滤器

```java
package org.zzk.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

// 过滤器
@WebFilter("/*")
public class Filtertext implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // 过滤处理
        System.out.println("前过滤器执行了");
        // 放行
        filterChain.doFilter(servletRequest, servletResponse);
        System.out.println("后过滤器执行了");
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
```

### 监听器

```java
package org.zzk.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

// 监听器
public class ContextListener implements ServletContextListener {
    @Override // 上下文初始化方法
    public void contextInitialized(ServletContextEvent sce) {
        ApplicationContext app = new ClassPathXmlApplicationContext("text.xml");
        // 将Spring的应用上下文对象储存到最大域中
        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("app", app);
        System.out.println("Spring容器创建完成");
    }

    @Override // 上下文销毁方法
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContextListener.super.contextDestroyed(sce);
    }
}
```

```java
package org.zzk.listener;

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

### web.xml 配置

```xml
<!-- 全局初始化参数 -->
<context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>classpath:text.xml</param-value>
</context-param>
<!-- web.xml配置监听器 -->
<listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>
```

### text.xml 配置

```xml
<!-- Dao注入 -->
<bean id="userDao" class="org.zzk.Dao.Impl.UserDaoImpl"></bean>
<!-- Service注入 -->
<bean id="userService" class="org.zzk.service.Impl.UserServiceImpl">
    <property name="userDao" ref="userDao"></property>
</bean>
```















