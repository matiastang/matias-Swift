<!--
 * @Author: tangdaoyong
 * @Date: 2021-02-03 16:40:55
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-02-03 16:47:18
 * @Description: Swift函数
-->
<!-- TOC -->

- [Swift函数](#swift函数)
    - [基本介绍](#基本介绍)
        - [声明](#声明)
            - [方法没有返回值](#方法没有返回值)
            - [方法有返回值](#方法有返回值)
        - [使用](#使用)
            - [方法没有返回值](#方法没有返回值-1)
            - [方法有返回值](#方法有返回值-1)
    - [进阶](#进阶)
        - [inout](#inout)
        - [交换元素](#交换元素)
        - [函数赋值](#函数赋值)
        - [抛出异常](#抛出异常)
        - [协议定义函数](#协议定义函数)
        - [协议函数默认实现](#协议函数默认实现)
        - [实现协议函数](#实现协议函数)
        - [泛型写法](#泛型写法)

<!-- /TOC -->
# Swift函数

## 基本介绍
 
### 声明
 
* 使用**func**关键字声明方法

 
#### 方法没有返回值
 
```swift

// 一个方法的基本格式
fileprivate func func_all(pepleName name: String = "默认名称") ->Void {
    print("调用方法\(#function)")
}

// 没有返回值，可简写
fileprivate func func_void(pepleName name: String = "默认名称") {
    print("调用方法\(#function)")
}

// 权限默认为internal，可简写
func func_internal(pepleName name: String = "默认名称") {
    print("调用方法\(#function)")
}

// 调用是可以不写外部参数名，可简写
func func_parameter(_ name: String = "默认名称") {
    print("调用方法\(#function)")
}

// 内外参数名一样时，可简写
func func_parameter(name: String = "默认名称") {
    print("调用方法\(#function)")
}

// 参数没有默认值，可写为
func func_normal(name: String) {
    print("调用方法\(#function)")
}

// 没有参数，可写为
func func_no_parameter() {
    print("调用方法\(#function)")
}
```
 
#### 方法有返回值
 
 * 返回值可以是任何类型
 * 如果方法定义了返回值，则必须返回相同类型的值，(some关键字声明的返回值例外，是为了实现SwiftUI的相关功能，而修改了了语言特性)
 
```swift

func func_int(_ age: Int? = nil) ->Int {
    print("调用方法\(#function)")
    guard let age = age else {
        return -1
    }
    return age
}

```
 
### 使用
 
 * 调用方法时，使用方法名调用
 
#### 方法没有返回值
 
```swift

func_all()
func_void()
func_internal()
// 下面两个方法同名，虽然有默认参数，但不能不传参数，因为：两个方法名相同，如果不传参数，就不能判断出调用的是那个方法。传参数时可以通过是否有对外参数判断。
func_parameter("参数不对外暴露名称")
func_parameter(name: "参数对外暴露名称")
func_normal(name: "参数没有默认值必传")
// 没有参数
func_no_parameter()

```
 
#### 方法有返回值
 
```swift
// func有返回值，但可以不接收
func_int()
// 接收了可以不使用
let _ = func_int()
// 定义了变量接收
let age = func_int()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult //表示取消不使用返回值的警告 @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

var leval = LevelTracker()
let unlock = leval.advance(to: 0)
```

## 进阶
 
### inout
 
 * 函数的参数默认是值传递，可以使用**inout**关键字传递地址。
```swift
var numbers = Array<Int>()
func add(_ numbers: inout [Int]) {
    numbers.append(0)
}
// 需要保证numbers是可变的
add(&numbers)
// add函数中改变的是外部变量numbers
print(numbers)

```
 
### 交换元素

```swift

// 如下实现变量交换
var a = 0
var b = 1
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
print("a=\(a),b=\(b)")

// 使用元组交换元素更简单
(a, b) = (b, a)
print("a=\(a),b=\(b)")

```
 
### 函数赋值

```swift

let function: (inout Int, inout Int) -> Void = swapTwoInts
function(&a, &b)

```
 
### 抛出异常
 
 * 函数可以作为另外一个函数的参数
 * rethrows关键字表明：本函不会抛出异常，但参数中的函数可能抛出异常
 * throws表明：当前函数可能抛出异常

```swift

func min(_ left:String, _ right: String, _ compare: (_ left:String, _ right: String) throws -> Bool) rethrows ->String {
    if try compare(left, right) {
        return left
    }
    return right
}

let left = "a"
let right = "b"
// 函数作为最后一个参数，可以写成尾随闭包
min(left, right) { (left, right) -> Bool in
    return left > right
}
// 简单逻辑可简写，详见闭包
min(left, right) { $0 > $1 }

```
 
### 协议定义函数

```swift
protocol isAnimal {
    func run()
}
```
 
### 协议函数默认实现

```swift
extension isAnimal {
    
    func run() {
        print("animal run")
    }
}
```

### 实现协议函数

```swift

struct PeopleError: Error {
    enum ErrorMeesage: String {
         case age = "age is nil"
    }
    let ageErr: ErrorMeesage
}

struct People: Equatable, isAnimal {
    
    var age: Int?
    
    static func == (lhs: People, rhs: People) -> Bool {
        do {
            return try ageEquality(lhs, rhs)
        } catch let err {
            print(err)// PeopleError(ageErr: __lldb_expr_56.PeopleError.ErrorMeesage.age)
        }
        return false
    }
    
    static func ageEquality(_ lhs: People, _ rhs: People) throws -> Bool {
        guard let lage = lhs.age else {
            throw PeopleError(ageErr: .age)
        }
        
        guard let rage = rhs.age else {
            throw PeopleError(ageErr: .age)
        }
        return lage == rage
    }
}

let tangdaoyong = People()
let tdy = People()

// People实现了Equatable协议，可以判断相当
tangdaoyong == tdy

```
 
### 泛型写法
 
 * 详见**泛型**

```swift

func animalRun<T: Equatable>(_ value: T) where T: isAnimal {
    value.run()
}
```