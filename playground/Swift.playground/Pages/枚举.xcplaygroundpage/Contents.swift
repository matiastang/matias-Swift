//: [Previous](@previous)

/*:
 
 # Swift 枚举
 
 */
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


//: [Next](@next)
