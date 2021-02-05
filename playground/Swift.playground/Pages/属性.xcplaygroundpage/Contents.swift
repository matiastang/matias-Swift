//: [Previous](@previous)

/*:
 
 # Swift属性
 
 */
struct PeoPle {
    private var _name = ""
    var name: String {
        get {
            return _name
        }
        set {
            print("\(age)=>\(newValue)")
            //
            _name = newValue
            //
        }
    }
    var age = 0 {
        willSet {
            print("\(age)=>\(newValue)")
            
        }
        didSet {
            print("\(oldValue)=>\(age)")
        }
    }
}

var a = PeoPle()

a.name = "name"
a.age = 10

class animal {
    private var _name = ""
    var name: String {
        get {
            return _name
        }
    }
    
    func setName(_ name: String) {
        self._name = name
    }
}

//Swift 5.1 新增了 Property Wrappers 特性。

@propertyWrapper
struct TwelveOrLess {
    private var number: Int
    init() { self.number = 0 }
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// Prints "0"

rectangle.height = 10
print(rectangle.height)
// Prints "10"

rectangle.height = 24
print(rectangle.height)
// Prints "12"

@propertyWrapper
struct SmallNumber {
    private var number: Int
    var projectedValue: Bool
    init() {
        self.number = 0
        self.projectedValue = false
    }
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}
struct SomeStructure {
    @SmallNumber var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
// Prints "false"

someStructure.someNumber = 55
print(someStructure.$someNumber)
// Prints "true"

enum Size {
    case small, large
}

struct SizedRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}


//: [Next](@next)
