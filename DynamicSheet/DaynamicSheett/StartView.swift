 

import SwiftUI

struct StartView: View {
    @Namespace var namespace
    @State var currentView = 0
    @State var keybordshow = false
    @FocusState var padd : Bool
    var body: some View {
        ZStack{
            if currentView == 0 {
                NamesView(currentView: $currentView, id: namespace, keyboradshow: $keybordshow)
                    .matchedGeometryEffect(id: "test", in: namespace)

            }else if currentView == 1 {
                EmailView(currentView: $currentView, id: namespace, keybordshow: $keybordshow)
                .matchedGeometryEffect(id: "test", in: namespace)

                
            }else if currentView == 2{
                profilImage(currentView: $currentView, id: namespace)
            }else{
                HomeView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
        }
    }
}

#Preview {
    StartView()
}
