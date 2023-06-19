# 图像基本操作

## 图像读取

+ cv2.IMREAD_COLOR:彩色图像

```python
import cv2
a = cv2.imread('110.jpg')
# 导入图像
cv2.imshow('1',a)
# 图像的显示:窗口名，显示图像	
cv2.waitKey(0)
# 关闭等待时间，0为点击任意键关闭
cv2.destroyAllWindows()
```

+ 灰度图

```python
a = cv2.imread('110.jpg',cv2.IMREAD_GRAYSCALE)
# 定义为灰度图
# cv2.IMREAD_GRAYSCALE
```

+ 像素点

```python
a.size
# 像素的总数
```

## 图像保存

```python
cv2.imwrite('2.png',a)
# 定义路径及名字，保存对象
```

## 图像数值

```python
a.shape
# 读取图像当前数值:H W C 
```

## 视频读取

+ cv2.VideoCapture():捕获摄像头数据，导入视频

```python
import cv2

a = cv2.VideoCapture('3.mp4')
# 获取视频对象
while a.isOpened():
# 判定是否能打开
    b , c = a.read()
    # 获取每一帧图像
    if b == True:
        cv2.imshow('1',c)
    # 显示图像
    if cv2.waitKey(10) & 0xFF == ord('q'):
        break
    # 每一帧间隔
a.release()	
# 释放视频对象
cv2.destroyAllWindows()
```

## 图像装换

+ 图像转换为灰度图

```python
b = cv2.cvtColor(a,cv2.COLOR_BGR2GRAY)
```

## ROI截取

```python
b = a[0:200,0:200]
```

## 颜色通道提取

```python
b,g,r = cv2.split(a)
```

## 颜色通道组合

```py
img = cv2.merge((b,g,r))
img.shape
```

## 单颜色通道显示

```py
import cv2
a = cv2.imread('2.jpg')
# 索引 B[0],G[1],R[2]
# 只保留B通道
a1 = a.copy()
a1[:,:,1] = 0
a1[:,:,2] = 0
# 只保留G通道
a2 = a.copy()
a2[:,:,0] = 0
a2[:,:,2] = 0
# 只保留R通道
a3 = a.copy()
a3[:,:,0] = 0
a3[:,:,1] = 0

cv2.imshow('1',a1)
cv2.imshow('2',a2)
cv2.imshow('3',a3)
cv2.waitKey(0)
cv2.destroyAllWindows()
```

## 边界填充

```py
import cv2
import matplotlib.pyplot as plt
a = cv2.imread('2.jpg')
b1,b2,b3,b4 = 50,50,50,50

a1 = cv2.copyMakeBorder(a,b1,b2,b3,b4,borderType=cv2.BORDER_REPLICATE)
# 复制法，复制最边缘的像素
a2 = cv2.copyMakeBorder(a,b1,b2,b3,b4,borderType=cv2.BORDER_REFLECT)
# 反射法，对两边进行复制
a3 = cv2.copyMakeBorder(a,b1,b2,b3,b4,borderType=cv2.BORDER_REFLECT_101)
# 反射法，以最边缘像素为轴对称反射
a4 = cv2.copyMakeBorder(a,b1,b2,b3,b4,borderType=cv2.BORDER_WRAP)
# 外包装法，以设定值为轴向外复制
a5 = cv2.copyMakeBorder(a,b1,b2,b3,b4,borderType=cv2.BORDER_CONSTANT,value=1)
# 常量法，常数值填充

cv2.imshow('1',a)
cv2.imshow('2',a1)
cv2.imshow('3',a2)
cv2.imshow('4',a3)
cv2.imshow('5',a4)
cv2.imshow('6',a5)

cv2.waitKey(0)
cv2.destroyAllWindows()
```

## 数值计算

```python
import cv2
a = cv2.imread('2.jpg')
a1 = a - 54
a2 = a + a1
print(a[:5,:,0])
# 打印指定行数
print(a1[:5,:,0])
print(a2[:5,:,0])
```

## 图像融合

+ 图像通道转换

```py
import cv2
a = cv2.imread('2.png')
a1 = cv2.imread('2.jpg')
a1 = cv2.resize(a1,(740,900))
# 指定图像，和转换通道值
print(a.shape,a1.shape)
```

+ 图像融合

```py
import cv2
a = cv2.imread('2.png')
a1 = cv2.imread('2.jpg')
a1 = cv2.resize(a1,(740,900))

a2 = cv2.addWeighted(a,0.4,a1,0.6,0)
# x1,x1权重，x2，x2权重，偏置项
cv2.imshow('1',a2)
cv2.waitKey(0)
cv2.destroyAllWindows()
```

## 图像阈值

+ cv2.threshold(ser,thresh,maxval,type)

```py
import cv2
a = cv2.imread('2.png')
a1 = cv2.imread('2.jpg')
# cv2.threshold(ser,thresh,maxval,type)
# ser:输入图   thresh:阈值   maxval:当像素超过值由type决定   type:操作类型
# 两个返回值   retVal:得到的阈值   dst：阈值后的图像
ret , h1 = cv2.threshold(a,127,255,cv2.THRESH_BINARY)
# cv2.THRESH_BINARY   超过阈值部分取最大值，否则取零
ret , h2 = cv2.threshold(a,127,255,cv2.THRESH_BINARY_INV)
# cv2.THRESH_BINARY_INV TB的取反
ret , h3 = cv2.threshold(a,127,255,cv2.THRESH_TRUNC)
# cv2.THRESH_TRUNC   大于阈值部分设为阈值，否则不变
ret , h4 = cv2.threshold(a,127,255,cv2.THRESH_TOZERO)
# cv2.THRESH_TOZERO   大于阈值部分不改变，否则为0
ret , h5 = cv2.threshold(a,127,255,cv2.THRESH_TOZERO_INV)
# cv2.THRESH_TOZERO_INV   TT的取反
cv2.imshow('1',a)
cv2.imshow('2',h1)
cv2.imshow('3',h2)
cv2.imshow('4',h3)
cv2.imshow('5',h4)
cv2.imshow('6',h5)
cv2.waitKey(0)
cv2.destroyAllWindows()
```

# openCV

+ 图形数据读取

```python
import cv2
import matplotlib.pylab as plt
import numpy
a = cv2.imread('2.png',cv2.IMREAD_COLOR)
# 图片路径，图片读取模式
print(a)
# cv2.IMREAD_COLOR          读取彩色图片，图片透明性会忽略，为默认参数，也可传入1
# cv2.IMREAD_GRAYSCALE      按灰度模式读取图像，也可以传入0
# cv2.IMREAD_UNCHANGED      读取图像，包括其alpha通道，也可以传入-1
```

+ 图形显示

```python
import cv2
import matplotlib
import numpy
a = cv2.imread('2.png')
cv2.imshow('麻了',a)
# 图片显示窗口名称，显示对象
cv2.waitKey(0)
# 监听时间，
cv2.destroyWindow()
# 关闭窗口（名称）
```

+ 图形保存

```python
import cv2
import matplotlib
import numpy
a = cv2.imread('2.png')
cv2.imwrite("D:/document/python-picture/1.png",a)
# 保存地址名称，保存对象
```

+ 像素值获取

```python
import cv2
import matplotlib
import numpy
a = cv2.imread('2.png')
w = a[100,100]                  # 获取该位置像素值
print(w)

w = a[100,100] = [12,23,12]     # 修改该位置像素值
print(w)

b = a[100,100,0]                # 获取该位置b通道像素值
g = a[100,100,1]                # 获取该位置g通道像素值
r = a[100,100,2]                # 获取该位置r通道像素值
print(b,g,r)

r = a[100,100,2] = 32           # 修改该位置单通道像素值
print(b,g,r)

z = a.item(100,100,2)           # 获取该位置单通道像素值
print(z)

z = a[100,100]
z.itemset(1,20)                 # 设置像素值（位置，设定值）
print(z)
```

+ 图片性质

```python
import cv2

a = cv2.imread('2.png')

w = a.shape                 # 返回值-宽（rows），长（cols），通道（channels）
print(w)

e = a.size
print(e)                    # 返回值-像素数量 = （rows）x （cols）

q = a.dtype                 # 返回数据元素的数据类型
print(q)
```

+ ROI截取（Range of Interest）

```python
import cv2

a = cv2.imread('2.png')

w = a[100:600,300:500]          # 截取（行，列）区域
cv2.imshow('1',w)

b = a[:,:,0] = 0                  # 截取单个通道
cv2.imshow('2',b)

q,e,r = cv2.split(a)            # 截取全通道
z = cv2.merge((q,e,r))
cv2.imshow('3',z)

cv2.waitKey(0)
cv2.destroyWindow()
```

+ 添加边界

```python
import cv2

a = cv2.imread('2.png')
cv2.imshow('0',a)
b = cv2.copyMakeBorder(a,5,5,5,5,cv2.BORDER_CONSTANT,value=[175,225,15])
# cv2.copyMakeBorder（图形对象，上下左右边界宽度，边界属性，value=[边界颜色]
# 边界属性： cv2.BORDER_CONSTANT                   带颜色的边界，需要传入另外一个颜色值
#          cv2.BORDER_REFLECT                    边缘元素的镜像反射做为边界
#          cv2.BORDER_DEFAULT                    将最近的像素映射为边界
#          cv2.BORDER_REPLICATE                  边缘元素的复制做为边界
#          CV2.BORDER_WRAP                       将对面的像素进行映射
cv2.imshow('1',b)

cv2.waitKey(0)
cv2.destroyWindow()
```

+ 像素算数运算

```python
import cv2

a = cv2.imread('2.png')
b = cv2.imread('1.png')
c = cv2.addWeighted(a,0.5,b,0.9,0)
# cv2.addWeighted（图形对象1，1权重，图形对象2，2权重，常量值图像相加后再加上常量值）

cv2.imshow('1',c)
cv2.waitKey(0)
cv2.destroyWindow()
```

+ 图像颜色空间转换

```python
import cv2
import numpy

a = cv2.imread('1.png')
b = cv2.cvtColor(a,cv2.COLOR_BGR2GRAY)      # 转为灰度模式
c = cv2.cvtColor(a,cv2.COLOR_BGR2HSV)       # 转为HSV模式

d1 = numpy.array([100,50,50])
d2 = numpy.array([200,255,255])
d = cv2.inRange(a,d1,d2)                    # 转灰度模式
# cv2.inRange（图形对象，下限，上限）
cv2.imshow('1',b)
cv2.imshow('2',c)
cv2.imshow('3',d)

cv2.waitKey(0)
cv2.destroyWindow()
```

+ 图像阈值化

```python
import cv2
import matplotlib.pyplot

a = cv2.imread('2.png',0)
d1,d2 = cv2.threshold(a,127,255,cv2.THRESH_BINARY)
# cv2.threshold（图形对象，阈值，最大值，状态）
# cv2.THRESH_BINARY          小于阈值的像素置为0，大于阈值的置为maxval
# cv2.THRESH_BINARY_INV      小于阈值的像素置为maxval，大于阈值的置为0
# cv2.THRESH_TRUNC           小于阈值的像素不变，大于阈值的置为thresh
# cv2.THRESH_TOZERO          小于阈值的像素置0，大于阈值的不变
# cv2.THRESH_TOZERO_INV      小于阈值的不变，大于阈值的像素置0

q1 = cv2.adaptiveThreshold(a,255,cv2.ADAPTIVE_THRESH_MEAN_C,cv2.THRESH_BINARY,7,2)
q2 = cv2.adaptiveThreshold(a,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,cv2.THRESH_BINARY,7,2)
q3 = cv2.adaptiveThreshold(a,155,cv2.ADAPTIVE_THRESH_MEAN_C,cv2.THRESH_BINARY_INV,7,2)
q4 = cv2.adaptiveThreshold(a,155,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,cv2.THRESH_BINARY_INV,7,2)
# cv2.adaptiveThreshold（图形对象，最大值，自适应方法，阈值类型，自适应窗口大小，常数值）
# 自适应方法    cv2.ADAPTIVE_THRESH_MEAN_C        阈值为周围像素的平均值
#             cv2.ADAPTIVE_THRESH_GAUSSIAN_C    阈值为周围像素的高斯均值（按权重）
# 阈值类型:      cv2.THRESH_BINARY               小于阈值的像素置为0，大于阈值的置为maxValuel
#               cv2.THRESH_BINARY_INV           小于阈值的像素置为maxValue，大于阈值的置为0
 
qw1 = ['1','2','3','4','5','6']
qw2 = [a,d2,q1,q2,q3,q4]
```

+ 图像缩放

```python
import cv2

a = cv2.imread('2.png',0)
b1 = cv2.resize(a,None,fx=2,fy=2,interpolation=cv2.INTER_CUBIC)
# cv2.resize(图形对象，输出的图形大小，x轴缩放系数，y轴缩放系数，插值算法）
# cv2.INTER_NEAREST         最近邻插值法
# cv2.INTER_LINEAR          默认值，双线性插值法
# cv2.INTER_AREA            基于局部像素的重采样
# cv2.INTER_CUBIC           基于4x4像素邻域的3次插值法
# cv2.INTER_LANCZOS4        基于8x8像素邻域的Lanczos插值
b2 = cv2.resize(a,(200,200),interpolation=cv2.INTER_AREA)

cv2.imshow('0',a)
cv2.imshow('1',b1)
cv2.imshow('2',b2)

while True:
    if ord('q') == cv2.waitKey(0):
        break
cv2.destroyWindow()
```

+ 透视变换

```python
import cv2
import numpy
import matplotlib.pyplot as plt

a = cv2.imread('2.png')
rows,cols,ch = a.shape

b1 = numpy.float32([[50,50],[250,50],[50,250],[250,250]])
b2 = numpy.float32([[0,0],[300,0],[0,300],[300,300]])
# 转换前后大小
M = cv2.getPerspectiveTransform(b1,b2)
# 返回3*3的转变矩阵
dst = cv2.warpPerspective(a,M,(300,300))
# cv2.warpPerspective(图形对象，转变矩阵，输出矩阵的大小)

plt.subplot(121),plt.imshow(a),plt.title('Input')
plt.subplot(122),plt.imshow(dst),plt.title('Output')
plt.show()
```

+ 对比度-灰度直方图

```python
import cv2 as cv
import matplotlib.pyplot as plt
import numpy as np

a = cv.imread('1.png', 0)

hist = cv.calcHist([a], [0], None, [256], [0, 256])
# cv.calcHist（图形对象，计算通道，是否掩膜，通道对象像素个数，像素边界）

plt.subplot(1, 3, 1), plt.plot(hist, color="r"), plt.axis([0, 256, 0, np.max(hist)])
plt.xlabel("gray level")
plt.ylabel("number of pixels")

plt.subplot(1, 3, 2), plt.hist(a.ravel(), bins=256, range=[0, 256]), plt.xlim([0, 256])
plt.xlabel("gray level")
plt.ylabel("number of pixels")

plt.subplot(1, 3, 3)
plt.plot(hist, color="r"), plt.axis([0, 256, 0, np.max(hist)])
plt.hist(a.ravel(), bins=256, range=[0, 256]), plt.xlim([0, 256])
plt.xlabel("gray level")
plt.ylabel("number of pixels")

plt.show()
```

+ 对比度-线性变换

```python
import cv2 as cv
import matplotlib.pyplot as plt
import numpy as np

a = cv.imread('2.png')
print(a)
# 通过函数y=ax+b对灰度值进行处理
# 灰度分布在[0,100], 选择a=2,b=10能将灰度范围拉伸到[10, 210]
b = cv.convertScaleAbs(a,alpha=1.5,beta=0)
# cv.convertScaleAbs（图形对象，y=ax+b：a值，y=ax+b：b值）
print(b)
cv.imshow('1',a)
cv.imshow('2',b)
cv.waitKey(0)
cv.destroyWindow()
```

+ 对比度-直方图正规化

```python
import cv2 as cv
import matplotlib.pyplot as plt
import numpy as np

a = cv.imread('2.png')
b = cv.normalize(a,dst=None,alpha=350,beta=10,norm_type=cv.NORM_MINMAX)
# cv.normalize（图形对象，输出图形矩阵，上限或正规值，下限，类型，
# 类型        cv2.NORM_L1:将像素矩阵的1-范数做为最大值（矩阵中值的绝对值的和）
#            cv2.NORM_L2：将像素矩阵的2-范数做为最大值（矩阵中值的平方和的开方）
#            cv2.NORM_MINMAX：将像素矩阵的∞-范数做为最大值 （矩阵中值的绝对值的最大值）
cv.imshow('1',a)
cv.imshow('2',b)

cv.waitKey(0)
cv.destroyWindow()
```

+ 对比度-全局直方图均衡化

```python
import cv2 as cv

a = cv.imread('2.png',0)
b = cv.equalizeHist(a)
# cv.equalizeHist（单通道图形对象，输出矩阵）

cv.imshow('1',a)
cv.imshow('2',b)

cv.waitKey(0)
cv.destroyWindow()
```

+ 限制对比度自适应直方图均衡化

```python
import cv2 as cv

a = cv.imread('2.png',0)
a1 = cv.createCLAHE(3,(8,8))
# cv.createCLAHE（限制对比度阈值，图形划分size）
b = a1.apply(a)
# 对图形进行限制对比度自适应直方图均衡化
cv.imshow('1',a)
cv.imshow('2',b)

cv.waitKey(0)
cv.destroyWindow()
```

图形平滑-高斯平滑

```python
import cv2 as cv

a = cv.imread('2.png')
b = cv.GaussianBlur(a,(3,3),1)
# cv.GaussianBlur（图形对象，输出矩阵，高斯卷积核大小，x卷积核标准差，y卷积核标准差，填充边界）

cv.imshow('1',a)
cv.imshow('2',b)

cv.waitKey(0)
cv.destroyWindow()
```

+ 图形平滑-均值平滑

```python
import cv2 as cv

a = cv.imread('2.png')
b = cv.blur(a,(3,5))
# cv.blur（图形对象，卷积核大小）
q = cv.boxFilter(a,-1,(3,5))
# cv.boxFilter（图形对象，数据格式，卷积核大小）
cv.imshow('1',a)
cv.imshow('2',b)
cv.imshow('3',q)

cv.waitKey(0)
cv.destroyWindow()
```

+ 图形平滑-双边滤波

```python
import cv2 as cv

a = cv.imread('2.png')
b = cv.bilateralFilter(a,0.5,40)
# cv.bilateralFilter（图形对象，技术卷积核直径，颜色空间滤波器偏差值，坐标空间滤波器偏差值）

cv.imshow('1',a)
cv.imshow('2',b)

cv.waitKey(0)
cv.destroyWindow()
```

+ 形态学处理-腐蚀

```python
import cv2 as cv

a = cv.imread('2.png',0)
b1,b2 = cv.threshold(a,200,255,cv.THRESH_BINARY_INV)
q1 = cv.getStructuringElement(cv.MORPH_RECT,(3,5))
# cv.getStructuringElement（核的形态，核的大小）
# 核的形态      cv2.MORPH_RECT            矩形
#              cv2.MORPH_CROSS          十字形(以矩形的锚点为中心的十字架)
#              cv2.MORPH_ELLIPSE        椭圆(矩形的内切椭圆）
q2 = cv.erode(b2,q1,iterations=1)
# cv.erode（图形对象，腐蚀核，腐蚀次数）
cv.imshow('1',a)
cv.imshow('2',b2)
cv.imshow('3',q2)

cv.waitKey(0)
cv.destroyWindow()
```

+ 形态学处理-膨胀

```python
import cv2 as cv

a = cv.imread('2.png',0)
b1,b2 = cv.threshold(a,200,255,cv.THRESH_BINARY_INV)
q1 = cv.getStructuringElement(cv.MORPH_RECT,(3,5))
# cv.getStructuringElement（核的形态，核的大小）
# 核的形态      cv2.MORPH_RECT            矩形
#              cv2.MORPH_CROSS          十字形(以矩形的锚点为中心的十字架)
#              cv2.MORPH_ELLIPSE        椭圆(矩形的内切椭圆）
q2 = cv.dilate(b2,q1,iterations=1)
# cv.dilate（图形对象，膨胀核，膨胀次数）

cv.imshow('1',a)
cv.imshow('2',b2)
cv.imshow('3',q2)

cv.waitKey(0)
cv.destroyWindow()
```

+ 形态学处理-运算

```python
import cv2 as cv
import matplotlib.pyplot as plt

a = cv.imread('2.png')
a1 = cv.cvtColor(a,cv.COLOR_BGR2GRAY)
b1,b2 = cv.threshold(a1,200,255,cv.THRESH_BINARY_INV)
q = cv.getStructuringElement(cv.MORPH_RECT,(3,5))
q1 = cv.morphologyEx(b2,cv.MORPH_OPEN,q,iterations=1)
# cv.morphologyEx（图形对象，运算，核，核次数）
# cv2.MORPH_OPEN        开运算
# cv2.MORPH_CLOSE       闭运算
# cv2.MORPH_GRADIENT    形态梯度
# cv2.MORPH_TOPHAT      顶帽运算
# cv2.MORPH_BLACKHAT    底帽运算

cv.imshow('1',a)
cv.imshow('2',q1)

cv.waitKey(0)
cv.destroyWindow()
```

+ 边缘检测-canny边缘检测算法

```python
import cv2

a = cv2.imread('2.png')

a1 = cv2.Canny(a,threshold1=60,threshold2=180)
a2 = cv2.Canny(a,threshold1=100,threshold2=200,apertureSize=5,L2gradient=True)
# cv2.Canny（图形对象，低阈值，高阈值，核窗口大小，边缘梯度大小使用方法）
# True = 使用平方和开方的方式
# False = 使用绝对值和的方式

cv2.imshow('1',a)
cv2.imshow('2',a1)
cv2.imshow('3',a2)

cv2.waitKey(0)
cv2.destroyWindow()
```

+ 边缘检测-Scharr算子

```python
import cv2

a = cv2.imread('2.png')
x1 = cv2.Scharr(a,ddepth=cv2.CV_32F,dx=1,dy=0)
# cv2.Scharr（图形对象，输出图形深度，=1与差分方向为水平方向卷积核卷积，=1与差分方向为垂直方向卷积核卷积）
x1 = cv2.convertScaleAbs(x1)

x2 = cv2.Scharr(a,ddepth=cv2.CV_32F,dx=0,dy=1)
x2 = cv2.convertScaleAbs(x2)

x = cv2.addWeighted(x1,0.5,x2,0.5,0)
# 两者等权叠加
cv2.imshow('1',a)
cv2.imshow('2',x1)
cv2.imshow('3',x2)
cv2.imshow('4',x)

cv2.waitKey(0)
cv2.destroyWindow()
```

+ 边缘检测-Laplacian算子

```python
import cv2
import numpy

a = cv2.imread('2.png')
a1 = cv2.imread('2.png',0)

b1 = cv2.Laplacian(a,cv2.CV_32F)
# cv2.Laplacian（图形对象，数据深度）
b2 = cv2.convertScaleAbs(b1)

b3 = cv2.Laplacian(a1,cv2.CV_32F)
b4 = cv2.convertScaleAbs(b3)

cv2.imshow('1',a)
cv2.imshow('2',b2)
cv2.imshow('3',a1)
cv2.imshow('4',b4)

cv2.waitKey(0)
cv2.destroyWindow()
```

+ 几何形态拟合-最小外包旋转矩形

```python
import cv2
import numpy
na = 0

def a(b1,b2):
    img = cv2.imread(b1)
    q1,q2,q3 = cv2.minAreaRect(b2)
    # 中心点坐标，尺寸，旋转角度	
    print(q1,q2,q3)
    d1 = cv2.boxPoints((q1,q2,q3))
    print(d1)

    for i in range(4):
        p1 =d1[i,:]
        p1 = [int(j) for j in p1]
        p2 =d1[(i+1)%4,:]
        p2 = [int(j) for j in p2]
        # 转换数据类型为int
        cv2.line(img,p1,p2,(0,0,255),2)

    cv2.imshow('1',img)
    cv2.waitKey(0)
    cv2.destroyWindow()

if na ==0:
    b1 = '3.png'

    b2 = numpy.array([[154,154],[253,171],[154,176],[249,205]],numpy.int32)
    a(b1,b2)
```

+ 矩形绘制

```python
import cv2

a = cv2.imread('2.png')
x,y,w,h = 50,50,50,50
cv2.rectangle(a,(x,y,x+w,y+h),color=(0,0,255),thickness=1)

cv2.circle(a,center=(x+w,y+h),radius=50,color=(255,0,0),thickness=1)

cv2.imshow('1',a)

cv2.waitKey(0)
cv2.destroyWindow()
```

+ 轮廓查找

```python
import cv2

a = cv2.imread('2.png')
a1 = a.copy()
a2 = a.copy()
img1 = cv2.cvtColor(a,cv2.COLOR_BGR2GRAY)
img2 = cv2.GaussianBlur(img1,(3,3),1)
ed = cv2.Canny(img2,100,300)
ker = cv2.getStructuringElement(cv2.MORPH_RECT,(10,1))
ed = cv2.dilate(ed,ker,iterations=2)        # 横向的形态学膨胀
# 寻找轮廓
con , hie = cv2.findContours(ed,cv2.RETR_EXTERNAL,cv2.CHAIN_APPROX_SIMPLE)
# a，b = （单通道二值图，轮廓检索模式，轮廓近似方法，偏移量offset）
# 轮廓检索模式：
cv2.drawContours(a1,con,-1,(0,0,255))
# 轮廓拟合
num = len(con)
for i in range(num):
    area = cv2.contourArea(con[i],oriented=False)
    if 30 < area <8000:     # 限定轮廓面积
        rect = cv2.boundingRect(con[i])
        print(rect)
        cv2.rectangle(a2,(rect[0],rect[2]),(rect[0] + rect[2],rect[2]+rect[3]),(0,255,0))

cv2.imshow('1',a)
cv2.imshow('2',a1)
cv2.imshow('3',a2)
cv2.imshow('4',ed)

cv2.waitKey(0)
cv2.destroyWindow()
```



































































