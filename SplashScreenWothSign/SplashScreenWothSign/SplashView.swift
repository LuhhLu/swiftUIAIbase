 

import SwiftUI

struct SplashView: View {
    @State var showSignView = false
    var body: some View {
        ZStack{
            if showSignView{
                SignView()
            }else{
                ContentView()
            }
        }
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 6){
                showSignView = true
            }
        }
       
    }
}

#Preview {
    SplashView()
}
