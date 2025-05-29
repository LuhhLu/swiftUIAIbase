 

import SwiftUI

struct SecurePasswordField: View {
    @State var password: String = ""
    @FocusState var isFocused: Bool
    var body: some View {
        HStack {
            Image(systemName: "lock.fill")
                .padding(.leading)
            SecureField("Password", text: $password)
                .padding(.leading,8)
                .focused($isFocused)
                .frame(height: 55)
        }
        .background(Color(.systemGray6) ,in:.rect(cornerRadius: 12))
        .overlay(content: {
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isFocused ? .blue.opacity(0.2) : .clear, lineWidth: 8)
                    .padding(-3)
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isFocused ? Color.blue : .clear, lineWidth: 2)
            }
           
        })
        .padding(.horizontal,40)
    }
}

#Preview {
    SecurePasswordField()
}
