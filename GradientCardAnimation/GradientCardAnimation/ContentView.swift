

import SwiftUI

struct ContentView: View {
    @State var  rotation:CGFloat = 0.0
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 260, height: 340)
                .foregroundColor(Color("c"))
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 130 , height: 500)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("lt"),Color("lb")]), startPoint: .top, endPoint: .bottom))
                .rotationEffect(.degrees(rotation))
                .mask {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(lineWidth: 7)
                        .frame(width: 255, height: 335)
                    
                }
            Text("CARD").bold()
                .font(.largeTitle)
                .foregroundColor(.white)
            
           
        }
        .onAppear{
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)){
                rotation = 360
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
