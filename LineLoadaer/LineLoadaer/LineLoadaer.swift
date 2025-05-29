 

import SwiftUI

struct LineLoadaer: View {
    @State  var activeIndex = 0
    let colors: [Color] = [.blue, .green, .yellow, .yellow, .red]
    var body: some View {

            HStack(spacing: 6) {
                ForEach(0..<5) { index in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(colors[index])
                        .frame(width: 4, height: activeIndex == index ? 80 : 5)
                        .animation(.spring(duration: 0.9), value: activeIndex)
                }
            }
        
            .onAppear {
                startAnimation()
            }
        
    }
    
      func startAnimation() {
        Timer.scheduledTimer(withTimeInterval:0.25, repeats: true) { timer in
                activeIndex = (activeIndex + 1) % 5
        }
    }
    
}

#Preview {
    LineLoadaer()
}











//
//
//
//import SwiftUI
//
//struct LineLoadaer: View {
//   @State private var animate = false
//    
//    let colors: [Color] = [
//        Color(red: 0.298, green: 0.525, blue: 0.976), // #4c86f9
//        Color(red: 0.286, green: 0.659, blue: 0.298), // #49a84c
//        Color(red: 0.965, green: 0.733, blue: 0.008), // #f6bb02
//        Color(red: 0.965, green: 0.733, blue: 0.008), // #f6bb02
//        Color(red: 0.129, green: 0.588, blue: 0.949)  // #2196f3
//    ]
//    
//    var body: some View {
//        GeometryReader { geometry in
//            HStack(spacing: 6) {
//                ForEach(0..<5) { index in
//                    Rectangle()
//                        .fill(colors[index])
//                        .frame(width: 4, height: animate ? 50 : 5)
//                        .animation(
//                            Animation.easeInOut(duration: 0.9)
//                                .repeatForever(autoreverses: true)
//                                .delay(Double(index) * 0.1),
//                            value: animate
//                        )
//                }
//            }
//            .frame(width: geometry.size.width, height: geometry.size.height)
//            .onAppear {
//                animate.toggle()
//            }
//        }
//        .frame(width: 100, height: 100)
//    }
//}
//
//#Preview {
//   LineLoadaer()
//}





//
//
//import SwiftUI
//
//struct LineLoadaer: View {
//   @State  var activeIndex = 0
//   @State  var interval: TimeInterval = 0.15
//   let colors: [Color] = [.blue, .green, .yellow, .yellow, .blue]
//   
//   var body: some View {
//
//           HStack(spacing: 6) {
//               ForEach(0..<5) { index in
//                   Rectangle()
//                       .fill(colors[index])
//                       .frame(width: 4, height: activeIndex == index ? 70 : 5)
//                       .animation(.spring(duration: 0.8), value: activeIndex)
//               }
//           }
//           .onAppear {
//               startAnimation()
//           }
//   }
//     func startAnimation() {
//       Timer.scheduledTimer(withTimeInterval:0.2, repeats: true) { timer in
//        
//               activeIndex = (activeIndex + 1) % 5
//           
//   
//       }
//   }
//}
//
//#Preview {
//   LineLoadaer()
//}
//
