 

import SwiftUI

struct HomeView: View {
    @State var selectedTab: TabIcon = .Home
      var imageManager = ImageManager()
    var body: some View {
        ZStack{
            if selectedTab == .Home{
                ContentView(imageManager: imageManager)
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .top)))
            }else if selectedTab == .Favorite {
                LikedImageGridView(imageManager: imageManager)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))

            }
            TabBar(selectedTab: $selectedTab)
                .padding(.bottom)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}


