 

import SwiftUI

struct LoadingCircle: View {
    @State var start = false
    var body: some View {
        ZStack{
            Circle()
                 .frame(width: 100, height: 100)
            
                 .foregroundStyle(AngularGradient(gradient: Gradient(colors: [.gray.opacity(0.1),.gray.opacity(0.25),.gray.opacity(0.5),.gray]), center: .center, angle: .degrees( start ? 360 : 0)))
             
                 .mask{
                    Image(systemName: "circle.dotted").resizable()
                    .frame(width: 100, height: 100)
                 }
            
            Image(systemName: "arrow.down").resizable()
                .frame(width: 40, height: 50)
                .symbolEffect(.pulse)
        }
      
            .onAppear(){
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    start.toggle()
                }
            }
    }
}

#Preview {
    LoadingCircle()
}
//rays , circle.dotted"
