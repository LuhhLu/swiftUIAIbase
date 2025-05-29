 

import SwiftUI
struct TDModel: Identifiable {
    var id = UUID()
    var title: String
    var detalis: String
    var isComplete: Bool = false
}
struct TimeLineView: View {
    @State var items: [TDModel] = [
        TDModel(title: "Complete SwiftUI Tutorial", detalis: "Follow the latest SwiftUI tutorial to enhance your UI building skills and explore new features."),
        TDModel(title: "Implement Animations", detalis: "Add smooth animations to your SwiftUI project to improve user experience."),
        TDModel(title: "Set Up SwiftData", detalis: "Configure SwiftData in your project to handle data persistence and explore its capabilities."),
        TDModel(title: "Refactor Codebase", detalis: "Refactor your existing code to make it more modular and readable, ensuring better maintainability."),
        TDModel(title: "Test New Features", detalis: "Thoroughly test the new features added to your SwiftUI project to ensure stability and performance.")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:16) {
                ForEach(items.indices,id: \.self) { item in
                    TaskView(items: items[item])
                        .background(alignment: .topLeading, content: {
                            GeometryReader{ geo in
                                Rectangle()
                                    .frame(width: 2)
                                    .frame(maxHeight:items[item].isComplete ? geo.size.height - 5: 0)
                                    .offset(y: 23)
                                    .padding(.leading,12)
                                
                            }
                        })
                    
                        .onTapGesture {
                            withAnimation(.spring(duration: 0.3)) {
                                items[item].isComplete.toggle()
                            }
                        }
                }
                HStack{
                    Image(systemName:items.allSatisfy{$0.isComplete} ? "checkmark.circle.fill" : "circle")
                    Text("Finish")
                    Spacer()
                }
                .foregroundStyle(items.allSatisfy{$0.isComplete} ? .green : .gray)
                .font(.title2)
                .onTapGesture {
                    toggleItems()
                }
                
            }
            
            
        }
        .safeAreaPadding()
    }
    func toggleItems(){
        let alltrue = items.allSatisfy({$0.isComplete})
        updateItemsSequentially(makeTrue: !alltrue, reverse: alltrue)
    }
    func updateItemsSequentially(makeTrue:Bool,reverse:Bool){
        let delayStep = 0.3
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
    TimeLineView()
}
