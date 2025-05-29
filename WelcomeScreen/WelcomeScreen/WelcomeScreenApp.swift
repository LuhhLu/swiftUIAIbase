 

import SwiftUI

@main
struct WelcomeScreenApp: App {
    @State var show = false
    var body: some Scene {
        WindowGroup {
            
            ZStack{
                if show{
                    HomeVeiw()
                }else{
                    ContentView()
                }
            }
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        show = true
                    }
                }
            }
        }
    }
}
