 

import SwiftUI

struct ItemView: View {
    let item: Item
    var body: some View {
        HStack(spacing:0){
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 4)
                .foregroundStyle(item.swiftUIColor)
                .padding(.vertical,6)
                .padding(.horizontal,5)
            VStack(alignment: .leading,spacing: 6) {
                Text(item.title).bold()
                Text(item.subtitle)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            .padding(10)
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .background{
            Color(item.swiftUIColor.opacity(0.3))
        }
        .clipShape(.rect(cornerRadius: 12))
 
    }
}
 
#Preview {
    ItemView(item:  Item(from: "2024-21-12 09:00:00", to: "2024-22-12 10:00:00", title: "have meeting with Sara and John", subtitle: "9.00 AM - 10.00 AM", color: "blue"))
}
