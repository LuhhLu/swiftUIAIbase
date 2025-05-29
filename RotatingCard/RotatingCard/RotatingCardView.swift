import SwiftUI

struct RotatingCard: View {
    var imageName: String
    var rotationAngle: Double
    var yOffset: CGFloat
    var show: Bool
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 230, height: 290)
            .rotation3DEffect(
                .radians(show ? 1 : 0),
                axis: (x: 0.8, y: 1.3, z: 0.3),
                anchor: .center,
                anchorZ: 0.0,
                perspective: show ? 0.5 : 0
            )
            .rotationEffect(.degrees(show ? rotationAngle : 0))
            .offset(y: show ? yOffset : 0)
    }
}

struct RotatingCardView: View {
    @State var show = false
    var body: some View {
   
        ZStack {
            RotatingCard(imageName: "m1", rotationAngle: -60, yOffset: 60, show: show)
            RotatingCard(imageName: "m2", rotationAngle: -60, yOffset: 0, show: show)
            RotatingCard(imageName: "m3", rotationAngle: -60, yOffset: -60, show: show)
        }
        .onTapGesture {
            withAnimation(.bouncy(duration: 0.5, extraBounce: 0.01)) {
                show.toggle()
            }
        }
    }
}

#Preview {
    RotatingCardView()
}



//
//import SwiftUI
//
//struct Textine: View {
//   @State var show = true
//   var body: some View {
//       ZStack{
//           Color.white.ignoresSafeArea()
//           Image(.m1).resizable().scaledToFill()
//               .frame(width: 230, height: 290)
//               .rotation3DEffect(
//                   .radians(show ?  1 : 0),
//                   axis: (x: 0.8 , y: 1.3 , 0.3 ),
//                   anchor: .center,
//                   anchorZ: 0.0,
//                   perspective:show ? 0.5 : 0
//               )
//               .rotationEffect(.degrees(show ? -60 : 0))
//               .offset(y:show ?  60 : 0)
//           
//           Image(.m2).resizable().scaledToFill()
//               .frame(width: 230, height: 290)
//               .rotation3DEffect(
//                   .radians(show ?  1 : 0),
//                   axis: (x: 0.8 , y: 1.3 , 0.3 ),
//                   anchor: .center,
//                   anchorZ: 0.0,
//                   perspective:show ? 0.5 : 0
//               )
//               .rotationEffect(.degrees(show ? -60 : 0))
//           
//           Image(.m3).resizable().scaledToFill()
//               .frame(width: 230, height: 290)
//               .rotation3DEffect(
//                   .radians(show ?  1 : 0),
//                   axis: (x: 0.8 , y: 1.3 , 0.3 ),
//                   anchor: .center,
//                   anchorZ: 0.0,
//                   perspective:show ? 0.5 : 0
//               )
//               .rotationEffect(.degrees(show ? -60 : 0))
//               .offset(y:show ?  -60 : 0)
//       }
//
//       .onTapGesture {
//           withAnimation(.spring) {
//               show.toggle()
//           }
//       }
//       
//            
//   }
//}
//
//#Preview {
//   Textine()
//}
//
