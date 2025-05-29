 

import SwiftUI

struct ContentView: View {
    @State var  showRain = false
    @State var  CloudMovement = false
    @State var  showBolt = false
    var body: some View {
        ZStack {
            Color("BG")
            HStack(spacing:15){
                Rain(height: 20, offset: 30)
                Rain(height: 60, offset: 30)
                Rain(height: 40, offset: 10)
                Rain(height: 30, offset: 30)
                Rain(height: 50, offset: 0)
            }
            .opacity(showRain ? 0 : 1)
            .rotationEffect(.degrees(40))
            .offset(x: showRain ? -80 : 0 , y: showRain ? 100 : 0)
            .offset(x: 30, y: 5)
            Image(systemName: "cloud.fill").font(.system(size: 150))
                .foregroundStyle(.white)
                .offset(x: CloudMovement ? 10 : -10)
               
            Image("bolt").resizable().scaledToFill()
                .frame(width: 50, height: 50)
                .offset(x: -20,y: 60)
                .opacity(showBolt ? 1 : 0)
                 
        }
        .ignoresSafeArea()
        .onAppear{
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: false)) {
                showRain.toggle()
            }
            withAnimation(.linear(duration: 0.6).repeatForever(autoreverses: true)) {
                CloudMovement.toggle()
            }
            withAnimation(.linear.speed(2).repeatForever(autoreverses: true)) {
                showBolt.toggle()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

struct Rain: View {
    var height:CGFloat = 0
    var offset:CGFloat = 0
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(width: 5, height: height)
            .offset(y: offset)
            .foregroundStyle(Color("R"))
    }
}

 
