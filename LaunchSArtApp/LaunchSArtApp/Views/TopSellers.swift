 

import SwiftUI
struct topsellers:Identifiable{
    var id = UUID()
    var image:String
    var name:String
    var num:String
}
var topsellersAp:[topsellers] = [
topsellers(image: "p1", name: "Thamer slajr", num: "53"),
topsellers(image: "p2", name: "fadinoor", num: "73"),
topsellers(image: "p3", name: "Username", num: "12"),
topsellers(image: "p4", name: "Sucodee", num: "64"),
]

struct TopSellers: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Top Sellers").bold()
                .font(.title)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(topsellersAp) { item in
                        HStack{
                            Image(item.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding(.leading,10)
                            VStack(alignment: .leading){
                                Text(item.name).bold()
                                HStack{
                                    Text(item.num)
                                    Image(systemName: "photo.fill")
                                        .imageScale(.medium)
                                        
                                }
                                
                            }
                            .foregroundColor(.black)
                            Spacer()
                        }
                        .frame(width: 200, height: 60)
                        .background(.black.opacity(0.05))
                    .cornerRadius(10)
                    }
                }
            }
            
        }
        .padding(5)
    }
}

struct TopSellers_Previews: PreviewProvider {
    static var previews: some View {
        TopSellers()
    }
}
