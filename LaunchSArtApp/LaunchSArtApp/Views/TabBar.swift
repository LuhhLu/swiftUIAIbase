 

import SwiftUI
struct TabItems:Identifiable{
    var id = UUID()
    var icon:String
    var tab:Tab
}
var tabItems:[TabItems] = [
    TabItems(icon: "house", tab: .house),
    TabItems(icon: "location", tab: .location),
    TabItems(icon: "plus", tab: .plus),
    TabItems(icon: "folder", tab: .folder),
    TabItems(icon: "person", tab: .person)
]
enum Tab: String{
    case house
    case location
    case plus
    case folder
    case person
}
struct TabBar: View {
    @State var selectedTab:Tab = .plus
    var body: some View {
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .cornerRadius(20)
                .padding(.horizontal,10)
            HStack(spacing: 20){
                ForEach(tabItems) { item in
                    Button(action: {
                        withAnimation{
                            selectedTab = item.tab
                        }
                        
                    }, label: {
                        Image(systemName: item.icon)
                            .imageScale(.large)
                            .foregroundColor(.white)
                })
                    .padding()
                    .background(selectedTab == item.tab ? .red : Color(""))
                    .clipShape(Circle())
                    .offset(y: selectedTab == item.tab ? -20 : 0)
                    
                }
               
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
