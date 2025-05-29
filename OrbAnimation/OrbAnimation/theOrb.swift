import SwiftUI

struct theOrb: View {
   @State var liquidColor: Color = .indigo
   @State var line = false
   @State var rotation = false
   var body: some View {
           ZStack{
               liquidColor
                   .mask(LiquidView())
                   .blur(radius: 1)
                   .background(liquidColor.opacity(0.3))
                   .background(
                    Color.BG
                        .shadow(.inner(color: .white.opacity(0.5), radius: 2, x: line ? 1 : 0, y: 0))
                    ,in:.circle
                   )
//                   .rotationEffect(.degrees(rotation ? 360 : 0))
               Circle()
                   .frame(width: 20, height: 20)
                   .blur(radius: 10)
                   .offset(y: -10)
                   .rotationEffect(.degrees(rotation ? 360 : 0))
               
           }
           .frame(width: 50, height: 50)
           .clipShape(Circle())
           .overlay(content: {
               Image(systemName: "sparkles")
                   .foregroundStyle(.white)
                   .font(.system(size: 25))
                   .shadow(color: .white, radius: 2, x: 0, y: 0)
                
           })
           
         
       .onAppear(){
           withAnimation(.linear(duration: 5).repeatForever(autoreverses: true)){
               line.toggle()
           }
           withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)){
               rotation.toggle()
           }
       }
     
   }
}

#Preview {
   theOrb()
//    OrbView()
}
