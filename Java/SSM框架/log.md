# lobback















# Event

### 实体类

```java
package com.zzk.event;

import lombok.Data;

/**
 * 事件日志实体类
 */

@Data
public class OptLog {
    // 操作IP
    private String requestIp;
    // 日志类型
    private String type;
    // 操作人
    private String userName;
    // 操作描述
    private String description;
}
```

### 事件类

```java
package com.zzk.event;

import org.springframework.context.ApplicationEvent;

import java.time.Clock;

/**
 * 系统日志事件
 */

public class SysLogEvent extends ApplicationEvent {
    public SysLogEvent(Object source, Clock clock) {
        super(source, clock);
    }
}
```

### 事件监听器

```java
package com.zzk.event;

import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * 日志事件监听器
 */

@Component
public class SysLogListener {
    // 异步处理
    @Async
    // 定义监听事件
    @EventListener(SysLogEvent.class)
    public void saveLog(SysLogEvent event) {
        OptLog source = (OptLog) event.getSource();
        System.out.println(source);
    }
}
```



