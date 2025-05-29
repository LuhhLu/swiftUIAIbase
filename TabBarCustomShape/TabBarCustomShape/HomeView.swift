
import SwiftUI

struct HomeVeiw: View {
   @State private var selectedTab: TabIcon = .Home
   
   var body: some View {
       ZStack {
           switch selectedTab {
           case .Home:
               HomeViewContent()
           case .bell:
               BellViewContent()
           case .message:
               MessageViewContent()
           case .like:
               LikeViewContent()
           case .person:
               PersonViewContent()
           }
           TabBar(selectedTab: $selectedTab)
       }
   }
}

#Preview {
   HomeVeiw()
}
struct HomeViewContent: View {
   var body: some View {
       Text("Home View")
   }
}

struct BellViewContent: View {
   var body: some View {
       Text("Bell View")
   }
}

struct MessageViewContent: View {
   var body: some View {
       Text("Message View")
   }
}

struct LikeViewContent: View {
   var body: some View {
       Text("Like View")
   }
}

struct PersonViewContent: View {
   var body: some View {
       Text("Person View")
   }
}
