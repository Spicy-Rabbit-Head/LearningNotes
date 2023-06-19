# string 容器

### string 构造

````c++
#include <iostream>

using namespace std;

int main() {
    // 默认构造
    string s1;
    s1 = "Hello";
    cout << s1 << endl;
    // 使用C字符串构造
    const char *str = "World";
    string s2(str);
    cout << s2 << endl;
    // 拷贝构造
    string s3(s2);
    cout << s3 << endl;
    // N 个字符 构造
    string s4(10, '6');
    cout << s4 << endl;
}
````

### string 赋值

```c++
#include <iostream>

using namespace std;

int main() {
    string s;
    // 赋值运算符
    s = "Hello";
    cout << s << endl;
    // 字符赋值
    s = 'A';
    cout << s << endl;
    // assign 赋值
    s.assign("Hello World");
    cout << s << endl;
    // assign 按量赋值
    s.assign("Hello World", 5);
    cout << s << endl;
    s.assign(10, 'W');
    cout << s << endl;
}
```

### string 拼接

```c++
#include <iostream>

using namespace std;

int main() {
    string str = "我";
    // 重载 += 字符串
    str += "爱";
    cout << str << endl;
    // 重载 += 字符
    str += ':';
    cout << str << endl;
    // append
    str.append(" Python ");
    cout << str << endl;
    // append 按量添加
    str.append(" 和 xxxxx", 5);
    cout << str << endl;
}
```

