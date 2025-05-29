 

import SwiftUI

struct ContentView: View {
    @State var textFeild: String = "SwiftUi"
    @State var TStroke: Double = 0.4
    @State var BStroke: Double = 1
    var body: some View {
        ZStack {
//            Color.bg.ignoresSafeArea()
            VStack {
                Slider(value: $BStroke, in: 1...2.8)
                Slider(value: $TStroke, in: 0.4...4)
                Spacer()
                Text(textFeild).foregroundStyle(.black).font(.custom("ChalkboardSE-Regular", size: 58)).bold()
                    .font(.system(size: 60, weight: .bold))
                    .CustomStrok(color: .white, width: TStroke)
                    .CustomStrok(color: .blue, width: BStroke)
                    .CustomStrok(color: .orange, width: BStroke)
//                    .CustomStrok(color: .yellow, width: BStroke)
//                    .CustomStrok(color: .green, width: BStroke)
//                    .CustomStrok(color: .purple, width: BStroke)
                    .offset(y: -200)
                Spacer()
            TextField("your text", text: $textFeild)
                .padding(10)
                .padding(.leading,10)
                .background(
                    Color.gray
                        .opacity(0.3)
                        .cornerRadius(15)
                )
                .padding(20)
            }
           
           
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
extension View {
   func CustomStrok(color:Color,width:CGFloat) -> some View{
        modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
}
 
struct StrokeModifier : ViewModifier{
    private let id = UUID()
    var strokeSize: CGFloat = 1
    var strokeColor: Color = .blue
    
    func body(content: Content) -> some View {
        content
            .padding(strokeSize*2)
            .background(
                Rectangle()
                .foregroundStyle(strokeColor)
                .mask({
                    outline(context: content)
                })
            )
    }
    func outline(context:Content) ->  some View {
        Canvas{ context , size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { layer in
                if let text = context.resolveSymbol(id: id){
                    layer.draw(text,at: .init(x: size.width/2, y: size.height/2))
                }
            }
            
        }symbols: {
            context.tag(id)
                .blur(radius: strokeSize)
        }
        
    }
}
