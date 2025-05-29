
import SwiftUI
struct MoodModel:Identifiable{
    var id = UUID()
    var feeling:String
    var mood:ImageResource
    var color:Color
}
struct ContentView: View {
    @State var feeling = "?"
    @State var Fcolor:Color = .white
    var moods:[MoodModel] = [
        MoodModel(feeling: "Unhappy", mood: .unhappy, color: .cUnhappy),
        MoodModel(feeling: "Sad", mood: .sad, color: .cSad),
        MoodModel(feeling: "Normal", mood: .normal, color: .cNormal),
        MoodModel(feeling: "Good", mood: .good, color: .cGoog),
        MoodModel(feeling: "Happy", mood: .happy, color: .cHappy)
    ]
    @State var selectedMood:ImageResource = .none
    @State var scrollToBottom = false
    var body: some View {
        ScrollViewReader { proxy in
            ZStack(alignment:.bottomTrailing){
                Color.black.ignoresSafeArea()
                CircleView
                ScrollView {
                    VStack(spacing:64){
                        Spacer()
                        Spacer()
                        IconView(Fcolor: $Fcolor, selectedMood: $selectedMood)
                        HStack(spacing:20){
                            ForEach(moods) { mood in
                                VStack(spacing:16){
                                    Image(mood.mood).resizable().scaledToFill()
                                        .frame(width: 45, height: 45)
                                    Text(mood.feeling)
                                        .foregroundStyle(.white)
                                }
                                .scaleEffect(selectedMood == mood.mood ? 1.3 : 0.8)
                                .onTapGesture {
                                    withAnimation {
                                        selectedMood = mood.mood
                                        Fcolor = mood.color
                                        feeling = mood.feeling
                                    }
                                }
                            }
                        }
                        VStack{
                            Spacer()
                            NoteView(scrollToBottom: $scrollToBottom)
                               .id("NoteView")
                            Spacer()
                        }
                       
                       
                    }
                    .padding()
                 
                 
                        
                }
                topTitle
                    .padding()
                    .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
            
            }
            .onChange(of: scrollToBottom) { _, _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                    withAnimation {
                        proxy.scrollTo("NoteView", anchor: .bottom)
                    }
                }
            }
        }
    }
    var CircleView:some View{
        Circle().foregroundStyle(Fcolor)
            .frame(width: 300, height: 300)
            .blur(radius: 200)
            .offset(x: 130, y: 130)
    }
    var topTitle:some View{
        VStack(alignment:.leading,spacing: 10){
            Text("How Do You Feel")
            HStack{
                Text("Today")
                Text(feeling)
                    .foregroundStyle(Fcolor)
                    .contentTransition(.numericText())
            }
        }
        .foregroundStyle(.white)
        .font(.largeTitle.bold())
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}
#Preview {
    ContentView()
}
struct IconView: View {
    @Binding var Fcolor :Color
    @State var scale  = false
    @Binding var selectedMood :ImageResource
    @State var FaceScale :CGFloat = 1
    var body: some View {
        ZStack{
            Circle().frame(width: 220, height: 220)
                .foregroundStyle(Fcolor)
                .opacity(scale ? 0 : 1)
                .scaleEffect(scale ? 1 : 0.4)
            Circle().frame(width: 300, height: 300)
                .foregroundStyle(Fcolor)
                .opacity(scale ? 0 : 1)
                .scaleEffect(scale ? 1 : 0.2)
            Image(selectedMood)
                .resizable().scaledToFill()
                .frame(width: 150, height: 150)
                .scaleEffect(FaceScale)
        }
        .onChange(of: selectedMood, { _, _ in
            withAnimation {
                FaceScale = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                withAnimation(.easeInOut(duration: 0.2)){
                    FaceScale = 1
                }
            }
        })
        
        .onAppear(){
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)){
                scale.toggle()
            }
        }
    }
}

 
