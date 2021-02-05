//: [Previous](@previous)

/*:
 
 # Swift结构体&类
 
 * Swift中结构体和枚举是值类型，类是引用类型
 
 */
/*:
 
 ## Swift结构体
 
 */
struct Resolution {
    
    // 存储属性
    private var width = 0
    private var height = 0
    
    // 计算属性
    var W: Int {
        get {
            return self.width
        }
    }
    
    var H: Int {
        get {
            return self.height
        }
    }
    
    // 初始化
    init(_ width: Int, height: Int) {
        print("w=\(self.width),h=\(self.height)")
        self.width = width
        self.height = height
    }
    
    init(_ width: Int) {
        self.init(width, height: 10)
    }
    
    // 方法
    
    // 实例方法
    @discardableResult
    func toString() ->String {
        return "width=\(self.width),height=\(self.height)"
    }
    
    mutating func setW(_ width: Int) {
        self.width = width
    }
    
    mutating func setH(_ height: Int) {
        self.height = height
    }
    
    // 类方法
    static func toString() ->String {
        return "width,height"
    }
    
    // struct是值类型，没有deinit
}

extension Resolution {
    
    // 扩展不能包含存储属性
//    var uuid = 0
}

extension Resolution: Equatable {

}

extension Resolution {
    
    subscript(index: Int) -> Int {
        if index & 1 == 1 {
            return self.W
        } else {
            return self.H
        }
    }
}

var resolution = Resolution.init(1)
resolution.W
resolution.H
resolution.toString()
resolution.setW(10)
resolution.setH(20)
resolution[0]
resolution[1]

Resolution.toString()

var newResolution = Resolution.init(10, height: 20)

resolution == newResolution

/*:
 
 ## Swift类
 
 */
let a = 0
let b = 0
//a === b
class VideoMode {
    
    var resolution = Resolution(10)
    var interlaced = false
    var frameRate = 0.0
    var name: String?

    init(_ age: Int = 10) {
        print(frameRate)
        frameRate = Double(age)
    }

    class func a() {

    }

    static func b() {

    }

    func c() {

    }

    deinit {
        print("\(VideoMode.self)-deinit")
    }
}

extension VideoMode: Equatable {
    
    static func == (lhs: VideoMode, rhs: VideoMode) -> Bool {
        return true
    }
}

var c = VideoMode()
let d = VideoMode()
c.resolution.W
c === d
c !== d
c = d
c === d
c !== d

//: [Next](@next)
