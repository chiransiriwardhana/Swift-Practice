import Foundation



//func getName(name: String?) -> String? {
//    guard let name else {
//        return nil
//    }
//
//    return "My name is name = \(name)"
//}
//
//getName(name: "Chiran")
//getName(name: nil)

let numbers = [1, 2, 3]
numbers.first
numbers.last
numbers.count
print(numbers.map(-))

var mutatingNumbers = [0, 1, 2]
mutatingNumbers.append(3)
mutatingNumbers.insert(3, at: 0)
print(mutatingNumbers)

mutatingNumbers.insert(contentsOf: [1, 2], at: 0)

for value in numbers {
    value
}

for value in numbers where value % 2 == 0 {
    value
}

let values = numbers.map{ (value: Int) -> Int in
    value * 2
}

print(values)

let valuesString = numbers.map{ (value: Int) -> String in
    String(value * 2)
}

print(valuesString)

let greaterThanOrEqualThree = numbers.filter{ (value: Int) -> Bool in
        value >= 3
}

print(greaterThanOrEqualThree)

//  compactMap is combination of map and filter. If filtering can't happen output is nil. so, output parameter is String?

numbers.compactMap { (value: Int) -> String? in
    value % 2 == 0 ? String(value): nil
}

let numbers2: [Int?] = [1, 2, nil, 4, 5]
numbers2.count // nil is the one of valid element. So, output is 5

let notNils = numbers2.filter { (value: Int?) -> Bool in
    value != nil
}

print(notNils)

let numbers3 = [1, 2, 1, 2]
numbers3.count

// to use hetorogenious array we use as [Any]
let stuff1 = [1, "Hello", 2, "World"] as [Any]
stuff1.count

let stuff2: [Any] = [1, "Hello", 2, "World"]
stuff2.count


// sets
let uniqueNumbers = Set([1, 2, 1, 2, 3]) // sets can't be guaranteed ordering
uniqueNumbers.count
uniqueNumbers.map(-)

// sets can also contain nil

let myNumbers = Set([1, 2, 3, nil, 5])

//  compactMap remove nil values. because you need to return value to be array u put compact map inside Set

let notNilNumbers = Set(myNumbers.compactMap {
    $0 // $0 means current value
})

print(notNilNumbers)

// creating hetorigeneous set

let stuff3: Set<AnyHashable> = [1, 2, 3, "Chiran"]
stuff3.count


//  if you want to extract specific type you can use keyword 'as'
let intsInStuff1 = stuff1.compactMap { (value: Any) -> Int? in
    value as? Int

}

let stringInStuff1 = stuff1.compactMap { (value: Any) -> String? in
    value as? String
}

print(intsInStuff1)
print(stringInStuff1)

let intsInStuff3 = stuff3.compactMap{(value: AnyHashable) -> Int? in
    value as? Int
}

print(intsInStuff3)

type(of: intsInStuff3)
type(of: stuff3)

// Sets calculated uniqueness using hashable protocol

struct Person: Hashable {
    let id: UUID
    let name: String
    let age: Int
}

let fooId = UUID()
let foo = Person(
    id: fooId,  // hashValue = 1
    name: "Foo", // hashValue = 10
    age: 20 // hashValue = 20
)

// overall hash function of foo is 31

let bar = Person(
    id: fooId, // hashValue = 1
    name: "Bar", // hashValue = 30
    age: 30 // hashValue = 40
)
// overall hash value of bar is 71.
// so foo and bar are different. So they can place inside array.


// bar and foo both use fooId

//  let people: Set<Person> = [foo, bar] ==> error doesnot conform to protocol hashable if we doesn't use hashable protocol in struct definition

let people: Set<Person> = [foo, bar]
people.count

// implementing hash functionality

struct Person2: Hashable {
    let id: UUID
    let name: String
    let age: Int

    // implementing own hashing for Person2

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

let bazId = UUID()
let baz = Person2(id: bazId, name: "Baz", age: 20)
let qux = Person2(id: bazId, name: "Qux", age: 30)

if baz == qux {
    "they are equal"
}

let people2 = Set([baz, qux])
people2.first!.name
print(people2)

// dictionaries.

let userInfo = [
    "name": "Foo",
    "age": 20,
    "address": [
        "line1": "Address line 1",
        "postCode": "12345"
    ]
] as [String: Any]

userInfo["name"]
userInfo["age"]
userInfo["address"]
(userInfo["address"] as! [String: String])["postCode"]

userInfo.keys
userInfo.values

// grab every key and associated value can be done as below

for (key, value) in userInfo {
    print(key)
    print(value)
}

for (key, value) in userInfo where value is Int {
    key
    value
}

for (key, value) in userInfo where value is Int && key.count > 2 {
    key
    value
}
