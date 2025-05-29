 
import SwiftUI

struct FloatingActionMenu: View {
    let direction: ButtonDirection
    let actionButtons: [ActionButton]
    @State var showButtons = false
    var body: some View {
        ZStack {
            ZStack {
                ForEach(actionButtons.indices, id: \.self) { index in
                    let button = actionButtons[index]
                    Button(action: {
                        button.action()
                        withAnimation { showButtons = false }
                    }) {
                        Image(systemName: button.icon)
                            .frame(width: 50, height: 50)
                            .background(.gray.opacity(0.3), in: .circle)
                            .rotationEffect(-direction.angle, anchor: .center)
                    }
                    .tint(.primary)
                    .padding(.bottom, 8)
                    .scaleEffect(showButtons ? 1 : 0)
                    .opacity(showButtons ? 1 : 0)
                    .offset(y: showButtons ? Double(index + 1) * -65 : 60)
                    .animation(
                        .easeOut.delay(Double(index) * 0.1),
                        value: showButtons
                    )
                }
            }
            .rotationEffect(direction.angle, anchor: .center)
          OpenButton
        }
    }
    var OpenButton:some View{
        Image(systemName: "plus")
            .foregroundStyle(.black)
            .font(.system(size: 30))
            .padding()
            .background(.white, in: .circle)
            .rotationEffect(.degrees(showButtons ? -45 : 0))
            .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: 0)
            .onTapGesture {
                withAnimation {
                    showButtons.toggle()
            }
        }
    }
}
#Preview {
    FloatingActionMenu(
        direction: .top,
        actionButtons: [
            ActionButton(icon: "globe", action: { print("🌐 Globe tapped") }),
            ActionButton(icon: "paintpalette.fill", action: {print("🎨 Theme changed") }),
            ActionButton(icon: "doc.fill", action: { print("📄 Open document") })
        ]
    )
}
struct ActionButton {
    let icon: String
    let action: () -> Void
}
enum ButtonDirection {
    case left, right, top, bottom
    var angle: Angle {
        switch self {
        case .left: return .degrees(-90)
        case .right: return .degrees(90)
        case .top: return .degrees(0)
        case .bottom: return .degrees(180)
        }
    }
}

 
