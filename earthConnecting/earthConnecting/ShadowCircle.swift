 

import SwiftUI

struct ShadowCircle: View {
    var color:Color
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 150, height: 150)
                .foregroundStyle(color.opacity(0.2))
            Circle()
                .frame(width: 150, height: 150)
                .offset(y: 10)
                .blendMode(.destinationOut)
        }
        .compositingGroup()
 
    }
}

#Preview {
    ShadowCircle(color: .white)
}
