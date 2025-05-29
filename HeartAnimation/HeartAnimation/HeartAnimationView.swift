 
import SwiftUI

struct HeartAnimationView: View {
    @State var isTapped = false
    @State var Animated = false
    var body: some View {
        
        ZStack {
            ForEach(0..<6) { i in
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 4, height: .random(in: 10...30))
                    .foregroundStyle(.pink)
                    .offset(y:Animated ? -70 : 0  )
                    .rotationEffect(.degrees(Double(i) * 60))
                    .scaleEffect(Animated ? 1 : 0)
                    .opacity(Animated ? 0 : 1)
            }
            
            Image(systemName:isTapped ? "heart.fill" : "heart")
                .foregroundColor(isTapped ? .pink : .red)
                .contentTransition(.symbolEffect)
                .font(.largeTitle)
            
            
               
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        Button(action: {
            withAnimation(.spring(duration: 0.8)) {
                isTapped.toggle()
            
            }
            
            withAnimation(isTapped ?.spring(duration: 1) : .none) {
                Animated.toggle()
            }
        }, label: {
            Text("one")
        })
        
          
        
        
    }
}


#Preview {
    HeartAnimationView()
}
