# swagger2 - 接口文档

------

# springfox 封装

### 环境

```xml
<!-- 可视化API接口文档 -->
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger2</artifactId>
    <version>3.0.0</version>
</dependency>
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger-ui</artifactId>
    <version>3.0.0</version>
</dependency>
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-boot-starter</artifactId>
    <version>3.0.0</version>
</dependency>
```

### 注解

|        @Api        | controller类上 |       对请求类的说明       |
| :----------------: | :------------: | :------------------------: |
|     @ApiIgnore     | controller类上 |   隐藏类swagger不会显示    |
|     @ApiModel      |    实体类上    |      说明实体类的用途      |
| @ApiModelProperty  |  实体类参数上  |   说明实体类属性的的含议   |
|    @JsonIgnore     |  实体类参数上  |      隐藏该实体类属性      |
|   @ApiOperation    |     方法上     |         方法的说明         |
| @ApiImplicitParams | 方法上组合使用 |      方法的参数的说明      |
| @ApiImplicitParam  |     方法上     |    用于指定单个参数的说    |
|   @ApiResponses    | 方法上组合使用 |   方法返回值状态码的说明   |
|    @ApiResponse    |     方法上     | 指定单个返回值状态码的说明 |
|     @ApiParam      |   方法参数上   |        单个方法参数        |

### 注解属性

| String        | tags           | 标题分组                    |
| ------------- | -------------- | --------------------------- |
| String        | description    | 描述                        |
| String        | produces       | 返回指定的类型              |
| String        | consumes       | 请求提交内容类型            |
| String        | protocols      | 标识请求支持的协议,请求规范 |
| Authorization | authorizations | 安全设置                    |
| boolean       | hidden         | 是否启用                    |
| String        | values         | 类说明                      |
| String        | note           | 方法详细描述                |

### 配置类

```java
package com.zzk.swagger2;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

/**
 * swagger 自动配置类
 */
@Configuration
// 启动Swagger
@EnableOpenApi
public class SwaggerConfig {
    // API信息生成器
    ApiInfo apiInfo = new ApiInfoBuilder()
            // 标题
            .title("接口文档")
            // 联系人
            .contact(new Contact("赵子奎", "https://github.com/Spicy-Rabbit-Head/vue3-study", "1192469846@qq.com"))
            // 版本号
            .version("1.0")
            // 描述
            .description("接口文档测试")
            .build();


    // 封装文档
    @Bean
    public Docket docket1() {
        // 实例对象 : 用于封装接口文档相关信息
        return new Docket(DocumentationType.SWAGGER_2)
                // API信息
                .apiInfo(apiInfo)
                // 分组
                .groupName("用户接口组").select()
                // 请求程序选择器
                .apis(RequestHandlerSelectors.basePackage("com.zzk.swagger2"))
                .build();
    }
}
```

### 接口

```java
package com.zzk.swagger2;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/user")
// 说明请求类
@Api(tags = "用户控制器")
public class SwaggerController {
    @GetMapping("getUsers")
    // 说明请求方法
    @ApiOperation(value = "查询所有用户", notes = "查询所有用户信息")
    public SwaggerTextUser getAllUsers() {
        return new SwaggerTextUser(1, "小白", 22, "北京");
    }
}
```

### 接口地址

```apl
http://localhost:xxxx//swagger-ui/index.html
```

# knife4j 封装

### 环境

```xml
<!-- knife4j 可视化API接口文档 -->
<dependency>
    <groupId>com.github.xiaoymin</groupId>
    <artifactId>knife4j-openapi2-spring-boot-starter</artifactId>
    <version>4.0.0</version>
</dependency>
```

### 配置

```yaml
knife4j:
  # 启动
  enable: true
  openapi:
    # 标题
    title: 接口文档
    # 描述
    description: "这是设备保养管理系统的接口文档"
    # 邮件
    email: 1192469846@qq.com
    # 联系人
    concat: 赵子奎
    # 项目地址
    url: https://github.com/Spicy-Rabbit-Head/vue3-study
    # 版本
    version: v1.0
    # 开源许可证
    license: MIT License
    # 许可证地址
    license-url: https://github.com/Spicy-Rabbit-Head/vue3-study/blob/main/LICENSE
    # 服务地址
    terms-of-service-url: http://192.168.60.50:xxx/
    # 分组
    group:
      test1:
        # 分组名
        group-name: 用户组
        # 读取形式
        api-rule: package
        # 包地址
        api-rule-resources:
          - com.zzk.swagger2
```

### 接口地址

```apl
http://localhost:12500/doc.html
```

