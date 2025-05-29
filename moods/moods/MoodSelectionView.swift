import SwiftUI
struct MoodModel: Identifiable {
    var id = UUID()
    var image:String
    var color: Color
}
struct MoodSelectionView: View {
    var moods: [MoodModel] = [
        .init(image: "good", color: .green),
        .init(image: "happy", color: .yellow),
        .init(image: "normal", color: .indigo),
        .init(image: "sad", color: .blue),
        .init(image: "unhappy", color: .red),
    ]
    @State private var selectedMood: UUID? = nil
    @State var Mood = "today?"
    @State var MoodColor:Color = .primary
  
    
    var body: some View {
        VStack(alignment:.leading) {
            Text("How are you feeling **\(Text(Mood).foregroundStyle(MoodColor))**")
                .contentTransition(.numericText())
                .font(.title2)
                .padding(.bottom, 20)
            HStack {
                ForEach(moods) { mood in
                    Image(mood.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .padding()
                        .background(mood.color.opacity(0.2), in: .rect(cornerRadius: 12))
                        .scaleEffect(selectedMood == mood.id ? 0.8 : 1)
                        .onTapGesture {
                            withAnimation {
                                selectedMood = mood.id
                                Mood =  mood.image
                                MoodColor = mood.color
                            }
                            
                        }
                    
                }
            }//HStack
        }//VStack
    }
}

#Preview {
    MoodSelectionView()
}

