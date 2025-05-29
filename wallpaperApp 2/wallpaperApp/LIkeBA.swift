 
import SwiftUI

struct LIkeBA: View {
    @Binding var  show : Bool
    var body: some View {
        Image(systemName: "heart.fill").font(.system(size: 50))
            .foregroundStyle(.red)
            .scaleEffect(show ? 2 : 0)
            .animation(.easeIn(duration: 0.5), value: show)
    }
}

#Preview {
    LIkeBA(show: .constant(false))
}
