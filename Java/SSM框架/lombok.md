# lombok

```java
package com.zzk.dao;


import lombok.*;

@Setter  // 生成属性set方法
@Getter  // 生成属性get方法
@NoArgsConstructor // 生成无参构造方法
@AllArgsConstructor // 生成全参构造方法
@EqualsAndHashCode // 生成equals和canEquals和hashcode方法
public class User {
    private String name;
    private Integer age;
} 
```

```java
package com.zzk.dao;


import lombok.*;

@Data
// 生成 set/get/equals/canEquals/hashcode/toString 方法
public class User {
    private String name;
    private Integer age;
}
```

```java
@Slf4j // 生成日志记录变量
```

> ```java
> package com.zzk.dao;
> 
> import lombok.Builder;
> 
> @Builder // 生成可建造对象
> public class User {
>     private String name;
>     private Integer age;
> }
> ```
>
> ```java
> // build建造
> User user = User.builder().name("小白").age(23).build();
> ```





