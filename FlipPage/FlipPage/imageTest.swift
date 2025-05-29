 

import SwiftUI

struct imageTest: View {
    var body: some View {
        Image(.book).resizable().scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 16, topTrailingRadius: 16, style: .continuous))
        Image(.book).resizable().scaledToFill()
       
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 16, topTrailingRadius: 16, style: .continuous))
            .frame(width: 150, height: 220)
    }
}

#Preview {
    imageTest()
}
