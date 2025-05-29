

import SwiftUI

struct PuButton: View {
    var body: some View {
        ZStack{
            Color.B_4.ignoresSafeArea()
            Button(action: {
                       print("Start Generating tapped")
                   }) {}
                   .boldGlowingStyle(title: "Start Generating", icon: "wand.and.stars")
                   .padding()
        }
    }
}

#Preview {
    PuButton()
}
struct BoldGlowingButtonStyle: ButtonStyle {
    var title: String
    var icon: String
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 6) {
            Text(title)
            Image(systemName: icon)
        }
        .font(.system(size: 18, weight: .semibold))
        .foregroundStyle(.white)
        .padding(.horizontal, 24)
        .padding(.vertical, 14)
        .background(
            Color.PU
                .clipShape(Capsule())
                .shadow(color: Color.PU.opacity(0.4), radius: 10, x: 0, y: 4)
        )
        .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
        .animation(.spring(), value: configuration.isPressed)
    }
}

extension Button {
    func boldGlowingStyle(title: String, icon: String) -> some View {
        self.buttonStyle(BoldGlowingButtonStyle(title: title, icon: icon))
    }
}
