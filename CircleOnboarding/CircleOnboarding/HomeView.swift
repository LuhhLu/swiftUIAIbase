 
import SwiftUI

struct HomeView: View {
    @Binding var showNextView: Bool
    @State  var isExpanded = false
    @State  var startTyping = false
    @State var showtext = false
    var body: some View {
        ZStack{
         
            GeoView(isExpanded: $isExpanded, startTyping: $startTyping, showtext: $showtext, color: "tview", text: "Start", shouldToggleExpand: false)
            
            VStack(alignment: .leading){
                Text("Swiftui \nFramework").font(.system(size: 50)).bold()
            }
            .opacity(isExpanded ? 1 : 0 )
            .scaleEffect(isExpanded ? 1 : 0)
            .offset(x: isExpanded ? 0 : UIScreen.main.bounds.width)
            
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showNextView: .constant(false))
    }
}
