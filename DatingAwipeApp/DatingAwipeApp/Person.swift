 

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let description: String
    let image: Image
    
    init(name: String, age: Int, description: String) {
        self.name = name
        self.age = age
        self.description = description
        self.image = Image(name)
    }
}

let peopleData = [
    Person(name: "Melisa", age: 36, description: "Lorem ispum dolor sit amet, consectetur adipiscing elit."),
    Person(name: "Britany", age: 27, description: "Lorem ispum dolor sit amet, consectetur adipiscing elit."),
    Person(name: "Ruby", age: 27, description: "Lorem ispum dolor sit amet, consectetur adipiscing elit."),
    Person(name: "Anne", age: 18, description: "Lorem ispum dolor sit amet, consectetur adipiscing elit."),
    Person(name: "Linnea", age: 30, description: "Lorem ispum dolor sit amet, consectetur adipiscing elit."),
  
   
]

// All pictures are from https://www.pexels.com/
