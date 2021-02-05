//: [Previous](@previous)

/*:
 
 # Swift函数
 
 */

/*:
 
 ## inout
 
 * 函数的参数默认是值传递，可以使用**inout**关键字传递地址。
 */
var numbers = Array<Int>()
func add(_ numbers: inout [Int]) {
    numbers.append(0)
}
// 需要保证numbers是可变的
add(&numbers)
// add函数中改变的是外部变量numbers
print(numbers)

/*:
 
 ## 交换元素

 */

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

/*:
 
 ## 函数赋值

 */

let function: (inout Int, inout Int) -> Void = swapTwoInts
function(&a, &b)

/*:
 
 ## 抛出异常
 
 * 函数可以作为另外一个函数的参数
 * rethrows关键字表明：本函不会抛出异常，但参数中的函数可能抛出异常
 * throws表明：当前函数可能抛出异常

 */

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

/*:
 
 ## 协议定义函数

 */
protocol isAnimal {
    func run()
}

/*:
 
 ## 协议函数默认实现

 */
extension isAnimal {
    
    func run() {
        print("animal run")
    }
}

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

/*:
 
 ## 泛型写法
 
 * 详见**泛型**

 */

func animalRun<T: Equatable>(_ value: T) where T: isAnimal {
    value.run()
}


//: [Next](@next)
