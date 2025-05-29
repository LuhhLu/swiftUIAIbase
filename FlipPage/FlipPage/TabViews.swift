 

import SwiftUI

struct TabViews: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Library View")
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Library")
                }
            Text("Bookstore View")
                .tabItem {
                    Image(systemName: "bag")
                    Text("Bookstore")
                }
            Text("Audiobooks View")
                .tabItem {
                    Image(systemName: "headphones")
                    Text("Audiobooks")
                }
            Text("Search View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
        .tint(.primary)
    }
}

#Preview {
    TabViews()
}
