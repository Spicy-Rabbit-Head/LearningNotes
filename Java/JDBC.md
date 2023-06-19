# JDBC 操作数据库

### JDBC 基本使用

```java
package org.zzk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) throws Exception {
        // 注册驱动
        Class.forName("org.gjt.mm.mysql.Driver");
        // 获取连接
        String url = "jdbc:mysql://127.0.0.1:6666/text?useSSL=false";
        String uname = "root";
        String pass = "root";
        Connection conn = DriverManager.getConnection(url, uname, pass);
        // 定义sql
        String sql = "update list set age='30' where id=2";
        // 获取执行sql对象
        Statement stat = conn.createStatement();
        // 执行sql
        int i = stat.executeUpdate(sql); // 受影响的行数
        System.out.println(i);
        // 释放资源
        stat.close();
        conn.close();
    }
}
```

# JDBC API详解

### 事务

```java
package org.zzk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) throws Exception {
        String url = "jdbc:mysql://127.0.0.1:6666/text?useSSL=false";
        String uname = "root";
        String pass = "root";
        Connection conn = DriverManager.getConnection(url, uname, pass);
        String sql1 = "update list set age='30' where id=2";
        String sql2 = "update list set age='30' where id=1";
        Statement stat = conn.createStatement();
        try {
            // 开启事务
            conn.setAutoCommit(false);
            int i1 = stat.executeUpdate(sql1);
            System.out.println(i1);
            // 主动触发异常
            int a = 3 / 0;
            int i2 = stat.executeUpdate(sql2);
            System.out.println(i2);
            // 提交事务
            conn.commit();
        } catch (Exception th) {
            // 回滚事务
            conn.rollback();
        }
        // 释放资源
        stat.close();
        conn.close();
    }
}
```

### DML SQL执行

```java
package org.zzk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) throws Exception {
        String url = "jdbc:mysql://127.0.0.1:6666/text?useSSL=false";
        String uname = "root";
        String pass = "root";
        Connection conn = DriverManager.getConnection(url, uname, pass);
        // DML语句 SQL增删改
        String sql1 = "update list set age='30' where id=1";
        Statement stat = conn.createStatement();
        // 执行DML
        int i1 = stat.executeUpdate(sql1);
        System.out.println(i1);
        stat.close();
        conn.close();
    }
}
```

### DQL SQL执行

```java
package org.zzk;

import java.sql.*;

public class Main {
    public static void main(String[] args) throws Exception {
        String url = "jdbc:mysql://127.0.0.1:6666/text?useSSL=false";
        String uname = "root";
        String pass = "root";
        Connection conn = DriverManager.getConnection(url, uname, pass);
        // DQL SQL查
        String sql = "select * from list";
        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery(sql);
        // 遍历返回数据
        while (rs.next()) {
            // 获取游标当前行
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String age = rs.getString("age");
            System.out.println(id);
            System.out.println(name);
            System.out.println(age);
            System.out.println("___________");
        }
    }
}
```

### 连接池

+ 配置文件

```properties
#驱动位置
driverClassName=com.mysql.jdbc.Driver
#数据库地址
url=jdbc:mysql://127.0.0.1:6666/text?useSSL=false
#账号
username=root
#密码
password=root
#初始化连接数量
initialSize=5
#最大连接数量
maxActive=10
#最大等待时间
maxWait=3000
```

+ 实现

```java
package org.zzk;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import javax.sql.DataSource;
import java.io.FileInputStream;
import java.sql.*;
import java.util.Properties;

public class Main {
    public static void main(String[] args) throws Exception {
        // 加载配置
        Properties prop = new Properties();
        prop.load(new FileInputStream("D:\\BaiduSyncdisk\\Project code\\JDBC\\src\\main\\resources\\druid.properties"));
        // 获取druid对象
        DataSource dataSource = DruidDataSourceFactory.createDataSource(prop);
        // 获取数据库连接
        Connection conn = dataSource.getConnection();
        System.out.println(conn);
    }
}
```



