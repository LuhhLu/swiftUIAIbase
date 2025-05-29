 

import SwiftUI

struct SideBarIconA: View {
    @Binding var show : Bool
    var body: some View {
        VStack(spacing: 4){
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .frame(width: 30, height: 4)
            HStack(spacing: show ? 0 : 10){
                RoundedRectangle(cornerRadius: 19, style: .continuous)
                    .frame(width: 15, height: 4)
                RoundedRectangle(cornerRadius: 19, style: .continuous)
                    .frame(width: 15, height: 4)
                    .offset(y: show ? 0 : -16)
            }
            .rotationEffect(.degrees(show ? 80 : 0), anchor: .bottom)
            .offset(y: show ? -10 : 0)
            .offset(x: show ? -2 : 0)
            
        }
        .rotationEffect(.degrees(show ? 50 : 0))
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
    }
}

struct SideBarIconA_Previews: PreviewProvider {
    static var previews: some View {
        SideBarIconA(show: .constant(false))
    }
}
