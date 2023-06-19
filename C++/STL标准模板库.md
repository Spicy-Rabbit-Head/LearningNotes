# STL

```apl
STL分为容器,算法,迭代器,仿函数,适配器(配接器),空间配置器
```

```apl
容器:各种数据结构,用于存放数据
算法:各种常用的算法
迭代器:扮演容器与算法之间的胶合剂
仿函数:行为类似函数，可作为算法的某种策略
适配器:一种用来修饰容器或者仿函数或迭代器接口的东西
空间配置器:负责空间的配置与管理
```













# vector 数组容器

```c++
#include <iostream>
// 导入
#include <vector>

using namespace std;

void Print(int x) {
    cout << x << endl;
}


int main() {
    // 定义 int 数组
    vector<int> v;
    // 插入
    v.push_back(10);
    v.push_back(20);
    v.push_back(30);
    v.push_back(40);
    // 迭代器访问
    // 起始迭代器 指向容器第一个元素
    vector<int>::iterator itB = v.begin();
    // 结束迭代器 指向容器中的最后一个元素的下一个位置
    vector<int>::iterator itE = v.end();
    // 遍历
    while (itB != itE) {
        cout << *itB << endl;
        itB++;
    }
    // 遍历
    for (vector<int>::iterator it = v.begin(); it != v.end(); it++) {
        cout << *it << endl;
    }
    // 遍历
    for_each(v.begin(), v.end(), Print);
}
```



















# 算法

### 质变算法





### 非质变算法







# 迭代器

