import SwiftUI
struct ProductThree:Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var imageName: ImageResource
    var isFavorite: Bool = false
    var isinCar:Bool = false
}
 
struct ProductViewThree: View {
    @State var product: ProductThree
    
    var body: some View {
        ZStack {
            VStack(spacing:-15){
                Group{
                    Image(product.imageName)
                        .resizable().scaledToFill()
                        .mask {
                            Image(.cshape).resizable()
                        }
                }
                .frame(width: 140, height: 150)
                .clipShape(.rect(cornerRadius: 13))
                VStack{
                    ZStack {
                        Circle()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(.white)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
                        Image(systemName:product.isinCar ? "bag.fill" :  "bag").foregroundStyle(.black)
                            .contentTransition(.symbolEffect)
                    }
                    .onTapGesture {
                            product.isinCar.toggle()

                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(product.name)
                        Text(String(format: "$%.2f", product.price))
                            .bold()
                    }
                    
                   
                }
            }
            .overlay(alignment: .topTrailing) {
                Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 18))
                    .padding(8)
                    .foregroundStyle(product.isFavorite ? .red : .white)
                    .onTapGesture {
                        product.isFavorite.toggle()
                    }
            }
        }
    }
}

#Preview {
    ProductViewThree(product: ProductThree(name: "Bomber Jacket", price: 49.99, imageName:.jacket ,isinCar:false))
}


 
