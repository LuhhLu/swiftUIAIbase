

import SwiftUI

struct profileVeiw: View {
    var body: some View {
        HStack {
            Image(systemName: "rectangle.grid.2x2")
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(lineWidth: 1)
                }
            Spacer()
            Text("TimerBoard")
                .font(.custom("PatrickHand-Regular", size: 30))
            Spacer()
            Image(.profile).resizable().scaledToFill()
                .frame(width: 45, height: 43)
                .clipShape(.rect(cornerRadius: 6))
                
            
        }
    }
}

#Preview {
    profileVeiw()
}
