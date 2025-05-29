 
import SwiftUI

struct SaveB: View {
    @Binding var  save :Bool
    var body: some View {
        Image(systemName: "arrow.down").foregroundStyle(.white).bold()
            .padding()
            .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10).trim(from: 0, to: save ? 1 : 0)
                    .stroke(lineWidth: 3)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 2), value: save)
                    .foregroundStyle(.green)
            }

    }
}

#Preview {
    SaveB(save: .constant(false))
}
