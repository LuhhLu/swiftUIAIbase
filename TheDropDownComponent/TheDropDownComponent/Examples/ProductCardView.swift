import SwiftUI

struct ProductCardView: View {
    let options: [DropdownOption] = [

        DropdownOption(title: "Details" , icon: "info.circle" , action: { print("Show product details") }) ,

        DropdownOption(title: "Edit" , icon: "pencil" , action: { print("Edit item") }) ,

        DropdownOption(title: "Share" , icon: "square.and.arrow.up" , action: { print("Share item") }) ,

        DropdownOption(title: "Delete" , icon: "trash" , action: { print("Delete item") })

    ]
    @State private var quantity = 1
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Focus 60")
                        .font(.title2)
                        .bold()
                }
            HStack {
                Text("$18.99")
                    .font(.title3)
                    .bold()
                Spacer()
            }
            Button(action: {
                print("Ordered \(quantity) Focus Gummies!")
            }) {
                HStack {
                    Image(systemName: "creditcard.fill")
                    Text("Order Now")
                        .bold()
                }
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding(.horizontal,22)
        .padding(.bottom,30)
        .padding(.top,22)
        .background(.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
        .overlay(alignment: .top, content: {
            DropdownMenu(dropdownAlignment: .trailing,fromTop: true, options: options)
                .padding(.horizontal, 20)
                .padding(.top, 10)
        })
        .frame(maxHeight: .infinity,alignment: .bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    ProductCardView()
}

 
