//: [Previous](@previous)

/*:
 
 # Swift 基础类型
 
 */

/*:
 
 ## 声明变量
 
 * **常量**声明之后不可改变
 * **变量**声明之后可改变
 
 * let声明的是**常量**
 * var声明的是**变量**
 
 注意：
 * 字符串需要使用双引号，不能使用单引号。
 
 */

/*
 字符串需要使用双引号，不能使用单引号
 Swift行尾可以不使用分号
 */

/*:
 
 ### let声明的是常量,不可改变
 
 */
let js_const = "let相当于js中的const"
let π = 3.14159
// 变量名可以是任何Unicode字符
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

/*
 报错内容：Cannot assign to value: 'js_const' is a 'let' constant
 XCode编辑器给出的修改参考：Change 'let' to 'var' to make it mutable
 */
//js_const = "重新赋值let声明的字符串会报错"


/*:
 
 ### var声明的是变量,可以改变
 
 */
var js_let_var = "var相当于js中的let和var"
var x = 0.0, y = 0.0, z = 0.0
js_let_var = "可以修改var声明的变量"

/*:
 
 ### let理解
 
 * let只是不可以改变当前变量内存中的值，但如果含有引用类型，则可以改变引用类型中的值。
 
 */

/*:
 
 #### 值类型
 
 */
var var_str = "可变"
let let_arr = [var_str, "不可变数组中的值类型"]
//let_arr[0] = "不能通过let_arr去改变var_str的值"
var_str = "可以直接改变var_str的值"
print(var_str)// 可以直接改变var_str的值
print(let_arr)// ["可变", "不可变数组中的值类型"]

/*:
 
 #### 引用类型
 
 */
class People {

    var name: String?

    init(_ name: String? = nil) {
        self.name = name
    }

    deinit {
        print(#function)
    }
}
var tdy = People()
tdy.name = "people"
let tangdaoyong = People()
tangdaoyong.name = "people"

let people_arr = [tdy, tangdaoyong]

print(people_arr.first!.name ?? "name is nil")// name is nil
people_arr.first!.name = "tdy"
print(people_arr.first!.name ?? "name is nil")// tdy

print(people_arr.last!.name ?? "name is nil")// name is nil
people_arr.last!.name = "tangdaoyong"
print(people_arr.last!.name ?? "name is nil")// tangdaoyong

/*:
 
 ## 基础类型
 
 * 所有基础类型都是**值类型**
 
 */

let str = "string"
let character:Character = "a"
let bool = true
let int = 0
let uint:UInt = 0
let float:Float = 0.0
let double = 0.0
let str_optional: String?

// 类型别名
typealias Number = Int
let number: Number = 0

print("Int.max=\(Int.max),Int.min=\(Int.min)")

/*:
 
 ## 复合类型
 
 */

let array = [0, 1]
let dictionary = [String:Int]()
var set = Set<String>()
print(set.isEmpty)
set.insert("0")
print(set.count)

/*:
 
 ## 类型安全
 
 * Swift是类型安全的，不同类型之间不能做运算，不存在**隐式转换**，可以显示转换
 
 */
let left_number = 1
let right_number = 1.0

//let add = left_number + right_number
let add_int = left_number + Int(right_number)
let add_double = Double(left_number) + right_number

/*:
 
 ## 类型推断
 
 * Swift声明变量是可以不写明变量的类型，Swift可以从赋值推断出类型，一般在默认推断不符合我们预期的时候可以写明变量类型
 
 */

let is_double = 1
let is_float:Float = 1

//: [Next](@next)
