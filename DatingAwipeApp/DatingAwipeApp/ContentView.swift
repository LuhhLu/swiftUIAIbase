 
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationBarView()
            CardsView()
        }
        .safeAreaPadding()
        .safeAreaInset(edge: .bottom) {
            TabBarView()
        }
    }
}

#Preview {
    ContentView()
}
