 
import SwiftUI

struct SmallLED: View {
    @Binding var text :String
    @Binding var textsize:CGFloat
    @Binding var Tcolor:String
    @Binding var Bcolor:String
    @Binding var font:String
    var body: some View {
        ZStack{
            GeometryReader(content: { geometry in
                Image(.hview).renderingMode(.template)
                    .resizable().scaledToFill()
                    .frame(width: geometry.size.width , height: 300)
                    .foregroundStyle(Color(Bcolor))
                    Text(text).bold()
                        .font(.custom(font, size: textsize / 2))
                        .fixedSize(horizontal: true, vertical: false)
                        .foregroundStyle(Color(Tcolor))
                        .position(x:geometry.size.width / 2,y: geometry.size.height / 2)
                    .mask {
                        Image(.hview)
                            .renderingMode(.template)
                            .resizable().scaledToFill()
                            .frame(width: geometry.size.width , height: 300)
                            .foregroundStyle(.grid)
                    }
                  
            })
            .frame(height: 310)
        }
        .ignoresSafeArea()
       
     
    }
}

//#Preview {
//    SmallLED()
//}
