
import SwiftUI

struct DropdownOption: Identifiable {
    let id = UUID()
    var title: String
    var color: Color = .primary
    var icon: String? = nil
    var action: () -> Void
}


enum DropdownAlignment {
    case leading
    case center
    case trailing
}

struct DropdownMenu: View {
    var icon = "ellipsis"
    @State var isExpanded = true
    @State private var menuWidth: CGFloat = 0
    var dropdownAlignment: DropdownAlignment = .center
    var showIcon: Bool = true
    var fromTop: Bool = false
    
    private var frameAlignment: Alignment {
        switch dropdownAlignment {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        }
    }
    
    private var transitionAnchor: UnitPoint {
        if fromTop {
            return dropdownAlignment == .leading ? .leading :
                   dropdownAlignment == .center  ? .center :
                   .trailing
        } else {
            return dropdownAlignment == .leading ? .topLeading :
                   dropdownAlignment == .center  ? .top :
                   .topTrailing
        }
    }
    let options: [DropdownOption]

    
    var body: some View {
        ZStack {
            
            Button(action: {
                isExpanded.toggle()
            }) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .frame(width: 40, height: 40)
                    .background(Color(.systemBackground),in:.circle)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            }
            .tint(.primary)
            .frame(height: 50)
            .frame(width: menuWidth, alignment: frameAlignment)
            .overlay(alignment:fromTop ? .bottom : .top) {
                   option
            }
        }
        .frame(width: menuWidth)
        .frame(maxWidth: .infinity, alignment: frameAlignment)
        .animation(.smooth, value: isExpanded)
    }
    var option :some View {
        Group{
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(options) { option in
                        HStack(spacing: 8) {
                            if showIcon, let iconName = option.icon {
                                Image(systemName: iconName)
                                    .frame(width: 20, height: 20)
                                
                            }
                            Text(option.title)
                        }
                        .foregroundColor(option.color)
                        .padding(.vertical, 5)
                        .onTapGesture {
                            option.action()
                            withAnimation {
                                isExpanded = false
                            }
                        }
                    }
                }
                
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.BG)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
             )
                .offset(y:fromTop ? -50 : 50)
                .fixedSize()
                .transition(
                    .scale(scale: 0, anchor: transitionAnchor)
                    .combined(with: .opacity)
                    .combined(with: .offset(y: 40))
                )
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .onAppear {
                                menuWidth = proxy.size.width
                                print("Menu width is: \(menuWidth)")
                            }
                    }
                )
            }
        }
        
    }
}


#Preview {
     
    DropdownMenu(dropdownAlignment: .trailing,fromTop: false, options: [
        
        DropdownOption(title: "Details" , icon: "info.circle" , action: { print("Show product details") }) ,

        DropdownOption(title: "Edit" , icon: "pencil" , action: { print("Edit item") }) ,

        DropdownOption(title: "Share" , icon: "square.and.arrow.up" , action: { print("Share item") }) ,

        DropdownOption(title: "Delete" , icon: "trash" , action: { print("Delete item") })

    ])
}
