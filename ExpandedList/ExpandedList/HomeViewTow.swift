import SwiftUI

struct HomeViewTow: View {
    @State private var selectedIndex: Int? = nil
    @State var data: [ExpandableItem] = [
        
        
        ExpandableItem(title: "SwiftUI", content: AnyView(
            Text("SwiftUI is the best way to build apps across Apple platforms. Discover new capabilities to customize the look and feel of your apps, as well as improved.")
            
        )),
        
        
        ExpandableItem(title: "Rectangle Example", content: AnyView(
            HStack(spacing:14) {
                RoundedRectangle(cornerRadius: 12).frame(height: 150)
                RoundedRectangle(cornerRadius: 12).frame(height: 150)
            }
            .foregroundStyle(.gray.opacity(0.2))
        )),
        
        
        ExpandableItem(title: "UIKit framework", content: AnyView(Text("UIKit provides a variety of features for building apps, including components you can use to construct the core infrastructure of your iOS, iPadOS, or tvOS apps."))),
        
        
        ExpandableItem(title: "Final Example", content: AnyView(Text("Try selecting different sections!")))
    ]

    func handleSelection(index: Int) {
        withAnimation(.spring(duration: 0.5, bounce:data[index].isOpen ? 0.1 : 0.4)) {
            for i in 0..<data.count {
                data[i].isOpen = false
            }
            if selectedIndex == index {
                selectedIndex = nil
            } else {
                selectedIndex = index
                data[index].isOpen = true
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach($data.indices, id: \.self) { index in
                ExStowView(vm: $data[index], index: index, selectedIndex: $selectedIndex, onTap: {
                    handleSelection(index: index)
                })
            }
        }
        .clipShape(.rect(cornerRadius: 24))
        .padding(.horizontal)
    }
}

#Preview {
    HomeViewTow()
}
