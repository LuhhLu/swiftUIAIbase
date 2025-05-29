
import SwiftUI

struct SpaceView: View {
   let starCount: Int = 500
   @State var show = false
   var body: some View {
       ZStack{
           Color.black
           ForEach(0..<starCount, id: \.self) { _ in
               StarView()
           }
       }
       .ignoresSafeArea()
   }

}
import SwiftUI

struct StarView: View {
   @State var position: CGPoint = CGPoint(x: 0, y: 0)
    let diameter = CGFloat.random(in: 0.1...3)
   var body: some View {
       GeometryReader { geometry in
           Circle()
               .fill(Color.white)
               .frame(width: diameter, height: diameter)
               .position(x: position.x, y: position.y)
               .onAppear {
                   position = CGPoint(x: CGFloat.random(in: 0...geometry.size.width),
                                      y: CGFloat.random(in: 0...geometry.size.height))
               }
       }
   }
}

#Preview {
    SpaceView()
}






//
//import SwiftUI
//
//struct BgOne: View {
//    let starCount: Int = 500
//    let starCount2: Int = 10
//    @State var show = false
//    
//    var body: some View {
//            ForEach(0..<starCount, id: \.self) { _ in
//                StarView()
//            }
//
//    }
//
//}
//struct StarView: View {
//    @State private var position: CGPoint = CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
//    @State private var shadowRadius: CGFloat = 10
//    let diameter: CGFloat = CGFloat.random(in: 0.1...3)
//    var body: some View {
//        Circle()
//            .fill(Color.white)
//            .frame(width: diameter, height: diameter)
//            .position(position)
//    }
//}
//#Preview {
//    ContentView()
//}
