//: [Previous](@previous)

/*:
 
 # Swift字符串和字符
 
 */
//字符串是值类型
let str = "字符串文字使用双引号"
let str1 = """
多行
字符串
"""
let str2 = "第\"一\"行\n第\"二\"行"
let str3 = #"""
第"一"行
第"二"行
"""#
let eAcute: Character = "\u{E9}"
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")

var greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
var beginning = greeting[..<index]
print(withUnsafePointer(to: &greeting) { $0 })
print(withUnsafePointer(to: &beginning) { $0 })
var newString = String(beginning)
print(withUnsafePointer(to: &newString) { $0 })

var str4: String = "12345678"
let length = str4.count
/*
 @available(swift 4)
 @inlinable public subscript(r: Range<String.Index>) -> Substring { get }
 */
//截取前四位
var sub1 = str4[str4.startIndex...str4.index(str4.startIndex, offsetBy: 4)]
var sub2 = str4[str4.startIndex...str4.index(str.startIndex, offsetBy: length-2)]
let sub5Range = str4.index(str4.startIndex, offsetBy: 2)..<str4.endIndex
var sub5 = str4[sub5Range]

let dogString = "Dog‼🐶"

print(dogString.count)

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}


//: [Next](@next)
