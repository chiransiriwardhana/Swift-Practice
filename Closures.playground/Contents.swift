import Foundation

//func add(_ lhs: Int, _ rhs: Int) -> Int {
//
//}

let add: (Int, Int) -> Int = { (lhs: Int, rhs: Int)-> Int in
    lhs + rhs
}

add(20,30)

func customAdd(_ lhs: Int, _ rhs: Int, using function: (Int, Int) -> Int ) -> Int {
    function(lhs, rhs)
}

customAdd(20, 30,using: {(lhs: Int, rhs: Int) -> Int in
    lhs + rhs
})

customAdd(20, 30) { (lhs: Int, rhs: Int) -> Int in // trailing closure syntax

    lhs + rhs
}

// infering data type
customAdd(30, 30){ (lhs, rhs) in
    lhs + rhs
}

// $ means argument in index 0,1, etc

customAdd(40, 30){
    $0 + $1
}

let ages = [30, 20, 19, 40]
print(ages)

print(ages.sorted(by: {(lhs: Int, rhs: Int) -> Bool in
    lhs > rhs
}))



//func < (lhs: Int, rhs: Int) -> Bool {
//    lhs > rhs
//}

print(ages.sorted(by: <))
print(ages.sorted(by: >))

func customAdd2(
    using function: (Int, Int) -> Int,
    _ lhs: Int,
    _ rhs:Int
) -> Int {
    function(lhs, rhs)
}

customAdd2(using: {(lhs, rhs) in
    lhs + rhs
}, 20, 30)

customAdd2(using: { $0 + $1 + 10}, 20, 30)

func add10To(_ value: Int) -> Int {
    value + 10
}

func add20To(value: Int) -> Int {
    value + 20
}

func doAddition(on value: Int, using function: (Int) -> Int) -> Int {
    function(value)
}

doAddition(on: 20) { (value) in
    value + 30
}

doAddition(on: 20, using: add10To(_:))

doAddition(on: 20, using: add20To(value:))
