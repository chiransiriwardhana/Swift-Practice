import Foundation

struct Person: Equatable {
    let id: String
    let name: String
}

let foo1 = Person(id: "1", name: "Foo")

let foo2 = Person(id: "1", name: "Bar")

//  when struct conform to Equatable protocol then swift go through all properties and check wheather they are equal or not

if foo1 == foo2 {
    "They are equal!"
} else {
    "They are not equal"
}

let foo3 = Person(id: "1", name: "FFo")

if foo1 == foo3 {
    "They are equal!"
} else {
    "They are not equal"
}

extension Person {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id // since we define equality by comparing ids above code return "They are eqaul". This is custome equality.
    }
}

enum AnimalType: Equatable { // If you don't include Equatable then line 42 throws an error because default AnimalType is not equatable
    case dog(breed: String)
    case cat(breed: String)
}

let dog1 = AnimalType.dog(breed: "Labradoodle")
let dog2 = AnimalType.dog(breed: "Labradoodle")

if dog1 == dog2 {
    "dog1 and dog2 are equal"
} else {
    "They are not equal"
}

// you can achieve this also throgh an extension. Then u don't want to use Equatable in AnimalType enum

enum AnimalType1 {
    case cat(breed: String)
    case dog(breed: String)
}

extension AnimalType1: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
            case let (.dog(lhsBreed), .dog(rhsBreed)), let (.cat(lhsBreed), .cat(rhsBreed)):
                return lhsBreed == rhsBreed
            default:
                return false
        }
    }
}



struct  Animal: Equatable {
    let name: String
    let type: AnimalType1
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.type == rhs.type // we only look at type
    }
}

let cat1 = Animal(name: "Whiskers", type: .cat(breed: "Street cat"))
let cat2 = Animal(name: "whoosh", type: .cat(breed: "Street cat"))

if cat1 == cat2 {
    "They are equal because of their type"
} else {
    "They are not equal"
}
