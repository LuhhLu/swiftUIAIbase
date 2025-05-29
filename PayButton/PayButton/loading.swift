import SwiftUI

struct loading: View {
    let circleCount = 3
    @State private var activeIndex: Int = 0
    var body: some View {
        HStack(spacing:4) {
            ForEach(0 ..< circleCount, id: \.self) { index in
                Circle()
                    .frame(width: 8, height: 8)
                    .offset(y: activeIndex == index ? -20 : 5)
                    .animation(.easeInOut(duration: 0.5), value: activeIndex)
            }
        }
        .foregroundStyle(.LD)
        .onAppear { startAnimation()}
    }
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            activeIndex = (activeIndex + 1) % circleCount
        }
    }
}

#Preview {
    loading()
}
