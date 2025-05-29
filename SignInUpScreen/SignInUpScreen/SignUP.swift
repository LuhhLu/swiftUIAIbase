 

import SwiftUI

struct SignUP: View {
    @FocusState var isActive
    @Binding var email:String
    @Binding var Password:String
    @Binding var Remember:Bool
    @Binding var showSignIn:Bool
    var action:() -> Void
    var body: some View {
        VStack(spacing:45){
            TopView(title: "Create new account", details: "Please fill in the form to continue")
            InfoTF(title: "Email", text: $email)
            PasswordCheckField()
            SignButton(title: "Sign up", action: {})
            OrView(title: "or")
            HStack(spacing:65){
                signAccount(image: .apple, width: 32, height: 32, action: {})
                signAccount(image: .email, width: 32, height: 32, action: {} )
                signAccount(image: .google, width: 32, height: 32, action: {} )
            }
            Spacer()
            Button {
                email = ""
                Password = ""
                withAnimation {
                    showSignIn.toggle()
                }
            } label: {
                Text("Already have an account? ***Sign in***")
            }
            .tint(.primary)

        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
//    SignUP()
}
