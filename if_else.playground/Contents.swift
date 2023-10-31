import Foundation

let myName = "Chiran"
let myAge = 22
let yourName = "Foo"
let yourAge = 19

if myName == "chiran" {
    "Your name is \(myName)"
} else {
    "Oops, I guessed it wrong"
}

if myName == "Chiran" {
    "Now I guessed it correctly"
} else if myName == "Foo" {
     "Are you foo?"
} else {
    "Okey I give up"
}

if "Chiran" == myName {
    "An uncommon way of doing this"
}

if myName == "chiran" && myAge == 30 {
    "Name is chiran and age is 30"
} else if myAge == 26 {
    "I only guessed the age right"
} else {
    "I don't know what I'm doing"
}

if myAge == 26 || myName == "Foo" {
    "Either age is 20, name is Foo or both"
} else if myName == "Chiran" || myAge == 26 {
    "It's too late to get in this clause"
}


// since there is no paranthesis swift read left to right.

if myName == "Chiran" && myAge == 22 && yourName == "Foo" || yourAge == 19 {

    "My name is Chiran and I'm 26 and your name is Foo...OR... you are 19"
}

if (myName == "Chiran" && myAge == 22) && (yourName == "Foo" || yourAge == 19) {
    "My name is Chiran and I'm 22... AND...  your name is Foo or you are 19"
} else {
    "Hmmm, that didn't work so well"
}
