//import Foundation
//
//enum CompassPoint {
//    case north
//    case south
//    case east
//    case west
//}
//
//enum Planet {
//    case mercury, venus, eart, mars, jupiter, saturn, uranus, neptune
//}
//
//var directionToHead = CompassPoint.south
//
////  Once directionToHead is declared as a CompassPoint, you can set it to a different CompassPoint value using a shorter dot syntax:
//
//directionToHead = .east
//switch directionToHead {
//    case .north:
//        print("Lots of planets have north")
//    case .south:
//        print("Watch out for penguins")
//    case .east:
//        print("Where the sun rises")
//    case .west:
//        print("Where the skies are blue")
//}
//
//// Enumerations are categorization of similar data
//
////struct Animal {
////    let type: String
////    init(type: String) {
////        if type == "Rabbit" || type == "Dog" || type == "Cat" {
////            self.type = type
////        } else {
////            preconditionFailure()
////        }
////    }
////}
//
//enum Animal {
//    case cat, dog, rabbit, hedgehog
//}
//
//let cat = Animal.cat
//cat
//
////if cat == Animal.cat {
////    "This is a cat"
////} else if cat == Animal.dog {
////    "This is a dog"
////} else if cat == 3 {
////    "This is something else"
////}
////
////func == (lhs: Animal, rhs: Int) -> Bool {
////    lhs == .rabbit && rhs == 3
////}
//
//if cat == Animal.cat {
//    "This is a cat"
//} else if cat == Animal.dog {
//    "This is a dog"
//} else {
//    "This is something else"
//}
//
//switch cat {
//    case .cat:
//        "This is a cat"
//        break
//    case .dog:
//        "This is a dog"
//        break
//    case .rabbit:
//        "This is a rabbit"
//        break
//    default:
//        "This is default"
//}
//
//func describeAnimal(_ animal: Animal) {
//    switch cat {
//        case .cat:
//            "This is a cat"
//            break
//        case .dog:
//            "This is a dog"
//            break
//        case .rabbit:
//            "This is rabbit"
//            break
//        case .hedgehog:
//            "This is hedgehog"
//            break
//    }
//}
//
//describeAnimal(Animal.rabbit)
//
//enum Shortcut {
//    case fileOrFolder(path: URL, name: String)
//    case wwwUrl(path: URL)
//    case song(artist: String, songName:String)
//}
//
//let wwwApple = Shortcut.wwwUrl(path: URL(string: "https://apple.com")!)
//
//let a: Int? = 5
//print(a!) // unwrapping a
//
//// error: Referencing operator function '==' on 'Equatable' requires that 'Shortcut' conform to 'Equatable'. because swift add implicit equality operator to Animal enum but swift doesn't add equality operator for Shortcut
//
////if wwwApple == Shortcut.wwwUrl(path: URL(string: "https://apple.com")!) {
////
////}
//
//
//switch wwwApple {
//    case .fileOrFolder(path: let path, name: let name):
//        path
//        name
//        break
//    case .wwwUrl(path: let path):
//        path
//        break
//    case .song(artist: let artist, songName: let songName):
//        artist
//        songName
//        break
//}
//
//// another way
//
//switch wwwApple {
//    case .fileOrFolder(let path, let name):
//        path
//        name
//        break
//    case .wwwUrl(let path):
//        path
//        break
//    case .song(let artist, let songName):
//        artist
//        songName
//        break
//}
//
//switch wwwApple {
//    case let .fileOrFolder(path, name): // let apply to all variables
//        path
//        name
//        break
//    case let .wwwUrl(path):
//        path
//        break
//    case let .song(artist, songName):
//        artist
//        songName
//        break
//}
//
//if case let .fileOrFolder(path, name) = wwwApple {
//    path
//    name
//}
//
//if case let .wwwUrl(path) = wwwApple {
//    path
//}
//
//let  withoutYou = Shortcut.song(artist: "Symphony X", songName: "Without You")
//
//if case let .song(_, songName) = withoutYou {
//    songName
//}
//
//enum Vehicle {
//    case car(manufacturer: String, model: String)
//    case bike(manufacturer: String, yearMade: Int)
////    func getManufacturer() -> String {
////        switch self {
////            case let .car(manufacturer, _):
////                return manufacturer
////            case let .bike(manufacturer, _):
////                return manufacturer
////        }
////    }
//
////    var getManufacturer: String {
////        switch self {
////            case let .car(manufacturer, _):
////                return manufacturer
////            case let .bike(manufacturer, _):
////                return manufacturer
////        }
////    }
//
//    var getManufacturer: String {
//        switch self {
//            case let .car(manufacturer, _), let .bike(manufacturer, _):
//                return manufacturer
//        }
//    }
//}
//
////func getManufacturer(from vehicle: Vehicle) -> String {
////    switch vehicle {
////        case let .car(manufacturer, _):
////            return manufacturer
////        case let .bike(manufacturer, _):
////            return manufacturer
////    }
////}
//
//let car = Vehicle.car(manufacturer: "Tesla", model: "X")
//
//car.getManufacturer
//
//switch car {
//    case let .car(manufacturer, _):
//        manufacturer
//        break
//    case let .bike(manufacturer,_):
//        manufacturer
//        break
//}
//
//let bike = Vehicle.bike(manufacturer: "HD", yearMade: 1987)
//
//bike.getManufacturer
//
//enum FamilyMember: String {
//    case father = "Dad"
//    case mother = "Mom"
//    case brother = "Bro"
//    case sister = "Sis"
//}
//
//FamilyMember.father.rawValue
//FamilyMember.brother.rawValue
//
//enum FavoriteEmoji: String, CaseIterable {
//    case blush = "😊"
//    case rocket = "🚀"
//    case fire = "🔥"
//}
//
//print(FavoriteEmoji.allCases)
//print(FavoriteEmoji.allCases.map(\.rawValue))
//
//if let blush = FavoriteEmoji(rawValue: "😊") {
//    "Found the blush emoji"
//    blush
//} else {
//    "This emoji doesn't exist"
//}
//
//if let snow = FavoriteEmoji(rawValue: "❄️") {
//    "Snow exists?! Really?"
//    snow
//} else {
//    "As expected , snow doesn't exist in our enum"
//}
//
//enum Height {
//    case short, medium, long
//
//    mutating func makeLong() {
//        self = Height.long
//    }
//}
//
//var myHeight = Height.medium
//myHeight.makeLong()
//myHeight
//
//indirect enum IntOperation {
//    case add(Int, Int)
//    case sustract(Int, Int)
//    case freeHand(IntOperation)
//
//    func calculateResult(of operation: IntOperation? = nil)->Int {
//        switch operation ?? self {
//            case let .add(lhs, rhs):
//                return lhs + rhs
//            case let .sustract(lhs, rhs):
//                return lhs - rhs
//            case let .freeHand(operation):
//                return calculateResult(of: operation)
//        }
//    }
//}
//
//let freeHand = IntOperation.freeHand(.add(2, 4))
//freeHand.calculateResult()
//freeHand.calculateResult(of: .sustract(1, 2))
//
////enum PersonalInfo<T> {
////    case firstName(T)
////    case lastName(T)
////    case address(T)
////}
////
////let firstName = PersonalInfo.firstName("John")
////let lastName = PersonalInfo.lastName("cooper")
////let address = PersonalInfo.address("No:45", "Temple road", "colombo")
//
//


enum Vehicle<VehicleType> {
    case vehicleType(VehicleType)
}

struct Car {
    let manufacturer: String
    let model: String
    let brandNewOrNot: Bool
}

struct Bike {
    let manufacturer: String
    let yearMade: Int
    let brandNewOrNot: Bool
}


let car = Car(manufacturer: "Tesla" ,model: "model X", brandNewOrNot: true)
let vehicle1 = Vehicle.vehicleType(car)

let bike = Bike(manufacturer: "HD", yearMade: 1990, brandNewOrNot: true)
let vehicle2 = Vehicle.vehicleType(bike)




