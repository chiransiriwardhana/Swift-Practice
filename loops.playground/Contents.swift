import Foundation

let languages = ["Swift", "Java", "Go", "JavaScript"]

for language in languages {
    print(language)
}

for language in languages where language != "Java" {
    print(language)
}

for i in 1...3 {
    print("i = \(i)")
}

for _ in 1...3 {
    print("*")
}

for i in stride(from: 1, to: 10, by: 2) {
    print(i)
}

for i in 0...4 {
    print("i = \(i)")
}
