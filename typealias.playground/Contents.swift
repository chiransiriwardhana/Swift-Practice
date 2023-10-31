import Foundation

typealias StudentName = String

let name: StudentName = "Jack"

name

class Student {
    var age: Int
    var name: String
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
}

var student1 = Student(age: 14, name: "Chiran")
var student2 = Student(age: 10, name: "Chirani")

typealias Students = Array<Student>

var students: Students = []

// students = [student1, student2]

students.append(student1)
students.append(student2)
students.count

for ele in students {
    print("student \(ele.name) is \(ele.age) years old")
}

typealias CompletionHandler = () -> String

func someMethod(oncomp: CompletionHandler) {
    print(oncomp())
}

var function = { "Hi" }

someMethod(oncomp: function)
print(function())
