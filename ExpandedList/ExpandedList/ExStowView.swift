 
import SwiftUI
struct ExpandableItem: Identifiable {
    let id = UUID()
    let title: String
    let content: AnyView
    var isOpen: Bool = false
}

import SwiftUI

struct ExStowView: View {
    @Binding var vm: ExpandableItem
    var index: Int
    @Binding var selectedIndex: Int?
    var onTap: () -> Void  

    var body: some View {
        VStack {
            VStack( spacing: vm.isOpen ? 14 : 0) {
                HStack{
                    Text(vm.title)
                        .font(.title2)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(vm.isOpen ? 90 : 0))
             
                }
                if !vm.isOpen{
                    Spacer()
                }
                vm.content
                    .fixedSize(horizontal: false, vertical: true)
                    .opacity(vm.isOpen ? 1 : 0)
                
            }
            .frame(maxHeight: vm.isOpen ? .none : 25 ,alignment: .top)
            .padding()
            .background(
                UnevenRoundedRectangle(
                    topLeadingRadius: index == selectedIndex ? 24 : ((selectedIndex ?? -1) + 1 == index ? 24 : 0),
                    bottomLeadingRadius: index == selectedIndex ? 24 : ((selectedIndex ?? -1) - 1 == index ? 24 : 0),
                    bottomTrailingRadius: index == selectedIndex ? 24 : ((selectedIndex ?? -1) - 1 == index ? 24 : 0),
                    topTrailingRadius: index == selectedIndex ? 24 : ((selectedIndex ?? -1) + 1 == index ? 24 : 0)
                )
                .fill(.BG)
                
            )
            .clipped()
        }
        .padding(.top, (selectedIndex != nil && index == selectedIndex! + 1) ? (vm.isOpen ? 16 : 0) : (vm.isOpen ? 12 : 0))
        .padding(.bottom, (selectedIndex != nil && index == selectedIndex! - 1) ? (vm.isOpen ? 16 : 0) : (vm.isOpen ? 12 : 0))
        .onTapGesture {
            onTap()
        }
    }
}
