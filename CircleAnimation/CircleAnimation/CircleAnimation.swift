 
import SwiftUI

struct CircleAnimation: View {
    @State var spin = false
    @State var scale = false
    var body: some View {
            ZStack{
                
                Circle() .stroke(lineWidth: 3)
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.gray.opacity(0.3))
                    
                Image("im").resizable().scaledToFill()
                    .frame(width: 170, height: 170)
                    .clipShape(Circle())
                    .scaleEffect( scale ? 1 : 0.9)
                
                Group{
                    Circle().trim(from: 0, to: 0.12)
                        .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        .frame(width: 200, height: 200)
                        .foregroundStyle(.pink)
                    
                    Circle().trim(from: 0, to: 0.12)
                        .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        .frame(width: 200, height: 200)
                        .rotationEffect(.degrees(-180))
                        .foregroundStyle(.blue)
                }
                .rotationEffect(.degrees(spin ? 360 : 0))
            }
        .onAppear(){
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                spin = true
            }
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                scale.toggle()
            }
        }
    }
}

#Preview {
    CircleAnimation()
}

