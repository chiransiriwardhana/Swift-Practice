import Foundation

func noArgumentAndNoReturnValue() {
    "I don't know what I'm doing"
}

noArgumentAndNoReturnValue()

func plusTwo(value: Int) {
    let newValue = value + 2
}

plusTwo(value: 30)

func newPlusTwo(value: Int) -> Int {
    return value + 2
}

newPlusTwo(value: 3)

func customAdd(value1: Int, value2: Int) -> Int {
    value1 + value2
}

let customAdded = customAdd(value1: 10, value2: 20)

// every argument can have two labels

func someOperation(external1 internalVal1: Int, external2 internalVal2: Int) {
    internalVal1 + internalVal2
}

someOperation(external1: 20, external2: 30)

// ignore external argument
func customMinus(_ lhs: Int, _ rhs: Int) -> Int {
    lhs - rhs
}

customMinus(20, 10)

@discardableResult
func myCustomAdd(_ lhs: Int, _ rhs: Int) -> Int {
    lhs + rhs
}

myCustomAdd(20, 30)

func doSomethingComplicated(with value: Int) -> Int {
    func mainLogic(value: Int) -> Int {
        value + 2
    }
    return mainLogic(value: value + 3)
    // mainLogic function is only available for doSomethingComplicated function
}

doSomethingComplicated(with: 30)

func getFullName(firstName: String = "Foo", lastName: String = "Bar") -> String {
  "\(firstName) \(lastName)"
}

getFullName()
getFullName(firstName: "Baz")
getFullName(lastName: "Foo")
getFullName(firstName: "Baz", lastName: "Qux")
