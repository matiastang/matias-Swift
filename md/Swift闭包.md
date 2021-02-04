<!--
 * @Author: tangdaoyong
 * @Date: 2021-02-03 17:08:48
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-02-03 17:24:57
 * @Description: Swift 闭包
-->
<!-- TOC -->

- [Swift 闭包](#swift-闭包)
    - [介绍](#介绍)
    - [基本格式](#基本格式)
    - [使用](#使用)
    - [尾随闭包](#尾随闭包)
    - [逃逸闭包](#逃逸闭包)
    - [autoclosure](#autoclosure)

<!-- /TOC -->
# Swift 闭包

## 介绍

 闭包(Closures)是自包含的功能代码块，可以在代码中使用或者用来作为参数传值。
 Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的 匿名函数比较相似。
 * **全局函数**和**嵌套函数**其实就是特殊的闭包。

 闭包的形式有：
 
 1.  全局函数
 有名字但不能捕获任何值。
 2. 嵌套函数
 有名字，也能捕获封闭函数内的值。
 3. 闭包表达式
 无名闭包，使用轻量级语法，可以根据上下文环境捕获值。
 
 Swift中的闭包的优化:
 * 根据上下文推断参数和返回值类型
 * 从单行表达式闭包中隐式返回（也就是闭包体只有一行代码，可以省略return）
 * 可以使用简化参数名，如$0, $1(从0开始，表示第i个参数...)
 * 提供了尾随闭包语法(Trailing closure syntax)
 * 逃逸闭包
 * auto closure
 
## 基本格式
 
```swift

//{(parameters) -> return type in
//   statements
//}

```
 
## 使用
 
 * 函数作为另外一个函数的参数
 
```swift
var numbers = [1, 2, 3, 5]
// 闭包
numbers.sorted(by: { (left, right) -> Bool in
    return left > right
})
```
 
## 尾随闭包
 
```swift
numbers.sorted { (left, right) -> Bool in
    return left > right
}
// 可简写
numbers.sorted { left, right -> Bool in return left > right}
numbers.sorted { left, right -> Bool in left > right}
numbers.sorted { left, right in left > right }
numbers.sorted { $0 > $1 }
numbers.sorted(by: >)
```
 
## 逃逸闭包
 
```swift
var backFunc: ((Int) -> Bool)?
func add(_ left: Int, _ right: Int, _ back: @escaping (_ number: Int) -> Bool) {
    backFunc = back
    // do
    backFunc?(left + right)
}

```
 
## autoclosure
 
```swift
var customersInLine = ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
```