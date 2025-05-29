 
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment:.leading,spacing: 40) {
          TypingView(fullText: "Hello, world!")
             
          TypingView(fullText:"New Line")
            
        }
        .frame(width: 220,alignment: .leading)
    }
}

#Preview {
    ContentView()
}
struct TypingView: View {
    @State var displayedText = ""
    var fullText:String
    let typingSpeed = 0.15
    @State var showLine = false
    var body: some View {
        HStack{
            Text(displayedText).font(.largeTitle.bold())
            Rectangle()
                .frame(width: 5, height: 40)
                .opacity(showLine ? 1 : 0)
        }
        .foregroundStyle(.green)
        .onAppear(){
            withAnimation(.linear(duration: 0.5).repeatForever(autoreverses: false)) {
                showLine.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                startTyping()
            }
        }
    }
    func startTyping(){
        displayedText = ""
        for (index,character) in fullText.enumerated(){
            DispatchQueue.main.asyncAfter(deadline: .now() + typingSpeed * Double(index)){
                displayedText.append(character)
                if index == fullText.count - 1 {
                    showLine = false
                }else{
                    showLine.toggle()
                }
            }
        }
    }
}

 
