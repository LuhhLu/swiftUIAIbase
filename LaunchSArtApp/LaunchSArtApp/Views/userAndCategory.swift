 

import SwiftUI
struct Category:Identifiable{
    var id = UUID()
    var type:String
    var tab:categoryTab
}
var category:[Category] = [
    Category(type: "All", tab: .All),
    Category(type: "Vintage", tab: .Vintage),
    Category(type: "Nfts", tab: .Nfts),
    Category(type: "Art", tab: .Art),
    Category(type: "Nature", tab: .Nature)
]
enum categoryTab:String{
    case All
    case Vintage
    case Nfts
    case Art
    case Nature
}
struct userAndCategory: View {
    @State var selectedTab:categoryTab = .All
    var users :[String] = ["p1","p2","p3","p4","p5"]
    var body: some View {
        VStack(alignment: .leading,spacing: 5){
            Text("Discover").bold()
                .font(.largeTitle)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(users,id: \.self) { item in
                        Image(item)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .overlay(content: {
                                Circle()
                                    .stroke(.black, lineWidth: 3)
                        })
                    }
                }
                .padding(5)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.black.opacity(0.2))
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(category) { item in
                        Button(action: {
                            withAnimation{
                                selectedTab = item.tab
                            }
                        }, label: {
                            Text(item.type).bold()
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal,10)
                                .padding(.vertical,4)
                                .background(selectedTab == item.tab ? .black :.gray.opacity(0.6))
                                .cornerRadius(15)
                            
                        })
                    }
                }
            }
            
            
        }
        .padding(5)
         
    }
}

struct userAndCategory_Previews: PreviewProvider {
    static var previews: some View {
        userAndCategory()
    }
}
