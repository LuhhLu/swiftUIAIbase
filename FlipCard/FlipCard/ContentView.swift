 
import SwiftUI

struct ContentView: View {
    @State var  isFlipped = false
    var body: some View {
        ZStack{
            myCard(text: "BACK", textC: .white, color: .b, scolor: .f, isTrue: 0, isFalse: -90, isFlipped: isFlipped)
              
                .animation(isFlipped ? .linear.delay(0.35) : .linear, value: isFlipped)
            
            myCard(text: "FLIP CARD", textC: Color(.t), color: .f, scolor: .b, isTrue: 90, isFalse: 0, isFlipped: isFlipped)
             
                .animation(isFlipped ? .linear  : .linear.delay(0.35), value: isFlipped)
        }
        .onTapGesture {
            withAnimation (.easeIn){
                isFlipped.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
struct myCard: View {
    var text: String
    var textC:Color
    var color:Color
    var scolor:Color
    var isTrue:CGFloat
    var isFalse:CGFloat
    var isFlipped:Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 300)
                .foregroundColor(color)
                .overlay(alignment: .bottomTrailing) {
                    RoundedRectangle(cornerRadius: 20)
                        .trim(from: 0, to: 0.20)
                        .frame(width: 220, height: 200)
                        .foregroundColor(scolor)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.orange)
                }
            
            
            Text(text).bold().font(.title)
                .foregroundStyle(textC)
        }
        .rotation3DEffect(
            .degrees(isFlipped ? isTrue : isFalse),
                                  axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}
