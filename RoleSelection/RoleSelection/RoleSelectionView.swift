import SwiftUI

struct RoleSelectionView: View {
    @State var selectedRole: String = "SwiftUI"
    let items = ["SwiftUI", "Uikit", "objective-C"]
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(items, id: \.self) { item in
                let isselected = selectedRole == item
                    HStack {
                        
                        Image(systemName: isselected ? "circle.fill" : "circle")
                            .foregroundStyle(isselected ? .blue : .gray)
                            .contentTransition(.symbolEffect).padding(.leading)
                        
                        Text(item).font(.title2)
                            .foregroundColor(.white).padding()
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(isselected ? .blue.opacity(0.2) : .clear,in:.rect(cornerRadius: 10))
                    .contentShape(Rectangle())
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2)
                            .foregroundStyle(isselected ? .blue : .clear)
                    })
                
                    .onTapGesture {
                            selectedRole = item
                    }
            }
        }
        .padding()
        .background(.black.opacity(0.9),in:.rect(cornerRadius: 10))
        .padding(.horizontal, 40)
    }
}
 

#Preview {
    RoleSelectionView()
}
