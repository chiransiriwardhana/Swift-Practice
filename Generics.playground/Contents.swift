import Foundation

// generics use to avoid writing same code again and again

func performSomeTask(_ operation: (Int, Int)-> Int, on lhs: Int, and rhs: Int) -> Int {

    operation(lhs, rhs)
}

performSomeTask(+, on: 10, and: 20)
performSomeTask(-, on: 10, and: 20)
performSomeTask(*, on: 10, and: 20)
performSomeTask(/, on: 20, and: 10)


//func perform1(_ op: (Numeric, Numeric)-> Numeric, on lhs: Numeric, and rhs: Numeric) -> Numeric {
//    op(lhs, rhs)
//} ==> you can't use numeric. because it is a protocol. Therefore you need to use generics



func performSomeTask<N: Numeric> (_ operation: (N, N) -> N, on lhs: N, and rhs: N)-> N {
    operation(lhs, rhs)
}

performSomeTask(+, on: 2.5, and: 2)
performSomeTask(-, on: 2.5, and: 2)
performSomeTask(*, on: 2.5, and: 2)
performSomeTask(/, on: 2.5, and: 2)




//print(type(of: x)) // more complete data type is double. therefore type of x is double

// alternative way of writing generic function

func perform2<N>(_ op: (N, N)-> N, on lhs: N, and rhs: N) -> N where N: Numeric {
    op(lhs, rhs)
}

perform2(+, on: 10, and: 20)
perform2(-, on: 10, and: 20)

protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

struct Person: CanJump, CanRun {
    func jump() {
        "Jumping"
    }

    func run() {
        "Running"
    }
}

func jumpAndRun<T: CanJump & CanRun>(value: T) {
    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(value: person)

// extension for array of strings

extension [String] {
    func longestString()->String? {
        self.sorted{ (lhs: String, rhs: String) -> Bool in
            return lhs.count > rhs.count
        }.first
    }
}

["Foo", "Bar Baz", "Qux"].longestString()
["Foo", "Bar Baz", "Qux"].sorted{(rhs: String, lhs: String) -> Bool in
    // print("\(rhs) **")
    // print("\(lhs) &&")
    return rhs.count > rhs.count

}.first


protocol View {
    func addSubView(_ view: View)
}

extension View {
    func addSubView(_ view: View) {

    }
}

struct Button: View {

}

struct Table: View {

}

// to convert protocol to generic you should use associatedtype
protocol PresentableAsView {
    associatedtype ViewType: View
    func produceView() -> ViewType
    //  If ViewType is button then this function produce Button. If ViewType is table then this function produce table
    func configure(superView: View, thisView: ViewType)
    func present(view: ViewType, on superView: View)
}

extension PresentableAsView {
    func configure(superView: View, thisView: ViewType) {
        // empty
    }
    func present(view: ViewType, on superView: View) {
        superView.addSubView(view)
    }
}

struct MyButton: PresentableAsView {
    func produceView() -> Button {
        Button()
    }

    func configure(superView: View, thisView: Button) {
        //  since produceView function returns Button class type of thisView is Button
    }

    func present(view: Button, on superView: View) {
        // empty
    }
}

// Object ViewType is Button
extension PresentableAsView  {

    func doSomethingWithView() {
        "This is a button"
    }
}

let button = MyButton()
button.doSomethingWithView()

struct MyTable: PresentableAsView {
    func produceView() -> Table {
        Table()
    }
}

let myTable = MyTable()

myTable.doSomethingWithView()

// if we use
//extension PresentableAsView  where ViewType == Button {
//
//    func doSomethingWithView() {
//        "This is a button"
//    }
//}

// then doSomethingWithView is not available for mytable. To make available for myTable you should remove "where ViewType == Button" in extension PresentableAsView

extension [Int] {
    func average() -> Double {
        Double(self.reduce(0, +)) / Double(self.count)
    }
}

[1 ,2, 3, 4].average()

struct Stack<Element> {
    var elements: [Element] = []

    mutating func push(element: Element) {
        elements.append(element)
    }

    mutating func pop() -> Element? {
        return elements.popLast()
    }

}

var stack: Stack<Int> = Stack()

// push
stack.push(element: 1)
stack.push(element: 2)
stack.push(element: 3)

// pop
stack.pop()


extension Stack {
    var topItem: Element? {
        elements.isEmpty ? nil: elements[elements.count - 1]
    }
}

stack.topItem

for ele in stack.elements {
    print(ele)
}


//protocol Vehicle {
//    associatedtype V
//
//    func printVehicleType(vehicleType: V) -> String
//}
//
//struct Car: Vehicle {
//
//    // var carName: String
//    func printVehicleType(vehicleType: V) -> String {
//        return "This is \(vehicleType)"
//    }
//}
//
//struct Bike: Vehicle {
//
//    // var bikeName: String
//
//    func printVehicleType(vehicleType: V) -> String {
//        return "This is \(vehicleType)"
//    }
//
//}
//let car = Car(carName: "Tesla")
//let bike = Bike(bikeName: "HD")
//
//car.printVehicleType(vehicleType: "Car")
//bike.printVehicleType(vehicleType: 1)

protocol Store {
    associatedtype Item

    var items: [Item] { get set }
    mutating func addItemsToStore(item: Item)
}

extension Store {
    mutating func addItemsToStore(item: Item) {
        items.append(item)
    }
}
struct BookStore: Store {
    var items = [String]()
}

struct NumberStore: Store {
    var items = [Int]()
}
var bookStore = BookStore()
bookStore.addItemsToStore(item: "Swift programming for beginers")
bookStore.addItemsToStore(item: "Objective-C programming for beginers")
var numberStore = NumberStore()
numberStore.addItemsToStore(item: 1)
