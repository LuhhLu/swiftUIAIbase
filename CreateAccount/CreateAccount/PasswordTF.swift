
import SwiftUI

struct PasswordTF: View {
    var title:String
    var details:String
    @Binding var Input:String
    @FocusState var isActive
    @State var showPassword = false
    var body: some View {
        VStack (alignment:.leading){
          Text(title)
            ZStack(alignment: .leading) {
                SecureField(details, text: $Input)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55).focused($isActive)
                    .background(.gray.opacity(0.3),in: .rect(cornerRadius: 12))
                    .opacity(showPassword ? 0 : 1)
                TextField(details, text: $Input)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55).focused($isActive)
                    .background(.gray.opacity(0.3),in: .rect(cornerRadius: 12))
                    .opacity(showPassword ? 1 : 0)
            }
            .overlay(content: {
                RoundedRectangle(cornerRadius: 12).stroke(isActive ? .blue : .clear,lineWidth: 2)
            })
            .overlay(alignment: .trailing) {
                Image(systemName:showPassword ? "eye.fill" : "eye.slash.fill")
                    .padding()
                    .contentShape(Rectangle())
                    .foregroundStyle(showPassword ? .primary : .secondary)
                    .onTapGesture {
                        showPassword.toggle()
                    }
            }
        }
        
    }
}

#Preview {
    
    PasswordTF(title: "Password", details: "Create a password", Input: .constant(""))
    
}
