import Foundation

// structure are value type

struct Person {
    let name: String
    let age: Int
}

let foo = Person(name: "Chiran", age: 20)

foo.name
foo.age

struct CommodoreComputer {
    let name: String
    let manufacturer: String
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}

// another way
//struct CommodoreComputer {
//    let name:String
//    let manufacturer = "Commodore"
//}

let c64 = CommodoreComputer(name: "C64")
c64.name
c64.manufacturer

let c128 = CommodoreComputer(name: "My Commoder 128")

struct Person2 {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)" // computed property
    }
}

let fooBar = Person2(firstName: "Foo", lastName: "Bar")

fooBar.firstName
fooBar.lastName
fooBar.fullName

// structures are immutable and don't allow to assign value

struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) {
        "Driving ..."
        currentSpeed = speed
    }
}

// if we use let immutableCar = Car(currentSpeed: 10) then we have error
// "Cannot use mutating member on immutable value: 'immutableCar' is a 'let' constant" because we are calling mutable value using let. let cann't use for mutable 

var mutableCar = Car(currentSpeed: 10)
mutableCar.drive(speed: 20)
mutableCar.currentSpeed

// you make copy of mutable car
let copy = mutableCar
mutableCar.currentSpeed
mutableCar.drive(speed: 30)
mutableCar.currentSpeed
copy.currentSpeed

// structured can't be subclassing
struct LivingThing {
    init() {
        "I'm living thing"
    }
}

//struct Animal: LivingThing { // error
//
//}

struct Bike {
    let manufacturer: String
    let currentSpeed: Int
}

let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)

var bike2 = bike1
// bike2.currentSpeed = 30 ==> Cannot assign to property: 'currentSpeed' is a 'let' constant

// another way to avoid "Cannot assign to property: 'currentSpeed' is a 'let' constant"

struct Bike1 {
    let manufacturer: String
    let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike1 {
        Bike1(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike11 = Bike1(manufacturer: "HD", currentSpeed: 20)
let bike22 = bike11.copy(currentSpeed: 30)
bike11.currentSpeed
bike22.currentSpeed
