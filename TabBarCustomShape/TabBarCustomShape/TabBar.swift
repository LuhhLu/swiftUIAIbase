

import SwiftUI
struct TabBarM:Identifiable{
   var id = UUID()
   var iconname:String
   var tab :TabIcon
   var index : Int
}

let tabItems = [
   TabBarM(iconname: "house.fill", tab: .Home, index: 0 ),
   TabBarM(iconname: "bell.fill", tab: .bell, index: 1 ),
   TabBarM(iconname: "message.fill", tab: .message, index: 2 ),
   TabBarM(iconname: "star.fill", tab: .like, index: 3 ),
   TabBarM(iconname: "person.fill", tab: .person, index: 4),
]

enum TabIcon :String {
 case Home
 case bell
 case message
 case like
 case person
}


struct TabBar: View {
//    @State var selectedTab:TabIcon = .Home
   @Binding var selectedTab:TabIcon
   @State var Xoffset = 0 * 70.0
   var body: some View {
       VStack {
           Spacer()
           HStack{
               ForEach(tabItems) { item in
                       Spacer()
                       Image(systemName: item.iconname)
                       .foregroundStyle(selectedTab == item .tab ? .orange : .gray)
                       .onTapGesture {
                           withAnimation(.spring()){
                               selectedTab = item .tab
                               Xoffset = CGFloat(item.index) * 70
                           }
                       }
                       Spacer()
               }
               .frame(width: 23.3)

           }
    
           .frame(height: 70)
           .background(
               CustomSahpe(xAxis: Xoffset + 12)
                   .foregroundStyle(.black)
                   .clipShape(RoundedRectangle(cornerRadius:13))
                   .padding(.vertical)
                   .frame(width: 365, height: 100, alignment: .center)
                    
           )
           .overlay(alignment: .bottomLeading) {
               Circle().frame(width: 10, height: 10).foregroundStyle(.black)
                   .offset(x: 29, y: -58)
                   .offset(x: Xoffset)
       }
           .offset(y: 15)
       }
   }
}

#Preview {
   TabBar(selectedTab: .constant(.Home))
}


