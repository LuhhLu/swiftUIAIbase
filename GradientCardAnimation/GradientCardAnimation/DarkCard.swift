 

import SwiftUI

struct DarkCard: View {
    @State var  rotation:CGFloat = 0.0
    var body: some View {
        ZStack{
            Color("bg")
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 260, height: 340)
                .foregroundColor(.black)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 500 , height: 200)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("l22").opacity(0.4),Color("l2"),Color("l2"),Color("l2").opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                .rotationEffect(.degrees(rotation))
                .mask {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(lineWidth: 3)
                        .frame(width: 256, height: 336)
                    
                }
            Text("CARD").bold()
                .font(.largeTitle)
                .foregroundColor(.white)
            
           
        }
        .ignoresSafeArea()
        .onAppear{
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)){
                rotation = 360
            }
        }
    }
}

struct DarkCard_Previews: PreviewProvider {
    static var previews: some View {
        DarkCard()
    }
}
