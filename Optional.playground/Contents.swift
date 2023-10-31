import Foundation

func multiplyByTwo(_ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    } else {
        return 0
    }
}

multiplyByTwo()
multiplyByTwo(nil)
multiplyByTwo(4)
multiplyByTwo(8)

let age: Int? = nil

if age != nil {
    "Age is there! How odd!"
} else {
    "Age is nill. Correct"
}

if let age {
    "Age is there. How odd! Its value is \(age)"
} else {
    "No age is present. As expected"
}

func checkAge() {
//    if age == nil {
//        "Age is nil as expected"
//        return
//    }

    guard age != nil else {
        "Age is nil as expected"
        return // return should be
    }

    "Age is not nil here. Strange!"
}

checkAge()

let age2: Int? = 0
func checkAge2() {
    guard let age2 else {
        "Age is nil. How strange"
        return
    }
    "Age2 is not nil as expected. Value = \(age2)"
}

switch age {
    case .none:
        "Age has no value as expected"
        break
    case let .some(value):
        "Age has the value of \(value)"
        break
}

if age2 == 0 {
    "Age2 is 0 as expected, and is not nil"
} else {
    "Age2 is not 0. How strange"
}

if age2 == .some(0) { // equal to if age2 == 0
    "Age2 is 0 as expected, and is not nil"
} else {
    "Age2 is not 0. How strange"
}

struct Person {
    let name: String
    let address: Address?
    struct Address {
        let firstLine: String?
    }
}

let foo: Person = Person(name: "Foo", address: nil)

if let fooFirstAddressLine = foo.address?.firstLine {
    fooFirstAddressLine
} else {
    "Foo doesn't have an address with first line. as expected"
}

if let fooAddress = foo.address, let firstLine = fooAddress.firstLine {
    fooAddress
    firstLine
} else {
    "Foo doesn't have address"
}

let bar: Person? = Person(name: "Bar", address: Person.Address(firstLine: nil))

if bar?.name == "Bar", bar?.address?.firstLine == nil {
    "Bar's name is bar and has no first line of addresss"
} else {
    "Seems like something isn't working right!"
}

let baz: Person? = Person(name: "Baz", address: Person.Address(firstLine: "Baz first line"))

switch baz?.address?.firstLine {
    case let .some(firstLine) where firstLine.starts(with: "Baz"): // where is pattern matching
        "Baz first address line = \(firstLine)"
        break
    case let .some(firstLine):
        "Baz first address line that didn't match the previous case"
        firstLine
        break
    case .none:
        "Baz first address line is nil??? Weird!"
}


func getFullName(firstName: String, lastName: String?) -> String? {
    if let lastName {
        return "\(firstName) \(lastName)"
    } else {
        return nil
    }
}

getFullName(firstName: "Foo", lastName: nil)
getFullName(firstName: "Foo", lastName: "Bar")


func getFullName2(firstName: String, lastName: String?) -> String? {
    guard let lastName else {
        return nil
    }
    return "\(firstName) \(lastName)"
}

getFullName2(firstName: "Foo", lastName: nil)
getFullName2(firstName: "Foo", lastName: "Bar")
