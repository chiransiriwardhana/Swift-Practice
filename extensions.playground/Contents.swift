import Foundation

//extension can add funactionality to existing types


extension Int {
    func plusTwo() -> Int {
        self // self referce to current integer instance
        return self + 2
    }
}

let two = 2
two.plusTwo()

struct Person {
    let firstName: String
    let lastName: String

//    now you only have constructor with Person(fullName: )
//    init(fullName: String) {
//
//    }
// to avoid this and to have Person(firstName:,lastName) and Person(fullName:) we can use extension
}

extension Person {
    init(fullName: String) {
        let components = fullName.components(separatedBy: " ")
        self.init(firstName: components.first ?? fullName,
                  lastName: components.last ?? fullName
                  )
    }
}

let person = Person(fullName: "Foo Bar")
person.firstName
person.lastName

protocol GoesVroom {
    var vroomValue: String { get }
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom()-> String {
        "\(self.vroomValue) goes vroom!"
    }
}

struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(manufacturer: "Tesla", model: "X")

extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufacturer) model \(self.model)"
    }
}

modelX.goVroom()

// you can extending convienance initializers and can add extensions to existing data structures

class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)// extending exsisting class and adding new convienence initializer
    }
}

let myDouble = MyDouble()
myDouble.value

// extention also can extend exsisting protocols

extension GoesVroom {
    func goVroomVroomEvenMore() -> String {
        "\(self.vroomValue) is vrooming even more!"
    }
}

modelX.goVroomVroomEvenMore()
