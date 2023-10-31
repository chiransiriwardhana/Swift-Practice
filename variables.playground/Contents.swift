import Foundation

// let variable can't be assigned again
// var can be assigned again

let myName = "chiran"
let yourName  = "siriwardena"
var names = [
    myName,
    yourName
]

// can't assign value to array declared with let.

//let names1 = [myName, yourName]
//
//names1.append("Bar")
//names1.append("foo")

names = ["Bla"] // mutating variable names
names.append("Bar") // mutating variable
names.append("Baz") // mutating variable

let foo = "Foo"
// foo2 and foo points to same memory loaction.but changing foo2 doesn't affect foo.
// this is how value type works in swift.

var foo2 = foo
foo2 = "Foo2"
foo
foo2

// swift has two types. value type and reference type.

let moreNames = ["Foo", "Bar"]
var copy = moreNames
copy.append("Baz")
print(moreNames)
print(copy)

let oldArray = NSMutableArray( // NSMutableArray class instance. Inferes can internally mutable
    array: [
        "Foo",
        "bar"
    ]
)

// In here oldArray and newArray are both change eventhough oldArray is use let keyword.
oldArray.add("Baz")
var newArray = oldArray
newArray.add("Qux")
print(oldArray)
print(newArray)

let someNames = NSMutableArray( // NSMutableArray is instance of a class
    array: [
        "Foo",
        "Bar"
    ]
)

// someNames = ["blaz"] Cannot assign to value: 'someNames' is a 'let' constant
someNames.add("chiran") //using built-in function in NSMutable Array

// NSMutableArray is subclass of NSArray
func changeTheArray(_ array:NSArray) {
    let copy = array as! NSMutableArray // casting
    copy.add("Baz")
}

// when calling changeTheArray() we pass reference of someArray. Therefore change in someName is visible to outside of the function.

changeTheArray(someNames)

// changing of array someNames inside a function is visible to outside of the function

print(someNames)  // someNames is internally mutated

// let works with value types and it prevent mutability.
