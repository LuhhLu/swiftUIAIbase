 


import SwiftUI

struct TabBarM: Identifiable {
   var id = UUID()
   var iconName: String
   var color: Color
   var tab: TabIcon
   var index: Int
}
let tabItems = [
   TabBarM(iconName: "square.stack", color: .T_1, tab: .Card, index: 0),
   TabBarM(iconName: "magnifyingglass", color: .T_2, tab: .Favorite, index: 1),
   TabBarM(iconName: "house", color: .T_3, tab: .Home, index: 2),
   TabBarM(iconName: "star", color: .T_4, tab: .Purchases, index: 3),
     TabBarM(iconName: "person", color: .purple, tab: .Notification, index: 4),
]
enum TabIcon: String {
   case Home, Card, Favorite, Purchases, Notification

   // Computed property to return the display name for each tab
   var displayName: String {
       switch self {
       case .Home:
           return "Home"
       case .Card:
           return "Card"
       case .Favorite:
           return "Search"
       case .Purchases:
           return "Favorite"
       case .Notification:
           return "Notif"
       }
   }
}
struct TabBarModel {
   var itemCount: Int

   init(itemCount: Int) {
       self.itemCount = itemCount
   }

   var overlayMultiplier: CGFloat {
       switch itemCount {
       case 2: return 1.72
       case 3: return 1.62
       case 4: return 1.54
       case 5: return 1.5
       default: return 2.0 // Default value or some other logic for different counts
       }
   }

   var initialOffsetMultiplier: CGFloat {
       switch itemCount {
       case 2: return 1
       case 3: return 1
       case 4: return 1
       case 5: return 1
       default: return 1.5 // Default value or some other logic for different counts
       }
   }
}
struct TabBar: View {
   @Binding var selectedTab: TabIcon
//    @State private var selectedTab: TabIcon = .Home
   @State private var selectedTabColor: Color = .T_3
   @State private var indicatorOffset: CGFloat = 0
 
   let tabBarModel = TabBarModel(itemCount: tabItems.count)
   var body: some View {
        
           GeometryReader { geometry in
                      let screenWidth = geometry.size.width
//            Color.bg.ignoresSafeArea()
           VStack {
              
               
               Spacer()
                  GeometryReader { geometry in
                   ZStack{
                       RoundedRectangle(cornerRadius: 40)
                           .foregroundStyle(.white)
                       Color.clear
                           .overlay(alignment: .bottomLeading) {
                              RoundedRectangle(cornerRadius: 10)
                                   .frame(width: 60, height: 50)
                                   .offset(x:-15,y: 0)
                                   .foregroundStyle(selectedTabColor.opacity(0.5))
                                   .offset(x: indicatorOffset - geometry.size.width  / CGFloat(tabItems.count) / tabBarModel.overlayMultiplier, y: -25)
                           }
                      
                           
                       HStack(spacing: 0) {
                           ForEach(tabItems) { item in
                               VStack(spacing: -25){
                                   Image(systemName: item.iconName).font(.system(size: 22))
                                       
                                       .frame(maxWidth: .infinity, maxHeight: .infinity)
                                       .onTapGesture {
                                           withAnimation(.spring()) {
                                               selectedTab = item.tab
                                               selectedTabColor = item.color
                                               let tabWidth = geometry.size.width / CGFloat(tabItems.count)
                                               indicatorOffset = CGFloat(item.index) * tabWidth + tabWidth / 1
                                           }
                                       }
                                   Text(item.tab.displayName).font(.system(size: 13))
                               }
                               .foregroundColor(selectedTab == item.tab ? item.color : .IC)
                               
                                   .offset(y: -18)
                           }
                       }
//                        ultraThinMaterial
                       .frame(height: 90)
                       .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40))
                       .overlay(alignment: .topLeading) {
                           RoundedRectangle(cornerRadius: 10)
                               .frame(width: 30, height: 6)
                               .foregroundColor(selectedTabColor)
                               .offset(x: indicatorOffset - geometry.size.width / CGFloat(tabItems.count) / tabBarModel.overlayMultiplier, y: 1)
                       }
                   }
                   .overlay {
                       RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 1)
                           .foregroundStyle(.gray.opacity(0.4))
                           
                           
                   }
               }
               .frame(height: 70)
               .offset(y: 15)
              
           }
//            .padding(.horizontal)
           .onAppear {
               let initialIndex = tabItems.firstIndex { $0.tab == selectedTab } ?? 0
               indicatorOffset = screenWidth / CGFloat(tabItems.count) * CGFloat(initialIndex) + screenWidth / CGFloat(tabItems.count) / 1
       }
       }
   }
}

#Preview {
    TabBar(selectedTab: .constant(.Home))
}

 
