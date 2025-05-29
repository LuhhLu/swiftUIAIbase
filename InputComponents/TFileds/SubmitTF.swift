 

import SwiftUI

struct SubmitTF: View {
    @Binding var text:String
    var action:() -> Void
    var body: some View {
        VStack{
            TextField("Sumbit", text: $text)
                .padding(.leading,25)
                .frame(height: 70)
                .padding(.trailing,50)
                .background(.gray.tertiary,in:.capsule)
                .overlay(alignment: .trailing) {
                    SubmitButton
                }
        }
    }
    var SubmitButton:some View{
        Button(action: {
            action()
        }) {
            Image(systemName:"arrow.up.right")
                .font(.title).padding(13)
                .background(.DL,in:.circle)
                
        }
        .tint(.primary)
        .padding(.trailing,10)
    }
}

#Preview {
    SubmitTF(text: .constant(""),action: {})
}
