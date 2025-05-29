 

import SwiftUI

struct LoadingDirection: View {
    @State var spin:Double = 0
    var body: some View {
        ZStack{
            VStack{
                Image(systemName: "arrowtriangle.up.fill")
                    .foregroundStyle(.red)
                Image(systemName: "arrowtriangle.down.fill")
                    .foregroundStyle(.blue.gradient)
            }
            .font(.largeTitle)
            .frame(width: 60, height: 60)
        }
        .rotationEffect(.degrees(spin))
        .background(){
            Image(systemName: "rays").resizable()
                .foregroundStyle(AngularGradient.init(gradient: Gradient(colors: [.gray.opacity(0.1),.gray.opacity(0.25),.gray.opacity(0.5),.gray]), center: .center, angle: .degrees(0)))
                .mask {
                    Circle().trim(from: 0, to: 0.5)
                        .frame(width: 60, height: 60)
                        .offset(y: 5)
                        .rotationEffect(.degrees(spin))
                }
        }
        .scaleEffect(2)
        .onAppear(){
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                spin += 360
            }
        }
      
    }
}

#Preview {
    LoadingDirection()
}
//trim(from: 0, to: show ? .random(in: 0...1.0) : 0)
