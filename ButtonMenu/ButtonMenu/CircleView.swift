 

import SwiftUI

struct CircleView: View {
    @Binding var show :Bool
    var body: some View {
        RoundedRectangle(cornerRadius: show ? 16 : 40)
            .frame(width: show ? 125 : 50, height: show ? 210 : 50)
            .foregroundStyle(.BG)
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomLeading)
            .padding(20)
            .onTapGesture {
                withAnimation(.snappy) {
                    show.toggle()
                }
            }
    }
}

//#Preview {
//    CircleView()
//}
