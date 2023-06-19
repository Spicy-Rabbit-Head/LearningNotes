# hibernate validator -- 验证框架

### 环境

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-validation</artifactId>
    <version>2.7.8</version>
</dependency>
```

### 实体

```java
package com.zzk.validator;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.*;

/**
 * Validator 验证测试实体
 */

@Data
public class ValidatorUser {
    @NotNull(message = "ID为空不能为空")
    private Integer id;
    @NotEmpty(message = "用户名不能为空")
    @Length(message = "用户名长度最大为40,最小为6", max = 40, min = 6)
    private String name;
    @Max(message = "年龄最大为100岁", value = 100)
    @Min(message = "年龄最小为18岁", value = 18)
    private Integer age;
    @Email(message = "邮箱格式不正确")
    private String email;
}
```

### 接口

```java
package com.zzk.validator;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

/**
 * 表单验证
 */

@RestController
@RequestMapping("/ValidatorText")
@Validated // 开启表单验证
public class ValidatorController {
    // 简单类型校验
    @RequestMapping("/get")
    public String get(@NotNull(message = "用户id不能为空") Integer id) {
        return "get success";
    }

    // 对象属性校验
    @RequestMapping("/save")
    public String save(@Validated ValidatorUser user) {
        return "save success";
    }
}
```

### 全局异常处理

```java
package com.zzk.validator;

import org.springframework.data.convert.ReadingConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.net.BindException;

/**
 * 表单验证异常处理器
 */
// 拦截指定控制器
@ControllerAdvice(annotations = {ReadingConverter.class, Controller.class})
@ResponseBody
public class ValidatorException {
    // 异常处理方法
    @ExceptionHandler({ConstraintViolationException.class, BindException.class})
    public String SpringValidatorException(Exception ex, HttpServletRequest request) {
        String message = "";
        if (ex instanceof ConstraintViolationException) {
            ConstraintViolationException constraintViolationException = (ConstraintViolationException) ex;
            ConstraintViolation<?> next = constraintViolationException.getConstraintViolations().iterator().next();
            message = next.getMessage();
        } else if (ex instanceof BindException) {
            BindException bindException = (BindException) ex;
            message = bindException.getMessage();
        }
        return message;
    }
}
```



