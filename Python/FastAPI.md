### FastAPI

```apl
用于构建 API 的现代、快速（高性能）的 web 框架
```

### 安装

```apl
pip install fastapi
pip install "uvicorn[standard]"
```

### 创建一个API

```py
# 导入依赖
from typing import Union
from fastapi import FastAPI
# 实例化 FastAPI
app = FastAPI()
# 创建接口
@app.get('/')
async def read_root():
    return {'hello':'world'}
# 测试时运行
if __name__ == '__main__':
    import uvicorn
    uvicorn.run(app,host='127.0.0.1',port=8000)
# 实际运行：命令行
# uvicorn main:app --reload
```

### 生成接口文档

```py
http://127.0.0.1:8000/docs
# 根路径输入docs
```

### 跨域

```py
# 导入跨域中间件
from fastapi.middleware.cors import CORSMiddleware
# 定义跨域
app.add_middleware(
    CORSMiddleware,
    # 允许跨域的源列表
    allow_origins=["*"],
    # 允许跨域请求的 HTTP 方法列表
    allow_methods=["*"],
    # 允许跨域请求的 HTTP 请求头列表
    allow_headers=["*"]
)
```







