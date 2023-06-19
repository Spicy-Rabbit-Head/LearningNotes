# 写操作	

```c++
#include <iostream>
// 导入输入输出流
#include <fstream>

using namespace std;

void test ( ) {
    // 创建流对象
    ofstream ofs;
    // 指定打开方式
    ofs.open("text.txt" , ios::out);
    // 写入
    ofs << "张三" << endl;
    ofs << "男" << endl;
    // 关闭文件
    ofs.close( );

}

int main ( ) {
    test( );
}
```

# 读文件

```c++
#include <iostream>
// 导入输入输出流
#include <fstream>

using namespace std;

void test ( ) {
    // 创建流对象
    ifstream ifs;
    // 指定打开方式
    ifs.open("text.txt" , ios::in);
    // 判断文件状态
    if (!ifs.is_open( )) {
        cout << "文件打开失败" << endl;
        return;
    }
    // 第一种读
    char bu[1024] = {0};
    while (ifs >> bu) {
        cout << bu << endl;
    }
    // 第二种读
    char buf[1024] = {0};
    while (ifs.getline(buf , sizeof(buf))) {
        cout << buf << endl;
    }
    // 第三种读
    string str;
    while (getline(ifs , str)) {
        cout << str << endl;
    }
    // 第四种读
    char c;
    while ((c = ifs.get( )) != EOF) {
        cout << c;
    }

    // 关闭文件
    ifs.close( );

}

int main ( ) {
    test( );
}
```

# 二进制写

```c++
#include <iostream>
// 导入输入输出流
#include <fstream>

using namespace std;

class P {
public:
    char Name[64];
    int Age;
};

void text ( ) {
    // 创建流对象并以二进制模式打开文件
    ofstream ofs("te.txt" , ios::out | ios::binary);
    // 写文件
    P p = {"小白" , 19};
    ofs.write((const char *) &p , sizeof(p));
    // 关闭文件
    ofs.close( );

}

int main ( ) {
    text( );
}
```

# 二进制读

```c++
#include <iostream>
// 导入输入输出流
#include <fstream>

using namespace std;

class P {
public:
    char Name[64];
    int Age;
};

void text ( ) {
    // 创建流对象并以二进制模式打开文件
    ifstream ifs("te.txt" , ios::in | ios::binary);
    // 判断文件打开状态
    if (!ifs.is_open( )) {
        cout << "文件打开失败" << endl;
        return;
    }
    // 读文件
    P p;
    ifs.read((char *) &p , sizeof(P));
    cout << p.Name << endl;
    cout << p.Age << endl;
    // 关闭文件
    ifs.close( );
}

int main ( ) {
    text( );
}
```

