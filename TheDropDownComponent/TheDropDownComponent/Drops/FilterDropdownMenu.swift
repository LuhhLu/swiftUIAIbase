 
import SwiftUI
struct FilterOption: Identifiable {
    let id = UUID()
    var title: String
    var isSelected: Bool = false
}

struct FilterDropdownMenu: View {
    @State private var isExpanded = false
    @State private var menuWidth: CGFloat = 0
    var dropdownAlignment: DropdownAlignment = .center
    
    private var frameAlignment: Alignment {
        switch dropdownAlignment {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        }
    }
    private var transitionAnchor: UnitPoint {
        switch dropdownAlignment {
        case .leading: return .topLeading
        case .center: return .top
        case .trailing: return .topTrailing
        }
    }
    @State private var options: [FilterOption] = [
        FilterOption(title: "On Sale"),
        FilterOption(title: "In Stock"),
        FilterOption(title: "Free Shipping"),
        FilterOption(title: "New Arrival")
    ]
    
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack(spacing: 4) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                    Text("Filter")
                        .fontWeight(.medium)
                        .fixedSize()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                    .foregroundStyle(.BG)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                )
            }
            .tint(.primary)
            .frame(height: 50)
            .frame(width: menuWidth, alignment: frameAlignment)
            .overlay(alignment: .top) {
                if isExpanded {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach($options) { $option in
                            HStack(spacing:14) {
                                Image(systemName: option.isSelected ? "checkmark.square.fill" : "square")
                                    .foregroundColor(option.isSelected ? Color.primary : .gray)
                                    .font(.system(size: 20))
                                    .contentTransition(.symbolEffect)
                                Text(option.title)
 
                            }
                            .padding(.vertical, 8)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .onTapGesture {
                                option.isSelected.toggle()
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.BG)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                    )                    .offset(y: 50)
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
                                }
                        }
                    )
                }
            }
        }
        .frame(width: menuWidth)
        .frame(maxWidth: .infinity, alignment: frameAlignment)
        .animation(.smooth, value: isExpanded)
      
     
    }
}

#Preview {
    FilterDropdownMenu(dropdownAlignment: .leading)
}
