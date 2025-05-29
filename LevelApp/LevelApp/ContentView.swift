 
import SwiftUI

struct ContentView: View {
    @State private var selectedLevel = 0
    @State private var questionIndex = 0
    let levels: [Level] = [
        Level(id: 0, questions: [
            Question(question: "What color is the sky?", possibleAnswers: ["Blue", "Green", "Red"], answerIndex: 0),
            Question(question: "Which animal barks?", possibleAnswers: ["Cat", "Dog", "Bird"], answerIndex: 1),
            Question(question: "What do you drink in the morning?", possibleAnswers: ["Juice", "Milk", "Water"], answerIndex: 1)
        ]),
        
        Level(id: 1, questions: [
            Question(question: "Which fruit is red?", possibleAnswers: ["Apple", "Banana", "Grape"], answerIndex: 0),
            Question(question: "What sound does a cow make?", possibleAnswers: ["Moo", "Woof", "Meow"], answerIndex: 0),
            Question(question: "How many legs does a spider have?", possibleAnswers: ["6", "8", "4"], answerIndex: 1),
            Question(question: "What color is a banana?", possibleAnswers: ["Red", "Yellow", "Green"], answerIndex: 1)
        ]),

        Level(id: 2, questions: [
            Question(question: "What is the first letter of the alphabet?", possibleAnswers: ["B", "C", "A"], answerIndex: 2),
            Question(question: "Which is a type of vegetable?", possibleAnswers: ["Carrot", "Chicken", "Fish"], answerIndex: 0),
            Question(question: "What color is grass?", possibleAnswers: ["Green", "Blue", "Yellow"], answerIndex: 0),
            Question(question: "Which number comes after 3?", possibleAnswers: ["5", "2", "4"], answerIndex: 2),
            Question(question: "Which is a bird?", possibleAnswers: ["Lion", "Eagle", "Elephant"], answerIndex: 1)
        ]),

        Level(id: 3, questions: [
            Question(question: "What is 2 + 2?", possibleAnswers: ["3", "4", "5"], answerIndex: 1),
            Question(question: "Which animal can fly?", possibleAnswers: ["Fish", "Dog", "Bird"], answerIndex: 2),
            Question(question: "What do you wear on your feet?", possibleAnswers: ["Hat", "Shoes", "Gloves"], answerIndex: 1),
            Question(question: "Which animal lives in water?", possibleAnswers: ["Dog", "Fish", "Horse"], answerIndex: 1),
            Question(question: "What do you use to write?", possibleAnswers: ["Pen", "Spoon", "Fork"], answerIndex: 0)
        ]),

        Level(id: 4, questions: [
            Question(question: "How many fingers do you have?", possibleAnswers: ["5", "6", "10"], answerIndex: 2),
            Question(question: "What color is an orange?", possibleAnswers: ["Red", "Orange", "Blue"], answerIndex: 1),
            Question(question: "Which is a farm animal?", possibleAnswers: ["Cow", "Whale", "Shark"], answerIndex: 0),
            Question(question: "What do you see with?", possibleAnswers: ["Eyes", "Ears", "Nose"], answerIndex: 0)
        ]),

        Level(id: 5, questions: [
            Question(question: "Which animal meows?", possibleAnswers: ["Dog", "Cow", "Cat"], answerIndex: 2),
            Question(question: "What color is the sun?", possibleAnswers: ["Yellow", "Green", "Purple"], answerIndex: 0),
            Question(question: "What grows on a tree?", possibleAnswers: ["Fruit", "Fish", "Car"], answerIndex: 0),
            Question(question: "Which season is cold?", possibleAnswers: ["Winter", "Summer", "Spring"], answerIndex: 0),
            Question(question: "Which is a type of transportation?", possibleAnswers: ["Car", "Apple", "Table"], answerIndex: 0),
            Question(question: "What do bees make?", possibleAnswers: ["Milk", "Honey", "Bread"], answerIndex: 1)
        ])
    ]
    var body: some View {
        NavigationView {
            LevelsProgressView(levels: levels, selectedLevel: $selectedLevel, questionIndex: $questionIndex)
                .navigationTitle("Progress Map")
        }
        .tint(.indigo)
    }
}

#Preview {
    ContentView()
}
