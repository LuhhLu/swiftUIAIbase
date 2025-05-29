import SwiftUI
struct CardView: View {
    var body: some View {
        Text("Card View").font(.largeTitle)
        // Your custom content here
            
    }
}
struct FavoriteView: View {
    var body: some View {
        Text("Search View").font(.largeTitle)
        // Your custom content here
    }
}
struct HomeView: View {
    var body: some View {
        Text("Home View").font(.largeTitle)
        // Your custom content here
    }
}
struct PurchasesView: View {
    var body: some View {
        Text("Favorite View").font(.largeTitle)
        // Your custom content here
    }
}
struct Homeview: View {
    @State private var selectedTab: TabIcon = .Home
    @State var taboffset :CGFloat = 0
    var body: some View {
        ZStack {
            // Your Views
            switch selectedTab {
            case .Home:
                ContentView(TBOffset: $taboffset)
            case .Card:
                CardView()
            case .Favorite:
                FavoriteView()
            case .Purchases:
                PurchasesView()
            default:
                Text("Selection does not correspond to a tab")
            }

            // Your custom TabBar
            VStack {
                Spacer()
                TabBar(selectedTab: $selectedTab)
                    .offset(y: taboffset)
                    .animation(.spring(duration: 1), value: taboffset)
            }
        }
    }
}

 
 

#Preview {
    Homeview()
}
