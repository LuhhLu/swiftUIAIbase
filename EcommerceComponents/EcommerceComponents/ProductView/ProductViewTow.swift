 

import SwiftUI

struct ProductTow:Identifiable {
    var id = UUID()
    var name: String
    var currentPrice: Double
    var rating: Double
    var imageName: String
    var isFavorite: Bool
}

struct ProductViewTow: View {
    @State var product: ProductTow
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topLeading) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(alignment: .topTrailing) {
                        HStack{
                            HStack(spacing:3){
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                Text(String(format: "%.1f", product.rating))
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                            .font(.system(size: 12))
                            .padding(.horizontal,8)
                            .padding(.vertical,5)
                            .background(.black.opacity(0.3),in:.rect(cornerRadius: 12))
                            Spacer()
                            
                            Button(action: {
                                product.isFavorite.toggle()
                            }) {
                                    Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                                        .font(.system(size: 18))
                                    
                                        .foregroundStyle(product.isFavorite ? .red : .primary)
                                        .contentTransition(.symbolEffect)
                                
                            }
                            .tint(.primary)
                            
                        }
                        .padding(8)
                    }
            }
            Text(product.name)
                .font(.system(size: 14))
                .bold()
                .lineLimit(1)
            Text(String(format: "$%.2f", product.currentPrice))
                .font(.system(size: 18))
                .bold()
        }
        .frame(width: 180)
    }
}

#Preview {
    ProductViewTow(product: ProductTow(
        name: "Classic White Crewneck T-Shirt",
        currentPrice: 59.00,
        rating: 4.7,
        imageName: "ctshirt",
        isFavorite: false
    ))
}
