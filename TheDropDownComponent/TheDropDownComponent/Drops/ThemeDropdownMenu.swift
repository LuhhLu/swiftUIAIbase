 
import SwiftUI
 
struct ModeOption: Identifiable {
    let id = UUID()
    var title: String
    var color: Color = .primary
    var icon: String
    var action: () -> Void
}

struct ModeDropdownMenu: View {
    @State private var isExpanded = false
    @State private var selectedOption: ModeOption?
    @State private var menuWidth: CGFloat = 0
    var dropdownAlignment: DropdownAlignment = .trailing
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
    private func setDarkMode() {
          UIApplication.shared.connectedScenes
              .compactMap { $0 as? UIWindowScene }
              .first?.windows.first?.overrideUserInterfaceStyle = .dark
      }
    private func setLightMode() {
           UIApplication.shared.connectedScenes
               .compactMap { $0 as? UIWindowScene }
               .first?.windows.first?.overrideUserInterfaceStyle = .light
       }
       
       private func setSystemMode() {
           UIApplication.shared.connectedScenes
               .compactMap { $0 as? UIWindowScene }
               .first?.windows.first?.overrideUserInterfaceStyle = .unspecified
       }
    private var options: [ModeOption] {
         [
             ModeOption(title: "Dark", icon: "moon.fill", action: { setDarkMode() }),
             ModeOption(title: "Light", icon: "sun.max.fill", action: { setLightMode() }),
             ModeOption(title: "System", icon: "gearshape.fill", action: { setSystemMode() })
         ]
     }

    var body: some View {
        ZStack {
            Button(action: {
                isExpanded.toggle()
            }) {
                Image(systemName: selectedOption?.icon ?? "circle.dotted")
                    .font(.title)
                    .contentTransition(.symbolEffect)
            }
            .tint(.primary)
            .frame(height: 50)
            .frame(width: menuWidth, alignment: frameAlignment)
            .overlay(alignment: .top) {
                if isExpanded {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(options) { option in
                            HStack(spacing: 8) {
                                Image(systemName: option.icon)
                                Text(option.title)
                            }
                            .foregroundColor(option.color)
                            .padding(.vertical, 5)
                            .onTapGesture {
                                selectedOption = option
                                option.action()
                                withAnimation {
                                    isExpanded = false
                                }
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.BG)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                    )
                    .offset(y: 50)
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
        .onAppear {
                   selectedOption = options.first
                   options.first?.action()
               }
    }
}

#Preview {
    ModeDropdownMenu(dropdownAlignment: .trailing)
}
