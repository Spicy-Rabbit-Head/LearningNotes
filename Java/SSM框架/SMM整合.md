# SSM 整合

------

# Maven

```xml
<dependencies>
    <!--spring-->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-context</artifactId>
        <version>6.0.3</version>
    </dependency>
    <dependency>
        <groupId>org.aspectj</groupId>
        <artifactId>aspectjweaver</artifactId>
        <version>1.9.19</version>
    </dependency>
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-jdbc</artifactId>
        <version>6.0.3</version>
    </dependency>
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-tx</artifactId>
        <version>6.0.3</version>
    </dependency>
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-test</artifactId>
        <version>6.0.3</version>
    </dependency>
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-webmvc</artifactId>
        <version>6.0.3</version>
    </dependency>
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>servlet-api</artifactId>
        <version>2.5</version>
    </dependency>
    <!--mybatis-->
    <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis</artifactId>
        <version>3.5.11</version>
    </dependency>
    <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis-spring</artifactId>
        <version>3.0.1</version>
    </dependency>
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>5.1.48</version>
    </dependency>
    <dependency>
        <groupId>com.alibaba</groupId>
        <artifactId>druid</artifactId>
        <version>1.2.3</version>
    </dependency>
    <!--测试-->
    <dependency>
        <groupId>junit</groupId>
        <artifactId>junit</artifactId>
        <version>4.12</version>
    </dependency>
    <!--日志-->
    <dependency>
        <groupId>ch.qos.logback</groupId>
        <artifactId>logback-classic</artifactId>
        <version>1.2.10</version>
    </dependency>
</dependencies>
```

# 原始整合

### 数据库配置

```properties
driverClassName=com.mysql.jdbc.Driver
url=jdbc:mysql://127.0.0.1:6666/text?useSSL=false&useUnicode=true&characterEncoding=UTF-8
#url=jdbc:mysql://127.0.0.1:2333/list?useSSL=false&useUnicode=true&characterEncoding=UTF-8
username=root
password=root
#password=666666
initialSize=5
maxActive=10
maxWait=3000
```

### 应用程序上下文配置文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd
http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd">
    <!--应用程序上下文配置文件-->

    <!--组件扫描:扫描service和mapper-->
    <context:component-scan base-package="com.zzk">
        <!--排除MVC-->
        <context:exclude-filter type="annotation"
                                expression="org.springframework.stereotype.Controller"/>
    </context:component-scan>

</beans>
```

### 日志

```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <contextName>kashop-server</contextName>
    <appender name="console" class="ch.qos.logback.core.ConsoleAppender">
        <!-- 日志输出编码 -->
        <encoder>
            <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度%msg：日志消息，%n是换行符-->
            <pattern>%d %contextName [%thread] %-5level %logger{36} - %msg%n</pattern>
            <charset>UTF-8</charset>
        </encoder>
    </appender>

    <!--打印SQL-->
    <logger name="java.sql.Connection" level="DEBUG" />
    <logger name="java.sql.Statement" level="DEBUG" />
    <logger name="java.sql.PreparedStatement" level="DEBUG" />

    <root level="DEBUG">
        <appender-ref ref="console" />
        <appender-ref ref="rollingFile" />
    </root>

</configuration>
```

### MyBatis核心配置

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<!--MyBatis核心配置-->
<configuration>
    <!-- 加载外部文件 -->
    <properties resource="jdbc.properties"/>
    <!-- 自定义别名 -->
    <typeAliases>
        <!--<typeAlias type="com.zzk.domain.Account" alias="account"/>-->
        <!--包扫描实体生成别名-->
        <package name="com.zzk.domain"/>
    </typeAliases>

    <!-- 数据库环境配置,可配置多个数据库 -->
    <environments default="development">
        <!-- 配置多个 environment 来切换数据库 -->
        <environment id="development">
            <!-- 事务管理配置 -->
            <transactionManager type="JDBC"/>
            <!-- 数据库连接池 -->
            <dataSource type="POOLED">
                <!-- 数据库连接信息 -->
                <property name="driver"
                          value="${driverClassName}"/>
                <property name="url" value="${url}"/>
                <property name="username"
                          value="${username}"/>
                <property name="password"
                          value="${password}"/>
            </dataSource>
        </environment>
    </environments>
    <!--加载映射-->
    <mappers>
        <!-- Mapper 代理式导入 -->
        <package name="com.zzk.mapper"/>
    </mappers>
</configuration>
```

### springMVC配置文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd
">
    <!--springMVC配置文件-->

    <!--组件扫描:扫描controller-->
    <context:component-scan
            base-package="com.zzk.controller"/>
    <!--mvc注解驱动-->
    <mvc:annotation-driven/>

</beans>
```

### web 配置

```xml
<!DOCTYPE web-app PUBLIC
        "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
        "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
    <display-name>Archetype Created Web Application
    </display-name>
    <!--spring监听器-->
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:applicationContext.xml
        </param-value>
    </context-param>
    <listener>
        <listener-class>
            org.springframework.web.context.ContextLoaderListener
        </listener-class>
    </listener>

    <!--springMVC前端控制器-->
    <servlet>
        <servlet-name>DispatcherServlet</servlet-name>
        <servlet-class>
            org.springframework.web.servlet.DispatcherServlet
        </servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>classpath:spring-mvc.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>
    <servlet-mapping>
        <servlet-name>DispatcherServlet</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>
</web-app>
```

### 测试界面

```jsp
<%--
    Created by IntelliJ IDEA.
    User: zhaozikui
        Date: 2023/1/28
            Time: 19:36
                To change this template use File | Settings | File Templates.
                --%>
<%@ page contentType="text/html;charset=UTF-8"
    language="java" %>

<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <h1>添加账户表单</h1>
        <form name="accountForm"
              action="http://localhost:9090/Spring_integration_war/account/save"
              method="post">
            账户名称:<input type="text" name="name"><br>
            账户金额:<input type="text" name="money"><br>
            <input type="submit" value="保存">
        </form>
    </body>
</html>
```

### web 层

```java
package com.zzk.controller;

import com.zzk.domain.Account;
import com.zzk.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

// Web层
@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService; // 业务层注入

    // 保存
    @RequestMapping(value = "/save", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String save(Account account) {
        accountService.save(account);
        return "保存成功";
    }


    // 查询
    @RequestMapping(value = "/findAll", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findAll() {
        List<Account> all = accountService.findAll();
        return all.toString();
    }
}
```

### 业务层接口

```java
package com.zzk.service;

import com.zzk.domain.Account;

import java.util.List;

// 业务层接口
public interface AccountService {
    // 保存
    public void save(Account account);
    
    // 查询
    public List<Account> findAll();
}
```

### 业务层实体类

```java
package com.zzk.service.impl;

import com.zzk.domain.Account;
import com.zzk.mapper.AccountMapper;
import com.zzk.service.AccountService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

// 业务层实现
@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Override
    public void save(Account account) {
        try {
            InputStream resourceAsStream = Resources.getResourceAsStream("mybatis-config.xml");
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
            SqlSession sqlSession = sqlSessionFactory.openSession();
            AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
            mapper.save(account);
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public List<Account> findAll() {
        try {
            InputStream resourceAsStream = Resources.getResourceAsStream("mybatis-config.xml");
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
            SqlSession sqlSession = sqlSessionFactory.openSession();
            AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
            List<Account> all = mapper.findAll();
            sqlSession.close();
            return all;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
```

### 数据库实体

```java
package com.zzk.domain;

// 数据库实体类
public class Account {
    private Integer id;
    private String name;
    private int money;
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public int getMoney() {
        return money;
    }
    
    public void setMoney(int money) {
        this.money = money;
    }
    
    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", money=" + money +
                '}';
    }
}
```

### Dao Mapper代理

```java
package com.zzk.mapper;

import com.zzk.domain.Account;

import java.util.List;

// Dao层
// MyBatis 代理
public interface AccountMapper {
    // 保存
    public void save(Account account);
    
    // 查询
    public List<Account> findAll();
}
```

### Mapper代理

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!--MyBatis SQL映射-->
<mapper namespace="com.zzk.mapper.AccountMapper">
    <insert id="save" parameterType="account">
        insert into base(id, name, money)
        values (#{id}, #{name}, #{money});
    </insert>
    <select id="findAll" resultType="account">
        select *
        from base
    </select>
</mapper>
```

# MyBatis 整合

### MyBatis核心配置

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<!--MyBatis核心配置-->
<configuration>
    <!--别名-->
    <typeAliases>
        <package name="com.zzk.domain"/>
    </typeAliases>
</configuration>
```

### 应用程序上下文配置文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd
http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd">
    <!--应用程序上下文配置文件-->

    <!--组件扫描:扫描service和mapper-->
    <context:component-scan base-package="com.zzk">
        <!--排除MVC-->
        <context:exclude-filter type="annotation"
                                expression="org.springframework.stereotype.Controller"/>
    </context:component-scan>

    <!--MyBatis 整合-->
    <context:property-placeholder location="classpath:jdbc.properties"/>
    <!--配置数据源-->
    <bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource">
        <!-- 数据库连接信息 -->
        <property name="driverClassName" value="${jdbc.driverClassName}"/>
        <property name="url" value="${jdbc.url}"/>
        <property name="username" value="${jdbc.username}"/>
        <property name="password" value="${jdbc.password}"/>
        <property name="initialSize" value="${jdbc.initialSize}"/>
        <property name="maxActive" value="${jdbc.maxActive}"/>
        <property name="maxWait" value="${jdbc.maxWait}"/>
    </bean>

    <!--配置SourceFactory工厂-->
    <bean id="sqlSessionFactory"
          class="org.mybatis.spring.SqlSessionFactoryBean">
        <property name="dataSource" ref="dataSource"/>
        <!--加载mybatis核心文件-->
        <property name="configLocation" value="classpath:mybatis-config.xml"/>
    </bean>

    <!--扫描mapper代理-->
    <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <property name="basePackage" value="com.zzk.mapper"/>
    </bean>

    <!--声明式事务控制-->
    <!--平台事务管理器-->
    <bean id="transactionManager"
          class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="dataSource"/>
    </bean>

    <!--配置事务增强-->
    <tx:advice id="txAdvice">
        <tx:attributes>
            <tx:method name="*"/>
        </tx:attributes>
    </tx:advice>

    <!--事务aop织入-->
    <aop:config>
        <aop:advisor advice-ref="txAdvice"
                     pointcut="execution(* com.zzk.service.impl.*.*(..))"/>
    </aop:config>

</beans>
```

### 业务层实现

```java
package com.zzk.service.impl;

import com.zzk.domain.Account;
import com.zzk.mapper.AccountMapper;
import com.zzk.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

// 业务层实现
@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Autowired
    // 自动注入代理
    private AccountMapper accountMapper;
    
    @Override
    public void save(Account account) {
        accountMapper.save(account);
    }
    
    @Override
    public List<Account> findAll() {
        return accountMapper.findAll();
    }
```

 





