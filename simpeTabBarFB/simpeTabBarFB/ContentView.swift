 
import SwiftUI
struct TabBar:Identifiable{
    var id = UUID()
    var iconname:String
    var tab :TabIcon
    var index : Int
}

let tabItems = [
    TabBar(iconname: "square.stack", tab: .Card, index: 0 ),
    TabBar(iconname: "magnifyingglass", tab: .Favorite, index: 1 ),
    TabBar(iconname: "house", tab: .Home, index: 2 ),
    TabBar(iconname: "star", tab: .Purchases, index: 3 ),
    TabBar(iconname: "person", tab: .Notification, index: 4),
]

enum TabIcon :String {
  case Home
  case Card
  case Favorite
  case Purchases
  case Notification
}


struct ContentView: View {
    @State var selectedTab:TabIcon = .Home
    @State var Xoffset = 2 * 70.0
    var body: some View {
        VStack {
            Spacer()
            HStack{
                ForEach(tabItems) { item in
                        Spacer()
                        Image(systemName: item.iconname).foregroundColor(.white)
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
            .background(.black,in:RoundedRectangle(cornerRadius: 10))
            .overlay(alignment: .bottomLeading) {
                Circle().frame(width: 10, height: 10).foregroundColor(.white)
                    .offset(x: 30, y: -5)
                    .offset(x: Xoffset)
        }
            .offset(y: 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
