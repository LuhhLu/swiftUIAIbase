 
import SwiftUI

struct TitleView: View {
    var text:String
    @Binding var show : Bool
     var body: some View {
        Text(text).foregroundStyle(.white)
            .overlay(alignment: .trailing) {
                Rectangle()
                .foregroundStyle(.black)
                .frame(maxWidth: show ? 0 : .infinity)
            }

    }
}

#Preview {
    TitleView(text: "hello", show: .constant(false))
}
