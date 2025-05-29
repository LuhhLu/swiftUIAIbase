

import SwiftUI

struct CardListView: View {
    @State var selectedQuestion: QuestionModel?
    @State var newName = ""
    @State var newQuestion = ""
    @State var newAnswer = ""
    @EnvironmentObject var vm: Manager
    var body: some View {
        List {
            ForEach(vm.questionList) { items in
                Button {
                    self.selectedQuestion = items
                    self.newName = items.name
                    self.newQuestion = items.question
                    self.newAnswer = items.answer
                    
                } label: {
                    VStack(alignment: .leading){
                        Text(items.name).bold()
                        Text(items.question)
                        Text(items.answer)
                            .foregroundColor(.gray)
                            .font(.system(size: 10))
                    }
                    .frame(height: 50)
                }

            }
            .onDelete(perform: vm.deletcard)
           
            
        }
        .navigationTitle("All Caeds")
        .listStyle(PlainListStyle())
        .sheet(item: $selectedQuestion) { items in
            UpDateCardView(selectedQuestion: items, newName: $newName, newQuestion: $newQuestion, newAnswer: $newAnswer)
                .presentationDetents([.fraction(0.45)])
                .presentationDragIndicator(.visible)
        }
    }
}

struct AardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
            .environmentObject(Manager())
    }
}
