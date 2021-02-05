//: [Previous](@previous)
/*:
 # 泛型Generics
 
 泛型使用驼峰命令，第一个字母一般为大写，表明是类型的占位符
*/

/*:
 
 ## 泛型基本使用
 
 */
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

/*:
 
 ## 泛型约束
 
 * 第一个类型参数T的类型约束为：T必须为SomeClass子类。第二个类型参数U类型约束为：U必须符合SomeProtocol协议。
 :*/
class SomeClass {
    
}
protocol SomeProtocol {
    
}
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here
}
/*:
 实现中的类型约束
 
 如果下列函数不约束`T: Equatable`则无法编译通过，因为`==`无法编译通过
 :*/
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
/*:
 
 ## 关联类型
 
 `associatedtype`关键字声明关联类型，可以在实现的时候确定关联类型的具体类型，也可以通过类型推断
 关联类型可以添加约束，如`associatedtype Item: Equatable`
 :*/
protocol Container {
    /// 定义了关联类型Item
    associatedtype Item
    /// 定义了关联类型Item，并添加约束
//    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int// 定义了关联类型的类型
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

/*:
 
 ## 声明已经符合某协议
 
 如果协议已经被实现，但并未声明实现了该协议，可以使用exteinon声明
 :*/
extension Array: Container {}

/*:
 ## 泛型where子句
 :*/
func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {

        // Check that both containers contain the same number of items.
        if someContainer.count != anotherContainer.count {
            return false
        }

        // Check each pair of items to see if they're equivalent.
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }

        // All items match, so return true.
        return true
}

extension Stack where Element: Equatable {
    
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}
/*:
 
 ## where子句和关联类型配合使用
 
 :*/
protocol NewContainer {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }

    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}
/*:
 Sequence 是一系列相同类型的值的集合，并且提供对这些值的迭代能力
 Iterator迭代器符合IteratorProtocol协议
 :*/
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
            var result = [Item]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}
/*:
 
 ## Opaque Types
 
 使用不透明类型作为返回类型表示所需的条件
 如下：该函数返回一个容器，但拒绝指定该容器的类型：some Container
 :*/
func makeOpaqueContainer<T>(item: T) -> some Container {
    return [item]
}
let opaqueContainer = makeOpaqueContainer(item: 12)
let twelve = opaqueContainer[0]
print(type(of: twelve))
// Prints "Int"

// Error: Protocol with associated types can't be used as a return type.
//func makeProtocolContainer<T>(item: T) -> Container {
//    return [item]
//}

// Error: Not enough information to infer C.
//func makeProtocolContainer<T, C: Container>(item: T) -> C {
//    return [item]
//}
//: [Next](@next)
