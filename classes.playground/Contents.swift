import Foundation

// class is reference type
// class should have initializer. structure doesn't need to have initializer.

class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    // mutattion func is not valid
    func increaseAge() {
        self.age += 1
    }
}

let foo = Person(name: "Foo", age: 20)

foo.age
foo.increaseAge() // internally change age
foo.age
foo.age += 10 // externally change
foo.age

//  foo = Person(name: "Bar", age: 20) Cannot assign to value: 'foo' is a 'let' constant
// without changing let foo to var foo, we can internally change using function when let foo = Person(name: "Foo", age: 20)

foo.age
let bar = foo // foo and bar points to same memory location
bar.increaseAge()
foo.age
bar.age

if foo === bar {
    "Foo and bar point to the same memory location"
} else {
    "They don't points to same memory location"
}

class Vehicle {
    func goVroom() {
        "Vroom vroom"
    }
}

class Car: Vehicle {

}

let car = Car()
car.goVroom()


class Person2 {
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    func increaseAge() {
        self.age += 1
    }
}

let baz = Person2(age: 20)
baz.age
// baz.age += 1 Left side of mutating operator isn't mutable: 'age' setter is inaccessible
// If we remove private(set) then we can change outside as well.

baz.increaseAge()
baz.age

class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int

    init() { // designated initializer

        model = "X"
        year = 2023
        // self.init(model: "X", year: 2023) Designated initializer for 'Tesla' cannot delegate another one. Designated initializer can't rely on another one
    }

    init(model: String, year:Int) { // designated initializer
        self.model = model
        self.year = year
    }

//  Convenience initializers are used when you have some class with a lot of properties that makes it kind of "Painful" to always initialize wit with all that variables, so what you do with convenience initializer is that you just pass some of the variables to initialize the object, and assign the rest with a default value.

    convenience init(model: String) {
        self.init(model: model, year: 2023) //  convenience initializer can rely on another one
    }
}

class TeslaModelY: Tesla {

    override init() {
        // super.init(model: "Y", year: 2023)
        // super.init(model: "Y") inside designated initializer you can't call convenience initializer

        super.init(model: "Y", year: 2023)
    }
}

let modelY = TeslaModelY()
modelY.model
modelY.year
modelY.manufacturer

let foobar = Person2(age: 20)
foobar.age
func doSOmething(with person: Person2) {
    person.increaseAge()
}

doSOmething(with: foobar)
foobar.age

class MyClass {
    init() {
        "Initialized"
    }

    func doSomething() {
        "Do something"
    }

    deinit {
        "Deinitialized"
    }
}

let myClousure = {
    let myClass = MyClass()
    myClass.doSomething()
}

myClousure() // at the end of calling myClousure deinitializer will call
