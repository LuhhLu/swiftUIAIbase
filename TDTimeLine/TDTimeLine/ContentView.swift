

import SwiftUI
struct TDModel: Identifiable {
    var id = UUID()
    var title: String
    var isComplete: Bool
}
struct ContentView: View {
    @State var items: [TDModel] = [
        TDModel(title: "learn swiftui", isComplete: false),
        TDModel(title: "swiftui animation", isComplete: false),
        TDModel(title: "swiftdata", isComplete: false)
    ]
    var body: some View {
        ScrollView{
            VStack(spacing:0) {
                ForEach(items.indices,id: \.self) { item in
                    HStack{
                        Image(systemName:items[item].isComplete ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(items[item].isComplete ? .green : .primary)
                        Text(items[item].title)
                            .strikethrough(items[item].isComplete)
                            .animation(.none, value: items[item].isComplete)
                        Spacer()
                    }
                    .font(.title2)
                    .overlay(alignment: .topLeading) {
                        Rectangle()
                            .frame(width: 1, height:items[item].isComplete ? 68 : 0)
                            .offset(y: 24)
                            .padding(.leading,12)
                    }
                    .frame(height: 90)
                    .onTapGesture {
                        withAnimation {
                            items[item].isComplete.toggle()
                        }
                    }
                   
                   
                }
                HStack {
                    Image(systemName:items.allSatisfy{$0.isComplete} ? "checkmark.circle.fill" : "circle")
                    Text("Finish")
                    Spacer()
                }
                .foregroundColor(items.allSatisfy{$0.isComplete} ? .green : .gray)
                .font(.title2)
                .frame(height: 58, alignment: .bottom)
                .onTapGesture {
                    toggleItems()
                      
                    
                }
            }
           
            .padding()
             
        }
    }
    func toggleItems() {
        let allTrue = items.allSatisfy({ $0.isComplete })
        updateItemsSequentially(makeTrue: !allTrue, reverse: allTrue)
    }
    func updateItemsSequentially(makeTrue: Bool, reverse: Bool) {
        let delayStep = 0.5
        let indices = reverse ? Array(items.indices.reversed()) : Array(items.indices)
        for (offset, index) in indices.enumerated() {
            let delay = Double(offset) * delayStep
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation {
                    items[index].isComplete = makeTrue
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
