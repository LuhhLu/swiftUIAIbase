

import SwiftUI

struct HomeView: View {
   @State private var selectedTab = TabBarViews.home
   var body: some View {
       ZStack{
           switch selectedTab {
           case .home:
               HomeV()
           case .list:
          listV()
           case .add:
           addv()
           case .notif:
               NotificationView()
           case .search:
               SearchView()
           }
           TabBar(selectedTab: $selectedTab)
               .frame(maxHeight: .infinity,alignment: .bottom)
       }
 
   }
}

#Preview {
   HomeView()
}
struct NotificationView: View {
   var body: some View {
       Text("Notification View")
   }
}

struct SearchView: View {
   var body: some View {
       Text("Search View")
   }
}

struct HomeV: View {
   var body: some View {
       Text("Home View")
   }
}

struct listV: View {
   var body: some View {
       Text("List View")
   }
}

struct addv: View {
   var body: some View {
       Text("Add View")
   }
}
