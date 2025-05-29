 

import SwiftUI
struct HomeView: View {
    @State var currentIndex = 0
    let vmCount = 3
    var body: some View {
        VStack {
            if currentIndex < vmCount {
                ContentView(currentIndex: $currentIndex)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            } else {
                Text("Home View..")
                    .onTapGesture {
                        currentIndex = 0
                    }
                 
            }
        }
        
    }
}

#Preview {
    HomeView()
}
