import Foundation

protocol CanBreathe {
    func breathe()
}
// structures don't allow inheritance from other structures. but they allow inheritance from protocols


struct Animal: CanBreathe {
    func breathe() {
        "Animal breathing"
    }
}

struct Person: CanBreathe {
    func breathe() {
        "Person breathing"
    }
}

let dog = Animal()
dog.breathe()
let foo = Person()
foo.breathe()

protocol CanJump {
    func jump()
}

extension CanJump {
    func jump() {
        "Jumping ..."
    }
}

struct Cat: CanJump {

    //  If you don't have extension for CanJump then you need to implement jump function for every struct, class that inherit from CanJump protocol

}

let whiskers = Cat()
whiskers.jump()

protocol HasName {
    //  let name: String { get } 'let' declarations cannot be computed properties
    var name: String { get }
    var age: Int { get set }

    // if u need more readable u can place function
    func describeMe()->String
}

extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old"
    }

    //  if func increaseAge() { self.age += 1 } then throws left side of mutating operator isn't mutable: 'self' is immutable

    mutating func increaseAge() {
        self.age += 1
    }
}

struct Dog: HasName {
    let name: String
    var age: Int
}

var woof = Dog(name: "woof", age: 10)
woof.name
woof.age
woof.age += 1 // if we have let woof = Dog(name: "woof", age: 10) then this line throw "Left side of mutating operator isn't mutable"
woof.age

woof.describeMe()
//  all objects conform to protocol HasName get describeMe function and increaseAge function.
woof.increaseAge()
woof.age

protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) {
        self.speed += value
    }
}

class Bike: Vehicle {
    var speed: Int
    init() {
        self.speed = 0
    }
}

var bike = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed

//we can use is operatore to check wheather object conform to a some protocol or not

struct Worm {

}

func describe(obj: Any) { // Any is any object
    if obj is Vehicle {
        "obj conforms to the Vehicle protocol"
    } else {
        "obj does NOT conform to the Vehicle protocol"
    }
}

describe(obj: bike)
let worm = Worm()
describe(obj: worm)

func increaseSpeedIfVehicle(obj: Any) {
    if var vehicle = obj as? Vehicle {
        vehicle.speed
        vehicle.increaseSpeed(by: 10)
        vehicle.speed
    } else {
        "This is not a vehicle"
    }
}

increaseSpeedIfVehicle(obj: bike) // you are passing new instance of bike to increaseSpeedIfVehicle function. You are not actually passing memory consumed by bike object what happen here is swift make entire copy of bike and passing it to this function. if we change struct Vehicle to class Vehicle then we get 20.
bike.speed
