<!--
 * @Author: tangdaoyong
 * @Date: 2021-02-04 10:45:35
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-02-04 10:55:45
 * @Description: Swift枚举&结构体&类
-->
<!-- TOC -->

- [Swift枚举&结构体&类](#swift枚举结构体类)
    - [枚举](#枚举)
    - [结构体](#结构体)
    - [类](#类)

<!-- /TOC -->
# Swift枚举&结构体&类

* Swift中结构体和枚举是值类型，类是引用类型

## 枚举
 
```swift
// 定义枚举
enum RGB {
    case R, G, B
}
// 枚举设置关联值
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
productBarcode
// 枚举设置原始值
enum Color:Int {
    case RED, WHITE
    // 修改实例值
    mutating func setWHITE() {
        self = .WHITE
    }
}

var red = Color(rawValue: 0)
red == Color.RED
red?.setWHITE()
red == Color.RED

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
```
 
## 结构体
 
```swift
struct Resolution {
    
    // 存储属性
    private var width = 0
    private var height = 0
    
    // 计算属性
    var W: Int {
        get {
            return self.width
        }
    }
    
    var H: Int {
        get {
            return self.height
        }
    }
    
    // 初始化
    init(_ width: Int, height: Int) {
        print("w=\(self.width),h=\(self.height)")
        self.width = width
        self.height = height
    }
    
    init(_ width: Int) {
        self.init(width, height: 10)
    }
    
    // 方法
    
    // 实例方法
    @discardableResult
    func toString() ->String {
        return "width=\(self.width),height=\(self.height)"
    }
    
    mutating func setW(_ width: Int) {
        self.width = width
    }
    
    mutating func setH(_ height: Int) {
        self.height = height
    }
    
    // 类方法
    static func toString() ->String {
        return "width,height"
    }
    
    // struct是值类型，没有deinit
}

extension Resolution {
    
    // 扩展不能包含存储属性
//    var uuid = 0
}

extension Resolution: Equatable {

}

extension Resolution {
    
    subscript(index: Int) -> Int {
        if index & 1 == 1 {
            return self.W
        } else {
            return self.H
        }
    }
}

var resolution = Resolution.init(1)
resolution.W
resolution.H
resolution.toString()
resolution.setW(10)
resolution.setH(20)
resolution[0]
resolution[1]

Resolution.toString()

var newResolution = Resolution.init(10, height: 20)

resolution == newResolution

```
 
## 类
 
```swift
let a = 0
let b = 0
//a === b
class VideoMode {
    
    var resolution = Resolution(10)
    var interlaced = false
    var frameRate = 0.0
    var name: String?

    init(_ age: Int = 10) {
        print(frameRate)
        frameRate = Double(age)
    }

    class func a() {

    }

    static func b() {

    }

    func c() {

    }

    deinit {
        print("\(VideoMode.self)-deinit")
    }
}

extension VideoMode: Equatable {
    
    static func == (lhs: VideoMode, rhs: VideoMode) -> Bool {
        return true
    }
}

var c = VideoMode()
let d = VideoMode()
c.resolution.W
c === d
c !== d
c = d
c === d
c !== d
```