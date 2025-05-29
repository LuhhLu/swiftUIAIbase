 

import SwiftUI

struct GrButton: View {
    var body: some View {
        ZStack{
            Color.B_2.ignoresSafeArea()
            Button(action: {
                       print("Subscribe now tapped")
                   }) {}
                   .gradientGlowingStyle(title: "Subscribe now", icon: "arrow.right")
                   .padding()
        }
    }
}

#Preview {
    GrButton()
}
struct GradientGlowingButtonStyle: ButtonStyle {
    var title: String
    var icon: String
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 6) {
            Text(title)
            Image(systemName: icon)
        }
        .font(.system(size: 18, weight: .bold))
        .foregroundStyle(.white)
        .padding(.horizontal, 24)
        .padding(.vertical, 14)
        .background(
            LinearGradient(gradient: Gradient(colors: [.GL,.GR]), startPoint: .leading, endPoint: .trailing)
                .clipShape(Capsule())
                .shadow(color: Color.pink.opacity(0.4), radius: 10, x: 0, y: 4)
        )
        .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
        .animation(.spring(), value: configuration.isPressed)
    }
}

extension Button {
    func gradientGlowingStyle(title: String, icon: String) -> some View {
        self.buttonStyle(GradientGlowingButtonStyle(title: title, icon: icon))
    }
}
