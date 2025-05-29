 

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUP: View {
    @FocusState var isActive
    @Binding var email:String
    @Binding var password:String
    @Binding var Remember:Bool
    @Binding var showSignIn:Bool
    
    @State private var errorMessage: String?
    @Environment(UserService.self) private var user
    
    var action:() -> Void
    var body: some View {
        VStack(spacing:45){
            TopView(
                title: "Create new account",
                details: "Please fill in the form to continue",
                error: errorMessage
            )
            InfoTF(title: "Email", text: $email)
            PasswordCheckField(text: $password)
            SignButton(title: "Sign up", action: signUp)
            OrView(title: "or")
            VStack(spacing:24){
                SignInProvider(with: .apple, action: .signUp)
                SignInProvider(with: .google, action: .signUp)
            }
            Spacer()
            Button(action: dismissSignUp) {
                Text("Already have an account? ***Sign in***")
            }
            .tint(.primary)
            .offset(y: -35)
        }
        .padding(.horizontal)
    }
    
    private func signUp() {
        Task {
            do {
                try await Auth.auth().createUser(withEmail: email, password: password)
                dismissSignUp()
            } catch {
                errorMessage = "Error creating user: \(error.localizedDescription)"
            }
        }
    }
    
    private func dismissSignUp() {
        email = ""
        password = ""
        withAnimation {
            showSignIn.toggle()
        }
    }
}

#Preview {
    HomeView()
//    SignUP()
}
