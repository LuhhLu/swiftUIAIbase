 
import SwiftUI

struct HomeVeiw: View {
    @State private var blurNum = 10
    @State  var BColor = 0.2
    @State private var show = true
    var body: some View {
        ZStack{
            VStack{
                Text("TourView")
                Rectangle()
                    .frame(width:100, height: 100)
                    .foregroundStyle(.red)
                    .padding(.bottom,100)
            }
            .blur(radius: CGFloat(blurNum))
            Color.black.opacity(BColor)
                .ignoresSafeArea()
            WelcomeView(BColor: $BColor, blurNum: $blurNum, show: $show)
            
        }
    }
}

#Preview {
    HomeVeiw()
}
