import SwiftUI
import SwiftUI

 
struct Product:Identifiable {
    var id = UUID()
    var name: String
    var currentPrice: Double
    var originalPrice: Double
    var discountPercentage: Int
    var imageName: String
    var isFavorite: Bool
}
struct ProductView: View {
    @State var  product: Product
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topLeading){
                Image(product.imageName).resizable().scaledToFill()
                    .frame(width: 150, height: 180)
                    .clipShape(.rect(cornerRadius: 16))
                    .overlay(alignment: .topTrailing) {
                        Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                            .font(.system(size: 14))
                            .foregroundStyle(product.isFavorite ? .red : .white)
                            .padding(6)
                            .background(.thinMaterial,in: .circle)
                            .contentTransition(.symbolEffect)
                            .padding(10)
                            .onTapGesture {
                                product.isFavorite.toggle()
                            }
                    }
                
            
                
            }
            Text(product.name)
                .font(.system(size: 14)).bold()
                .lineLimit(1)
            
            HStack{
                
                      Text(String(format: "$%.2f", product.currentPrice))
                          .font(.system(size: 14))
                          .bold()
                      
                      Text(String(format: "$%.2f", product.originalPrice))
                          .font(.system(size: 10))
                          .strikethrough()
                          .foregroundColor(.gray)
            }
        }
        .frame(width: 150)
    }
}

#Preview {
    ProductView(product: Product(name: "White T-Shirt",
                                 currentPrice: 50.00,
                                 originalPrice: 100.00,
                                 discountPercentage: 50,
                                 imageName: "tshirt",
                                 isFavorite: false))
}
