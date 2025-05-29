import SwiftUI

struct ProductModel: Identifiable {
    var id = UUID()
    var name: String
    var originalPrice: Double
    var discountedPrice: Double
    var imageName: ImageResource
    var isInCart: Bool = false
}
struct HProductOne: View {
    @State private var product: ProductModel
    
    init(product: ProductModel) {
        _product = State(initialValue: product)
    }
    
    var body: some View {
        HStack(spacing: 5) {
            Image(product.imageName).resizable().scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(.rect(cornerRadius: 15))
                .padding(10)
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .font(.system(size: 14).bold())
                Spacer()
                VStack(alignment: .leading, spacing: 4) {
                    Text(String(format: "$%.2f", product.originalPrice))
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                        .strikethrough()
                    
                    Text(String(format: "$%.2f", product.discountedPrice))
                        .font(.system(size: 18).bold())
                        .foregroundStyle(.orange)
                }
            }
            
            Spacer()
            VStack{
                Spacer()
                ZStack{
                    Circle().frame(width: 40, height: 40)
                        .foregroundStyle(.gray.opacity(0.3))
                    Image(systemName: product.isInCart ? "bag.fill" : "bag")
                        .contentTransition(.symbolEffect)
                }
                .onTapGesture {
                    product.isInCart.toggle()
                }
            }
        }
        .padding(.vertical,10)
        .padding(.trailing,10)
        .frame(height: 120)
        .background(.gray.opacity(0.2),in:.rect(cornerRadius: 12))
        .padding()
     
    }
}

#Preview {
    HProductOne(product: ProductModel(name: "Hoodie Vert Rose", originalPrice: 100.00, discountedPrice: 75.00, imageName: .jacket))
}
