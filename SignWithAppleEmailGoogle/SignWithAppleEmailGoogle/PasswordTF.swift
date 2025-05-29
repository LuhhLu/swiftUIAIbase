

import SwiftUI

struct PasswordTF: View {
    var title:String
    @Binding var text:String
    @FocusState var isActive
    @State var showPassword = false
    var body: some View {
        ZStack(alignment: .leading){
            SecureField(title, text: $text)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.3),in:.rect(cornerRadius: 12))
                .opacity(showPassword ? 0 : 1)
            TextField(title, text: $text)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.3),in:.rect(cornerRadius: 12))
                .opacity(showPassword ? 1 : 0)
        }
        .overlay(alignment: .trailing) {
            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                .padding(16)
                .contentShape(Rectangle())
                .foregroundStyle(showPassword ? .primary : .secondary)
                .onTapGesture {
                    showPassword.toggle()
                }
        }
        
    }
}

#Preview {
    HomeView()
//    PasswordTF()

}
