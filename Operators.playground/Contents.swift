import Foundation

let myAge = 22
let yourAge = 20

if myAge > yourAge {
    "I'm older than you"
} else if myAge < yourAge {
    "I'm younger than you"
} else {
    "O hey, we are the same age"
}

let myMotherAge = myAge + 30
let doubleMyAge = myAge * 2

// there are three different types of data types in swift
// 1. unary prefix,
// 2. unary postfix
// 3. binary infix

// 1. unary prefix
let foo = !true // prefix because before the value comes up

// 2. unary postfix
let name = Optional("Chiran") // optional means name can contain a value or not
print(type(of: name))
let unaryPostFix = name! // grap value inside name and assign to unaryPostFix
print(type(of: unaryPostFix))

// 3. binary infix

let result = 1 + 2
let names = "Foo" + " " + "Bar"

// Ternary Operator

let age = 30
//let message: String
//if age >= 18 {
//    message = "You are an adult"
//} else {
//    message = "You are not yet an adult"
//}

let message = age >= 18 ? "You are an adult" : "You are not yet an adult"
