 

import SwiftUI

struct InfoTextField: View {
    @State var Fname = ""
    @State var Lname = ""
    var body: some View {
        VStack(spacing:50) {
            InfoField(title: "First Name", text: $Fname)
            InfoField(title: "Last Name", text: $Lname)
     
        }
        .padding()
    }
}

#Preview {
    InfoTextField()
}
struct InfoField: View {
    let title:String
    @Binding var text:String
    @FocusState var isTyping:Bool
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text).padding(.leading)
                .frame(height: 55).focused($isTyping)
                .frame(maxWidth: .infinity)
                .background(isTyping ? .indigo : .gray.opacity(0.3),in:RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2))
            Text(title).padding(.horizontal,5)
                .background(.DL.opacity(isTyping || !text.isEmpty ? 1 : 0))
                .foregroundStyle(isTyping ? .indigo : .gray.opacity(0.5))
                .padding(.leading).offset(y: isTyping || !text.isEmpty ? -27 : 0)
                .onTapGesture {
                        isTyping .toggle()

                }
        }
        .animation(.linear(duration: 0.2), value: isTyping)
       
    }
}

 
