 

import SwiftUI

struct CadrTow: View {
    var body: some View {
        ZStack{
            Color("bg")
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 250, height: 350)
                .foregroundColor(Color("bg"))
                .shadow(color: .black.opacity(0.12), radius: 10, x: 25, y: 20)
                .shadow(color: .white.opacity(0.5), radius: 10, x: -25, y: -20)
        }
        .ignoresSafeArea()
    }
}

struct CadrTow_Previews: PreviewProvider {
    static var previews: some View {
        CadrTow()
    }
}
