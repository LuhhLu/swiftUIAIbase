 

import SwiftUI

struct CustomGameLevelView: View {
    let level: Level
    @State private var selectedAnswer: Int? = nil
    @State private var isCorrect: Bool? = nil
    @State private var isProcessing = false
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedLevel: Int
    @Binding var questionIndex: Int

    init(level: Level, selectedLevel: Binding<Int>, questionIndex: Binding<Int>) {
        self.level = level
        self._selectedLevel = selectedLevel
        self._questionIndex = questionIndex
    }
    var body: some View {
        VStack(spacing:46){
            Spacer()
            Text(level.questions[questionIndex].question)
                .font(.largeTitle).bold()
                .multilineTextAlignment(.center)
                .frame(height: 150)
            VStack(spacing:16){
                ForEach(0..<level.questions[questionIndex].possibleAnswers.count,id: \.self) { number in
                    Text(level.questions[questionIndex].possibleAnswers[number])
                        .padding(.vertical,12).frame(maxWidth: .infinity)
                        .background(
                            isCorrect == nil || selectedAnswer != number ? Color(.systemGray6) :
                                (number == level.questions[questionIndex].answerIndex ? Color.green : Color.red),in:.rect(cornerRadius: 12)
                            
                        )
                        .onTapGesture {
                            if !isProcessing{
                                selectedAnswer = number
                                checkAnswer (number)
                            }
                        }
                        .foregroundStyle(selectedAnswer == number ? .white : .gray)
                }
            }
            .frame(height: 200)
            Spacer()
          
        }
        .padding(.horizontal)
        .navigationTitle("Level \(level.id + 1) ")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Text("\(questionIndex + 1)/\(level.questions.count)")
                    .font(.system(size: 11))
                    .lineLimit(1)
                    .scaledToFit()
                    .minimumScaleFactor(0.1)
                    .frame(width: 30, height: 30)
                    .background(.indigo)
                    .clipShape(Circle())
            }
        }
        
    }
    func checkAnswer(_ selected: Int) {
        isProcessing = true
        isCorrect = (selected == level.questions[questionIndex].answerIndex)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if isCorrect == true {
                questionIndex += 1
                if questionIndex == level.questions.count {
                    dismiss()
                    selectedLevel += 1
                    questionIndex = 0
                }
            }
            selectedAnswer = nil
            isCorrect = nil
            isProcessing = false
        }
    }
}
#Preview {
    NavigationView {
        CustomGameLevelView(level: Level(id: 0, questions: [Question(question: "What color is the sky", possibleAnswers: ["Blue", "Green", "Red"], answerIndex: 0)]), selectedLevel: .constant(0), questionIndex: .constant(0))
    }
}

//#Preview {
//    ContentView()
//}
