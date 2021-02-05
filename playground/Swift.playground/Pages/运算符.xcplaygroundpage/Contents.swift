//: [Previous](@previous)

/*:

 # Swift 运算符
 
 */

//赋值运算
let a = "a"
var b: String
b = a
let (x, y) = (1, 2)// 元组赋值

//算数运算
print("""
1 + 2 = \(1 + 2)
5 - 3 = \(5 - 3)
2 * 3 = \(2 * 3)
10.0 / 2.5 = \(10.0 / 2.5)
""")

print("""
9 % 4 = \(9 % 4)
""")

//一元运算符
let numberA = -1
let numberB = +numberA
print(numberB)

//复合运算符
var numberC = 1
numberC += 3
numberC -= 1

//比较运算符
let c = 1
let d = "2"
let e = 2
//c == d
d == String(c)
let f = Int(d)
c == f
c != f
c > e
c < e
c >= e
c <= e

//三元运算符
c < e ? "c < e" : "c >= e"

//解包
var swift: Int?
swift ?? 0
swift = 0
swift!
//自定义运算符
//infix 中缀，prefix左（前缀）、postfix右（后缀）
//infix operator <-- {}
infix operator ?=
//现在运算符已经被系统识别，不用再方法前添加infix。
func ?= (left: Int?, right: Int) -> Int {
    return left ?? right
}

swift ?= 1

let range = 0...5
//区间运算符
for index in 0...5 {
    print(index)
}
for index in 6..<10 {
    print(index)
}
let `operator` = "operator"
print(`operator`)

infix operator <|

func <| (left: Int, right: Int) -> ClosedRange<Int> {
    // TODO: - 输入判断
    return (left + 1)...right
}
print(5<|8)


//: [Next](@next)
