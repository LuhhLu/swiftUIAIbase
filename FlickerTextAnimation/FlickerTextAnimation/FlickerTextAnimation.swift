 

import SwiftUI
 
struct FlickerTextAnimation: View {
    @State var letterColors: [Color] = Array(repeating: .white, count: "SWIFTUI".count)
    var color:Color = .white// letter color
    let text = "SWIFTUI"
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                ForEach(0..<text.count, id: \.self) { index in
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .foregroundColor(letterColors[index])
                        //If the color of the letter is white, it will contain a shadow.
                        .shadow(color: letterColors[index] == color ? color : .clear, radius: 2)
                        .shadow(color: letterColors[index] == color ? color : .clear, radius: 50)
                }
            }
            .font(.system(size: 60).bold())
            
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                    changeColors()//Restart function every 0.1 second
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                        timer.invalidate() //STOP AFTER 1.5 second
                        letterColors = Array(repeating: color, count: text.count) // Reset all letters to white.
                    }
                }
            }
            .padding(.top,45)
            Spacer()
        }
      
    }
    
      func changeColors() {
        for index in letterColors.indices {
            //We use random to change the color of the letters randomly.
            letterColors[index] = Bool.random() ? .gray.opacity(0.3) : color
        }
    }
    
}

#Preview {
    FlickerTextAnimation()
}








//
//
//import SwiftUI
//
//struct FlickerTextAnimation: View {
//   @State var letterColors: [Color] = Array(repeating: .white, count: "Hello World!".count)
//    let text = "Hello World!"
//   var body: some View {
//       HStack(spacing: 0) {
//           ForEach(0..<text.count, id: \.self) { index in
//               Text(String(text[text.index(text.startIndex, offsetBy: index)]))
//                   .foregroundColor(letterColors[index])
//           }
//       }
//       .font(.largeTitle.bold())
//       
//       .onAppear {
//           Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
//               changeColors()
//               DispatchQueue.main.asyncAfter(deadline: .now() + 1){
//                   timer.invalidate()
//                   letterColors = Array(repeating: .white, count: text.count)
//               }
//           }
//       }
//   }
//   
//   
//     func changeColors() {
//       for index in letterColors.indices {
//           letterColors[index] = Bool.random() ? .gray.opacity(0.3) : .white
//       }
//   }
//}
//
//#Preview {
//   FlickerTextAnimation()
//}
