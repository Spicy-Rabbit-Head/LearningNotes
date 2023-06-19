# JSON 响应

### JAVA 对象转换 JSON

```java
public class user {
    public String name;
    public Integer age;

    public user() {
    }

    public user(String name, Integer age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString() {
        return "user{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}
```

```java
user user = new user("张三", 23);
String s = JSON.toJSONString(user);
System.out.println(s);
```

### JSON 对象转换 JAVA

```json
{
    "name":"李四",
    "age":24
}
```

```java
user u = JSON.parseObject(s,user.class);
System.out.println(u);
```

