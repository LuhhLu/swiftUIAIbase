import SwiftUI

struct BubbleAnimationView: View {
    @State private var bubbles: [Bubble] = []
    var body: some View {
    
        ZStack {
            ForEach(bubbles.indices, id: \.self) { index in
                Circle()
                    .frame(width: bubbles[index].size, height: bubbles[index].size)
                    .position(x: bubbles[index].positionX, y: bubbles[index].positionY)
                    .opacity(bubbles[index].opacity)
                    .onAppear {
                        animateBubble(at: index)
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: createBubbles)
    }

    func createBubbles() {
        for _ in 0..<100 {
            let size = CGFloat.random(in: 5...15)
            let positionX = CGFloat.random(in: 0...UIScreen.main.bounds.width)
            let positionY = UIScreen.main.bounds.height + size
            let speed = Double.random(in: 4.0...8.0)
            let opacity = Double.random(in: 0.5...1.0)
            let bubble = Bubble(size: size, positionX: positionX, positionY: positionY, speed: speed, opacity: opacity)
            bubbles.append(bubble)
        }
    }
    
    func animateBubble(at index: Int) {
        let delay = Double.random(in: 0...5)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            withAnimation(.easeOut(duration: bubbles[index].speed).repeatForever(autoreverses: false)) {
                bubbles[index].positionY = -100
                bubbles[index].opacity = 0
            }
        }
    }
}

struct Bubble: Identifiable {
    let id = UUID()
    var size: CGFloat
    var positionX: CGFloat
    var positionY: CGFloat
    var speed: Double
    var opacity: Double
}

 


#Preview {
    BubbleAnimationView()
}
