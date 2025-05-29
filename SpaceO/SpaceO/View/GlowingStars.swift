 
import SwiftUI

struct GlowingStars: View {
    let starCount: Int = 500
    let starCount2: Int = 10
    @State var show = false
    @State var show2 = false
    @State var show3 = false
    var body: some View {
        ZStack{
            ForEach(0..<starCount2, id: \.self) { item in
                GlowStar()
                    .opacity(show ? 1 : 0)
                    .animation(.easeOut.delay(Double(item) * 0.5), value: show)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                withAnimation(.spring(duration:5)) {
                    show.toggle()
                }
            }
            
        }

    }
}

#Preview {
    GlowingStars()
}

struct GlowStar: View {
    @State var position: CGPoint = CGPoint(x: 0, y: 0)
    @State var shadowRadius: CGFloat = 10
    let diameter = CGFloat.random(in: 2...3)
   var body: some View {
       GeometryReader { geometry in
           Circle()
               .fill(Color.white)
               .frame(width: diameter, height: diameter)
               .shadow(color: .white, radius: shadowRadius)
               .shadow(color: .white, radius: shadowRadius)
               .shadow(color: .white, radius: shadowRadius)
               .shadow(color: .white, radius: shadowRadius)
               .shadow(color: .white, radius: shadowRadius)
               .position(x: position.x, y: position.y)
               .onAppear {
                   position = CGPoint(x: CGFloat.random(in: 0...geometry.size.width),
                                      y: CGFloat.random(in: 0...geometry.size.height))
            }
       }
   }
}

