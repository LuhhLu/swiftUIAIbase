 
import SwiftUI

struct OpenBuuton: View {
    @Binding var show :Bool
     var body: some View {
        Image(systemName: "plus")
             .foregroundStyle(.primary)
             .font(.largeTitle)
             .rotationEffect(.degrees(show ? 45 : 0))
             .padding(20)
             .background(
                Circle()
                    .modeBasedCardStyle(cornerRadius: 60)
             )
             .offset(y: show ? 140 : 0)
             .onTapGesture {
                 withAnimation (.spring){
                     show.toggle()
                 }
             }
    }
}

#Preview {
    OpenBuuton(show: .constant(false))
}
