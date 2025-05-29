import SwiftUI

struct OffsetEffect: View {
    var items = ["Buttons", "Text", "Images", "Cards", "Forms"]
    var colors: [Color] = [.blue, .indigo, .red, .cyan, .yellow]
    @State var currentIndex = 0
    var body: some View {
        HStack(spacing: 4) {
            Text("Loading")
            ZStack {
                ForEach(0..<items.count, id: \.self) { index in
                    if index == currentIndex {
                        Text(items[index]).bold()
                            .foregroundColor(colors[index])
                            .transition(customTransition.combined(with: .scale(scale: 0, anchor: .leading)))
                            .id(index)
                    }
                }
            }
            .frame(width: 70, height: 30,alignment:.leading).clipped()
        }
        .scaleEffect(2)
        .onAppear {
            startTimer()
        }
        .scaleEffect(1.4)
    }
    
    var customTransition: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .offset(y: 50).combined(with: .opacity),
            removal: .offset(y: -50).combined(with: .opacity)
        )
    }
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                currentIndex = (currentIndex + 1) % items.count
            }
        }
    }
}

#Preview {
    OffsetEffect()
}

 
