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
let a1:symbol = Symbol('a');
console.log(a1);
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

### namespace 命名空间

```tsx
// 命名空间
namespace A {
    export const a = 1;
}

console.log(A.a);
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



