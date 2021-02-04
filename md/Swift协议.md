<!--
 * @Author: tangdaoyong
 * @Date: 2021-02-03 17:47:16
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-02-03 17:50:18
 * @Description: Swift Protocols
-->
 
# Swift Protocols
 
## 介绍
 
 * 协议可以由类，结构，或枚举实现
 * 协议可以定义实例属性和类属性，协议没有指定属性是存储属性还是计算属性，仅指定所需的属性名称和类型。
 * 协议可以定义实例方法和类型方法
 * 对于值类型（即结构和枚举）的实例方法，请将mutating关键字放在方法的func关键字之前，以指示允许该方法修改其所属的实例以及该实例的任何属性

## 定义协议
 
```swift
import Foundation
import PlaygroundSupport

//定义协议
protocol SomeProtocol {
//    可读写实例属性
    var mustBeSettable: Int { get set }
//    只读实例属性
    var doesNotNeedToBeSettable: Int { get }
//    类属性
    static var someTypeProperty: Int { get set }
//    实例方法
    func random() -> Double
//    类方法
    static func someTypeMethod()
//    结构或枚举实现协议时可以在方法类更新实例
    mutating func toggle()
}

```
 
## 使用协议
 
```swift
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}
```
 
## 继承类并实现协议
 
```swift
//class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
//    // class definition goes here
//}

//class SomeClass: SomeProtocol {
//    var mustBeSettable: Int
//
//    var doesNotNeedToBeSettable: Int
//
//    static var someTypeProperty: Int
//
//    func random() -> Double {
//        <#code#>
//    }
//
//    static func someTypeMethod() {
//        <#code#>
//    }
//
//    func toggle() {
//        <#code#>
//    }
//
////    required修饰符的使用可确保您在符合类的所有子类上提供初始化程序要求的显式或继承实现，以使它们也符合协议。
//    required init(someParameter: Int) {
//        // initializer implementation goes here
//    }
//}
```

 * 协议可以作为类型
 * 协议可扩展
 * 扩展可以遵守协议
```swift
//可以使泛型类型有条件地符合协议。通过编写泛型where子句实现
//extension Array: TextRepresentable where Element: TextRepresentable {
//    var textualDescription: String {
//        let itemsAsText = self.map { $0.textualDescription }
//        return "[" + itemsAsText.joined(separator: ", ") + "]"
//    }
//}
//let myDice = [d6, d12]
//print(myDice.textualDescription)

```
 
## 协议继承
 
```swift
protocol NameProtocol {
    var name: String { get }
}
protocol AgeProtocol {
    var name: String { get set }
    var age: Int { get }
}
protocol AnimalProtocol: NameProtocol, AgeProtocol {
    // protocol definition goes here
}

struct AnimalA:AnimalProtocol {
    var name: String {
        get {
            return "animal"
        }
        set {
            age = Int(newValue) ?? 0
        }
    }
    
    var age: Int
}
let one = AnimalA(age: 10)

//通过将AnyObject协议添加到协议的继承列表中，可以将协议采用限制为类类型（而不是结构或枚举）。
//protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
//    // class-only protocol definition goes here
//}
//SomeClassOnlyProtocol只能用于类

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}
```
 
## &约束
 
```swift
//celebrator参数要求同事符合Named、Aged协议
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)
// Prints "Happy birthday, Malcolm, you're 21!"

//使用is和as运算符来检查协议一致性，并转换为特定协议

```
 
## 可选
 
 * 可选要求以optional修饰符作为协议定义的一部分。提供了可选要求，以便您可以编写与Objective-C互操作的代码。协议和可选要求都必须用@objc属性标记。请注意，@objc协议只能被从Objective-C类或其他@objc类继承的类采用。它们不能被结构或枚举采用。
 
```swift

@objc protocol OptionalProtocol {
    @objc optional func random() -> Double
}
```
 
## 协议扩展
 
```swift

import Foundation

public extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}


let arr = [10, 10, 10]
let arr2 = [100, 50]
arr.allEqual()
```