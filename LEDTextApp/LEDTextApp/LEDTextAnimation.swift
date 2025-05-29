
import SwiftUI

struct LEDTextAnimation: View {
    @Binding var text :String
    @Binding var textsize:CGFloat
    @Binding var Tcolor:String
    @Binding var Bcolor:String
    @Binding var font:String
    @State var textWidth: CGFloat = 0
    @State var offset: CGFloat = 0
    var body: some View {
        ZStack{
            GeometryReader(content: { geometry in
                Image(.led).renderingMode(.template)
                    .resizable().scaledToFill()
                    .foregroundStyle(Color(Bcolor))
                    .frame(width: geometry.size.width , height: geometry.size.height)
                Text(text).bold()
                    .font(.custom(font, size: textsize))
                    .frame( maxHeight: 200)
                    .foregroundStyle(Color(Tcolor))
                    .fixedSize()
                    .background(GeometryReader { textGeometry -> Color in
                        DispatchQueue.main.async {
                            self.textWidth = textGeometry.size.width
                        }
                        return Color.clear
                    })
                    .offset(x: self.offset)
                    .rotationEffect(.degrees(90))
                    .position(x:geometry.size.width / 2)
                    .mask {
                        Image(.led)
                            .renderingMode(.template)
                            .resizable().scaledToFill()
                            .foregroundStyle(.grid)
                            .frame(width: geometry.size.width , height: geometry.size.height)
                    }
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){
                            self.offset = geometry.size.height + textWidth / 2
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                            withAnimation(.linear(duration:20)
                                .repeatForever(autoreverses: false)){
                                    offset = -textWidth / 2
                                }
                        }
                        
                    }
            })
 
            
        }
        .ignoresSafeArea()
  
    }
}

//#Preview {
//    LEDTextAnimation()
//}
 
