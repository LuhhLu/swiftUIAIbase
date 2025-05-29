 

import SwiftUI

struct TabBar: Identifiable {
    var id = UUID()
    var iconname: String
    var tab: TabIcon
}

let tabItems = [
    TabBar(iconname: "square.stack", tab: .Card),
    TabBar(iconname: "location", tab: .location),
    TabBar(iconname: "house", tab: .Home),
    TabBar(iconname: "star", tab: .Purchases),
    TabBar(iconname: "person", tab: .Notification),
]

enum TabIcon: String {
    case Home
    case Card
    case location
    case Purchases
    case Notification
}

struct CustomTabBar: View {
    @State var selectedTab: TabIcon = .Home
    @State var Xoffset = 2 * 70.0
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(Array(tabItems.enumerated()), id: \.element.id) { index, item in
                    Spacer()
                    Image(systemName: item.iconname).bold()
                        .symbolVariant(selectedTab == item.tab ? .fill : .none)
                        .contentTransition(.symbolEffect)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedTab = item.tab
                                Xoffset = CGFloat(index) * 70
                            }
                        }
                    Spacer()
                }.frame(width: 23.3)//ForEach
            }.frame(height: 70) //HStack
            .background(.thinMaterial, in: .capsule)
            .overlay(alignment: .bottomLeading) {
                Circle().frame(width: 10, height: 10)
                    .offset(x: 30, y: -5).offset(x: Xoffset)
            }
//            .offset(y: 15)//overlay
        }
    }
}

 
#Preview {
    CustomTabBar()
}
