//: [Previous](@previous)

/*:
 
 # Swift方法
 
 */

/*:
 
 ## 声明
 
 * 使用**func**关键字声明方法
 
 */

/*:
 
 ### 方法没有返回值
 
 */

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

/*:
 
 ### 方法有返回值
 
 * 返回值可以是任何类型
 * 如果方法定义了返回值，则必须返回相同类型的值，(some关键字声明的返回值例外，是为了实现SwiftUI的相关功能，而修改了了语言特性)
 
 */

func func_int(_ age: Int? = nil) ->Int {
    print("调用方法\(#function)")
    guard let age = age else {
        return -1
    }
    return age
}

/*:
 
 ## 使用
 
 * 调用方法时，使用方法名调用
 
 */

/*:
 
 ### 方法没有返回值
 
 */

func_all()
func_void()
func_internal()
// 下面两个方法同名，虽然有默认参数，但不能不传参数，因为：两个方法名相同，如果不传参数，就不能判断出调用的是那个方法。传参数时可以通过是否有对外参数判断。
func_parameter("参数不对外暴露名称")
func_parameter(name: "参数对外暴露名称")
func_normal(name: "参数没有默认值必传")
// 没有参数
func_no_parameter()

/*:
 
 ### 方法有返回值
 
 */
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

//: [Next](@next)
