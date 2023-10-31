import Foundation

class StudentClass {
    var name: String
    var grade: Int
    init(name: String, grade: Int) {
        self.name = name
        self.grade = grade
    }
}

let student1 = StudentClass(name: "Chiran", grade: 12)
let student2 = student1

student2.name = "Chirani"

print("student1 name: \(student1.name)")
print("student2 name: \(student2.name)")


struct StudentStruct {
    var name: String
    var grade: Int
}

var student3 = StudentStruct(name: "Anish Sharma", grade: 8)
var student4 = student3
student4.name = "Anish Gupta"

print("student3 name: \(student3.name)")
print("student4 name: \(student4.name)")
