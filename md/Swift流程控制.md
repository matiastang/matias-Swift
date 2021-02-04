<!--
 * @Author: tangdaoyong
 * @Date: 2021-02-03 15:50:36
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-02-03 15:54:31
 * @Description: Swift流程控制
-->
<!-- TOC -->

- [Swift流程控制](#swift流程控制)
    - [循环](#循环)
        - [for in](#for-in)
        - [while](#while)
        - [repeat while](#repeat-while)
    - [条件](#条件)
        - [if let](#if-let)
        - [guard](#guard)
        - [switch](#switch)
        - [#available](#available)

<!-- /TOC -->
# Swift流程控制
 
## 循环

### for in
 
 * 循环中的return和break关键字和其他语言类似
 
```swift

//C-style for statement has been removed in Swift 3
//for var i = 0; i < 10; i++ {
//    print(i)
//}

let arr = Array(repeating: "0", count: 5)

for item in arr {
    print(item)
}

for (index, value) in arr.enumerated() {
    print(index + value)
}

// 扩展+运算符
func +(left: Int, right: String) ->String {
    return String(left) + "=>" + right
}

```
 
### while
 
```swift

var number = 0
while number < 10 {
    number += 1
}

```
 
### repeat while
 
 * 同do-while
 
```swift

repeat {
    number -= 2
} while number > 0

if number <= 0 {
    number = 0
}

```
 
## 条件
 
### if let
 
```swift

var number1: Int?
if let number2 = number1 {
    print("number1有值为\(number2)")
}

```
 
### guard
 
 * 推崇guard内部变量名和参数名一样
 
```swift

func isNumber(_ number: Int?) ->Int {
    guard let number = number else {
        return 0
    }
    return number
}

```
 
### switch
 
 * unknown 可以兼容**未来扩展的值**
 
```swift

enum TYPE:Int {
    case ONE,
         TWO,
         THRRE
}
var type = TYPE.ONE
type = .TWO
TYPE.ONE.rawValue == 0
switch type {
case .ONE, .TWO:
    break
case .THRRE:
    break
@unknown default:
    print("未知")
    break
}

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."

```
 
### #available
 
 * **系统版本**、**平台**适配
 * `@available`可以做到方法**系统版本**、**平台**适配
 
```swift

if#available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
```