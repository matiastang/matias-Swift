//: [Previous](@previous)

/*:
 
 # Swift错误处理
 
 */

//Swift中符合Error协议的类型的值可以用来表示错误，和enum类型搭配使用最佳。

//try

//do {
//    try expression
//    statements
//} catch pattern 1 {
//    statements
//} catch pattern 2 where condition {
//    statements
//} catch pattern 3, pattern 4 where condition {
//    statements
//} catch {
//    statements
//}

//try?通过将错误转换为可选值来处理错误

//try!在表达式之前编写以禁用错误传播，并将调用包装在不会抛出任何错误的运行时断言中。如果实际抛出错误，您将得到运行时错误。

//func processFile(filename: String) throws {
//    if exists(filename) {
//        let file = open(filename)
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//            // Work with the file.
//        }
//        // close(file) is called here, at the end of the scope.
//    }
//}

//: [Next](@next)
