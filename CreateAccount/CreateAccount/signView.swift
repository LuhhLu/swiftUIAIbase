 

import SwiftUI

struct signView: View {
    @State var Name = ""
    @State var Email = ""
    @State var Password = ""
    @FocusState var  focusState
    var body: some View {
        VStack(spacing:24){
            InfoTF(title: "Name", details: "Enter your name", input: $Name)
            InfoTF(title: "Email", details: "Enter your email", input: $Email)
            PasswordTF(title: "Password", details: "Create a password", Input: $Password)
        }
        
    }
}

#Preview {
    signView()
}
struct InfoTF: View {
    var title:String
    var details:String
    @Binding var input:String
    @FocusState var  focusState
    var body: some View {
        VStack(alignment:.leading,spacing: 10){
            Text(title).bold()
            TextField(details, text: $input)
                .padding(.leading)
                .frame(height: 55)
                .background(.gray.opacity(0.3),in: .rect(cornerRadius: 12))
                .focused($focusState)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(focusState ? .blue : .clear,lineWidth: 2)
                }
        }
    }
}

 
