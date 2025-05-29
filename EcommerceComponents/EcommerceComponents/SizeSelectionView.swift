import SwiftUI

struct SizeSelectionView: View {
    let availableSizes: [String] = ["XS", "S", "M", "L", "XL"]
    @State private var selectedSize: String = "M"
    @State var CircleShape = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Select Size")
                .bold()
            HStack(spacing:16){
                ForEach(availableSizes,id:\.self) { size in
                    Text(size)
                        .font(.headline)
                        .frame(width: 50, height: 50)
                        .background(selectedSize == size ? Color.primary : .clear,in:.rect(cornerRadius: CircleShape ? 40 : 10))
                        .foregroundStyle(selectedSize == size ? .LD : .primary)
                        .overlay {
                            RoundedRectangle(cornerRadius: CircleShape ? 40 : 10)
                                .stroke(selectedSize == size ? .clear : .gray,lineWidth: 2)
                        }
                        .onTapGesture {
                            selectedSize = size
                        }
                }
            }

 
        }
//        .padding()
    }
}

#Preview {
    SizeSelectionView()
}
 
