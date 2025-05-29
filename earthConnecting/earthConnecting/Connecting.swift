 

import SwiftUI

struct Connecting: View {
    @State var show = false
    @State var show2 = false
    var body: some View {
        
        VStack(spacing:24) {
            ZStack{ Color.blue
                ZStack {
                    Image(.earth).resizable().scaledToFill()
                        .frame(width: 180, height: 180) .offset(x: show ? -200 : 160)
                    
                    Image(.earth).resizable().scaledToFill()
                        .frame(width: 180, height: 180) .offset(x: show2 ? -200 : 160)
                }
            }
            .frame(width: 150, height: 150)
            .mask { Circle()}
            .overlay {
                Circle().stroke(lineWidth: 3) .frame(width: 150, height: 150)
                    .overlay(alignment: .top) {
                        ShadowCircle(color: .white)
                        ShadowCircle(color: .black)
                            .rotationEffect(.degrees(180))
                    }
//                
            }
            Text("Connecting...") .font(.system(size: 25))
        }
        .onAppear(){
            withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                show.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
                withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                    show2.toggle()
                }
            }
        }
    }
}

#Preview {
    Connecting()
}
