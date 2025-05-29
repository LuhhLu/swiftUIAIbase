 

import SwiftUI

struct BlueButton: View {
    var body: some View {
        ZStack{
            Color.B_5.ignoresSafeArea()
            Button(action: {
                       print("Start Generating tapped")
                   }) {}
                   .BlueGlowingStyle(title: "Build my website", icon: "arrow.right")
         }
    }
}

#Preview {
    BlueButton()
}
struct BlueGlowingButtonStyle: ButtonStyle {
    var title: String
    var icon: String
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 16) {
            Text(title)
            Image(systemName: icon)
                .foregroundStyle(.BL)
                .font(.system(size: 12 )).bold()
                .background {
                    Circle().frame(width: 30, height: 30)
                        
                }
        }
        .font(.system(size: 18 ))
        .foregroundStyle(.white)
        .padding(.horizontal, 24)
        .padding(.vertical, 14)
        .background(
            Color.BL
                .clipShape(Capsule())
                .shadow(color: Color.BL.opacity(0.4), radius: 10, x: 0, y: 4)
        )
        .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
        .animation(.spring(), value: configuration.isPressed)
    }
}

extension Button {
    func BlueGlowingStyle(title: String, icon: String) -> some View {
        self.buttonStyle(BlueGlowingButtonStyle(title: title, icon: icon))
    }
}
