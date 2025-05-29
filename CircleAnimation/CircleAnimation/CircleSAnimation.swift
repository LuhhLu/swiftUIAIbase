import SwiftUI

struct CircleSAnimation: View {
    @State var scale: [CGFloat] = Array(repeating: 1.0, count: 5)
    
    var body: some View {
        ZStack {
            ForEach(0 ..< 5) { item in
                Circle().foregroundStyle(.gray)
                
                    .frame(width: 50 * CGFloat(item + 1), height: 50 * CGFloat(item + 1))
                
                    .opacity(1 - (0.2 * CGFloat(item)))
                    .shadow(color: .black, radius: 10, x: 0, y: 5)
               
                    .scaleEffect(scale[item])
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: true)
                            .delay(0.1 * Double(item)), value: scale[item]
                    )
            }
            
        }
        .onAppear {
            for i in 0..<scale.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + (0.1 * Double(i))) {
                    scale[i] = 1.2
                }
            }
        }
    }
}

#Preview {
    CircleSAnimation()
}
