
import SwiftUI

struct CirclesView: View {
    @Binding  var rotateCircles:Bool
    @Binding  var c1 :Bool
    @Binding  var c2 :Bool
    var body: some View {
        VStack{
            VStack(spacing:30){
                ZStack{
                    Circle()
                        .trim(from: 0, to: 0.25)
                        .stroke(lineWidth: 3)
                        .frame(width: 50, height: 50)
                    
                    Circle()
                        .trim(from: 0, to: 0.23)
                        .stroke(lineWidth: 3)
                        .frame(width: 50, height: 40)
                        .rotationEffect(.degrees(c1 ? 360 : 5))
                        
                    Circle()
                        .trim(from: 0, to: 0.2)
                        .stroke(lineWidth: 3)
                        .frame(width: 50, height: 30)
                        .rotationEffect(.degrees(c2 ? 360 : 10))
                    
                }
                .foregroundStyle(.green)
                .rotationEffect(.degrees(rotateCircles ? 360 + 60 : 60))
                Text("Booking your item").bold()
                
                
                
                
            }
        }
        .frame(width: 250, height: 150)
        .background(.white,in:RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        
    }
}

#Preview {
    CirclesView(rotateCircles: .constant(false), c1: .constant(false), c2: .constant(false))
}
