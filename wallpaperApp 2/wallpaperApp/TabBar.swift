import SwiftUI
struct TabBarS:Identifiable{
   var id = UUID()
   var iconname:String
   var tab :TabIcon
   var index : Int
}

let tabItems = [
    TabBarS(iconname: "house", tab: .Home, index: 1 ),
    TabBarS(iconname: "suit.heart", tab: .Favorite, index: 2 )
]
enum TabIcon :String {
 case Home
 case Favorite
}
struct TabBar: View {
    @Binding var selectedTab: TabIcon

    var body: some View {
        VStack{
            Spacer()
            
            HStack{
                ForEach(tabItems) { item in
                    Spacer()
                    Image(systemName: selectedTab == item.tab ? "\(item.iconname).fill" : item.iconname)
                        .font(.system(size: 30))
                        .onTapGesture {
                            withAnimation {
                                selectedTab = item.tab
                            }
                        }
                  
                    Spacer()
                }
                
                .frame(width: 23.3)
            }
            .frame(height: 70)
            .padding(.horizontal)
            .background(.thinMaterial,in:RoundedRectangle(cornerRadius: 30))
            .overlay {
                RoundedRectangle(cornerRadius: 30).stroke(lineWidth: 2)
                    .foregroundStyle(AngularGradient.init(gradient: Gradient(colors: [.clear,.primary,.clear,.clear]), center: .center, angle: .radians(3)))
            }
        }
    }
}

#Preview {
    TabBar(selectedTab: .constant(.Home))
}
