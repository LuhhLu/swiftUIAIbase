import SwiftUI

struct HomeView: View {
    let starCount: Int = 500
    let starCount2: Int = 10
    @State var show = false
    @State var show2 = false
    @State var show3 = false
    var body: some View {
        ZStack {
            GeometryReader(content: { geometry in
                Image(.sp1).resizable().scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            })
            GlowingStars()
            MeteorView(delayAnimation: 3)
            MeteorView(delayAnimation: 6)
            MeteorView(delayAnimation: 9)
            SpaceButton(title: "Get started", action: {
            //action
            })
                .offset(y: -90)
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    HomeView()
}


//RadialGradient(gradient: Gradient(colors: [.purple, .black]), center: .center, startRadius: 100, endRadius: 700)
//    .ignoresSafeArea()


 
