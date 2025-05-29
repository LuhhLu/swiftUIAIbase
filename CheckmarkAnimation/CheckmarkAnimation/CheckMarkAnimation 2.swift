 
import SwiftUI

struct CheckMarkAnimation2: View {
    @State var isTapped = false
    @State var Animated = false
    @State var scale:CGFloat = 1
    var body: some View {
        
        ZStack {
            ForEach(0..<6) { i in
                Circle().frame(width: 30, height:30)
                    .scaleEffect(Animated ? 0 : 1)
                    .offset(y:Animated ? -50 : 0)
                    .rotationEffect(.degrees(Double(i) * 60))
                    .opacity(Animated ? 1 : 0)
            }
            
            Image(systemName:isTapped ? "checkmark.circle" : "circle")
                .contentTransition(.symbolEffect).font(.largeTitle)
        }
        .foregroundStyle(isTapped ? .indigo : .white)
        .onTapGesture {
            withAnimation(.spring(duration: 1)) {
                isTapped.toggle()
            }
            withAnimation(isTapped ?.spring(duration: 1) : .none) {
                Animated.toggle()
            }
        }  
    }
}

#Preview {
    CheckMarkAnimation2()
}
