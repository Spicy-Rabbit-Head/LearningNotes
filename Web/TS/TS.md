# TypeScript 

### 基础类型

```tsx
// any 任意类型
let a: any = 'Hello';
console.log(a);

// number 数字类型
let b1: number = 1;
let b2: number = 0b1111;
let b3: number = 0o10;
let b4: number = 0x10;
console.log(b1);
console.log(b2);
console.log(b3);
console.log(b4);

// string 字符串类型
let c: string = '1';
console.log(c);

// boolean 布尔类型
let d: boolean = true;
console.log(d);

// undefined 未定义类型
let e: undefined = undefined;
console.log(e);

// null 空类型
let f: null = null;
console.log(f);

// void 空类型
let g: void = undefined;
console.log(g);

// unknown 未知类型
// 只能赋值给any类型和unknown类型
let m: unknown = '1';
console.log(m);
```

### 接口和对象类型

```tsx
// 接口重名重合
interface Asset {
    // 定义对象属性类型
    name: string;
}
// 重名重合
interface Asset {
    age: number;
}

let a: Asset = {
    name: '小白',
    age: 18
}
console.log(a)
```

```tsx
// 接口任意key
interface Asset {
    // 明确key必须有
    name: string; 
    // 索引签名
    [propName: string]: any;
}

let a: Asset = {
    name: '小白',
    age: 18,
    address: '北京'
}
console.log(a)
```

```tsx
// 接口可选操作符
interface Asset {
    name: string;
    // 可选操作符
    age?: number;
}

let a: Asset = {
    name: '小白'
    // 非必须
}
console.log(a)
```

```tsx
// 接口readonly
interface Asset {
    name: string;
    // 只读属性
    readonly age: number;
}

let a: Asset = {
    name: '小白',
    age: 18
}
console.log(a)
```

```tsx
// 接口继承
interface Asset {
    name: string;
    age: number;
}

// 继承
interface B extends Asset {
    address: string;
}

let a: B = {
    name: '小白',
    age: 18,
    address: '北京'
}
console.log(a)
```

```tsx
// 接口定义函数类型
interface fn {
    (a: number, b: number): number
}

const fn: fn = function (a: number, b: number) {
    return a + b
}

console.log(fn(1, 2))
```

### 数组类型

```tsx
// 数组
let i: number[] = [1, 2, 3];
console.log(i);

// 泛型数组
let j: Array<number> = [1, 2, 3];
console.log(j);

// 接口定义对象数组
interface X {
    name: string;
}

let arr: X[] = [{name: 'a'}, {name: 'b'}];
console.log(arr);

// 多维数组
let arr2: number[][] = [[1, 2], [3, 4]];
console.log(arr2);

let arr3: any[] = [1, 'a', {name: 'a'}];
console.log(arr3);
```

### 元组类型

```tsx
// 元组
// 各元素的类型不必相同，对应位置的类型需要相同
let k: [string, number] = ['1', 1];
console.log(k);
```

### 函数类型

```tsx
// 函数
function add(a: number, b: number): number {
    return a + b
}

console.log(add(1, 2))

// 对象传参
interface IAdd {
    name: string
    age: number
}

function add2(user: IAdd): IAdd {
    return user
}

console.log(add2({name: 'zhangsan', age: 18}))

// 函数重载
let user: number[] = [1, 2, 3, 4, 5]

// 传入id单个查询
function find(id: number): number[]
// 传入数组添加
function find(add: number[]): number[]
// 无形参查询全部
function find(): number[]
// 实现
function find(ids?: number | number[]): number[] {
    if (typeof ids == 'number') {
        return user.filter(item => item == ids)
    } else if (Array.isArray(ids)) {
        user.push(...ids)
        return user
    } else {
        return user
    }
}

console.log(find())
console.log(find(2))
console.log(find([6, 7, 8]))
```

### 枚举类型

```tsx
// 数字枚举
enum Color {
    Red,
    Green,
    Blue
}

let l: Color = Color.Red;
console.log(l);
console.log(Color);

// 字符串枚举
enum Sex {
    male = '男',
    girl = '女'
}

console.log(Sex)

// 异构枚举
enum Answer {
    yes = 1,
    no = 'no'
}

console.log(Answer)

// 反向映射
enum Color1 {
    Red,
    Green,
}

console.log(Color1[0])
```

### never类型

```tsx
// never 永远不会类型
type A = string & number;

function xm(): never {
    throw new Error('error');
}

xm()
```

### symbol类型

```tsx
// symbol 唯一
let a1: symbol = Symbol('a');
console.log(a1);

// 反射键
let b1: symbol = Symbol('a');
let b2: symbol = Symbol('a');
let obj = {
    name: 'jack',
    [b1]: 'hello',
    [b2]: 'world',
}
// for in 无法遍历symbol
// Object.keys() 无法遍历symbol
// Object.getOwnPropertyNames() 无法遍历symbol
// Object.getOwnPropertySymbols() 可以遍历symbol,但是无法遍历普通键
// 取键
console.log(Reflect.ownKeys(obj));
```

### 类型断言 | 联合类型 | 交叉类型

```tsx
// 联合类型
let a: number | string = 1234567890;
console.log(a)
a = '1-1-1-1'
console.log(a)

// 类型断言
let fn = function (type: number): boolean {
    return !!type
}
console.log(fn(0))

let f = function (num: number | string): void {
    console.log((num as string).length)
}
f('1234567890')


// 交叉类型
interface People {
    name: string
    age: number
}

interface Man {
    sex: string
}

const tom = (man: People & Man): void => {
    console.log(man)
}
tom({
    name: 'tom',
    age: 18,
    sex: '男'
})
```

### 内置对象

```tsx
// ECMAScript 的内置对象
let number: Number = new Number(123);
console.log(number);
let date: Date = new Date();
console.log(date);

// DOM的内置对象
let div = document.querySelector('div');

// BOM的内置对象
let local: Storage = window.localStorage;
let lo: Location = window.location;
```

### Class类

```tsx
// 使用接口约束类
interface vuecls {
    name: string;
    init(): void;
}

// class创建
class vue implements vuecls {
    name: string;

    // 构造方法
    constructor(name: string) {
        this.name = name;
    }

    // 被接口约束,必须实现接口中的方法
    init(): void {
        console.log(this.name);
    }
}

// 实例化
let v = new vue('Hello Vue');
v.init();
```

```tsx
// get set
class style {
    color: string;

    constructor() {
        this.color = 'red';
    }

    set setcolor(color: string) {
        this.color = color;
    }

    get getcolor() {
        return this.color;
    }
}

const style1 = new style();
style1.color = 'blue';
console.log(style1.getcolor);
```

```tsx
// 类的修饰符
// public: 公共的,默认的
// private: 私有的,只能在类内部使用
// protected: 受保护的,只能在类内部和子类中使用
// readonly: 只读的,不能修改
```

```tsx
// 简单的虚拟DOM
// 类型声明
interface VNodeNames {
    tag: string

    text?: string

    children?: VNodeNames[]
}

// 虚拟DOM
class Dom {
    // 根节点
    createElement(el: string) {
        return document.createElement(el)
    }

    // 填充文本
    setText(el: HTMLElement, text: string) {
        el.textContent = text
    }

    // 渲染函数(深度优先)
    render(data: VNodeNames) {
        // 创建根节点
        let root = this.createElement(data.tag)
        // 渲染子节点
        if (data.children && Array.isArray(data.children)) {
            data.children.forEach((item) => {
                let child = this.render(item)
                root.appendChild(child)
            })
        } else {
            if (data.text != null) {
                this.setText(root, data.text)
            }
        }
        return root
    }
}

// 测试
let data: VNodeNames = {
    tag: 'div',
    children: [
        {
            tag: 'p',
            text: 'hello'

        },
        {
            tag: 'p',
            text: 'world'
        }
    ]
}
// 挂载到#app
let dom = new Dom()
let root = dom.render(data)
let app = document.querySelector('#app') || document.body
app.appendChild(root)
```

```tsx
// super 调用父类的构造函数
class Animal {
    name: string;
    constructor(name: string) {
        this.name = name;
    }
    move(distance: number = 0) {
        console.log(`${this.name} moved ${distance}m`);
    }
}

class Snake extends Animal {
    constructor(name: string) {
        super(name);
    }
    move(distance: number = 5) {
        console.log('Slithering...');
        super.move(distance);
    }
}

// 测试
let sam = new Snake('Sammy the Python');
sam.move();
```

```tsx
// 静态方法
class Person {
    static sayHello() {
        console.log('hello');
    }
}

Person.sayHello();
```

### 抽象类

```tsx
// 抽象类
abstract class vue {
    name: string;
    constructor(name: string) {
        this.name = name;
    }
    // 抽象方法
    abstract print(): void;
}
// 抽象类不能被实例化，只能被继承，抽象类中的抽象方法必须在子类中实现。
// 继承抽象类
class redas extends vue {
    print(): void {
        console.log(this.name);
    }
}

let red = new redas('小白');
red.print();
```

### 类型推导 & 类型别名

```tsx
// 自动类型推导
let a = 1;
console.log(typeof a)
// 类型别名
type S = string;
let str: S = 'string';
console.log(str);
```

### 生成器 & 迭代器

```tsx
// 生成器
function* gen() {
    // 同步异步都可以
    yield '小白';
    yield '小黑';
    yield Promise.resolve('小红');
}

const g = gen();
console.log(g.next());
console.log(g.next());
console.log(g.next());
console.log(g.next());

// 迭代器
const each = (value: any) => {
    let i: any = value[Symbol.iterator]();
    let next: any = {done: false};
    while (!next.done) {
        next = i.next();
        if (!next.done) {
            console.log(next.value);
        }
    }
}

each(['小白', '小黑', '小红']);

// 迭代器语法糖
let set: Set<string> = new Set(['小白1', '小黑2', '小红3']);
for (let value of set) {
    console.log(value);
}
```

### 泛型

```tsx
// 泛型即动态类型
function fn<T>(a: T, b: T): Array<T> {
    return [a, b];
}

console.log(fn(1, 2));
console.log(fn('a', 'b'));

// 泛型约束
type A<T> = string | T;
let a: A<number> = 1;
a = 'a';

function f<T extends number>(a: T, b: T) {
    return a + b;
}
console.log(f(1, 2));
```

### TS 配置

```json
{
  "compilerOptions": {
    /* 项目 */
    // 启用增量编译
    "incremental": true,
    // 增量编译文件的存储位置
    // "tsBuildInfoFile": "./.tsbuildinfo",
    // 在引用复合项目时禁用首选源文件而不是声明文件
    // "disableSourceOfProjectReferenceRedirect": true,
    // 在编辑时,从多项目参考检查中选择一个项目
    // "disableSolutionSearching": true,
    // 减少TypeScript自动加载的项目数量
    // "disableReferencedProjectLoad": true,
    // 打印诊断信息
    // "diagnostics": true,

    // 语言与环境
    // 目标语言的版本
    "target": "ES2020",
    // TS 需要引入的库,即声明文件
    "lib": [
      "ES2020"
    ],
    // jsx解析器
    "jsx": "preserve",
    "experimentalDecorators": true,
    //
    "emitDecoratorMetadata": true,
    // jsx语法解析器
    "jsxFactory": "React.createElement",
    // 指定用于片段的JSX片段引用
    // "jsxFragmentFactory": "",
    // 指定用于导入JSX工厂函数的模块说明符
    // "jsxImportSource": "",
    // 指定为“createElement”调用的对象
    // "reactNamespace": "",
    // 禁用包含任何库文件
    // "noLib": true,
    // 发出符合ecmascript标准的类字段
    // "useDefineForClassFields": true,
    // 控制用来检测模块格式JS文件的方法
    // "moduleDetection": "auto",


    // 模块
    // 生成代码的模版标准
    "module": "ESNext",
    // 模块解析策略
    "moduleResolution": "node",
    // 解析非相对模块名的基准目录
    // "baseUrl": "./",
    // 路径映射,相对于baseUrl
    "paths": {},
    // 指定输出文件目录(用于输出),用于控制输出目录结构
    // "rootDirs": [],
    // 声明文件的路径
    // "typeRoots": [],
    // 加载的声明文件包
    // "types": [],
    // 允许从模块访问UMD全局变量
    // "allowUmdGlobalAccess": true,
    // 解析模块时要搜索的文件名后缀列表
    "moduleSuffixes": [],
    // 启用导入.json文件
    // "resolveJsonModule": true,
    // 禁止使用 import、require 或 <reference> 来扩展TypeScript应该添加到项目中的文件数量
    // "noResolve": true,

    // JavaScript支持
    // 允许编译器编译JS,JSX文件
    // "allowJs": true,
    // 允许在JS文件中报错
    // "checkJs": true,
    // 指定用于检查来自'node_modules'的JavaScript文件的最大文件夹深度
    // "maxNodeModuleJsDepth": 1,


    // 发行
    // 生成声明文件,即.d.ts文件
    "declaration": true,
    // 为声明文件生成map文件
    // "declarationMap": true,
    // 只生成声明文件,不生成js文件
    "emitDeclarationOnly": false,
    // 生成目标文件的映射文件
    "sourceMap": false,
    // 将源映射与源文件一起写入单独的文件中
    // "outFile": "./",
    // 指定所有输出文件的目录
    // "outDir": "./",
    // 删除所有的注释
    "removeComments": false,
    // 不输出文件,只做类型检查
    // "noEmit": true,
    // 允许每个项目一次从tslib导入辅助函数，而不是每个文件包含它们
    // "importHelpers": true,
    // 为仅用于类型的导入指定发出/检查行为
    // "importsNotUsedAsValues": "remove",
    // 降级遍历器实现
    "downlevelIteration": false,
    // 为调试器指定查找参考源代码的根路径
    // "sourceRoot": "",
    // 指定调试器应该定位映射文件的位置,而不是生成的位置
    // "mapRoot": "",
    // 生成目标文件的映射文件
    // "inlineSourceMap": true,
    // 在发出的JavaScript中的源映射中包含源代码
    // "inlineSources": true,
    // 在输出文件的开头发出UTF-8字节顺序标记(BOM)
    // "emitBOM": true,
    // 设置输出文件的换行符
    // "newLine": "crlf",
    // 禁止在JSDoc注释中发出带有“@internal”的声明
    // "stripInternal": true,
    // 在编译后的输出中禁用生成自定义助手函数，如'__extends'
    // "noEmitHelpers": true,
    // 发生错误时不生成文件
    // "noEmitOnError": true,
    // 禁用在生成的代码中擦除'const enum'声明
    // "preserveConstEnums": true,
    // 指定声明文件的输出目录
    "declarationDir": "./types",
    // 在JavaScript输出中保留未使用的导入值，否则这些值将被删除
    // "preserveValueImports": true,

    // 互操作的约束
    // 确保每个文件都可以安全地转译，而不依赖于其他导入
    // "isolatedModules": true,
    // 当模块没有默认导出时，允许 import x from y
    // "allowSyntheticDefaultImports": true,
    // 更改编译器行为,由帮助程序函数修复
    "esModuleInterop": true,
    // 禁用解析符号链接到它们的真实路径
    // "preserveSymlinks": true,
    // 强制使用文件名中的一致大小写
    "forceConsistentCasingInFileNames": true,
    // 类型检查
    // 启用所有严格的类型检查选项
    "strict": true,
    // 不允许隐式的any类型
    "noImplicitAny": true,
    // 不允许把null,undefined赋值给任意类型
    "strictNullChecks": true,
    // 不允许函数参数的双向协变
    "strictFunctionTypes": true,
    // 严格的bind,call,apply检查
    "strictBindCallApply": true,
    // 类的实例属性必须初始化
    "strictPropertyInitialization": false,
    // 不允许this有隐式的any类型
    "noImplicitThis": true,
    // 默认catch子句变量为 unknown 而不是 any
    // "useUnknownInCatchVariables": true,
    // 在代码中注入严格模式头信息
    "alwaysStrict": true,
    // 检查只声明未使用的局部变量
    "noUnusedLocals": true,
    // 检查未使用的函数参数
    "noUnusedParameters": true,
    // 按编写方式解释可选属性类型，而不是添加 undefined
    // "exactOptionalPropertyTypes": true,
    // 为在函数中没有显式返回的代码路径启用错误报告
    // "noImplicitReturns": true,
    // 防止switch语句贯穿(即不允许switch语句中没有break)
    "noFallthroughCasesInSwitch": true,
    // 当使用索引访问时，向类型添加 undefined
    // "noUncheckedIndexedAccess": true,
    // 确保用重写修饰符标记派生类中的重写成员
    // "noImplicitOverride": true,
    // 强制对使用索引类型声明的键使用索引访问器
    // "noPropertyAccessFromIndexSignature": true,
    // 禁用未使用标签的错误报告
    // "allowUnusedLabels": true,
    // 禁用不可达代码的错误报告
    // "allowUnreachableCode": true,

    // 完整性
    // 跳过类型检查。TypeScript中包含的ts文件
    "skipDefaultLibCheck": false,
    // 跳过所有的类型检查
    "skipLibCheck": false
  },
  // 指定一个匹配列表,用于确定应该包含在编译中的文件
  "include": [
    "src/**/*"
  ],
  // 指定一个排除列表,用于确定应该排除在编译中的文件
  "exclude": [
  ],
  // 指定那些文件使用该配置文件
  "files": [
  ]
}
```

### namespace 命名空间

```tsx
// 命名空间
namespace A {
    export const a = 1;
}

console.log(A.a);
```

### 声明文件

```ts
declare function fn<T>(a: T, b: T): Array<T>;

type A<T> = string | T;
declare let a: A<number>;

declare function f<T extends number>(a: T, b: T): number;
```

### Mixins 混入

```tsx
interface Name {
    name: string;
}

interface Age {
    age: number;
}

interface Sex {
    sex: string;
}

// 对象混入
let a: Name = {name: '张三'};
let b: Age = {age: 18};
let c: Sex = {sex: '男'};
console.log(Object.assign(a, b, c));
```

```tsx
class A {
    type: boolean;

    changeType() {
        this.type = !this.type;
    }
}

class B {
    name: string;

    getName(): string {
        return this.name;
    }
}

class C implements A, B {
    type: boolean = true;
    name: string = '小白';

    changeType() {
        this.type = !this.type;
    }

    getName(): string {
        return this.name;
    }
}

// 类C实现了接口A和B，但是类C并没有继承A和B，而是将A和B的属性和方法混入到了类C中，这样就可以实现多继承的效果。
function mixins(curClas: any, item: any[]) {
    item.forEach((item) => {
        Object.assign(curClas.prototype, item.prototype)
    })
}
```

### 装饰器

```tsx
// 类装饰器
const Base: ClassDecorator = (target) => {
    // target 返回的是类的构造函数
    // 增加属性
    target.prototype.base = 'base';
    // 增加方法
    target.prototype.say = () => {
        console.log('say');
    }
}

@Base
class Http {
    //....
}

const http = new Http() as any;
http.say();
```

```tsx
// 装饰器工厂
const Base = (name: string) => {
    const fn: ClassDecorator = (target) => {
        target.prototype.print = () => {
            console.log('Hello, ' + name);
        }
    }
    return fn;
}

@Base('小白')
class Http {
    //....
}

const http = new Http() as any;
http.print();
```

```tsx
// 方法装饰器
const Get = (path: string) => {
    const fn: MethodDecorator = (_0, _1, descriptor: PropertyDescriptor) => {
        descriptor.value(path)
    }
    return fn;
}

class axios {
    @Get('/api')
    get(data: any) {
        console.log(data)
    }
}

const axios1 = new axios();
```

### 协变

```tsx
// 协变
// 主类型
interface A {
    name: string;
}
// 子类型
interface B{
    name: string;
    age: number;
}
let a: A = {name: 'a'};
let b: B = {name: 'b', age: 1};
// 协变:子类型必须包含主类型的所有属性
a = b;
```

### 逆变

```tsx
// 逆变
interface A {
    name: string;
}

interface B {
    name: string;
    age: number;
}

let fn1 = (param: A) => {

}

let fn2 = (param: B) => {

}
// 逆变
fn2 = fn1;
```



