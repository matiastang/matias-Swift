//: [Previous](@previous)
/*:

 # Swift集合类型
 
 */

/*:
 
 ## Array
 
 */
let arr1 = [1]
var arr2 = [1]
arr2.append(3)

let arr3: [String] = []
arr3.isEmpty
let arr4 = [String]()
let arr5 = Array(repeating: "", count: 5)

for (index, value) in arr5.enumerated() {
    print("index=\(index), value=\(value)")
}
for item in arr5.reversed().enumerated() {
    print("index=\(item.0), value=\(item.1)")
}

/*:
 
 ## Set
 
 */
var set1: Set = ["Rock", "Classical", "Hip hop"]
set1.insert("tdy")
set1.remove(at: set1.startIndex)
set1.isEmpty
set1.count
for item in set1 {
    print(item)
}
set1.contains("tdy")
for item in set1.sorted() {
    print(item)
}
/*:
 
 ## Dictionary
 
 */
var dic1 = [String: Int]()
dic1["age"] = 27
dic1["age"]! += 1
dic1.keys
dic1.values

//: [Next](@next)
