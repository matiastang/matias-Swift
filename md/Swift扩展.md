<!--
 * @Author: tangdaoyong
 * @Date: 2021-02-04 11:06:12
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-02-04 11:06:50
 * @Description: Swift扩展 Extension
-->
# Swift扩展 Extension
 
Swift中可以为类，结构，枚举或协议类型使用扩展
这包括扩展您无法访问原始源代码的类型的能力（称为追溯建模）。扩展与Objective-C中的类别相似。（与Objective-C类别不同，Swift扩展没有名称。）

Swift中的扩展可以：

添加计算实例属性和计算类型属性
定义实例方法和类型方法
提供新的初始化器
定义下标
定义和使用新的嵌套类型
使现有类型符合协议
```swift
extension Int {
    
//    var string: String?// etxtenon不能添加存储属性
    
    var toString: String {
        get {
            return String(self)
        }
    }
    
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

let number = 1
number.toString

//extension实例方法
//添加了扩展名的实例方法还可以修改实例本身。修改self其属性的结构和枚举方法或其属性必须将实例方法标记为mutating，就像从原始实现中对方法进行修改一样。

extension Int {
    
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
//        let decimalBase = self >> digitIndex * 18
//        return decimalBase & 0xff
    }
}
746381295[0]
```