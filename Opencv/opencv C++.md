[TOC]

# Mat 类

### 创建

```c++
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    // 声明
    Mat img;
    // 赋值
    img = imread("2.jpg");
    // 声明指定类型及大小
    Mat img1 = Mat_<double>(3 , 3);
    // 通过数据类型创建
    Mat img2(640 , 280 , CV_8UC3); // 640 x 280 大小的彩色图像通道
}
```

### 构造

```c++
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    // 矩阵尺寸构造
    Mat img(200 , 200 , CV_16F);
    // Size构造
    Mat img1(Size(1920 , 1080) , CV_8S);
    // 枚举构造
    Mat img2 = (Mat_<int>(3 , 3) << 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9);
    // 数组构造
    double a[8] = {1 , 2 , 3 , 4 , 5 , 6 , 7 , 8};
    Mat img3 = Mat(2 , 2 , CV_32FC2 , a);
    // 等等....
}
```

### Mat :: convertTo - 图像矩阵装换

```c++
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img1 = imread("3.jpg");
    Mat img2;
    // convertTo(输出图像,转换的类型,转换的缩放因子,装换的偏置因子)
    img1.convertTo(img2 , CV_8SC1 , 2 , 0);
    imshow("H" , img2);
    waitKey(0);
}
```

# 图像读取与显示

### imread - 图像读取

```c++
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    // imread("路径",读取参数)
    Mat img = imread("2.jpg" , 0);
    // flags 读取参数:
    // -1:IMREAD_UNCHANGED     按图像原样读取,保留Alpha通道
    // 0:IMREAD_UNCHANGED      将图像转为灰度图读取
    // 1:IMREAD_COLOR          将图像转为BGR彩色图像
    // 2:IMREAD_ANYDEPTH       保留图像的16,32位深度,不声明该参数则转为8位读取
    // 4:IMREAD_ANYCOLOR       以任何可能的颜色读取图像
    // 8:IMREAD_LOAD_GDAL      使用Gdal 驱动程序加载图像
    // 16:IMREAD_REDUCED_GRAYSCALE_     将图像转为灰度图,尺寸缩小X/X
    // 17:IMREAD_REDUCED_COLOR_         将图像转为3通道彩色图像,尺寸缩小X/X
    // 128:IMREAD_IGNORE_ORIENTATION    不以 EXIF 的方向旋转图像
}
```

### namedWindow - 图像窗口

```c++
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    // namedWindow(窗口名称,窗口设置标识)
    namedWindow("Hello" , WINDOW_GUI_NORMAL);
    // flags 窗口设置标识:
    // WINDOW_NORMAL        显示图像后允许随意调整窗口大小
    // WINDOW_AUTOSIZE      根据图像大小显示窗口,不允许调整大小
    // WINDOW_OPENGL        创建窗口时支持OpenGL
    // WINDOW_FULLSCREEN    全屏显示窗口
    // WINDOW_FREERATIO     调整图像尺寸以填满窗口
    // WINDOW_KEEPRATIO     保持图像的比例
    // WINDOW_GUI_EXPANDED  创建的窗口允许添加工具栏和状态栏
    // WINDOW_GUI_NORMAL    创建没有状态栏和工具栏的窗口
}
```

### imshow - 图像显示

```c++
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    // imshow(窗口名称,显示的图像矩阵)
    Mat img = imread("2.jpg");
    imshow("Hello",img);
}
```

### waitKey - 等待显示窗口关闭

```c++
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img1 = imread("2.jpg");
    imshow("H" , img1);
    // 等待键
    waitKey(0);
    // 定义时间或为0时的密钥事件
}
```

# 视频加载与摄像头调用

### VideoCapture - 读取视频文件

```c++
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    // VideoCapture(读取的视频)
    VideoCapture v("6.mp4");
}
```

### VideoCapture - 读取调用摄像头

```c++
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    // VideoCapture(调用摄像头的编号)
    VideoCapture v(0);
}
```

### VideoCapture :: open - 打开视频及摄像头

```c++
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    VideoCapture v;
    // .open(打开视频或摄像头编号 )
    v.open("6.mp4");
}
```

### VideoCapture :: isOpened - 视频状态判断

```c++
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    VideoCapture v("6.mp4");
    // isOpened 返回bool
    cout << v.isOpened( ) << endl;
    // 判断视频是否已初始化
}
```

### VideoCapture :: release - 关闭并释放

```c++
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    VideoCapture v("6.mp4");
    cout << v.isOpened( ) << endl;
    // 关闭并释放
    v.release( );
    cout << v.isOpened( ) << endl;
}
```

### VideoCapture :: grab - 抓取下一帧

```c++
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    VideoCapture v("6.mp4");
    // 抓取视频或摄像头下一帧,成功返回true
    cout << v.grab( ) << endl;
}
```

### VideoCapture :: retrieve - 解码并返回抓取的视频帧

```c++
using namespace std;

#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    VideoCapture v("6.mp4");
    Mat img;
    // 解码并返回抓取的视频帧
    v.retrieve(img,0);
}
```

### VideoCapture :: read - 抓取、解码并返回下一个视频帧

```c++
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    VideoCapture v("6.mp4");
    Mat img;
    // 解码并返回抓取的视频帧
    v.read(img);
    cout << img << endl;
}
```

### VideoCapture :: get - 返回指定的视频捕获属性

```c++
#include <iostream>
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    VideoCapture v("6.mp4");
    // 0:CAP_PROP_POS_MSEC          视频文件的当前位置(单位ms)
    cout << v.get(CAP_PROP_POS_MSEC) << endl;
    // 3:CAP_PROP_FRAME_WIDTH       视频流中图像宽度
    cout << v.get(CAP_PROP_FRAME_WIDTH) << endl;
    // 4:CAP_PROP_FRAME_HEIGHT      视频流中图像的高度
    cout << v.get(CAP_PROP_FRAME_HEIGHT) << endl;
    // 5:CAP_PROP_FPS               视频流的频率(每秒帧数)
    cout << v.get(CAP_PROP_FPS) << endl;
    // 6:CAP_PROP_FOURCC            编解码器的4字符代码
    cout << v.get(CAP_PROP_FOURCC) << endl;
    // 7:CAP_PROP_FRAME_COUNT       视频流中图像帧数
    cout << v.get(CAP_PROP_FRAME_COUNT) << endl;
    // 8:CAP_PROP_FORMAT            返回Mat对象的格式
    cout << v.get(CAP_PROP_FORMAT) << endl;
    // 10:CAP_PROP_BRIGHTNESS       图像的亮度(用于相机)
    // 11:CAP_PROP_CONTRAST         图像的对比度(用于相机)
    // 12:CAP_PROP_SATURATION       图像的饱和度(用于相机)
    // 13:CAP_PROP_HUE              图像的色调(用于相机)
    // 14:CAP_PROP_GAIN             图像的增益(用于相机)
}
```

### VideoCapture :: set - 设置指定的视频捕获属性

```c++
#include <iostream>
#include <opencv2/highgui.hpp>

using namespace cv;

int main ( ) {
    VideoCapture v("6.mp4");
    // 属性同 get
    cout << v.get(0) << endl;
    v.set(0 , 10);
    cout << v.get(0) << endl;
}
```

# 数据保存

### imwrite - 图像保存

```c++
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("2.jpg");
    bool i = imwrite("3.jpg" , img);
}
```

### VideoWriter- 图像保存

```c++

```

# 图像颜色空间

### cvtColor - 图像颜色通道装换

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img1 = imread("3.jpg");
    Mat img2 , img3 , img4 , img5 , img6 , img7 , img8 , img9 , img10 , img11;
    // 0:COLOR_BGR2BGRA     对RGB图像添加 alpha 通道
    cvtColor(img1 , img2 , COLOR_BGR2BGRA);
    imshow("添加 alpha 通道" , img2);

    // 4:COLOR_BGR2RGB      彩色图像颜色通道顺序更改
    cvtColor(img1 , img3 , COLOR_BGR2RGB);
    imshow("彩色图像颜色通道顺序更改" , img3);

    // 10:COLOR_BGR2GRAY     转为灰度图像
    cvtColor(img1 , img4 , 10);
    imshow("转为灰度图像" , img4);

    // 10:COLOR_GRAY2BGR     灰度图转彩色图(伪彩色)
    cvtColor(img4 , img5 , 8);
    imshow("灰度图转彩色图" , img5);

    // 82:COLOR_BGR2YUV      RGB图转YUV图
    cvtColor(img1 , img6 , 82);
    imshow("RGB图转YUV图" , img6);

    // 84:COLOR_YUV2BGR      YUV图转RGB图
    cvtColor(img6 , img7 , 84);
    imshow("YUV图转RGB图" , img7);

    // 40:COLOR_BGR2HSV      RGB图转HSV图
    cvtColor(img1 , img8 , COLOR_BGR2HSV);
    imshow("RGB图转HSV图" , img8);

    // 54:COLOR_HSV2BGR      HSV图转RGB图
    cvtColor(img8 , img9 , COLOR_HSV2BGR);
    imshow("HSV图转RGB图" , img9);

    // 44:COLOR_BGR2Lab      RGB图转Lab图
    cvtColor(img1 , img10 , 44);
    imshow("RGB图转Lab图" , img10);

    // 56:COLOR_Lab2BGR     Lab图转RGB图
    cvtColor(img10 , img11 , 56);
    imshow("Lab图转RGB图" , img11);

    waitKey(0);
}
```

### split - 图像通道分离

### merge - 图像通道合并

```c++
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img1 = imread("3.jpg");
    Mat img2[3] , img3 , img4 , img5;
    // 多通道分离
    split(img1 , img2);
    img3 = img2[0];
    imshow("RGB-B" , img3);
    img4 = img2[1];
    imshow("RGB-G" , img4);
    img5 = img2[2];
    imshow("RGB-R" , img5);

    // vector 多通道分离
    vector<Mat> imgv;
    Mat imgv0 , imgv1 , imgv2;
    split(img1 , imgv);
    imgv0 = imgv.at(0);
    imshow("RGB-BV" , imgv0);
    imgv1 = imgv.at(1);
    imshow("RGB-GV" , imgv1);
    imgv2 = imgv.at(2);
    imshow("RGB-RV" , imgv2);

    // 多通道合并
    Mat H;
    merge(img2 , 3 , H);
    imshow("合成RGB" , H);

    // vector 多通道合并
    Mat HV;
    merge(imgv , HV);
    imshow("合成RGBV" , HV);

    waitKey(0);
}
```

# 图像像素操作处理

### minMaxLoc - 寻找图像像素的最大值与最小值

```c++
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    float i[12] = {1 , 35 , 2 , 4 , 2 , 6 , 23 , 6 , 32 , 7 , 0 , 2};
    Mat img = Mat(3 , 4 , CV_32FC1 , i);
    double minV , maxV;
    Point minI , maxI;
    // minMaxLoc(检索图像 , 输出最小值 , 输出最大值 , 输出最小位置 , 输出最大位置)
    minMaxLoc(img , &minV , &maxV , &minI , &maxI);
    cout << "最小 " << minV << "\t最大 " << maxV << endl;
    cout << "最小位置 " << minI << "\t最大位置 " << maxI << endl;
}
```

### mean - 计算图像的平均值

### meanStdDev - 计算图像平均值和标准差

```c++
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("3.jpg");
    // 图像的平均值
    Scalar Mean;
    Mean = mean(img);
    cout << "通道1平均值为" << Mean[0] << endl;
    cout << "通道2平均值为" << Mean[1] << endl;
    cout << "通道3平均值为" << Mean[2] << endl;

    // 同时求平均值和标准差
    Mat MyM , MyS;
    meanStdDev(img , MyM , MyS);
    cout << "平均值  " << MyM << endl;
    cout << "标准差  " << MyS << endl;
}
```

### threshold - 图像二值化

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("3.jpg" , 0);
    Mat G1 , G2 , G3 , G4 , G5 , G6 , G7;
    // threshold(输入图像,输出图像,二值化的阈值,二值化的最大值,二值化方法)
    // 0:THRESH_BINARY      灰度值大于阈值的为最大值,否则为0
    threshold(img , G1 , 125 , 255 , THRESH_BINARY);
    imshow("G1" , G1);

    // 1:THRESH_BINARY_INV  灰度值大于阈值的为0,否则为最大值
    threshold(img , G2 , 125 , 255 , THRESH_BINARY_INV);
    imshow("G2" , G2);

    // 2:THRESH_TRUNC       灰度值大于阈值为阈值,其他值不变
    threshold(img , G3 , 125 , 255 , THRESH_TRUNC);
    imshow("G3" , G3);

    // 3:THRESH_TOZERO      灰度值大于阈值不变,其他为0
    threshold(img , G4 , 125 , 255 , THRESH_TOZERO);
    imshow("G4" , G4);

    // 4:THRESH_TOZERO_INV   灰度值大于阈值为0,其他不变
    threshold(img , G5 , 125 , 255 , THRESH_TOZERO_INV);
    imshow("G5" , G5);

    // 8:THRESH_OTSU         大津法自动寻求全局阈值
    threshold(img , G6 , 125 , 255 , THRESH_BINARY | THRESH_OTSU);
    imshow("G6" , G6);

    // 16:THRESH_OTSU        三角法自动寻求全局阈值
    threshold(img , G7 , 125 , 255 , THRESH_BINARY | THRESH_TRIANGLE);
    imshow("G7" , G7);

    waitKey(0);
}
```

### adaptiveThreshold - 自适应阈值寻找

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("3.jpg" , 0);
    Mat G1 , G2;
    // adaptiveThreshold(输入图像,输出图像,二值化的最大值,自适应确定阈值的方法,二值化方法,自适应阈值像素邻域大小,常数)
    // ADAPTIVE_THRESH_MEAN_C      高斯法
    adaptiveThreshold(img , G1 , 255 , ADAPTIVE_THRESH_MEAN_C , THRESH_BINARY , 55 , 0);
    imshow("G1" , G1);

    // ADAPTIVE_THRESH_GAUSSIAN_C  均值法
    adaptiveThreshold(img , G2 , 255 , ADAPTIVE_THRESH_GAUSSIAN_C , THRESH_BINARY , 55 , 0);
    imshow("G2" , G2);

    waitKey(0);
}
```

# 图像变换

### vconcat - 竖向连接

### hconcat - 横向连接

```c++
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img1 = imread("1_01.png");
    Mat img2 = imread("1_02.png");
    Mat img3 = imread("1_03.png");
    Mat img4 = imread("1_04.png");
    Mat G1 , G2;
    imshow("切片1-1" , img1);
    imshow("切片1-2" , img2);
    imshow("切片2-1" , img3);
    imshow("切片2-2" , img4);
    // vconcat(Mat矩阵的数组,Mat矩阵的数目,连接后的Mat矩阵)
    // vconcat(第一个连接的Mat矩阵,第二个连接的Mat矩阵,连接后的Mat矩阵)
    vconcat(img1 , img3 , G1);
    imshow("竖向连接" , G1);

    // hconcat(Mat矩阵的数组,数组中Mat的数目,连接后的矩阵)
    // hconcat(第一个连接的Mat矩阵,第二个连接的Mat矩阵,连接后的Mat矩阵)
    hconcat(img1 , img2 , G2);
    imshow("横向连接" , G2);

    waitKey(0);
}
```

### resize - 图像尺寸变换

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("1_01.png");
    Mat G1 , G2 , G3 , G4 , G5 , G6 , G7;

    // resize(输入图像 , 输出图像 , 输出图像尺寸 , x轴比例因子 , y轴比例因子,插值方法)
    // 0:INTER_NEAREST      最近邻插值法
    resize(img , G1 , Size(600 , 600) , 0 , 0 , INTER_NEAREST);
    imshow("最近邻插值法" , G1);

    // 1:INTER_LINEAR       双线性插值法
    resize(img , G2 , Size(600 , 600) , 0 , 0 , INTER_LINEAR);
    imshow("双线性插值法" , G2);

    // 2:INTER_CUBIC        双三次插值法
    resize(img , G3 , Size(600 , 600) , 0 , 0 , INTER_CUBIC);
    imshow("双三次插值法" , G3);

    // 3:INTER_AREA         缩小插值法
    resize(img , G4 , Size(600 , 600) , 0 , 0 , INTER_AREA);
    imshow("缩小插值法" , G4);

    // 4:INTER_LANCZOS4      Lanczos插值法
    resize(img , G5 , Size(600 , 600) , 0 , 0 , INTER_LANCZOS4);
    imshow("Lanczos插值法" , G5);

    // 5:INTER_LINEAR_EXACT   位精确双线性插值法
    resize(img , G6 , Size(600 , 600) , 0 , 0 , INTER_LINEAR_EXACT);
    imshow("位精确双线性插值法" , G6);

    waitKey(0);
}
```

### flip - 图像翻转变换

```c++
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("2.jpg");
    Mat G1 , G2 , G3 , G4 , G5 , G6 , G7;

    // flip(输入图像 , 输出图像 , 翻转方式标识)
    // x 轴对称
    flip(img , G1 , 0);
    // y 轴对称
    flip(img , G2 , 1);
    // 先用 x 轴对称,再以 y 轴对称
    flip(img , G3 , -1);

    imshow("X翻转" , G1);
    imshow("Y翻转" , G2);
    imshow("先X翻转后Y翻转" , G3);

    waitKey(0);
}
```

### getRotationMatrix2D - 计算旋转矩阵

### warpAffine - 图像仿射变换

### getAffineTransform - 三点计算旋转矩阵

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("3.jpg");
    Mat G1 , G2;
    // 旋转角度
    double angle = 30;
    // 输出图像的尺寸
    Size dst(img.rows , img.cols);
    // 设置旋转中心
    Point2f center(img.rows / 2.0 , img.cols / 2.0);
    // getRotationMatrix2D(图像旋转中心,图像旋转角度,轴的比例因子)
    // 计算旋转矩阵
    G1 = getRotationMatrix2D(center , angle , 1);
    // warpAffine(输入图像,输出图像,变换矩阵,输出的尺寸,插值方式,像素边界外推方法,填充边界)
    warpAffine(img , G2 , G1 , dst);
    imshow("旋转" , G2);

    Point2f src[3] , ds[3];
    // 原图像3点
    src[0] = Point2f(0 , 0);
    src[1] = Point2f(0 , (float) (img.cols - 1));
    src[2] = Point2f((float) (img.rows - 1) , (float) (img.cols - 1));
    // 仿射变换后的3点
    ds[0] = Point2f((float) (img.rows) * 0.11 , (float) (img.cols) * 0.20);
    ds[1] = Point2f((float) (img.rows) * 0.15 , (float) (img.cols) * 0.70);
    ds[2] = Point2f((float) (img.rows) * 0.81 , (float) (img.cols) * 0.85);
    // 求变换矩阵
    Mat G3 , G4;
    G3 = getAffineTransform(src , ds);
    warpAffine(img , G4 , G3 , dst);
    imshow("三点仿射" , G4);
    waitKey(0);

    waitKey(0);
}
```

### getPerspectiveTransform - 求透视变换矩阵

### warpPerspective - 透视变换

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("3.jpg");
    Mat G1 , G2;

    Point2f src[4];
    Point2f dst[4];
    // 变换的4点坐标
    src[0] = Point2f(94.0 , 374.0);
    src[1] = Point2f(507.0 , 380.0);
    src[2] = Point2f(1.0 , 623.0);
    src[3] = Point2f(627.0 , 627.0);
    // 目标的4点坐标
    dst[0] = Point2f(0.0 , 0.0);
    dst[1] = Point2f(627.0 , 0.0);
    dst[2] = Point2f(0.0 , 627.0);
    dst[3] = Point2f(627.0 , 627.0);
    // 计算透视变换矩阵
    // getPerspectiveTransform(输入图像四点,目标图像四点,透视变换的方法)
    G1 = getPerspectiveTransform(src , dst , DECOMP_NORMAL);
    // 0:DECOMP_LU          最佳主轴元素的高斯消元法
    // 1:DECOMP_SVD         奇异值分解方法
    // 2:DECOMP_EIG         特征值分解法
    // 3:DECOMP_CHOLESKY    平方根分解法
    // 4:DECOMP_QR          正交三角分解法
    // 16:DECOMP_NORMAL     正规方程公式

    // 透视变换投影
    // warpPerspective(输入图像 , 输出图像 , 变换矩阵 , 输出图像尺寸 , 插值标志 , 像素边界外推方法 , 填充边界的数值)
    warpPerspective(img , G2 , G1 , img.size( ));

    imshow("W" , img);
    imshow("H" , G2);

    waitKey(0);
}
```

### warpPolar - 极坐标变换 

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("3.jpg");
    Mat G1 , G2;
    // 极坐标在图像的原点
    Point2f center = Point2f(img.cols / 2 , img.rows / 2);
    // 正极坐标变换
    // warpPolar(输入图像,输出图像,目标图像大小,极坐标变换后的原点,变换边界圆的半径,插值方法|坐标映射方法)
    warpPolar(img , G1 , Size(img.rows , img.cols) , center , center.x , INTER_LINEAR | WARP_POLAR_LINEAR);
    // 逆极坐标变换
    warpPolar(img , G2 , Size(img.rows , img.cols) , center , center.x , INTER_LINEAR | WARP_INVERSE_MAP);
    // 坐标映射方法
    // WARP_POLAR_LINEAR        极坐标正变换
    // WARP_POLAR_LOG           半对数据坐标变换
    // WARP_INVERSE_MAP         逆变换
    
    imshow("原图" , img);
    imshow("正极坐标变换" , G1);
    imshow("逆极坐标变换" , G2);

    waitKey(0);
}
```

# 几何图形绘制

### circle - 绘制圆形

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    // 绘制图像底板
    Mat img = Mat::zeros(Size(200 , 200) , CV_8UC3);
    // 绘制圆形
    // circle(画板,圆心坐标,圆半径,圆颜色,轮廓宽度,边界的类型,中心坐标和半径数值的小数位数)
    // 绘制实心圆
    circle(img , Point(50 , 50) , 25 , Scalar(255 , 0 , 0) , -1);

    // 绘制空心圆
    circle(img , Point(120 , 50) , 20 , Scalar(0 , 255 , 0) , 4);
    imshow("绘制圆" , img);
    waitKey(0);
}
```

### line - 绘制直线

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    // 绘制图像底板
    Mat img = Mat::zeros(Size(200 , 200) , CV_8UC3);
    // 绘制直线
    // line(画板,直线起点,直线终点,线颜色,线宽度,线类型,中心坐标和半径数值的小数位数)
    line(img , Point(50 , 50) , Point(150 , 50) , Scalar(255 , 0 , 0) , 2 , LINE_4 , 0);
    line(img , Point(50 , 70) , Point(150 , 70) , Scalar(0 , 255 , 0) , 2 , LINE_8 , 0);
    line(img , Point(50 , 90) , Point(150 , 90) , Scalar(0 , 0 , 255) , 2 , LINE_AA , 0);

    imshow("绘制线" , img);
    waitKey(0);
}
```

### ellipse - 绘制椭圆

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    // 绘制图像底板
    Mat img = Mat::zeros(Size(500 , 500) , CV_8UC3);
    // 绘制四分之一椭圆
    // ellipse(画板,椭圆中心坐标,椭圆主轴大小的一半,椭圆旋转的角度,起始角度,结束角度,颜色,轮廓宽度,线类型,中心坐标和半径数值的小数位数)
    ellipse(img , Point(300 , 255) , Point(100 , 70) , 0 , 0 , 100 , Scalar(0 , 255 , 0) , -1);
    // 绘制椭圆
    ellipse(img , RotatedRect(Point2f(150 , 100) , Size2f(30 , 20) , 0) , Scalar(255 , 0 , 0) , 2);

    imshow("绘制椭圆" , img);
    waitKey(0);
}
```

### rectangle - 绘制矩形

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    // 绘制图像底板
    Mat img = Mat::zeros(Size(500 , 500) , CV_8UC3);
    // 绘制矩形
    // rectangle(画板,矩形的一个顶点,矩形的相对顶点,颜色,线宽,线类型)
    rectangle(img , Point(300 , 255) , Point(100 , 70) , Scalar(255 , 0 , 0) , -1);
    // rectangle(画板,矩形左顶点和长宽,颜色,线宽,线类型)
    rectangle(img , Rect(300 , 300 , 60 , 50) , Scalar(0 , 255 , 0) , 3);

    imshow("绘制矩形" , img);
    waitKey(0);
}
```

### fillPoly - 绘制多边形

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    // 绘制图像底板
    Mat img = Mat::zeros(Size(500 , 500) , CV_8UC3);
    // 绘制多边形
    Point pp[2][3];
    pp[0][0] = Point(72 , 200);
    pp[0][1] = Point(142 , 204);
    pp[0][2] = Point(226 , 263);
    pp[1][0] = Point(172 , 310);
    pp[1][1] = Point(117 , 319);
    pp[1][2] = Point(15 , 260);
    const Point * pts[2] = {pp[0] , pp[1]};
    int npts[] = {3 , 3};
    // fillPoly(画板,矩形的一个顶点,矩形的相对顶点,顶点个数,颜色,线宽,线类型)
    fillPoly(img , pts , npts , 2 , Scalar(0 , 255 , 0) , 8);

    imshow("绘制多边形" , img);
    waitKey(0);
}
```

### putText - 文字生成

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    // 绘制图像底板
    Mat img = Mat::zeros(Size(500 , 500) , CV_8UC3);
    // 绘制文字
    // putText(画板,输出文字,输出字符左下角坐标,字体类型,字体大小,颜色,宽度,线类型,原点位置)
    // 原点位置 True 则在左下角 ,否则 在左上角
    putText(img , "Hello World" , Point(100 , 100) , 2 , 1 , Scalar(0 , 255 , 0));
    putText(img , "Fack" , Point(150 , 150) , FONT_ITALIC , 1 , Scalar(0 , 255 , 0));
    // fontFace 字体
    // 0:FONT_HERSHEY_SIMPLEX        正常大小的无衬线字体
    // 1:FONT_HERSHEY_PLAIN          小尺寸的无衬线字体
    // 2:FONT_HERSHEY_DUPLEX         正常大小的较复杂无衬线字体
    // 3:FONT_HERSHEY_COMPLEX        正常大小的衬线字体
    // 4:FONT_HERSHEY_TRIPLEX        正常大小的较复杂衬线字体
    // 5:FONT_HERSHEY_COMPLEX_SMALL  小尺寸的衬线字体
    // 6:FONT_HERSHEY_SCRIPT_SIMPLEX 手写风格字体
    // 7:FONT_HERSHEY_SCRIPT_COMPLEX 复杂手写风格字体
    // 16:FONT_ITALIC                斜体字体
    
    imshow("绘制文字" , img);
    waitKey(0);
}
```

# 感兴趣区域

### Rect - 矩阵容器

```c++
#include <opencv2/imgcodecs.hpp>
#include <iostream>

using namespace std;

using namespace cv;

int main ( ) {
    Mat img = imread("3.jpg");
    // Rect(左上角x,左上角y,矩形宽度,矩阵高度)
    Rect r(100 , 100 , img.rows , img.cols);
    cout << r << endl;
}
```

### copyTo - 深拷贝

```c++
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("3.jpg");
    Mat G1 , G2;
    // Mat 对象调用
    // (输出)
    img.copyTo(G1);
    imshow("Mat对象生成" , G1);

    copyTo(img , G2 , img);
    imshow("深拷贝" , G2);
    waitKey(0);
}
```

# 图像金字塔

### pyrDown - 高斯金字塔

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("3.jpg");
    // 高斯金字塔
    // 高斯金字塔数组
    vector<Mat> Gaus;
    // 将原图设为初始层
    Gaus.push_back(img);
    // 构建高斯金字塔
    for (int i = 0 ; i < 3 ; ++i) {
        Mat gauss;
        // pyrDown(输入图像,输出图像,输出图像尺寸,像素边界外推方法)
        pyrDown(Gaus[0] , gauss);
        // 添加
        Gaus.push_back(gauss);
    }
    for (int i = 0 ; i < 3 ; ++i) {
        imshow((&"G"[i]) , Gaus[i]);
    }
    waitKey(0);
}
```

### pyrUp - 拉普拉斯金字塔

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main ( ) {
    Mat img = imread("3.jpg");
    // 拉普拉斯金字塔
    // 拉普拉斯金字塔数组
    vector<Mat> Lap;
    // 将原图设为第一层
    Lap.push_back(img);
    // 构建拉普拉斯
    for (int i = 0 ; i < 3 ; ++i) {
        Mat lap;
        // pyrUp(输入图像,输出图像,输出图像尺寸,像素边界外推方法)
        pyrUp(Lap[0] , lap);
        // 添加
        Lap.push_back(lap);
    }
    for (int i = 0 ; i < 3 ; ++i) {
        imshow((&"L"[i]) , Lap[i]);
    }
    waitKey(0);
}
```

# 窗口交互操作

### createTrackbar - 图像窗口滑动条

```c++
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

// 滑动条回调声明
void callback (int , void *);

// 滑动条初始值
int value = 100;
Mat img1 = imread("3.jpg");
Mat img2;

int main ( ) {
    namedWindow("滑动条改变图像亮度");
    imshow("滑动条改变图像亮度" , img1);
    // 创建滑动条
    // createTrackbar(滑动条名称,滑动条窗口名称,指向数值的指针,滑动条最大值,调用的函数,传递形参)
    createTrackbar("亮度" , "滑动条改变图像亮度" , &value , 600 , callback , 0);

    waitKey( );
}

void callback (int , void *) {
    float a = value / 100.0;
    img2 = img1 * a;
    imshow("滑动条改变图像亮度" , img2);
}
```

### setMouseCallback - 鼠标响应

```c++
#include <iostream>

using namespace std;

#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

Mat img , imgP;// 全局图像
Point pre; // 前一时刻鼠标的位置
void mouse (int event , int x , int y , int flags , void *);
// 事件回调函数

int main ( ) {
    img = imread("3.jpg");
    img.copyTo(imgP);
    imshow("图像窗口1" , img);
    imshow("图像窗口2" , imgP);
    // setMouseCallback(鼠标事件响应窗口名字,鼠标响应回调,传递形参)
    setMouseCallback("图像窗口1" , mouse , 0);

    waitKey(0);
}

void mouse (int event , int x , int y , int flags , void *) {
    if (event == EVENT_RBUTTONDOWN) {
        cout << "点击左键才能绘图" << endl;
    }
    if (event == EVENT_LBUTTONDOWN) {
        pre = Point(x , y);
    }
    if (event == EVENT_MOUSEMOVE && (flags & EVENT_FLAG_LBUTTON)) {
        // 显示鼠标移动轨迹
        imgP.at<Vec3b>(y , x) = Vec3b(0 , 0 , 255);
        imgP.at<Vec3b>(y , x - 1) = Vec3b(0 , 0 , 255);
        imgP.at<Vec3b>(y , x + 1) = Vec3b(0 , 0 , 255);
        imgP.at<Vec3b>(y + 1 , x) = Vec3b(0 , 0 , 255);
        imgP.at<Vec3b>(y + 1 , x) = Vec3b(0 , 0 , 255);
        imshow("图像窗口2" , imgP);
        // 直线显示移动轨迹
        Point pt(x , y);
        line(img , pre , pt , Scalar(0 , 0 , 255) , 2 , 5 , 0);
        pre = pt;
        imshow("图像窗口1" , img);
    }
}
```

# 图像直方图绘制

### calcHist - 直方图统计函数

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg");
    Mat G1;
    cvtColor(img, G1, COLOR_BGR2GRAY);
    Mat hist;
    const int channels[1] = {0};
    float inR[2] = {0, 255};
    // 像素灰度值范围
    const float *reag[1] = {inR};
    // 直方图维度
    const int bins[1] = {256};
    // 计算图像直方图
    // calcHist(输入图像,输入图像数量,统计的通道数组,掩码,输出结果,计算维度,数组尺寸,取值范围)
    calcHist(&G1, 1, channels, Mat(), hist, 1, bins, reag);
    // 绘制直方图
    int hist_w = 512;
    int hist_h = 400;
    int width = 2;
    Mat histI = Mat::zeros(hist_h, hist_w, CV_8UC3);
    for (int i = 1; i < hist.rows; ++i) {
        rectangle(histI, Point(width * (i - 1), hist_h - 1),
                  Point(width * i - 1, hist_h - cvRound(hist.at<float>(i - 1) / 15)), Scalar(255, 255, 255), -1);
    }
    namedWindow("hise", WINDOW_AUTOSIZE);
    imshow("hise", histI);
    imshow("gray", G1);

    waitKey(0);
}
```

### normalize - 直方图归一化

```c++
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    vector<double> posi = {2.0, 8.0, 10.0};
    vector<double> norm1, norm2, norm3, norm4;
    // normalize(输入数组矩阵1,输入数据矩阵2,归一化下限标准,归一化上限标准,归一化方法,输出数据类型,掩码矩阵)
    // 1:NORM_INF       无穷范数,向量最大值
    normalize(posi, norm1, 1.0, 0.0, NORM_INF);
    cout << norm1[0] << endl;
    // 2:NORM_L1        L1范数,绝对值之和
    normalize(posi, norm2, 1.0, 0.0, NORM_L1);
    cout << norm2[0] << endl;
    // 4:NORM_L2        L2范数及模长归一化,平方根之和
    normalize(posi, norm3, 1.0, 0.0, NORM_L2);
    cout << norm3[0] << endl;
    // 32:NORM_MINMAX    偏移归一化
    normalize(posi, norm4, 1.0, 0.0, NORM_MINMAX);
    cout << norm4[0] << endl;
}
```

### compareHist - 直方图比较

```c++
#include <iostream>

using namespace std;

#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

void draw(Mat &hist, int type, string name) {
    int hist_w = 512;
    int hist_h = 400;
    int width = 2;
    Mat histI = Mat::zeros(hist_h, hist_w, CV_8UC3);
    for (int i = 1; i < hist.rows; ++i) {
        rectangle(histI, Point(width * (i - 1), hist_h - 1),
                  Point(width * i - 1, hist_h - cvRound(hist.at<float>(i - 1) / 15)), Scalar(255, 255, 255), -1);
    }
    namedWindow(name, WINDOW_AUTOSIZE);
    imshow(name, histI);
}

int main() {
    Mat img = imread("3.jpg");
    Mat hist1, hist2, hist3, gray1, gray2, gray3;
    cvtColor(img, gray1, COLOR_BGR2GRAY);
    resize(gray1, gray2, Size(), 0.5, 0.5);
    gray3 = imread("2.jpg");
    const int channe[1] = {0};
    float inR[2] = {0, 255};
    const float *ranges[1] = {inR};
    const int bins[1] = {256};
    calcHist(&gray1, 1, channe, Mat(), hist1, 1, bins, ranges);
    calcHist(&gray2, 1, channe, Mat(), hist2, 1, bins, ranges);
    calcHist(&gray3, 1, channe, Mat(), hist3, 1, bins, ranges);
    draw(hist1, NORM_INF, "hist1");
    draw(hist2, NORM_INF, "hist2");
    draw(hist3, NORM_INF, "hist3");

    // compareHist(输入图1,输入图2,比较方法)
    double hist_hist1 = compareHist(hist1, hist1, HISTCMP_CORREL);
    cout << "原图直方图和原图直方图相关系数" << hist_hist1 << endl;
    double hist_hist2 = compareHist(hist1, hist2, HISTCMP_CORREL);
    cout << "原图直方图和缩小直方图相关系数" << hist_hist2 << endl;
    double hist_hist3 = compareHist(hist1, hist3, HISTCMP_KL_DIV);
    cout << "两幅图像的相关系数" << hist_hist3 << endl;
    // 0:HISTCMP_CORREL         相关法
    // 1:HISTCMP_CHISQR         卡方法
    // 2:HISTCMP_INTERSECT      直方图相交法
    // 3:HISTCMP_BHATTACHARYYA  巴氏距离法
    // 3:HISTCMP_HELLINGER      海林格距离法
    // 4:HISTCMP_CHISQR_ALT     替代卡方法
    // 5:HISTCMP_KL_DIV         相对熵法
    waitKey(0);
}
```

# 直方图应用

### equalizeHist - 直方图均衡化

```c++
#include <iostream>

using namespace std;

#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

void draw(Mat &hist, int type, string name) {
    int hist_w = 512;
    int hist_h = 400;
    int width = 2;
    Mat histI = Mat::zeros(hist_h, hist_w, CV_8UC3);
    for (int i = 1; i < hist.rows; ++i) {
        rectangle(histI, Point(width * (i - 1), hist_h - 1),
                  Point(width * i - 1, hist_h - cvRound(hist.at<float>(i - 1) / 15)), Scalar(255, 255, 255), -1);
    }
    namedWindow(name, WINDOW_AUTOSIZE);
    imshow(name, histI);
}

int main() {
    Mat img = imread("3.jpg");
    Mat gray, hist1, hist2;
    cvtColor(img, gray, COLOR_BGR2GRAY);
    Mat equa;
    // 直方图均衡化
    // equalizeHist(输入图像,输出图像)
    equalizeHist(gray, equa);
    const int channels[1] = {0};
    float inR[2] = {0, 255};
    const float *rang[1] = {inR};
    const int bins[1] = {256};
    calcHist(&gray, 1, channels, Mat(), hist1, 1, bins, rang);
    calcHist(&equa, 1, channels, Mat(), hist2, 1, bins, rang);
    draw(hist1, NORM_INF, "hist1");
    draw(hist2, NORM_INF, "hist2");
    imshow("原图", gray);
    imshow("均衡后的原图", equa);
    waitKey(0);
}
```

### calcBackProject - 图像直方图反向投影

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

void draw(Mat &hist, int type, string name) {
    int hist_w = 512;
    int hist_h = 400;
    int width = 2;
    Mat histI = Mat::zeros(hist_h, hist_w, CV_8UC3);
    normalize(hist, hist, 255, 0, type, -1, Mat());
    namedWindow(name, WINDOW_NORMAL);
    imshow(name, hist);
}

int main() {
    Mat img = imread("2.jpg");
    Mat subimg = imread("3.jpg");
    Mat img_HSV, sub_HSV, hist1, hist2;
    imshow("img", img);
    imshow("subimg", subimg);
    // 转换通道
    cvtColor(img, img_HSV, COLOR_BGR2HSV);
    cvtColor(subimg, sub_HSV, COLOR_BGR2HSV);
    int hbins = 32, sbins = 32;
    int histSize[] = {hbins, sbins};
    float h_ranges[] = {0, 180};
    float s_ranges[] = {0, 256};
    const float *rang[] = {h_ranges, s_ranges};
    int channe[] = {0, 1};
    // 绘制 H-Size 二维直方图
    calcHist(&sub_HSV, 1, channe, Mat(), hist1, 2, histSize, rang, true, false);
    draw(hist1, NORM_INF, "hist1");
    Mat back;
    // calcBackProject(输入图像数组,输入图像数量,统计通道数组,输入直方图,输出反向投影,灰度值取值范围,反向投影因子)
    calcBackProject(&img_HSV, 1, channe, hist1, back, rang, 1.0);
    imshow("反向投影的结果", back);

    waitKey(0);
}
```

### matchTemplate - 图像模板匹配

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;


int main() {
    Mat img = imread("2.jpg");
    Mat temp = imread("3.jpg");
    Mat resu;
    // matchTemplate(匹配图像,模板图像,匹配输出图像,匹配方法,匹配掩码)
    matchTemplate(img, temp, resu, TM_CCOEFF_NORMED);
    // 0:TM_SQDIFF          平方差匹配法
    // 1:TM_SQDIFF_NORMED   归一化平方差匹配法
    // 2:TM_CCORR           相关匹配法
    // 3:TM_CCORR_NORMED    归一化相关匹配法
    // 4:TM_CCOEFF          系数匹配法
    // 5:TM_CCOEFF_NORMED   归一化系数匹配法
    
    double maxV, minV;
    Point minL, maxL;
    // 寻找匹配结果中最大值和最小值的坐标
    minMaxLoc(resu, &minV, &maxV, &minL, &maxL);
    // 绘制最佳匹配区域
    rectangle(img, Rect(maxL.x, maxL.y, temp.cols, temp.rows), Scalar(0, 0, 255), 2);
    imshow("原图", img);
    imshow("模板图像", temp);
    imshow("输出", resu);

    waitKey(0);
}
```

# 图像卷积

### filter2D - 卷积运算

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;


int main() {
    // 待卷积矩阵
    uchar poi[25] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25};
    Mat img(5, 5, CV_8UC1, poi);
    // 卷积模板
    Mat ker = (Mat_<float>(3, 3) << 1, 2, 1, 2, 0, 2, 1, 2, 1);
    Mat kernel = ker / 12;  // 卷积模板归一化
    Mat res, res_norm;
    // filter2D(输入图像,输出图像,输出图像数据类型,卷积核,内核基准点,偏值,像素边界外推法)
    filter2D(img, res, CV_32F, ker, Point(-1, -1), 2, BORDER_CONSTANT);
    filter2D(img, res_norm, CV_32F, kernel, Point(-1, -1), 2, BORDER_CONSTANT);
    cout << "res" << endl << res << endl;
    cout << "res_norm" << endl << res_norm << endl;
    // 图像卷积
    Mat lena = imread("3.jpg");
    Mat lena_f;
    filter2D(lena, lena_f, -1, kernel, Point(-1, -1), 2, BORDER_CONSTANT);
    imshow("lenaf", lena_f);
    imshow("lena", lena);

    waitKey(0);
}
```

# 噪音种类和生成

### rand - 随机函数原型

```c++
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    int s = rand();
    cout << s << endl;
}
```

### fill - 高斯噪音

```c++
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat imga = imread("3.jpg");
    Mat equa = imread("2.jpg", IMREAD_ANYDEPTH);
    // 生成原始图像尺寸
    Mat imga_n = Mat::zeros(imga.rows, imga.cols, imga.type());
    Mat equa_n = Mat::zeros(imga.rows, imga.cols, equa.type());
    imshow("img原图", imga);
    imshow("equa原图", equa);
    RNG rng;
    // fill(随机数矩阵,随机方法,下限,上限)
    rng.fill(imga_n, RNG::NORMAL, 10, 20); // 三通道高斯分布随机数
    rng.fill(equa_n, RNG::NORMAL, 15, 30); // 生成单通道高斯分布随机数
    imshow("三通道高斯噪音", imga_n);
    imshow("单通道高斯噪音", equa_n);
    waitKey(0);
}
```

# 线性滤波

### blur - 均值滤波

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat equa = imread("3.jpg", IMREAD_ANYDEPTH);
    Mat res1, res2, res3;
    // blur(待滤波图像,滤波输出,卷积核尺寸,内核的基准点,像素外推法)
    blur(equa, res1, Size(3, 3));
    imshow("3 x 3 卷积均值滤波", res1);
    blur(equa, res2, Size(9, 9));
    imshow("9 x 9 卷积均值滤波", res2);

    waitKey(0);
}

```

### boxFilter - 方框滤波

### sqrBoxFilter - 滤波器像素数组平方求和

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat equa = imread("3.jpg", 0);
    Mat equa_32;
    equa.convertTo(equa_32, CV_32F, 1.0 / 255);
    Mat resultNorm, dataS;
    // boxFilter(输入图像,输出图像,输出图像数据类型,卷积核尺寸,内核的基准点,归一化标志,像素外推法)
    boxFilter(equa, resultNorm, -1, Size(3, 3), Point(-1, -1), true);
    // sqrBoxFilter(输入图像,输出图像,输出图像数据类型,卷积核尺寸,内核的基准点,归一化标志,像素外推法)
    sqrBoxFilter(equa_32, dataS, -1, Size(3, 3), Point(-1, -1), true, BORDER_CONSTANT);
    imshow("result", resultNorm);
    imshow("res", dataS);
    waitKey(0);
}
```

### GaussianBlur - 高斯滤波

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat equa = imread("3.jpg", 0);
    Mat equa_3, equa_9;
    // GaussianBlur(输入图像,输出图像,滤波器尺寸,X方向滤波标准差,Y方向滤波标准差,像素外推法)
    GaussianBlur(equa, equa_3, Size(3, 3), 10, 20);
    GaussianBlur(equa, equa_9, Size(9, 9), 10, 20);
    imshow("3 x 3 ", equa_3);
    imshow("9 x 9 ", equa_9);

    waitKey(0);
}
```

# 非线性滤波

### medianBlur - 中值滤波

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", 0);
    Mat G1, G2;
    // medianBlur(输入图像,输出图像,滤波器尺寸)
    medianBlur(img, G1, 3);
    medianBlur(img, G2, 9);
    imshow("3 x 3", G1);
    imshow("9 x 9", G2);

    waitKey(0);
}
```

### bilateralFilter - 双边滤波

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", 0);
    Mat G1, G2;
    // bilateralFilter(输入图像,输出图像,滤波像素邻域直径,颜色空间滤波器标准差,空间坐标滤波器标准差,像素外推法)
    bilateralFilter(img, G1, 9, 50, 25 / 2);
    bilateralFilter(img, G2, 25, 50, 25 / 2);
    imshow("img1", G1);
    imshow("img2", G2);

    waitKey(0);
}
```

# 图像边缘检测

### convertScaleAbs - 矩阵数据绝对值边缘

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    // 创建边缘检测滤波器
    // X方向边缘检测滤波器
    Mat kernel1 = (Mat_<float>(1, 2) << 1, -1);
    Mat kernel2 = (Mat_<float>(1, 3) << 1, 0, -1);
    Mat kernel3 = (Mat_<float>(3, 1) << 1, 0, -1);
    // 左上到右下方向边缘检测滤波器
    Mat kernelXY = (Mat_<float>(2, 2) << 1, 0, 0, -1);
    // 右上到左下方向边缘检测滤波器
    Mat kernelYX = (Mat_<float>(2, 2) << 0, -1, 1, 0);
    Mat img = imread("3.jpg");
    Mat G1, G2, G3, G4, G5, G6;
    // 检测图像边缘
    // 以[1 -1]水平方向检测
    filter2D(img, G1, CV_16S, kernel1);
    // convertScaleAbs(输入矩阵,输出矩阵,缩放因子,添加偏差)
    convertScaleAbs(G1, G1);

    // 以[1 0 -1]水平方向检测
    filter2D(img, G2, CV_16S, kernel2);
    convertScaleAbs(G2, G2);

    // 以[1 0 -1]垂直方向检测
    filter2D(img, G3, CV_16S, kernel3);
    convertScaleAbs(G3, G3);

    // 整幅图像的边缘
    G6 = G2 + G3;

    // 检测由左上到右下方向检测
    filter2D(img, G4, CV_16S, kernelXY);
    convertScaleAbs(G4, G4);

    // 检测由右上到左下方向检测
    filter2D(img, G5, CV_16S, kernelYX);
    convertScaleAbs(G5, G5);

    imshow("以[1 -1]水平方向检测", G1);
    imshow("以[1 0 -1]水平方向检测", G2);
    imshow("以[1 0 -1]垂直方向检测", G3);
    imshow("检测由左上到右下方向检测", G4);
    imshow("检测由右上到左下方向检测", G5);
    imshow("整幅图像的边缘", G6);

    waitKey(0);
}
```

### Sobel - 一阶离散性差分算子边缘检测

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", 0);
    Mat GX, GY, GXY;
    // Sobel(输入图像,输出图像,输出图像数据类型,X方向差分阶数,Y方向差分阶数,算子尺寸,偏值,像素外推法)
    // X 方向一阶边缘检测
    Sobel(img, GX, CV_16S, 2, 0, 1);
    convertScaleAbs(GX, GX);

    // Y 方向一阶边缘检测
    Sobel(img, GY, CV_16S, 0, 1, 3);
    convertScaleAbs(GY, GY);

    // 整幅图像一阶边缘检测
    GXY = GX + GY;

    imshow("X", GX);
    imshow("Y", GY);
    imshow("XY", GXY);

    waitKey(0);
}
```

### Scharr - 灰度级变化点的集合边缘检测

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", 0);
    Mat GX, GY, GXY;
    // Scharr(输入图像,输出图像,输出图像数据类型,X方向差分阶数,Y方向差分阶数,导数结果缩放因子,偏值,像素外推法)
    // X 方向一阶边缘检测
    Scharr(img, GX, CV_16S, 1, 0);
    convertScaleAbs(GX, GX);

    // Y 方向一阶边缘检测
    Scharr(img, GY, CV_16S, 0, 1);
    convertScaleAbs(GY, GY);

    // 整幅图像一阶边缘检测
    GXY = GX + GY;

    imshow("X", GX);
    imshow("Y", GY);
    imshow("XY", GXY);

    waitKey(0);
}
```

### getDerivKernels - 生成边缘检测滤波器

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    // 分离的 Sobel 算子
    Mat sobel_x1, sobel_x2, sobel_x3, sobel_y1, sobel_y2, sobel_y3;
    // 分离的 Scharr 算子
    Mat scharr_x, scharr_y;
    // 最终算子
    Mat sobelX1, sobelX2, sobelX3, sobelX;
    // getDerivKernels(行滤波器系数输出矩阵,列滤波器系数输出矩阵,X方向导数阶数,Y方向导数阶数,滤波器大小,滤波器系数是否归一化,滤波器系数类型)
    
    // 一阶 X 方向 Soble 算子
    getDerivKernels(sobel_x1, sobel_y1, 1, 0, 3);
    sobel_x1 = sobel_x1.reshape(CV_8U, 1);
    sobelX1 = sobel_y1 * sobel_x1; // 计算滤波器

    // 二阶 X 方向 Soble 算子
    getDerivKernels(sobel_x2, sobel_y2, 2, 0, 5);
    sobel_x2 = sobel_x2.reshape(CV_8U, 1);
    sobelX2 = sobel_y2 * sobel_x2;

    // 三阶 X 方向 Soble 算子
    getDerivKernels(sobel_x3, sobel_y3, 3, 0, 7);
    sobel_x3 = sobel_x3.reshape(CV_8U, 1);
    sobelX3 = sobel_y3 * sobel_x3;

    // X 方向 Scharr 算子
    getDerivKernels(scharr_x, scharr_y, 1, 0, FILTER_SCHARR);
    scharr_x = scharr_x.reshape(CV_8U, 1);
    sobelX = scharr_y * scharr_x;

    // 输出结果
    cout << "一阶 X 方向 Soble 算子" << endl << sobelX1 << endl;
    cout << "二阶 X 方向 Soble 算子" << endl << sobelX2 << endl;
    cout << "三阶 X 方向 Soble 算子" << endl << sobelX3 << endl;
    cout << "X 方向 Scharr 算子" << endl << sobelX << endl;
    waitKey(0);
}
```

### Laplacian - n维欧几里德空间中的二阶微分算子

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", 0);
    Mat reau, reaug, reaut;// Laplacian(输入图像,输出图像,输出图像数据类型,滤波器大小,导数计算缩放因子,偏值,像素外推法)
    // 为进行滤波提取 Laplacian 边缘
    Laplacian(img, reau, CV_16S, 3, 1, 0);
    convertScaleAbs(reau, reau);

    // 滤波后提取 Laplacian 边缘
    GaussianBlur(img, reaug, Size(3, 3), 5, 0);
    Laplacian(reaug, reaut, CV_16S, 3, 1, 0);
    convertScaleAbs(reaut, reaut);

    // 显示图像
    imshow("G1", reau);
    imshow("G2", reaut);

    waitKey(0);
}
```

###		 Canny - 多级边缘检测

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", 0);
    Mat G1, G2, G3;
    // 高阈值检测图像边缘
    Canny(img, G1, 100, 200, 3);
    // 低阈值检测图像边缘
    Canny(img, G2, 20, 40, 3);
    // 高斯模糊后检测边缘
    GaussianBlur(img, G3, Size(3, 3), 5);
    Canny(G3, G3, 100, 200, 3);

    imshow("A", G1);
    imshow("B", G2);
    imshow("C", G3);
    
    waitKey(0);
}
```

# 像素距离与连通域

### distanceTransform - 图像像素距离变换

```c++
#include <iostream>

using namespace std;

#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    // 构建简易矩阵,用于求取像素间距离
    Mat a = (Mat_<uchar>(5, 5) << 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
    Mat dist1, dist2, dist3, dist4;
    // distanceTransform(输入图像,输出图像,二维标签数组,计算像素间方法,距离变换掩码矩阵尺寸,构建标签数组的类型)
    // distanceTransform(输入图像,输出图像,计算像素间方法,距离变换掩码矩阵尺寸,构建标签数组的类型)
    /*计算像素间方法:
     * -1:DIST_USER        自定义距离
     * 1:DIST_L1           街区距离
     * 1:DIST_L1           街区距离
     * 2:DIST_L2           欧氏距离
     * 3:DIST_C            棋盘距离
     */
    /* 构建标签数组的类型:
     * 0:DIST_LABEL_CCOMP   输入图像的每个连接的0像素都分配相同的标签
     * 1:DIST_LABEL_PIXEL   输入图像中每个0像素都有自己的标签
     */
    // 计算街区距离
    distanceTransform(a, dist1, 1, 3, CV_8U);
    cout << "街区距离" << endl << dist1 << endl;
    // 计算欧氏距离
    distanceTransform(a, dist2, 2, 5, CV_8U);
    cout << "欧氏距离" << endl << dist2 << endl;
    // 计算棋盘距离
    distanceTransform(a, dist3, 3, 5, CV_8U);
    cout << "棋盘距离" << endl << dist3 << endl;
    // 对图像进行距离变换
    Mat img = imread("3.jpg", 0);
    Mat G1, G2;
    // 转为二值图像并交换颜色区域
    threshold(img, G1, 50, 255, THRESH_BINARY);
    threshold(img, G2, 50, 255, THRESH_BINARY_INV);

    // 距离变换
    Mat dist, dist_I;
    distanceTransform(G1, dist, 1, 3, CV_32F);
    distanceTransform(G2, dist_I, 1, 3, CV_8U);

    imshow("G1", G1);
    imshow("G2", G2);
    imshow("G1_", dist);
    imshow("G2_", dist_I);

    waitKey(0);
}
```

### connectedComponents - 图像连通域分析

```C++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    // 图像进行距离变换
    Mat img = imread("3.jpg");
    Mat R1, R2;
    // 转为二值图,用于统计连通域
    cvtColor(img, R1, COLOR_BGR2GRAY);
    threshold(R1, R2, 50, 255, THRESH_BINARY);
    // 生成随机图像,来区分图像连通域
    RNG rng(10086);
    Mat out;
    // connectedComponents(待标记的单通道图像,标记连通域的输出图像,标记连通域邻域种类,输出图像类型,算法类型)
    // connectedComponents(待标记的单通道图像,标记连通域的输出图像,标记连通域邻域种类,输出图像类型)
    // 算法类型:
    // 0:CCL_WU             8邻域使用SAUF,4邻域使用SAUF
    // -1及1:CCL_DEFAULT    8邻域使用BBDT,4邻域使用SAUF
    
    int number = connectedComponents(R2, out, 8, CV_16U); // 统计连通域的个数
    vector<Vec3b> colors;
    for (int i = 0; i < number; ++i) {
        // 使用均匀分布的随机数确定颜色
        Vec3b vec3 = Vec3b(rng.uniform(0, 255), rng.uniform(0, 255), rng.uniform(0, 255));
        colors.push_back(vec3);
    }
    // 标记不同连通域
    Mat res = Mat::zeros(img.size(), img.type());
    int w = res.cols;
    int h = res.rows;
    for (int i = 0; i < h; ++i) {
        for (int j = 0; j < w; ++j) {
            int label = out.at<uint16_t>(i, j);
            if (label == 0) { // 背景不变
                continue;
            }
            res.at<Vec3b>(i, j) = colors[label];
        }
    }

    imshow("原图", img);
    imshow("标记后的图", res);

    waitKey(0);
}
```

### connectedComponentsWithStats - 图像连通域位置面积

```c++
#include <iostream>

using namespace std;

#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    // 图像进行距离变换
    Mat img = imread("3.jpg");
    imshow("原图", img);
    Mat R1, R2;
    // 转为二值图,用于统计连通域
    cvtColor(img, R1, COLOR_BGR2GRAY);
    threshold(R1, R2, 50, 255, THRESH_BINARY);
    // 生成随机图像,来区分图像连通域
    RNG rng(10086);
    Mat out, stats, cemtr;
    // 统计连通域数目
    // connectedComponentsWithStats(输入图像,输出图像,连通域统计信息矩阵,连通域质心坐标,邻域种类,输出图像的数据类型)
    int number = connectedComponentsWithStats(R2, out, stats, cemtr, 8, CV_16U);
    vector<Vec3b> colors;
    for (int i = 0; i < number; ++i) {
        // 使用均匀分布的随机数确定颜色
        Vec3b vec3 = Vec3b(rng.uniform(0, 255), rng.uniform(0, 255), rng.uniform(0, 255));
        colors.push_back(vec3);
    }
    // 标记不同连通域
    Mat res = Mat::zeros(img.size(), img.type());
    int w = res.cols;
    int h = res.rows;
    for (int i = 0; i < number; ++i) {
        // 中心位置
        int centerx = cemtr.at<double>(i, 0);
        int centery = cemtr.at<double>(i, 1);
        // 矩形边框
        int x = stats.at<int>(i, CC_STAT_LEFT);
        int y = stats.at<int>(i, CC_STAT_TOP);
        int w = stats.at<int>(i, CC_STAT_WIDTH);
        int h = stats.at<int>(i, CC_STAT_HEIGHT);
        int area = stats.at<int>(i, CC_STAT_AREA);
        // 中心位置绘制
        circle(img, Point(centerx, centery), 2, Scalar(255, 0, 0), 2, 8, 0);
        // 外接矩形
        Rect rect(x, y, w, h);
        rectangle(img, rect, colors[i], 1, 8, 0);
        putText(img, format("%d", i), Point(centerx, centery), FONT_HERSHEY_SIMPLEX, 0.5, Scalar(0, 255, 0), 1);
        cout << "n" << i << "M" << area << endl;
    }

    imshow("标记后的图", img);

    waitKey(0);
}
```

# 腐蚀和膨胀

### getStructuringElement - 生成结构元素

### erode - 图像腐蚀

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg");
    Mat G1, G2;
    // getStructuringElement(生成结构元素的种类,结构元素的尺寸,中心点的位置)
    // 0:MORPH_RECT     矩形结构元素,所有元素都为1
    // 1:MORPH_CROSS    十字结构元素,中间的列和行元素为1
    // 2:MORPH_ELLIPSE  椭圆结构元素,矩形的内核椭圆元素为1
    G1 = getStructuringElement(0, Size(3, 3));

    Mat R1, R2;   
    // erode(输入图像,输出图像,腐蚀操作的结构元素,中心点在结构元素的位置,腐蚀次数,像素外推法,不外推时的边界值)
    erode(img, R1, G1);
    namedWindow("A", WINDOW_GUI_NORMAL);
    namedWindow("B", WINDOW_GUI_NORMAL);
    imshow("A", img);
    imshow("B", R1);
    
    waitKey(0);
}
```

### dilate - 图像膨胀

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg");
    Mat G1, G2;
    G1 = getStructuringElement(0, Size(9, 9));
    G2 = getStructuringElement(1, Size(9, 9));

    Mat R1, R2;
    // dilate(输入图像,输出图像,膨胀操作的结构元素,中心点在结构元素的位置,膨胀次数,像素外推法,不外推时边界值)
    dilate(img, R1, G1);
    imshow("M", img);
    imshow("A", R1);

    waitKey(0);
}
```

# 形态学处理

### morphologyEx - 形态学操作

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", 0);
    imshow("M", img);
    Mat ker = getStructuringElement(0, Size(9, 9));
    Mat G1, G2, G3, G4, G5, G6;
    // morphologyEx(输入图像,输出图像,形态学操作类型,结构元素,中心点在结构元素的位置,处理次数,像素外推法,不外推时边界值)
    // 0:MORPH_ERODE        图像腐蚀
    // 1:MORPH_DILATE       图像膨胀
    // 2:MORPH_OPEN         开运算
    // 3:MORPH_CLOSE        闭运算
    // 4:MORPH_GRADIENT     形态学梯度
    // 5:MORPH_TOPHAT       顶帽运算
    // 6:MORPH_BLACKHAT     黑帽运算
    // 7:MORPH_HITMISS      击中击不中运算
    // 开运算
    morphologyEx(img, G1, MORPH_OPEN, ker);
    imshow("开运算", G1);

    // 闭运算
    morphologyEx(img, G2, MORPH_CLOSE, ker);
    imshow("闭运算", G2);

    // 形态学梯度
    morphologyEx(img, G3, MORPH_GRADIENT, ker);
    imshow("形态学梯度", G3);

    // 顶帽运算
    morphologyEx(img, G4, MORPH_TOPHAT, ker);
    imshow("顶帽运算", G4);

    // 黑帽运算
    morphologyEx(img, G5, MORPH_BLACKHAT, ker);
    imshow("黑帽运算", G5);

    // 击中击不中运算
    morphologyEx(img, G6, MORPH_HITMISS, ker);
    imshow("击中击不中运算", G6);
    
    waitKey(0);
}
```

### 图像细化

```c++
```

# 形状检测

### HoughLines - 直线检测

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

void draw(Mat &img, // 标记直线的图像
          vector<Vec2f> lines, // 检测直线数据
          double rows,
          double cows,
          Scalar caslay, // 直线颜色
          int n // 直线宽度
) {
    Point pt1, pt2;
    for (int i = 0; i < lines.size(); ++i) {
        float rho = lines[i][0]; // 直线距离坐标原点的位置
        float theta = lines[i][1]; // 直线与坐标原点的垂线与x轴的夹角
        double a = cos(theta); // 夹角的余弦
        double b = sin(theta); // 夹角的正弦
        double x0 = a * rho, y0 = b * rho; // 正弦与过坐标原点的垂线的交点
        double length = max(rows, cows); // 图像的高宽最大值
        // 计算直线的一点
        pt1.x = cvRound(x0 + length * (-b));
        pt1.y = cvRound(y0 + length * (a));
        // 计算直线的另一点
        pt2.x = cvRound(x0 - length * (-b));
        pt2.y = cvRound(y0 - length * (a));
        // 两点绘制直线
        line(img, pt1, pt2, caslay, n);
    }
}

int main() {
    Mat img = imread("3.jpg", 0);
    imshow("M", img);
    Mat edge;
    // 检测边缘并二值化
    Canny(img, edge, 80, 180, 3, false);
    threshold(edge, edge, 170, 255, THRESH_BINARY);
    // 用不同累加器检测直线
    vector<Vec2f> lines1, lines2;
    // HoughLines(输入图像,输出图像,像素单位的距离分辨率,弧度单位的角度分辨率,累加器阈值,多尺度霍夫变换算法,检测的最小角度,检测的最大角度)
    HoughLines(edge, lines1, 1, CV_PI / 180, 50, 0, 0);
    HoughLines(edge, lines2, 1, CV_PI / 180, 100, 0, 0);
    // 绘制直线
    Mat G1, G2;
    img.copyTo(G1);	
    img.copyTo(G2);
    draw(G1, lines1, edge.rows, edge.cols, Scalar(255), 2);
    draw(G2, lines2, edge.rows, edge.cols, Scalar(255), 2);

    imshow("G1", G1);
    imshow("G2", G2);

    waitKey(0);
}
```

### HoughLinesP - 渐进概率式霍夫变换

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", 0);
    imshow("M", img);
    Mat edge;
    // 检测边缘并二值化
    Canny(img, edge, 80, 180, 3, false);
    threshold(edge, edge, 170, 255, THRESH_BINARY);
    imshow("D", edge);
    // 利用渐进概率式霍夫变换
    vector<Vec4i> lines1, lines2;
    // HoughLinesP(输入图像,输出矩阵,像素单位的距离分辨率,弧度单位的角度分辨率,累加器阈值,直线的最小长度,直线上相邻点的最大距离)
    HoughLinesP(edge, lines1, 1, CV_PI / 180, 50, 1, 10);
    HoughLinesP(edge, lines2, 1, CV_PI / 180, 100, 1, 30);
    // 绘制直线
    Mat G1, G2;
    img.copyTo(G1);
    img.copyTo(G2);

    // 两点连接最大距离 10 直线检测结果
    for (int i = 0; i < lines1.size(); ++i) {
        cout << lines1[i] << endl;
        line(G1, Point(lines1[i][0], lines1[i][1]), Point(lines1[i][2], lines1[i][3]), Scalar(255), 3);
    }
    // 两点连接最大距离 30 直线检测结果
    for (int i = 0; i < lines2.size(); ++i) {
        line(G2, Point(lines2[i][0], lines2[i][1]), Point(lines2[i][2], lines2[i][3]), Scalar(255), 3);
    }
    imshow("G1", G1);
    imshow("G2", G2);

    waitKey(0);
}
```

### fitLine - 直线拟合

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", 0);
    imshow("M", img);
    Vec4f lines; // 存放直线拟合
    vector<Point2f> point; // 直线检测点
    const static float Points[10][2] = {
            {0.0F, 0.0F}, {10.0F, 11.0F}, {21.0F, 20.0F}, {30.0F, 31.0F}, {40.0F, 42.0F},
            {50.0F, 50.0F}, {60.0F, 60.0F}, {71.0F, 70.0F}, {136.0F, 137.0F}, {181.0F, 180.0F}
    };
    for (int i = 0; i < 10; ++i) {
        point.push_back(Point2f(Points[i][0], Points[i][1]));
    }
    // 参数设定
    double param = 0; // 距离类型中数值参数C
    double reps = 0.01; // 坐标原点与直线之间的距离精度
    double aeps = 0.01; // 角度精度
    // fitLine(输入点集, 输出直线描述, 距离类型, 数值参数C, 坐标原点距离精度, 角度精度)
    // 1:DIST_L1
    // 2:DIST_L2
    // 4:DIST_L12
    // 5:DIST_FAIR
    // 6:DIST_WELSCH
    // 7:DIST_HUBER
    fitLine(point, lines, DIST_L1, 0, 0.01, 0.01);
    double k = lines[1] / lines[0]; // 直线斜率
    cout << "直线斜率" << k << endl;
    cout << "直线上一点坐标x:" << lines[2] << "\ty:" << lines[3] << endl;
    cout << "直线解析式:" << k << "(x-" << lines[2] << ")+" << lines[3] << endl;

    waitKey(0);
}
```

### HoughCircles - 圆形检测

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("4.jpg");
    imshow("原图", img);
    Mat gray;
    cvtColor(img, gray, COLOR_BGR2GRAY);
    GaussianBlur(gray, gray, Size(3, 3), 2, 2);
    // 检测圆形
    vector<Vec3f> circles;
    double dp = 2;
    double minDist = 10; // 圆形间最小距离
    double param1 = 100; // 边缘检测较大阈值
    double param2 = 100; // 累加器阈值
    int min_rad = 20; // 圆形最小半径
    int max_rad = 100; // 圆形最大半径

    // HoughCircles(输入图像,输出量,方法标志,离散化分辨率与图像分辨率反比,圆心间最小距离,边缘检测较大阈值,累加器阈值,圆形最小半径,圆形最大半径)
    HoughCircles(gray, circles, HOUGH_GRADIENT, dp, minDist, param1, param2, min_rad, max_rad);
    // 图像中标记圆形
    for (int i = 0; i < circles.size(); ++i) {
        // 读取圆心
        Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
        // 读取半径
        int radius = cvRound(circles[i][2]);
        // 绘制圆心
        circle(img, center, 3, Scalar(0, 255, 0), -1, 8, 0);
        // 绘制圆
        circle(img, center, radius, Scalar(0, 0, 255), 3, 8, 0);
    }
    imshow("圆", img);
    waitKey(0);
}
```

# 轮廓检测

### findContours - 轮廓发现

### drawContours - 轮廓绘制

```c++
#include <iostream>

using namespace std;

#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("4.jpg");
    imshow("原图", img);
    Mat G1, G2;
    // 灰度图
    cvtColor(img, G1, COLOR_BGR2GRAY);
    // 平滑滤波
    GaussianBlur(G1, G1, Size(3, 3), 4, 4);
    // 自适应二值化
    threshold(G1, G2, 170, 255, THRESH_BINARY | THRESH_OTSU);
    // 轮廓发现
    // 轮廓
    vector<vector<Point>> cont;
    // 轮廓结构
    vector<Vec4i> hier;
    // 轮廓检测模式:
    // 0:RETR_EXTERNAL     只检测最外层轮廓
    // 1:RETR_LIST         提取所有轮廓,并放在list中
    // 2:RETR_CCOMP        提取所有轮廓,并组织成双层结构
    // 3:RETR_TREE         提取所有轮廓,并建立网状轮廓结构
    // 轮廓逼近方法:
    // 1:CHAIN_APPROX_NONE      获取每个轮廓的每个像素
    // 2:CHAIN_APPROX_SIMPLE    压缩水平方向,垂直方向,对角线方向的元素,只保留该方向的终点坐标
    // 3:CHAIN_APPROX_TC89_L1   使用 The-Chinl 链逼近算法中的一个
    // 4:CHAIN_APPROX_TC89_L1   使用 The-Chinl 链逼近算法中的一个
    // findContours(输入图像,输出轮廓,轮廓结构向量,轮廓检测模式,轮廓逼近方法,轮廓点移动偏移量)
    // findContours(输入图像,输出轮廓,轮廓检测模式,轮廓逼近方法,轮廓点移动偏移量)
    findContours(G2, cont, hier, RETR_TREE, CHAIN_APPROX_SIMPLE, Point());
    for (int i = 0; i < cont.size(); ++i) {
        // drawContours(输入图像,绘制的轮廓,绘制轮廓的数目,轮廓颜色,轮廓线条粗细,线连接类型,结构关系,绘制轮廓等级轮廓偏移量)
        // 1:LINE_4     4线连通线型
        // 3:LINE_8     8线连通线型
        // 4:LINE_AA    抗锯齿线型
        drawContours(img, cont, i, Scalar(0, 255, 5), 2, 8);
    }
    for (int i = 0; i < hier.size(); ++i) {
        cout << hier[i] << endl;
    }
    imshow("D", img);

    waitKey(0);
}
```

### boundingRect - 寻找轮廓最大外接矩形

### minAreaRect - 寻找轮廓最小外接矩形

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("4.png");
    imshow("原图", img);
    Mat G1, G2;
    img.copyTo(G1); // 最大外接矩形
    img.copyTo(G2); // 最小外接矩形
    // 去噪与二值化
    Mat canny;
    Canny(img, canny, 20, 160, 3, false);
    imshow("边缘", canny);
    // 膨胀运算将小缝隙填补
    Mat ker = getStructuringElement(0, Size(3, 3));
    dilate(canny, canny, ker);
    // 轮廓发现与绘制
    vector<vector<Point>> cont;
    vector<Vec4i> hier;
    findContours(canny, cont, hier, 0, 2, Point());
    // 寻找轮廓外接矩形
    for (int i = 0; i < cont.size(); ++i) {
        // boundingRect(输入灰度图或二维点集)
        // 最大外接
        Rect rect = boundingRect(cont[i]);
        rectangle(G1, rect, Scalar(0, 255, 0), 2, 8, 0);
        // minAreaRect(输入二维点集)
        // 最小外接
        RotatedRect rrect = minAreaRect(cont[i]);
        Point2f poi[4];
        rrect.points(poi);  // 最小外接的4顶点
        Point2f cpt = rrect.center; // 最小外接的中心
        // 绘制矩形与中心
        for (int j = 0; j < 4; ++j) {
            if (j == 3) {
                line(G2, poi[j], poi[0], Scalar(0, 255, 0), 2, 8, 0);
                break;
            }
            line(G2, poi[j], poi[j + 1], Scalar(0, 255, 0), 2, 8, 0);
        }
        circle(img, cpt, 2, Scalar(255, 0, 0), 2, 8, 0);
    }
    imshow("max", G1);
    imshow("min", G2);

    waitKey(0);
}
```

### approxPolyDP - 寻找逼近轮廓多边形

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

// 绘制函数
void draw(Mat res, Mat img) {
    for (int i = 0; i < res.rows; ++i) {
        // 最后坐标点与第一坐标点链接
        if (i == res.rows - 1) {
            Vec2i poi1 = res.at<Vec2i>(i);
            Vec2i poi2 = res.at<Vec2i>(0);
            line(img, poi1, poi2, Scalar(0, 255, 0), 2, 8, 0);
            break;
        }
        Vec2i poi1 = res.at<Vec2i>(i);
        Vec2i poi2 = res.at<Vec2i>(i + 1);
        line(img, poi1, poi2, Scalar(0, 255, 0), 2, 8, 0);
    }
}


int main() {
    Mat img = imread("4.png");
    imshow("原图", img);
    // 边缘检测
    Mat canny;
    Canny(img, canny, 80, 160, 3, false);
    // 膨胀运算
    Mat ker = getStructuringElement(0, Size(3, 3));
    dilate(canny, canny, ker);
    // 轮廓发现与绘制
    vector<vector<Point>> cont;
    vector<Vec4i> hier;
    findContours(canny, cont, hier, 0, 2, Point());
    // 绘制多边形
    for (int i = 0; i < cont.size(); ++i) {
        RotatedRect rrect = minAreaRect(cont[i]);
        Point2f center = rrect.center;
        circle(img, center, 2, Scalar(0, 255, 0), 2, 8, 0);
        Mat result;
        // approxPolyDP(输入轮廓像素点,多边形逼近结果,逼近精度,逼近曲线是否封闭曲线的标志)
        // 多边形逼近
        approxPolyDP(cont[i], result, 4, true);
        draw(result, img);
    }
    imshow("res", img);
    waitKey(0);
}
```

### pointPolygonTest - 像素点距离轮廓

```c++
#include <iostream>

using namespace std;

#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("4.png");
    // 边缘检测
    Mat canny;
    Canny(img, canny, 80, 160, 3, false);
    // 膨胀运算
    Mat ker = getStructuringElement(0, Size(3, 3));
    dilate(canny, canny, ker);
    // 轮廓发现与绘制
    vector<vector<Point>> cont;
    vector<Vec4i> hier;
    findContours(canny, cont, hier, 0, 2, Point());
    // 创建图像像素点
    Point point = Point(20, 40);
    circle(img, point, 2, Scalar(0, 255, 255), 2, 8, 0);
    // 多边形
    for (int i = 0; i < cont.size(); ++i) {
        // 最小外接
        RotatedRect rrect = minAreaRect(cont[i]);
        Point2f center = rrect.center;
        // 绘制圆心点
        circle(img, center, 2, Scalar(0, 255, 0), 2, 8, 0);
        // pointPolygonTest(输入轮廓,需要计算的像素,计算的距离是否具有方向性)
        // 轮廓外部点距离轮廓的距离
        double dis = pointPolygonTest(cont[i], point, true);
        // 轮廓内部点距离到轮廓的距离
        double dis2 = pointPolygonTest(cont[i], center, true);
        // 输出点结果
        cout << "轮廓外部点距离轮廓的距离" << dis << endl;
        cout << "轮廓内部点距离到轮廓的距离" << dis2 << endl;
    }
    waitKey(0);
}
```

### convexHull - 凸包检测

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg");
    // 二值化
    Mat gray, binary;
    cvtColor(img, gray, COLOR_BGR2GRAY);
    threshold(gray, binary, 105, 255, THRESH_BINARY);
    // 开运算消除细小区域
    Mat k = getStructuringElement(MORPH_RECT, Size(3, 3), Point(-1, -1));
    morphologyEx(binary, binary, MORPH_OPEN, k);
    imshow("binary", binary);
    // 轮廓发现
    // 轮廓发现与绘制
    vector<vector<Point>> cont;
    vector<Vec4i> hier;
    findContours(binary, cont, hier, 0, 2, Point());
    for (int i = 0; i < cont.size(); ++i) {
        // 计算凸包
        vector<Point> hull;
        // convexHull(输入二维点集或轮廓坐标,输出凸包顶点,方向标志,输出数据的类型标志)
        convexHull(cont[i], hull);
        // 绘制凸包
        for (int j = 0; j < hull.size(); ++j) {
            // 绘制凸包顶点
            circle(img, hull[j], 4, Scalar(255, 0, 0), 2, 8, 0);
            // 连接凸包
            if (j == hull.size() - 1) {
                line(img, hull[j], hull[0], Scalar(0, 0, 255), 2, 8, 0);
                break;
            }
            line(img, hull[j], hull[j + 1], Scalar(0, 0, 255), 2, 8, 0);
        }
    }
    imshow("hull", img);
}
```

# 矩的计算

### moments - 计算图像矩

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("4.png");
    // 二值化
    Mat gray, binary;
    cvtColor(img, gray, COLOR_BGR2GRAY);
    threshold(gray, binary, 105, 255, THRESH_BINARY);
    // 开运算消除细小区域
    Mat k = getStructuringElement(MORPH_RECT, Size(3, 3), Point(-1, -1));
    morphologyEx(binary, binary, MORPH_OPEN, k);
    // 轮廓发现
    vector<vector<Point>> cont;
    vector<Vec4i> hier;
    findContours(binary, cont, hier, 0, 2, Point());
    for (int i = 0; i < cont.size(); ++i) {
        Moments M;
        // moments(计算矩的区域,将所有非零像素值视为1的标志)
        M = moments(cont[i], true);
        cout << "空间矩" << endl;
        cout << "M00\t" << M.m00 << endl << "M01\t" << M.m01 << endl;
        cout << "M10\t" << M.m10 << endl << "M11\t" << M.m11 << endl;
        cout << "M02\t" << M.m02 << endl << "M20\t" << M.m20 << endl;
        cout << "M12\t" << M.m12 << endl << "M21\t" << M.m21 << endl;
        cout << "M03\t" << M.m03 << endl;
        cout << "中心矩" << endl;
        cout << "Mu20\t" << M.mu20 << endl << "Mu02\t" << M.mu02 << endl;
        cout << "Mu11\t" << M.mu11 << endl << "Mu30\t" << M.mu30 << endl;
        cout << "Mu21\t" << M.mu21 << endl << "Mu12\t" << M.mu12 << endl;
        cout << "Mu03\t" << M.mu03 << endl;
        cout << "归一化中心矩" << endl;
        cout << "Nu20\t" << M.nu20 << endl << "Nu02\t" << M.nu02 << endl;
        cout << "Nu11\t" << M.nu11 << endl << "Nu30\t" << M.nu30 << endl;
        cout << "Nu21\t" << M.nu21 << endl << "Nu12\t" << M.nu12 << endl;
        cout << "Nu03\t" << M.nu03 << endl;
    }
}
```

### Hu矩

```c++
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img = imread("4.png");
    // 二值化
    Mat gray, binary;
    cvtColor(img, gray, COLOR_BGR2GRAY);
    threshold(gray, binary, 105, 255, THRESH_BINARY);
    // 开运算消除细小区域
    Mat k = getStructuringElement(MORPH_RECT, Size(3, 3), Point(-1, -1));
    morphologyEx(binary, binary, MORPH_OPEN, k);
    // 轮廓发现
    vector<vector<Point>> cont;
    vector<Vec4i> hier;
    findContours(binary, cont, hier, 0, 2, Point());
    for (int i = 0; i < cont.size(); ++i) {
        Moments M;
        M = moments(cont[i], true);
        Mat hu;
        // HuMoments(输入图像矩,输出Hu矩7个值)
        // HuMoments(输入图像矩,输出Hu矩矩阵)
        HuMoments(M, hu);
        cout << hu << endl;
    }
}
```

# 点集拟合

### 寻找二维点集的最小包围三角形

### 寻找二维点集的最小包围圆形

```c++
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;

int main() {
    Mat img(500, 500, CV_8UC3, Scalar::all(0));
    RNG &rng = theRNG(); // 生成随机点
    while (true) {
        int i, count = rng.uniform(1, 101);
        vector<Point> poi;
        // 生成随机点
        for (int j = 0; j < count; ++j) {
            Point pt;
            pt.x = rng.uniform(img.cols / 4, img.cols * 3 / 4);
            pt.y = rng.uniform(img.rows / 4, img.rows * 3 / 4);
            poi.push_back(pt);
        }
        // minEnclosingTriangle(输入二维点集,拟合的三角形顶点坐标)
        // 寻找包围点集的三角形
        vector<Point2f> triang;
        double area = minEnclosingTriangle(poi, triang);
        // minEnclosingCircle(输入二维点集,圆形的圆形,圆形的半径)
        // 寻找包围点集的圆形
        Point2f center;
        float radius = 0;
        minEnclosingCircle(poi, center, radius);
        img = Scalar::all(0);
        Mat img2;
        img.copyTo(img2);
        // 绘制坐标点
        for (int j = 0; j < count; ++j) {
            circle(img, poi[j], 3, Scalar(255, 255, 0), FILLED, LINE_AA);
            circle(img2, poi[j], 3, Scalar(255, 255, 0), FILLED, LINE_AA);
        }
        // 绘制三角形
        for (int j = 0; j < 3; ++j) {
            if (j == 2) {
                line(img, triang[j], triang[0], Scalar(255, 0, 255), 1, 16);
                break;
            }
            line(img, triang[j], triang[j + 1], Scalar(255, 0, 255), 1, 16);
        }
        // 绘制圆形
        circle(img2, center, cvRound(radius), Scalar(255, 23, 25), 1, LINE_AA);
        imshow("包围点集的三角形", img);
        imshow("包围点集的圆形", img2);
        char key = (char) waitKey();
        if (key == 27 || key == 'q' || key == 'Q') {
            break;
        }
    }
}
```

# QR 二维码检测

### detect - 定位 OR 二维码

### decode - 解码 OR 二维码

```java
#include <iostream>

using namespace std;

#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("6.png");
    Mat gray, qrcode;
    cvtColor(img, gray, COLOR_BGR2GRAY);
    QRCodeDetector qrco;
    vector<Point> poi;
    string inf;
    bool inQR;
    // detect(检测图片,输出QR最小四边形顶点坐标)
    // 识别二维码
    inQR = qrco.detect(gray, poi);
    if (inQR) {
        // decode(QR图像, QR二维顶点, 校正和二值化的二维码)
        // 解码二维码
        inf = qrco.decode(gray, poi, qrcode);
        // 输出二维4顶点坐标
        cout << poi << endl;
    } else {
        cout << "无法识别二维码" << endl;
    }
    // 绘制二维码边框
    for (int i = 0; i < poi.size(); ++i) {
        if (i == poi.size() - 1) {
            line(img, poi[i], poi[0], Scalar(0, 0, 255), 2, 8);
            break;
        }
        line(img, poi[i], poi[i + 1], Scalar(0, 0, 255), 2, 8);
    }
    // 将解码内容输出到图片上
    putText(img, inf.c_str(), Point(20, 30), 0, 1.0, Scalar(0, 0, 255), 2, 8);
    imshow("QR", img);
    waitKey(0);
}
```

### detectAndDecode - 定位 OR 二维码并解码

```c++
#include <iostream>

using namespace std;

#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("6.png");
    Mat gray;
    cvtColor(img, gray, COLOR_BGR2GRAY);
    QRCodeDetector qrco;
    vector<Point> poi;
    string inf;
    // detectAndDecode(QR二维码,QR二维码顶点坐标,校正和二值化二维码)
    inf = qrco.detectAndDecode(gray, poi);
    cout << poi << endl;
    putText(img, inf.c_str(), Point(20, 55), 0, 1.0, Scalar(0, 0, 0), 2, 8);
    imshow("QR", img);
    waitKey(0);
}
```

# 傅里叶变换

### dft - 离散傅里叶变换

### idft - 离散傅里叶逆变换

### getOptimalDFTSize - 最优输入矩阵尺寸

### copyMakeBorder - 图像周围包围外框

### amplitude - 计算两矩阵组成二维向量矩阵的幅值矩阵

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg");
    Mat a = (Mat_<float>(5, 5) << 1, 2, 3, 4, 5, 2, 3, 4, 5, 6, 3, 4, 5, 6, 7, 4, 5, 6, 7, 8, 5, 6, 7, 8, 9);

    Mat b, c, d;
    // dft(输入图像或数组矩阵,输出离散傅里叶变换后的数组矩阵,变换类型,输入输出的形式)
    // 1:DFT_INVERSE         对一维数组或二维数组进行逆变换
    // 2:DFT_SCALE           缩放标识,输出结果除以输入元素的数目N
    // 4:DFT_ROWS            对输入变量的每一行进行正变换或逆变换
    // 16:DFT_COMPLEX_OUTPUT 对一维或二维实数数组进行正变换,结果为相同尺寸的复数共轭对称矩阵
    // 32:DFT_REAL_OUTPUT    对一维或二维复数矩阵进行逆变换,输出相同尺寸的复数共轭对称的复数矩阵,如果输入的
    // 矩阵具有复数共轭对称性的复数矩阵,则计算结果为实数矩阵
    // 64:DFT_COMPLEX_INPUT  指定输入数据是复数矩阵,输入矩阵必须具有二个通道
    dft(a, b, DFT_COMPLEX_OUTPUT); // 正变换
    dft(b, c, DFT_INVERSE | DFT_SCALE | DFT_REAL_OUTPUT); // 逆变换只输出实数
    // idft(输入图像或数组矩阵,输出离散傅里叶变换后的数组矩阵,变换类型,输入输出的形式)
    idft(b, d, DFT_SCALE); // 逆变换

    Mat gray;
    cvtColor(img, gray, COLOR_BGR2GRAY);
    resize(gray, gray, Size(500, 500));
    imshow("原图", gray);
    // getOptimalDFTSize(输入需要进行离散傅里叶变换的矩阵的最佳行数或列数)
    // 计算适合图像离散傅里叶变换的最优尺寸
    int rows = getOptimalDFTSize(gray.rows);
    int cols = getOptimalDFTSize(gray.cols);
    // 扩展图像
    Mat appr;
    int T = (rows - gray.rows) / 2; // 上扩展行数
    int B = rows - gray.rows - T; // 下扩展行数
    int L = (cols - gray.cols) / 2; // 左扩展行数
    int R = cols - gray.cols - L; // 上扩展行数
    // copyMakeBorder(原图, 扩展后图, 上扩展像素行数, 下扩展像素行数, 左扩展像素行数, 右扩展像素行数,扩展边界类型,扩展边界数值);
    copyMakeBorder(gray, appr, T, B, L, R, BORDER_CONSTANT);
    imshow("扩展后的图像", appr);

    // 构建离散傅里叶输入量
    Mat flo[2], complex;
    flo[0] = Mat_<float>(appr); // 实数部分
    flo[1] = Mat::zeros(appr.size(), CV_32F); // 虚数部分
    merge(flo, 2, complex); // 合成多通道
    // 进行离散傅里叶变换
    Mat result;
    dft(complex, result);
    // 将复数转化为幅值
    Mat resuleC[2];
    split(result, resuleC); // 分成实数和虚数
    Mat amplitude;
    // magnitude(向量x坐标的浮点矩阵,向量y坐标的浮点矩阵)
    magnitude(resuleC[0], resuleC[1], amplitude);
    // 使用对数缩小 M1 = log(1+M) 保证所有数大于0
    amplitude = amplitude + 1;
    log(amplitude, amplitude); // 求自然对数

    // 与原图尺寸对应的区域
    amplitude = amplitude(Rect(T, L, gray.cols, gray.rows));
    normalize(amplitude, amplitude, 0, 1, NORM_MINMAX);  // 归一化
    imshow("傅里叶变换结果幅值图像", amplitude);

    // 重新排列傅里叶图像象限,使得原点位于图像中心
    int centerx = amplitude.cols / 2;
    int centery = amplitude.rows / 2;
    // 分解4个区域
    Mat Qlt(amplitude, Rect(0, 0, centerx, centery)); // ROI 左上
    Mat Qrt(amplitude, Rect(centerx, 0, centerx, centery)); // ROI 右上
    Mat Qlb(amplitude, Rect(0, centery, centerx, centery)); // ROI 左下
    Mat Qrb(amplitude, Rect(centerx, centery, centerx, centery)); // ROI 右下

    // 交换象限,左上和右下进行交换
    Mat med;
    Qlt.copyTo(med);
    Qrb.copyTo(Qlt);
    med.copyTo(Qrb);
    // 交换象限,左下和右上进行交换
    Qrt.copyTo(med);
    Qlb.copyTo(Qrt);
    med.copyTo(Qlb);

    imshow("中心化后的幅值图像", amplitude);
    
    waitKey(0);
}
```

### mulSpectrums - 计算两复数矩阵乘积

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg");
    Mat gray;
    cvtColor(img, gray, COLOR_BGR2GRAY);
    Mat grayf = Mat_<float>(gray); // 更换数据类型为 float
    Mat ker = (Mat_<float>(5, 5) << 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
    // 构建输出图像
    Mat res;
    int rw = abs(grayf.rows - ker.rows) + 1;
    int rh = abs(grayf.cols - ker.cols) + 1;
    res.create(rw, rh, grayf.type());

    // 计算最优离散傅里叶变换尺寸
    int wid = getOptimalDFTSize(grayf.cols + ker.cols - 1);
    int hei = getOptimalDFTSize(grayf.rows + ker.rows - 1);

    // 改变输入图像尺寸
    Mat temp;
    int A_T = 0;
    int A_B = wid - grayf.rows;
    int A_L = 0;
    int A_R = hei - grayf.cols;
    copyMakeBorder(grayf, temp, 0, A_B, 0, A_R, BORDER_CONSTANT);

    // 改变滤波器尺寸
    Mat temps;
    int B_T = 0;
    int B_B = wid - ker.rows;
    int B_L = 0;
    int B_R = hei - ker.cols;
    copyMakeBorder(ker, temps, 0, B_B, 0, B_R, BORDER_CONSTANT);

    // 分别进行离散傅里叶变换
    dft(temp, temp, 0, grayf.rows);
    dft(temps, temps, 0, ker.rows);

    // mulSpectrums(输入矩阵1,输入矩阵2,输出矩阵,操作标志,是否对输入矩阵2进行共轭变换标志)
    // 多个傅里叶变换结果相乘
    mulSpectrums(temp, temps, temp, DFT_COMPLEX_OUTPUT);

    // 相乘结果进行逆变换
    idft(temp, temp, DFT_SCALE, res.rows);

    // 对逆变换结果进行归一化
    normalize(temp, temp, 0, 1, NORM_MINMAX);

    // 截取部分结果作为滤波结果
    temp(Rect(0, 0, res.cols, res.rows)).copyTo(res);
    imshow("原图", img);
    imshow("滤波图像", res);

    waitKey(0);
}
```

### dct - 计算离散余弦变换

### idct - 离散余弦逆变换

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat ker = (Mat_<float>(4, 4) << 1, 2, 3, 4, 2, 3, 4, 5, 3, 4, 5, 6, 4, 5, 6, 7, 5, 6, 7, 8);
    Mat a, b;
    // dct(输入数据矩阵,输出数据矩阵,转换方法标志)
    // 0:--             对一维或二维数组进行正变换
    // 1:DCT_INVERSR    对一维或二维数组进行逆变换
    // 4:DCT_ROWS       执行输入矩阵的正变换或逆变换
    dct(ker, a);
    // idct(输入数据矩阵,输出数据矩阵,转换的方法)
    idct(a, b);
    // 对图像进行处理
    Mat img = imread("3.jpg");
    imshow("原图", img);

    // 计算最优变换尺寸
    int wit = 2 * getOptimalDFTSize((img.cols + 1) / 2);
    int hei = 2 * getOptimalDFTSize((img.rows + 1) / 2);

    // 对三通道分别进行离散余弦变换
    vector<Mat> chan;
    split(img, chan);

    // 提取 NGR 颜色各通道
    Mat one = chan.at(0);
    Mat two = chan.at(1);
    Mat three = chan.at(2);

    // 进行离散余弦变换
    Mat oneD, twoD, threeD;
    dct(Mat_<float>(one), oneD);
    dct(Mat_<float>(two), twoD);
    dct(Mat_<float>(three), threeD);

    // 重新组成3通道
    vector<Mat> chanT;
    chanT.push_back(Mat_<uchar>(oneD));
    chanT.push_back(Mat_<uchar>(twoD));
    chanT.push_back(Mat_<uchar>(threeD));

    Mat result;
    merge(chanT, result);
    imshow("DCT图像", result);

    waitKey(0);
}
```

# 积分图像

### integral - 计算标志求和积分

### integral - 计算平方求和积分

### integral - 计算倾斜求和积分

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    // 创建 16 x 16矩阵
    Mat img = Mat::ones(16, 16, CV_32FC1);
    // 在图像中添加随机噪音
    RNG rng(10086);
    for (int i = 0; i < img.rows; ++i) {
        for (int j = 0; j < img.cols; ++j) {
            float d = rng.uniform(-0.5, 0.5);
            img.at<float>(i, j) = img.at<float>(i, j) + d;
        }
    }
    // 计算标志求和积分
    Mat sum;
    // integral(输入矩阵,输出标准求和积分,输出图像数据类型标志)
    cv::integral(img, sum);
    Mat sumU = Mat_<uchar>(sum);

    // 计算平方求和积分
    Mat sqsum;
    // integral(输入矩阵,输出标准求和积分,输出平方求和积分,标准求和数据类型,平方求和数据类型)
    cv::integral(img, sum, sqsum);
    Mat sqsumU = Mat_<uchar>(sqsum);

    // 计算倾斜求和积分
    Mat tilt;
    // integral(输入矩阵,输出标准求和矩阵,输出平方求和矩阵,输出倾斜45度求和积分矩阵,输出数据类型)
    cv::integral(img, sum, sqsum, tilt);
    Mat tiltU = Mat_<uchar>(tilt);

    namedWindow("计算标志求和积分", WINDOW_NORMAL);
    namedWindow("计算平方求和积分", WINDOW_NORMAL);
    namedWindow("计算倾斜求和积分", WINDOW_NORMAL);
    imshow("计算标志求和积分", sum);
    imshow("计算平方求和积分", sqsum);
    imshow("计算倾斜求和积分", tilt);

    waitKey(0);
}
```

# 图像分隔

### floodFill - 漫水填充法

```c++
#include <iostream>

using namespace std;

#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg");
    RNG rng(10086);
    int conne = 4; // 连通域方式
    int maskV = 255; // 掩码图像的数值
    int flags = conne | (maskV << 8) | FLOODFILL_FIXED_RANGE; // 漫水填充操作方式标志
    // 设置与选中像素点的差值
    Scalar loD = Scalar(20, 20, 20);
    Scalar upD = Scalar(20, 20, 20);
    // 声明掩码矩阵变量
    Mat mask = Mat::zeros(img.rows + 2, img.cols + 2, CV_8UC1);
    while (true) {
        // 随机生成像素点
        int py = rng.uniform(0, img.rows - 1);
        int px = rng.uniform(0, img.cols - 1);
        Point point = Point(px, py);
        Rect rect;
        // 彩色图像填充像素值
        Scalar newVal = Scalar(rng.uniform(0, 255), rng.uniform(0, 255), rng.uniform(0, 255));
        // floodFill(输入图像,掩码矩阵,种子点,归入种子点的新像素值,种子点最小矩形边界,添加进种子区域条件的上界差值,漫水填充法操作标志)
        // 1 << 16 : 仅考虑当前像素点与初始种子点像素值之间的差值,否则考虑新种子点像素值与当前像素值之间的差异,即范围是否浮动的标志
        // 1 << 17 : 不会改变原始图像,即忽略第四参数 newVal,只生成掩码矩阵
        // 漫水填充
        int area = floodFill(img, mask, point, newVal, &rect, loD, upD, flags);
        cout << "像素点X" << point.x << endl;
        cout << "像素点Y" << point.y << endl;
        cout << "填充数目" << area << endl;

        // 输出填充的图像
        imshow("填充的彩色图像", img);
        imshow("掩码图像", mask);
        int c = waitKey(0);
        if ((c & 255) == 27) {
            break;
        }
    }
}
```

### watershed - 分水岭法

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg"), imgG, imgM;
    Mat mask;
    cvtColor(img, imgG, COLOR_BGR2GRAY);
    // 提取边缘并进行闭运算
    Canny(imgG, imgM, 60, 200);
    imshow("边缘图像", imgM);
    imshow("原图像", img);

    // 计算连通域数目
    vector<vector<Point>> cont;
    vector<Vec4i> hier;
    findContours(imgM, cont, hier, RETR_CCOMP, CHAIN_APPROX_SIMPLE);

    // 绘制轮廓用于输出分水岭
    mask = Mat::zeros(imgM.size(), CV_32S);
    for (int i = 0; i < cont.size(); ++i) {
        drawContours(mask, cont, i, Scalar::all(i + 1), -1, 8, hier, INT_MAX);
    }
    // 分水岭法
    // watershed(输入图像,输入/输出标记结果)
    watershed(img, mask);
    vector<Vec3b> colors;
    for (int i = 0; i < cont.size(); ++i) {
        int b = theRNG().uniform(0, 255);
        int g = theRNG().uniform(0, 255);
        int r = theRNG().uniform(0, 255);
        colors.push_back(Vec3b((uchar) b, (uchar) g, (uchar) r));
    }
    Mat resu = Mat(img.size(), CV_8UC3);
    for (int i = 0; i < imgM.rows; ++i) {
        for (int j = 0; j < imgM.cols; ++j) {
            // 绘制区域颜色
            int index = mask.at<int>(i, j);
            if (index == -1) {
                resu.at<Vec3b>(i, j) = Vec3b(255, 255, 255);
            } else if (index <= 0 || index > cont.size()) {
                resu.at<Vec3b>(i, j) = Vec3b(0, 0, 0);
            } else {
                resu.at<Vec3b>(i, j) = colors[index - 1];
            }
        }
    }
    resu = resu * 0.6 + img * 0.4;
    imshow("分水岭结果", resu);
    
    waitKey(0);
}

```

### grabCut - 高斯混合法

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg");
    // 绘制矩形
    Mat imgR;
    img.copyTo(imgR);
    Rect rect(80, 30, 340, 390);
    rectangle(imgR, rect, Scalar(255, 255, 255), 2);
    imshow("选择的区域", imgR);
    // 进行分割
    Mat bgd = Mat::zeros(1, 65, CV_64FC1);
    Mat fgd = Mat::zeros(1, 65, CV_64FC1);
    Mat mask = Mat::zeros(img.size(), CV_8UC1);
    // grabCut(输入图像,输入/输出单通道掩码图像,对象ROI
    // 区域,背景模型的临时数组,前景模型的临时数组,算法迭代次数,分割模式标志)
    // 掩码图像像素值范围和含义
    // 0:GC_BGD      明显为背景的像素
    // 1:GC_FGD      明显为前景的像素
    // 2:GC_PR_BGD       可能为背景的像素
    // 3:GC_PR_FGD       可能为前景的像素
    // 分割模式
    // 0:GC_INIT_WITH_RECT   使用提供的矩形初始化状态和掩码,之后根据算法进行迭代更新
    // 1:GC_INIT_WITH_MASK     使用提供的掩码初始化状态
    // 2:GC_EVAL     算法应该恢复
    // 3:GC_EVAL_FREEZE_MODEL       只使用固定模型运行 Grabcue 算法(单次迭代)
    grabCut(img, mask, rect, bgd, fgd, 5, GC_INIT_WITH_RECT);

    // 将分割的前景重新绘制
    Mat resu;
    for (int i = 0; i < mask.rows; ++i) {
        for (int j = 0; j < mask.cols; ++j) {
            int n = mask.at<uchar>(i, j);
            // 将明显是前景和可能是前景的区域保留
            if (n == 1 || n == 3) {
                mask.at<uchar>(i, j) = 255;
            } else {
                mask.at<uchar>(i, j) = 0;
            }
        }
    }
    bitwise_and(img, img, resu, mask);
    imshow("分割结果", resu);

    waitKey(0);
}
```

### pyrMeanShiftFiltering - 均值漂移法

### TermCriteria - 终止迭代类型

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg");
    // 分割处理
    Mat resu1, resu2;
    // TermCriteria(终止条件标志,最大迭代次数,迭代算法停止时需要满足的条件)
    TermCriteria T10 = TermCriteria(TermCriteria::COUNT | TermCriteria::EPS, 10, 0.1);
    // pyrMeanShiftFiltering(输入图像,输出图像,滑动窗口的半径,滑动窗口的颜色幅度,分割金字塔缩放层数,迭代算法终止条件)
    pyrMeanShiftFiltering(img, resu1, 20, 40, 2, T10); // 第一次分割
    pyrMeanShiftFiltering(resu1, resu2, 20, 40, 2, T10); // 再次分割
    // 显示分割结果
    imshow("原图", img);
    imshow("一次分割", resu1);
    imshow("二次分割", resu2);

    // 提取边缘
    Mat imgC, resu1C, resu2C;
    Canny(img, imgC, 30, 200);
    Canny(resu1, resu1C, 30, 200);
    Canny(resu2, resu2C, 30, 200);
    imshow("原图边缘", imgC);
    imshow("一次分割边缘", resu1C);
    imshow("二次分割边缘", resu2C);

    waitKey(0);
}
```

# 图像修复

### inpaint - 修复少量污染和水印

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("5.jpg");
    imshow("原图", img);
    // 转换灰度图
    Mat imgG;
    cvtColor(img, imgG, COLOR_BGR2GRAY, 0);
    // 阈值处理生成掩码
    Mat imgM;
    threshold(imgG, imgM, 225, 255, THRESH_BINARY);
    // 对掩码进行膨胀增加掩码面积
    Mat ker = getStructuringElement(MORPH_RECT, Size(3, 3));
    dilate(imgM, imgM, ker);
    // 图像修复
    Mat imgX;
    // inpaint(输入图像,修复掩码,输出图像,算法考虑像素点圆形邻域半径,修复图像方法标志)
    // 0:INPAINT_NS         基于纳维-斯托克斯方程修复图像
    // 1:INPAINT_TELEA      基于快速行进方法修复图像
    inpaint(img, imgM, imgX, 5, INPAINT_NS);
    imshow("掩码", imgM);
    imshow("修改图像", imgX);

    waitKey(0);
}
```

# 角点检测

### drawKeypoints - 绘制关键点

### KeyPoint - 关键点数据类型

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", IMREAD_COLOR);
    Mat imgG;
    cvtColor(img, imgG, COLOR_BGR2GRAY);
    // 生成关键点
    vector<KeyPoint> key;
    RNG rng(10086);
    for (int i = 0; i < 100; ++i) {
        float pty = rng.uniform(0, img.rows - 1);
        float ptx = rng.uniform(0, img.cols - 1);
        // KeyPoint(关键点的角度,关键点的分类号,特征点来源,关键点坐标,最强关键点响应,关键点邻域直径)
        KeyPoint keyPoint;
        keyPoint.pt.x = ptx;
        keyPoint.pt.y = pty;
        // 将关键点保存到向量中
        key.push_back(keyPoint);
    }
    // drawKeypoints(输入图像,关键点向量,输出图像,关键点颜色,绘制功能选择)
    // 0:DEFAULT                创建输出图像矩阵,将绘制结果存放输出图像,并且绘制圆形表示关键点位置,不表示关键点大小和方向
    // 1:DRAW_OVER_OUTIMG       不创建输出图像矩阵,直接在元素图像中绘制关键点
    // 2:NOT_DRAW_SINGLE_POINTS 不绘制单个关键点
    // 4:DRAW_RICH_KEYPOINTS    在关键点位置绘制圆形,圆形体现关键点的大小和方向
    // 绘制关键点
    drawKeypoints(img, key, img, Scalar(0, 0, 0));
    drawKeypoints(imgG, key, imgG, Scalar(255, 255, 255));
    imshow("彩色图关键点", img);
    imshow("灰度图关键点", imgG);

    waitKey(0);
}
```

### cornerHarris - 计算角点 Harris 评价系数 R

```c++
 #include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", IMREAD_COLOR);
    Mat imgG;
    cvtColor(img, imgG, COLOR_BGR2GRAY);

    // 计算 Harris 评价系数
    Mat harris;
    int blockSize = 2; // 邻域半径
    int apeSize = 3;
    // cornerHarris(输入图像,评价系数矩阵,邻域大小,Sobel算子半径,计算评价系数的权重系数,像素外推法)
    cornerHarris(imgG, harris, blockSize, apeSize, 0.04);

    // 归一化以便于进行数值比较和结果显示
    Mat harrisn;
    normalize(harris, harrisn, 0, 255, NORM_MINMAX);
    convertScaleAbs(harrisn, harrisn);

    // 寻找 Harris 角点
    vector<KeyPoint> key;
    for (int i = 0; i < harrisn.rows; ++i) {
        for (int j = 0; j < harrisn.cols; ++j) {
            int R = harrisn.at<uchar>(i, j);
            if (R > 160) {
                // 保存角点
                KeyPoint keyp;
                keyp.pt.y = i;
                keyp.pt.x = j;
                key.push_back(keyp);
            }
        }
    }
    // 绘制角点
    drawKeypoints(img, key, img);
    imshow("系数矩阵", harrisn);
    imshow("角点图", img);

    waitKey(0);
}
```

### goodFeaturesToTrack - 旋转不变角点检测

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img1 = imread("3.jpg", IMREAD_COLOR), gray;
    cvtColor(img1, gray, COLOR_BGR2GRAY)
    // 提取角点
    int maxC = 100; // 检测角点数目
    double qual = 0.01; // 质量等级
    double minC = 0.04; // 两角点间最小欧氏距离
    vector<Point2f> cor;
    // goodFeaturesToTrack(输入图像,检测角点输出量,寻找的角点数目,角点阈值与最佳角点之间的关系,两角点最小欧氏距离,掩码矩阵,计算梯度协方差矩阵尺寸,算法使用 Harris 角点检测,常值权重系数)
    goodFeaturesToTrack(gray, cor, maxC, qual, minC, Mat(), 3, false);
    // 绘制角点
    vector<KeyPoint> keyP;
    for (int i = 0; i < cor.size(); ++i) {
        KeyPoint key;
        key.pt = cor[i];
        keyP.push_back(key);
    }
    drawKeypoints(img1, keyP, img1);
    imshow("角点结果", img1);

    waitKey(0);
}
```

### goodFeaturesToTrack - 亚像素级别角点检测

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img1 = imread("3.jpg", IMREAD_COLOR), gray;
    cvtColor(img1, gray, COLOR_BGR2GRAY);
    // 提取角点
    int maxC = 100; // 检测角点数目
    double qual = 0.01; // 质量等级
    double minC = 0.04; // 两角点间最小欧氏距离
    vector<Point2f> cor;
    // goodFeaturesToTrack(输入图像,检测角点输出量,寻找的角点数目,角点阈值与最佳角点之间的关系,两角点最小欧氏距离,掩码矩阵,计算梯度协方差矩阵尺寸,算法使用 Harris 角点检测,常值权重系数)
    goodFeaturesToTrack(gray, cor, maxC, qual, minC, Mat(), 3, false);
    // 计算亚像素级别角点坐标
    vector<Point2f> corS = cor;
    Size winSize = Size(5, 5);
    Size zeroZone = Size(-1, -1);
    TermCriteria criteria = TermCriteria(TermCriteria::EPS + TermCriteria::COUNT, 40, 0.001);
    // cornerSubPix(输入图像,角点坐标,搜索窗口尺寸的一半,搜索区域中间"死区"大小的一半,终止角点优化迭代条件)
    cornerSubPix(gray, corS, winSize, zeroZone, criteria);
    for (int i = 0; i < cor.size(); ++i) {
        string str = to_string(i);
        str = "第" + str + "个角点初始坐标";
        cout << str << cor[i] << "\t精细后坐标" << corS[i] << endl;
    }
}
```

# 特征点检测

### ORB::create - ORB 特征点检测

### detect - 计算图像关键点

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img = imread("3.jpg", IMREAD_COLOR);
    // 创建ORB特征点类变量
    // ORB::create(特征点数目,金字塔层级间缩放比例,金字塔图像层数系数,边缘阈值,原图在金字塔中层数,生成描述子时需要的像素点数目,生成描述子时关键点周围邻域尺寸,计算FAST角点时像素值差值的阈值)
    Ptr<ORB> orb = ORB::create(500, 1.2F, 8, 31, 0, 2, ORB::HARRIS_SCORE, 31, 20);
    // 计算ORB关键点
    vector<KeyPoint> key;
    // detect(输入图像,检测到的关键点,计算关键点时的掩码矩阵)
    orb->detect(img, key); // 确认关键点
    // 计算ORB描述子
    Mat imgA;
    img.copyTo(imgA);
    // 绘制不含角度和大小的结果
    drawKeypoints(img, key, img, Scalar(255, 255, 255));
    // 绘制含有角度和大小的结果
    drawKeypoints(img, key, imgA, Scalar(255, 255, 255), DrawMatchesFlags::DRAW_RICH_KEYPOINTS);
    imshow("不含角度和大小的结果", img);
    imshow("含有角度和大小的结果", imgA);
    waitKey(0);
}
```

### detectAndCompute - 计算关键点和描述子

```apl
detectAndCompute(输入图像,计算关键点掩码矩阵,得到的关键点,关键点的描述子,是否使用已有关键点的标识符)
```

### compute - 计算描述子

```apl
compute(输入图像,输入关键点,关键点对应的描述子)
```

### SIFT::create - SIFT 特征点检测

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    //【1】载入图像
    Mat img = imread("3.jpg");

    //【2】定义SIFT中的hessian阈值特征点检测算子
    int minH = 400;
    // SIFT::create(计算特征点的数目,金字塔中每组的层数,过滤较差特征点的阈值,过滤边缘效应的阈值,金字塔0层高斯滤波系数)
    Ptr<SIFT> sif = SIFT::create(minH);
    vector<KeyPoint> key;

    //【3】调用detect函数检测出SIFT特征关键点，保存在vector容器中
    sif->detect(img, key);

    //【4】绘制特征关键点
    Mat img1;
    drawKeypoints(img, key, img1, Scalar(0, 255, 0), DrawMatchesFlags::DEFAULT);

    //【5】显示效果图
    imshow("特征点检测效果图", img1);
    waitKey(0);
}
```

# 特征点匹配

### DMatch - 保存描述子集合

### BFMatcher - 特征点匹配的类

### DescriptorMatcher::match - 计算通知单集合对应描述子

### drawMatches - 显示特征点匹配结果

```java
#include <iostream>

using namespace std;

#include <opencv2/opencv.hpp>

using namespace cv;

void orb(Mat &gray, vector<KeyPoint> &key, Mat &descr) {
    Ptr<ORB> orb = ORB::create(1000, 1.2F);
    orb->detect(gray, key);
    orb->compute(gray, key, descr);
}


int main() {
    //【1】载入图像
    Mat img1 = imread("2.jpg");
    Mat img2 = imread("3.jpg");
    // 提取 ORB 特征点
    vector<KeyPoint> ket1, ket2;
    Mat descr1, descr2;
    // 计算特征点
    orb(img1, ket1, descr1);
    orb(img2, ket2, descr2);
    // 特征点匹配
    // DMatch(两描述子间距离,训练描述子来自的图像索引,查询描述子集合中的索引,训练描述子集合中的索引)
    vector<DMatch> matches; // 定义存放匹配结果的变量
    // BFMatcher(计算两描述子间距离的类型标志,是否进行交叉检测标志)
    // NORM_L1          NORM_L2
    // NORM_HAMMING     NORM_HAMMING2
    BFMatcher matcher(NORM_HAMMING); // 定义特征点匹配的类,使用汉明距离
    // DescriptorMatcher::match(查询描述子集合,训练描述子集合,两集合描述子匹配结果,描述子匹配时的掩码矩阵)
    matcher.match(descr1, descr2, matches); // 进行特征点匹配
    cout << "matches=" << matches.size() << endl; // 匹配成功的特征点数
    // 通过汉明距离筛选匹配结果
    double min_dist = 10000, max_dist = 0;
    for (int i = 0; i < matches.size(); ++i) {
        double dist = matches[i].distance;
        if (dist < min_dist) min_dist = dist;
        if (dist > max_dist) max_dist = dist;
    }
    // 输出所有匹配结果中最大汉明距离和最小汉明距离
    cout << "min" << min_dist << endl;
    cout << "max" << max_dist << endl;
    // 将汉明距离较大的匹配点对删除
    vector<DMatch> good;
    for (int i = 0; i < matches.size(); ++i) {
        if (matches[i].distance <= max(2 * min_dist, 20.0)) {
            good.push_back(matches[i]);
        }
    }
    cout << "good" << good.size() << endl;
    // 绘制结果
    Mat out1, out2;
    // drawMatches(图1,图1关键点,图2,图2关键点,图1关键点与图2关键点匹配关系,显示匹配结果的输出图像,连接线和关键点颜色,没有匹配点的关键点颜色,匹配掩码矩阵,绘制功能选择标志)
    drawMatches(img1, ket1, img2, ket2, matches, out1);
    drawMatches(img1, ket1, img2, ket2, good, out2);
    imshow("未筛选结果", out1);
    imshow("最小汉明距离筛选", out2);

    waitKey(0);
}
```

### DescriptorMatcher::KnnMatch - 一对多的描述子匹配

```apl
KnnMatch(查询描述子集合,训练描述子集合,描述子匹配结果,每个查询描述子在训练描述子集合中寻找的最优匹配结果数目,描述子匹配的掩码矩阵,输出匹配结果数目是否与查询描述子数目相同的选择标志)
```

### FlannBasedMatcher - 快速最近邻搜索库特征点匹配

```c++
#include <iostream>

using namespace std;

#include <opencv2/opencv.hpp>

using namespace cv;

void orb(Mat &gray, vector<KeyPoint> &key, Mat &descr) {
    Ptr<ORB> orb = ORB::create(1000, 1.2F);
    orb->detect(gray, key);
    orb->compute(gray, key, descr);
}


int main() {
    //【1】载入图像
    Mat img1 = imread("2.jpg");
    Mat img2 = imread("3.jpg");
    // 提取 ORB 特征点
    vector<KeyPoint> ket1, ket2;
    Mat descr1, descr2;
    // 计算特征点
    orb(img1, ket1, descr1);
    orb(img2, ket2, descr2);
    // 匹配描述子数据类型
    if ((descr1.type() != CV_32F) && (descr2.type() != CV_32F)) {
        descr1.convertTo(descr1, CV_32F);
        descr2.convertTo(descr2, CV_32F);
    }
    // 特征点匹配
    vector<DMatch> matches; // 定义存放匹配结果的变量
    // FlannBasedMatcher(匹配时需要使用的算法,递归遍历的次数)
    // makePtr<flann::KDTreeIndexParams>()      采用随机 k-d 树寻找匹配点
    // makePtr<flann::KMeansIndexParams>()      采用 k-means 树寻找匹配点
    // makePtr<flann::HierarchicalClusteringIndexParams>()
    // 采用层次聚类树寻找匹配点
    FlannBasedMatcher matcher; // 使用默认
    matcher.match(descr1, descr2, matches);
    cout << "匹配成功特征点数目:" << matches.size() << endl;

    // 寻找距离最大值和最小值
    double min_dist = 100, max_dist = 0;
    for (int i = 0; i < descr1.rows; ++i) {
        double dist = matches[i].distance;
        if (dist < min_dist) min_dist = dist;
        if (dist > max_dist) max_dist = dist;
    }
    cout << "min" << min_dist << endl;
    cout << "max" << max_dist << endl;
    // 将最大值距离的0.4倍作为最优匹配结果进行筛选
    vector<DMatch> good;
    for (int i = 0; i < matches.size(); ++i) {
        if (matches[i].distance < 0.40 * max_dist) {
            good.push_back(matches[i]);
        }
    }
    cout << "good:" << good.size() << endl; // 匹配成功特征点数目
    Mat out1, out2;
    drawMatches(img1, ket1, img2, ket2, matches, out1);
    drawMatches(img1, ket1, img2, ket2, good, out2);
    imshow("未筛选结果", out1);
    imshow("筛选结果", out2);

    waitKey(0);
}
```

### findHomography - RANSAC 优化特征点匹配 

```c++
#include <iostream>

using namespace std;

#include <opencv2/opencv.hpp>

using namespace cv;

void match_min(vector<DMatch> mat, vector<DMatch> &good) {
    double min_dist = 10000, max_dist = 0;
    for (int i = 0; i < mat.size(); ++i) {
        double dist = mat[i].distance;
        if (dist < min_dist) min_dist = dist;
        if (dist > max_dist) max_dist = dist;
    }
    cout << "min:" << min_dist << endl;
    cout << "max:" << max_dist << endl;
    for (int i = 0; i < mat.size(); ++i) {
        if (mat[i].distance <= max(2 * min_dist, 20.0))
            good.push_back(mat[i]);
    }
}

// RANSAC算法实现
void ransac(vector<DMatch> mats, vector<KeyPoint> quer, vector<KeyPoint> train, vector<DMatch> &mater) {
    // 定义保存匹配点坐标
    vector<Point2f> srcPoin(mats.size()), dstPoin(mats.size());
    // 保存从关键点中提取到的匹配点对坐标
    for (int i = 0; i < mats.size(); ++i) {
        srcPoin[i] = quer[mats[i].queryIdx].pt;
        dstPoin[i] = train[mats[i].trainIdx].pt;
    }
    // 匹配点对进行 RANSAC 过滤
    vector<int> inlimask(srcPoin.size());
    // findHomography(原图特征点坐标,目标图特征点坐标,计算单应矩阵方法,重投影的最大误差,掩码矩阵,RANSAC算法迭代次数,置信区间)
    // 计算单应矩阵:
    // 0       使用最小二乘方式计算单应矩阵
    // RANSAC      使用RANSAC方法计算单应矩阵
    // LMEDS       使用最小中值方法计算单应矩阵
    // RHO         使用PROSAC方法计算单应矩阵
    findHomography(srcPoin, dstPoin, RANSAC, 5, inlimask);
    // 手动保留 RANSAC 过滤后的匹配点对
    for (int i = 0; i < inlimask.size(); ++i) {
        if (inlimask[i]) {
            mater.push_back(mats[i]);
        }
    }
}

void orb_feat(Mat &gray, vector<KeyPoint> &keyP, Mat &descr) {
    Ptr<ORB> orb = ORB::create(1000, 1.2F);
    orb->detect(gray, keyP);
    orb->compute(gray, keyP, descr);
}

int main() {
    // 载入图像
    Mat img1 = imread("2.jpg");
    Mat img2 = imread("3.jpg");
    // 提取 ORB 特征点
    vector<KeyPoint> ket1, ket2;
    Mat descr1, descr2;
    // 基于区域分割的ORB特征点提取
    orb_feat(img1, ket1, descr1);
    orb_feat(img2, ket2, descr2);
    // 特征点匹配
    vector<DMatch> matches, good_min, good_rans;
    BFMatcher matcher(NORM_HAMMING);
    matcher.match(descr1, descr2, matches);
    cout << "matches:" << matches.size() << endl;
    // 最小汉明距离
    match_min(matches, good_min);
    cout << "good_min:" << good_min.size() << endl;
    // 用 RANSAC 算法筛选匹配结果
    ransac(good_min, ket1, ket2, good_rans);
    cout << "good_rans:" << good_rans.size() << endl;

    Mat out1, out2, out3;
    drawMatches(img1, ket1, img2, ket2, matches, out1);
    drawMatches(img1, ket1, img2, ket2, good_min, out2);
    drawMatches(img1, ket1, img2, ket2, good_rans, out3);
    imshow("未筛选结果", out1);
    imshow("最小汉明距离筛选结果", out2);
    imshow("RANSAC筛选", out3);

    waitKey(0);
}
```

# 单目视觉

### convertPointsToHomogeneous - 非齐次坐标转换为齐次坐标

### convertPointsFromHomogeneous - 齐次坐标转换为非齐次坐标

```c++
#include <iostream>

using namespace std;

#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    // 设置二个三维坐标
    vector<Point3f> poi3;
    poi3.push_back(Point3f(3, 6.1, 1.5));
    poi3.push_back(Point3f(23, 32, 1));
    // 非齐次坐标转换齐次坐标
    Mat poi4;
    // (非齐次坐标,齐次坐标)
    convertPointsToHomogeneous(poi3, poi4);
    // 齐次坐标转非齐次坐标
    vector<Point2f> poi2;
    // (齐次坐标,非齐次坐标)
    convertPointsFromHomogeneous(poi3, poi2);
    cout << "__________非齐次坐标转换齐次坐标__________" << endl;
    for (int i = 0; i < poi3.size(); ++i) {
        cout << "齐次:" << poi3[i];
        cout << "\t非齐次:" << poi2 << endl;
    }
    cout << "__________齐次坐标转非齐次坐标__________" << endl;
    for (int i = 0; i < poi3.size(); ++i) {
        cout << "非齐次:" << poi3[i];
        cout << "\t齐次:" << poi4.at<Vec4f>(i, 0) << endl;
    }

    waitKey(0);
}
```

### findChessboardCorners - 标定板提出内角点

### find4QuadCornerSubpix - 提高标定板内角点坐标精度

### findCirclesGrid - 检测标定板圆心坐标

### drawChessboardCorners - 标定板绘制角点位置

```c++
#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img1 = imread("img1.png");
    Mat img2 = imread("img2.png");
    Mat gray1, gray2;
    cvtColor(img1, gray1, COLOR_BGR2GRAY);
    cvtColor(img2, gray2, COLOR_BGR2GRAY);
    // 定义数目
    Size boars1 = Size(19, 15);
    Size boars2 = Size(7, 7);
    // 检测角点
    vector<Point2f> img1poi, img2poi;
    // findChessboardCorners(方棋盘标定图像,图像中内角点行数和列数,检测到的坐标,检测内角点的方法)
    // 1:CALIB_CB_ADAPTIVE_THRESH        使用自适应阈值将图像转为二值图像
    // 2:CALIB_CB_NORMALIZE_IMAGE        在应用固定阈值或自适应阈值之前,进行图像均衡化
    // 4:CALIB_CB_FILTER_QUADS           使用其他条件(如轮廓区域,周长,方形形状)来过滤掉在轮廓检索阶段提取的假四边形
    // 8:CALIB_CB_FAST_CHECK             用快速方法查找图像中的角点
    bool b1 = findChessboardCorners(gray1, boars1, img1poi); // 计算方格标定板角点坐标
    // findCirclesGrid(圆形标定图像,图像中圆形行数和列数,输出圆心的坐标,检测圆心的方法)
    // 1:CALIB_CB_SYMMETRIC_GRID         使用圆的对称模式
    // 2:CALIB_CB_ASYMMETRIC_GRID        使用不对称的圆形图像
    // 3:CALIB_CB_CLUSTERING             使用特殊算法进行网格检测,它对透视扭曲更加稳健,但对背景杂乱更加敏感
    bool b2 = findCirclesGrid(gray2, boars2, img2poi); // 计算圆形标定板角点坐标
    // 细化角点坐标
    // find4QuadCornerSubpix(计算的图像,点坐标,优化坐标时考虑的邻域范围)
    find4QuadCornerSubpix(gray1, img1poi, Size(5, 5));
    find4QuadCornerSubpix(gray2, img2poi, Size(3, 3));
    // // 绘制角点检测结果
    // drawChessboardCorners(绘制点的目标图像,标定板行列的数目,检测到的坐标数组,绘制点的样式)
    drawChessboardCorners(img1, boars1, img1poi, true);
    drawChessboardCorners(img2, boars2, img2poi, true);
    imshow("方格标定板角点坐标", img1);
    imshow("圆形标定板角点坐标", img2);

    waitKey(0);
}
```

### calibrateCamera - 计算相机内参矩阵和相机的畸变系数矩阵

```c++
#include <iostream>

using namespace std;

#include <opencv2/opencv.hpp>

using namespace cv;

int main() {
    Mat img1 = imread("img1.png");
    Mat img2 = imread("img1.png");
    vector<Mat> img;
    img.push_back(img1);
    img.push_back(img2);
    // 定义数目
    Size boars1 = Size(19, 15);
    vector<vector<Point2f>> imgs;
    for (int i = 0; i < img.size(); ++i) {
        Mat imgs1 = img[i];
        Mat gray;
        cvtColor(img1, gray, COLOR_BGR2GRAY);
        vector<Point2f> imgpoi;
        findChessboardCorners(gray, boars1, imgpoi); // 计算方格标定板角点
        find4QuadCornerSubpix(gray, imgpoi, Size(5, 5)); // 细化方格标定板角点坐标
        imgs.push_back(imgpoi);
    }
    Size qsua = Size(10, 10); // 棋盘个每个方格的真实尺寸
    vector<vector<Point3f>> obj;
    for (int i = 0; i < imgs.size(); ++i) {
        vector<Point3f> temp;
        for (int j = 0; j < boars1.height; ++j) {
            for (int k = 0; k < boars1.width; ++k) {
                Point3f real;
                real.x = j * qsua.width;
                real.y = k * qsua.height;
                real.z = 0;
                temp.push_back(real);
            }
        }
        obj.push_back(temp);
    }
    // 初始化每个图像的角点数量,假定图像中能看见完整的标定板
    vector<int> point;
    for (int i = 0; i < imgs.size(); ++i) {
        point.push_back(boars1.width * boars1.height);
    }
    // 图像尺寸
    Size imges;
    imges.width = img[0].cols;
    imges.height = img[0].rows;
    Mat camer = Mat(3, 3, CV_32FC1, Scalar::all(0)); // 相机内参矩阵
    // 相机畸变系数
    Mat dist = Mat(1, 5, CV_32FC1, Scalar::all(0));
    vector<Mat> rvrcs; // 图像的旋转向量
    vector<Mat> tvecs; // 图像的平移向量
    // calibrateCamera(棋盘内角点的三维坐标,棋盘内角点的二维坐标,图像的像素尺寸大小,相机的内参矩阵,相机的畸变系数,相机坐标系与世界坐标系间旋转向量,相机坐标系与世界坐标系间平移向量,标定算法,迭代终止条件)
    // 0x00001:CALIB_USE_INTRINSIC_GUESS       需要内参矩阵初值,否则图像中心置为初值,并利用最小二乘的方式计算焦距
    // 0x00004:CALIB_FIX_PRINCIPAL_POINT       进行优化时,固定光轴在图像中的投影点
    // 0x00002:CALIB_FIX_ASPECT_RATIO          将Fx/Fy作为定值,将Fy作为自由参数进行计算
    // 0x00008:CALIB_ZERO_TANGENT_DIST         忽略切向畸变,将切向畸变系数置为0
    //        :CALIB_FIX_K1                    最后一位(1-6),表示对应的径向畸变系数不变
    // 0x04000:CALIB_RATIONAL_MODEL            用六阶径向畸变修正公式,否则用三阶
    calibrateCamera(obj, imgs, imges, camer, dist, rvrcs, tvecs, 0);
    cout << "相机的内参矩阵:" << camer << endl;
    cout << "相机畸变系数:" << dist << endl;

    waitKey(0);
}
```

### initUndistortRectifyMap - 计算校正图像映射矩阵

### remap - 去除图像中的矩阵

### undistort - 直接校正图像

```c++
#include <iostream>

using namespace std;

#include <opencv2/opencv.hpp>

using namespace cv;

// (所有原图的向量,计算得到的相机内参,计算得到的相机畸变系数,图像的尺寸,校正后的图像)
void init(vector<Mat> imgs, Mat camer, Mat dist, Size imgssize, vector<Mat> &undist) {
    // 计算坐标校正映射矩阵
    Mat R = Mat::eye(3, 3, CV_32F);
    Mat mapx = Mat(imgssize, CV_32FC1);
    Mat mapy = Mat(imgssize, CV_32FC1);
    // initUndistortRectifyMap(相机内参矩阵,相机畸变系数矩阵,图像对应的相机位置间旋转矩阵,校正后的相机内参矩阵,图像尺寸,输出1映射矩阵数据类型,输出1x坐标校正映射矩阵,输出2y坐标校正映射矩阵)
    initUndistortRectifyMap(camer, dist, R, camer, imgssize, CV_32FC1, mapx, mapy);
    // 校正图像1
    for (int i = 0; i < imgs.size(); ++i) {
        Mat undi;
        // remap(畸变图像,去畸变图像,x坐标校正映射矩阵,y坐标校正映射矩阵,插值类型,像素外推法,用常值外推法时的常数数值)
        remap(imgs[i], undi, mapx, mapy, INTER_LINEAR);
        undist.push_back(undi);
    }
}

// 使用undistorr直接计算校正图像
void undist(vector<Mat> imgs, Mat camer, Mat dist, vector<Mat> &undist) {
    for (int i = 0; i < imgs.size(); ++i) {
        Mat und;
        // undistort(畸变图像,去畸变图像,相机内参矩阵,相机畸变系数矩阵,畸变图像的相机内参矩阵)
        undistort(imgs[i], und, camer, dist);
        undist.push_back(und);
    }
}

int main() {
    Mat img1 = imread("img1.png");
    Mat img2 = imread("img1.png");
    vector<Mat> imgs;
    imgs.push_back(img1);
    imgs.push_back(img2);
    Mat camer = (Mat_<float>(3, 3)
            << 3981.329280868089, 0, 243.1152290010379, 0, 3986.785032579462, 197.869054658536, 0, 0, 1);
    Mat dist = (Mat_<float>(1, 5)
            << -0.7908542799275837, 105.1981059140969, -0.009653477077060661, 0.02360632300397547, 0.5428028632200186);
    vector<Mat> undistimgs;
    Size imgsize;
    imgsize.width = imgs[0].cols;
    imgsize.height = imgs[0].rows;
    // 组合校正图像
    init(imgs, camer, dist, imgsize, undistimgs);
    // 使用undistort直接计算校正图像
    // undist(imgs, camer, dist, undistimgs);
    for (int i = 0; i < imgs.size(); ++i) {
        string wind = to_string(i);
        imshow("未校正图像" + wind, imgs[i]);
        imshow("校正图像" + wind, undistimgs[i]);
    }
    waitKey(0);
}
```

















  
