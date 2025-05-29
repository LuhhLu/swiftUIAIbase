import SwiftUI

struct GenerateButton: View {
    var body: some View {
        ZStack {
            Color("BG").ignoresSafeArea()
            Label("Generate image", systemImage: "sparkles")
                .frame(height: 55)
                .padding(.horizontal, 30)
                .foregroundStyle(.white)
                .background(
                    Capsule()
                        .foregroundColor(Color("BG"))
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 5)
                )
        }
    }
}

#Preview {
    GenerateButton()
}
