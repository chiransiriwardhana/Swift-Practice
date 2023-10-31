import Foundation

struct Person {
    let firstName: String?
    let lastName: String?

    enum Errors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNameAreNil
    }

    func getFullName() throws -> String {
        switch (firstName, lastName) {
            case(.none, .none):
                throw Errors.bothNameAreNil
            case (.none, .some):
                throw Errors.firstNameIsNil
            case (.some, .none):
                throw Errors.lastNameIsNil
            case let (.some(firstName), .some(lastName)):
                return "\(firstName) \(lastName)"
        }
    }
}

let foo = Person(firstName: "Foo", lastName: nil)

do {
    let fullName = try foo.getFullName()
} catch {
    "Got an error = \(error)" // catch has internal hidden variable called error
}

do {
    let fullName = try foo.getFullName()
    fullName
} catch is Person.Errors {
    "Got an error"
}

let bar = Person(firstName: nil, lastName: nil)

do {
    let fullName = try bar.getFullName()
    // fullName
} catch Person.Errors.firstNameIsNil {
    "Firstname is nil"
} catch Person.Errors.lastNameIsNil {
    "Lastname is nil"
} catch Person.Errors.bothNameAreNil {
    "Bothnames are nil"
} catch {
    "Some other error is thrown"
}

struct Car {
    let manufacturer: String

    enum Errors: Error {
        case invalidManufacturer
    }

    init(manufacturer: String) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = try Car(manufacturer: "")
    myCar.manufacturer
} catch Car.Errors.invalidManufacturer {
    "Invalid manufacturer"
} catch {
    "Some other error"
}

if let yourCar = try? Car(manufacturer: "Tesla") {
    // try? means optionally call the function
    "Success, your car = \(yourCar)"
} else {
    "Failed to construct and error is not accessible now"
}

let theirCar = try! Car(manufacturer: "Ford")// don't use this try! unwrappe because it cause to crash the application if manufacturer is ""
theirCar.manufacturer

struct Dog {

    let isInjured: Bool
    let isSleeping: Bool

    enum BarkingErrors: Error {
        case cannotBarkIsSleeping
    }

    func bark() throws {
        if isSleeping {
            throw BarkingErrors.cannotBarkIsSleeping
        }
        "Bark..."
    }

    enum RunningErrors: Error {
        case cannotRunIsInjured
    }

    func run() throws {
        if isInjured {
            throw RunningErrors.cannotRunIsInjured
        }
        "Run..."
    }

    func barkAndRun() throws {
        try bark()
        try run()
    }
}

let dog = Dog(isInjured: true, isSleeping: true)

do {

    try dog.barkAndRun()

} catch Dog.BarkingErrors.cannotBarkIsSleeping, Dog.RunningErrors.cannotRunIsInjured {

    "Cannot-bark-is-sleeping OR cannot-run-is-injured"
} catch {
    "Some other error"
}


do {

    try dog.barkAndRun()

} catch Dog.BarkingErrors.cannotBarkIsSleeping {
    "Cannot-bark-is-sleeping" // since barkAndRun() has try bark() as first, this line will execute
} catch Dog.RunningErrors.cannotRunIsInjured {
    "Cannot-run-is-injured"
} catch {
    "Some other error"
}

func fullName(firstName: String?, lastName: String?, calculator: (String?, String?) throws -> String? ) rethrows -> String? {

    // rethrows use when we have closure as an arguemnt which also throws an error
    try calculator (firstName, lastName)

}

enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func + (firstName: String?, lastName: String?) throws -> String? {
    guard let firstName, !firstName.isEmpty else {
        throw NameErrors.firstNameIsInvalid
    }

    guard let lastName, !lastName.isEmpty else {
        throw NameErrors.lastNameIsInvalid
    }

    return "\(firstName) \(lastName)"
}

do {
    let foobar = try fullName(firstName: "Foo", lastName: nil, calculator: +)

} catch NameErrors.firstNameIsInvalid {
    "FirstName is invalid"

} catch NameErrors.lastNameIsInvalid {
    "Last name is invalid"

} catch let err {
    "Some other error = \(err)"
}

enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(from int: Int) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(IntegerErrors.noPositiveIntegerBefore(thisValue: int))
    }

    return Result.success(int - 1)
}

func performGet(forvalue value: Int) {
    // Result is Enum
    switch getPreviousPositiveInteger(from: value) {
        case let .success(previousValue):
            "Previous value is \(previousValue)"
        case let .failure(error):
            switch error {
                case let .noPositiveIntegerBefore(thisValue):
                    "No positive integer before \(thisValue)"
            }
    }
}

performGet(forvalue: 0)
performGet(forvalue: 2)
