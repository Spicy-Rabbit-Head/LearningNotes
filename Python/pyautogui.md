# pyautogui

+ 坐标系
  以屏幕左上角为原点，X轴正方向向右，Y轴正方向向下
+ 函数

```python
import pyautogui
import cv2
# 获取屏幕分辨率
a = pyautogui.size()    # size()
print(a)

# 获取鼠标当前位置
b = pyautogui.position()    # position（）
print(b)

# 检查XY坐标是否在屏幕
c = pyautogui.onScreen(2311,2311)   # onScreen（x,y）
print(c)

# 鼠标运动——绝对位置
pyautogui.moveTo(1900,900,duration=1)    # moveTo(x,y,时间)
# duration鼠标运动时间

# 鼠标运动——相对位置
pyautogui.move(0,100,duration=1)    # move(x,y,时间)

# 鼠标拖动——绝对位置
pyautogui.dragTo(2240,1000,duration=1,button='left')    # dragTo(x,y,时间,键)    left左   right右
# button键选择

# 鼠标拖动——相对位置
pyautogui.dragTo(-200,-300,duration=1,button='left')    # dragTo(x,y,时间,键)    left左   right右

# 鼠标点击
pyautogui.click(116,458,duration=2,button='left',clicks=2,interval=0.5)    # click(x,y,时间,键,次数,间隔)
# clicks点击次数    # interval点击间隔时间

# 鼠标双击
pyautogui.doubleClick(100,100,button='left')    # doubleClick(x,y,键)

# 鼠标三击
pyautogui.tripleClick(100,100,button='leif')    # tripleClick(x,y,键)

# 鼠标按压
pyautogui.moveTo(2100,700)
pyautogui.mouseDown(button='left')    # mouseDown(鼠标下压)
pyautogui.move(200,200,duration=1)
pyautogui.mouseUp(button='left')    # mouseUp(鼠标上升)

# 鼠标滚动
pyautogui.scroll(200)    # scroll(滚动数)
pyautogui.scroll(-200)

# 键盘输入
pyautogui.write()    # write(字符串,字符输入间隔)

# 键盘按压
pyautogui.press()    # press(需要按下的键)
pyautogui.hotkey()    # hotkey()按顺序按下键

# 截图
pyautogui.screenshot('截屏.png',region=(0,0,1000,1000))    # screenshot(格式,区域)
                            # region=(起始区域，接收位置）

# 搜索图像
a = pyautogui.locateOnScreen('hsz.png',confidence=0.5)    # 图形位置
print(a)

# 图像中心点
a = pyautogui.center()    # center(变量)

# 点击图标
pyautogui.click('hsz.png',clicks=2)

# 灰度匹配
a = pyautogui.locateOnScreen('hsz.png',grayscale=True,confidence=0.5)
print(a)
# grayscale灰度匹配ON

# 像素获取
a.getpixel(100,100)

# 像素检测
pyautogui.pixelMatchesColor(100,200,(255,255,255),tolerance=10)
# tolerance像素波动范围
```



