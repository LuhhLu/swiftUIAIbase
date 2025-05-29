 

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Tab = .all
    var body: some View {
        NavigationStack{
            CustomNavView(title: "Hi Sucodee", profileImage: .pro) {
                ScrollView{
                    VStack(spacing:24){
                        MostReadView()
                        segmentedControl(selectedTab: $selectedTab)
                        BookView(selectedTab: $selectedTab)
                    }
                    .safeAreaPadding(.horizontal,16)
                    .safeAreaPadding(.top,24)
                }
            }
           
        }
    }
}

#Preview {
    HomeView()
}
