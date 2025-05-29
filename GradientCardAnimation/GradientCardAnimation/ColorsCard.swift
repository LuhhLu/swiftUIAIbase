 

import SwiftUI

struct ColorsCard: View {
    @State var  rotation:CGFloat = 0.0
    var body: some View {
        ZStack{
            Color("bg")
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 440, height: 440)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red,.orange,.yellow,.green,.blue,.purple,.pink]), startPoint: .top, endPoint: .bottom))
                .rotationEffect(.degrees(rotation))
                .mask {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(lineWidth: 3)
                        .frame(width: 250, height: 335)
                        .blur(radius: 10)

                }

            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 260, height: 340)
                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 520 , height:480)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red,.orange,.yellow,.green,.blue,.purple,.pink]), startPoint: .top, endPoint: .bottom))
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

struct ColorsCard_Previews: PreviewProvider {
    static var previews: some View {
        ColorsCard()
    }
}
