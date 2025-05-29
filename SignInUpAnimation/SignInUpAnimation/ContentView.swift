 

import SwiftUI

struct ContentView: View {
    @State var transition = false
    var body: some View {
        ZStack{
            if transition{
                signup(transtionl: $transition)
             
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }else{
                signin(transtionl: $transition)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
            
            
        }
        .animation(.easeInOut, value: transition)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
