import Firebase
import FirebaseAuth
import SwiftUI
import AuthenticationServices

struct SignIn: View {
    @FocusState var isActive
    @Binding var email:String
    @Binding var Password:String
    @Binding var isRememberMeSelected: Bool
    @Binding var showSignUp:Bool
    @State var showForgotView = false
    @State private var errorMessage: String?
    
    @Environment(UserService.self) private var user
    
    var action:() -> Void
    var body: some View {
        VStack(spacing:45){
            TopView(
                title: "Welcome back",
                details: "Please sign up in to your account",
                error: errorMessage
            )
            InfoTF(title: "Email", text: $email)
            VStack(spacing:24){
                PasswordTF(title: "Password", text: $Password)
                HStack{
                    Toggle(isOn: $isRememberMeSelected) {
                        Text("Label")
                    }
                    .toggleStyle(RememberStyle())
                    Spacer()
                    Button {
                        showForgotView.toggle()
                    } label: {
                        Text("Forget password?").bold()
                            .font(.footnote)
                    }
                    .tint(.primary)

                }
            }
            SignButton(title: "Sign in", action: signIn)
            OrView(title: "or")
            VStack(spacing:24){
                SignInProvider(with: .apple, action: .signIn)
                SignInProvider(with: .google, action: .signIn)
            }
            Spacer()
            Button(action: presentSignUp) {
                Text("Don't have an account? ***Sign up***")
            }
            .tint(.primary)
            .offset(y: -35)
        }
        .padding()
        .sheet(isPresented: $showForgotView, content: {
            ForgotView()
                .presentationDetents([.fraction(0.40)])
        })
    }
    
    private func signIn() {
        Task {
            do {
                let result = try await Auth.auth().signIn(withEmail: email, password: Password)
                user.persistence = isRememberMeSelected
                
                withAnimation {
                    user.state = .authorized(result.user)
                }
            } catch {
                errorMessage = "Error creating user: \(error.localizedDescription)"
            }
        }
    }
    
    private func presentSignUp() {
        email = ""
        Password = ""
        withAnimation {
            showSignUp.toggle()
        }
    }
}

#Preview {
    HomeView()
//    SignIn()
}
struct TopView: View {
    var title:String
    var details:String
    let error: String?
    
    var body: some View {
        VStack(alignment:.leading,spacing: 16){
            Text(title).font(.title.bold())
            if let error{
                Text(error)
                    .foregroundStyle(.red)
            }else{
                Text(details)
                    .foregroundStyle(.secondary)
            }
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        
    }
}
struct InfoTF: View {
    var title:String
    @Binding var text:String
    @FocusState var isActive
    var body: some View {
        ZStack(alignment:.leading){
            TextField(title, text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.gray.opacity(0.3),in:.rect(cornerRadius: 12))
        }
    }
}


struct RememberStyle:ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack{
                Image(systemName: configuration.isOn ? "checkmark.square"  :"square" )
                    .contentTransition(.symbolEffect)
                Text("Remember")
            }
        }
        .tint(.primary)

    }
}

struct SignButton: View {
    var title:String
    var action:() -> Void
    var body: some View {
        Button(action: {action()}, label: {
            Text(title).foregroundStyle(.signtext).font(.title2.bold())
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.primary,in: Capsule())
        })
        .tint(.primary)
    }
}
struct OrView: View {
    var title:String
    var body: some View {
        HStack{
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
        Text(title)
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
            
        }
    }
}
