
import SwiftUI

struct GlowGradientButton: View {
   let gradientColors = Gradient(colors: [.red, .yellow, .green, .blue, .purple, .pink, .purple])
   var title:String
   @State private var isPressed = false
   @State private var isAnimating = false
   var action:() -> Void
   var body: some View {
       ZStack{
         RoundedRectangle(cornerRadius: 20)
               .stroke(AngularGradient.init(gradient: gradientColors, center: .center, angle: .degrees(isAnimating ? 360 : 0)),lineWidth: 14)
               .frame(width: 210, height: 30)
               .offset(y: 30)
                .blur(radius: 30)
           Text(title)
               .font(.custom("Space Grotesk", size: 24))
               .foregroundColor(.white)
               .frame(width: 280, height: 60)
               .background(.bcolor,in:RoundedRectangle(cornerRadius: 20))
               .overlay {
                   RoundedRectangle(cornerRadius: 20)
                          .stroke(AngularGradient.init(gradient: gradientColors, center: .center, angle: .degrees(isAnimating ? 360 : 0)),lineWidth: 3)
                          .overlay {
                              RoundedRectangle(cornerRadius: 20)
                                  .stroke(lineWidth: 4)
                                  .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black,.black, .clear]), startPoint: .top, endPoint: .bottom))
                          }
               }
       }
       .scaleEffect(isPressed ? 0.95 : 1.0)
       .animation(.easeOut(duration: 0.2), value: isPressed)
       .onTapGesture {
           withAnimation {
               action()
           }
       }
       .onAppear {
           withAnimation(.linear(duration:5).repeatForever(autoreverses: false)) {
               isAnimating = true
           }
       }
       .simultaneousGesture(
                   DragGesture(minimumDistance: 0)
                       .onChanged({ _ in isPressed = true })
                       .onEnded({ _ in isPressed = false })
               )
   }
}

#Preview {
   GlowGradientButton(title: "Next", action: {})
}
