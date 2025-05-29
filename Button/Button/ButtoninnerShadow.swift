import SwiftUI

struct ButtoninnerShadow: View {
    var body: some View {
        ZStack {
//            Color.gray.opacity(0.3)
            Button("Subscribe") {print("Subscribe tapped")}
                .buttonStyle(InnerShadowButtonStyle(backgroundColor: .indigo,shadowColor: .black.opacity(0.2)))
            .padding(.horizontal, 34)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ButtoninnerShadow()
}

struct InnerShadowButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var shadowColor: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2.bold())
            .padding()
            .frame(maxWidth: .infinity, minHeight: 50)
         
            .background(
                backgroundColor
                    .shadow(.inner(color: shadowColor, radius: 1, x: 0, y: -7)),
                in: .rect(cornerRadius: 12)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(), value: configuration.isPressed)
    }
}

