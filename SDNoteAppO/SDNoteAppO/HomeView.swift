 
import SwiftUI
struct HomeView: View {
    @State var showSideM = false
    var body: some View {
        ZStack{
            ContentView(showside: $showSideM)
            SideMenu()
                .offset(x: -220)
        }
        .offset(x:showSideM ?  220 : 0)
        .animation(.smooth, value: showSideM)
    }
}

#Preview {
    HomeView()
}
