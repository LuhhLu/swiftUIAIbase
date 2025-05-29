 

import SwiftUI

struct SpaceTow: View {
    let starCount: Int = 500
    let starCount2: Int = 10
    @State var show = false
    @State var show2 = false
    @State var show3 = false
    var body: some View {
        ZStack {
            SpaceView()
            GlowingStars()
            MeteorView(delayAnimation: 5)
            MeteorView(delayAnimation: 3)
            MeteorView(delayAnimation: 7)
            SpaceButton(title: "Get started", action: {
            //action
            })
                .offset(y: -90)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SpaceTow()
}
