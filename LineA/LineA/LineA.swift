import SwiftUI

struct WaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 10, y: 40))
        path.addLine(to: CGPoint(x: 27, y: 40))
        path.addLine(to: CGPoint(x: 37, y: 67))
        path.addLine(to: CGPoint(x: 62, y: 13))
        path.addLine(to: CGPoint(x: 70, y: 41))
        path.addLine(to: CGPoint(x: 86, y: 41))
        return path
    }
}

struct LineA: View {
    @State var startTrim: CGFloat = 0
    @State var endTrim: CGFloat = 0
      var body: some View {
        
              ZStack {
                  WaveShape()
                      .stroke(.red.opacity(0.3), lineWidth: 3)
//
//                  WaveShape()
//                      .trim(from: startTrim, to: endTrim)
//                      .stroke(.red, lineWidth: 3)

              }
//              .frame(width: 100, height: 100)
//              .scaleEffect(1.5)
              
          
          .onAppear {
              withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: false)) {
                  startTrim = 1
                  endTrim = 1.4
              }
          }
      }
}

#Preview {
    LineA()
}










//
//
//struct WaveShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        path.move(to: CGPoint(x: 10, y:40))
//
//        path.addLine(to: CGPoint(x: 27, y: 40))
//        path.addLine(to: CGPoint(x: 37, y: 67))
//        path.addLine(to: CGPoint(x: 62, y:13))
//        path.addLine(to: CGPoint(x: 70, y:41))
//        path.addLine(to: CGPoint(x: 86, y:41))
// 
//        return path
//    }
//}
//
//
//import SwiftUI
//
//struct LineA: View {
//    var body: some View {
//        VStack{
//            ZStack{
//                WaveShape()
//                    .stroke(.red.opacity(0.3), lineWidth: 3)
//                          .frame(width: 100, height: 100)
//                         
//                WaveShape()
//                          .stroke(Color.red, lineWidth: 3)
//                          .frame(width: 100, height: 100)
//                    
//            }
//            
//            Spacer()
//        }
//       
//    }
//}
//
//#Preview {
//    LineA()
//}
