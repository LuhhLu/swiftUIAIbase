 

import SwiftUI

struct SignIn: View {
    @FocusState var isActive
    @Binding var email:String
    @Binding var Password:String
    @Binding var Remember:Bool
    @Binding var showSignUp:Bool
    @State var showForgotView = false
    var action:() -> Void
    var body: some View {
        VStack(spacing:45){
            TopView(title: "Welcome back", details: "Please sign up in to your account")
            InfoTF(title: "Email", text: $email)
            VStack(spacing:24){
                PasswordTF(title: "Password", text: $Password)
                HStack{
                    Toggle(isOn: $Remember, label: {
                        Text("Label")
                    })
                    .toggleStyle(RememberStyle())
                    Spacer()
                    Button(action: {
                        showForgotView.toggle()
                    }, label: {
                        Text("Forget password?").bold()
                            .font(.footnote)
                    })
                    .tint(.primary)
                }
              
            }
            SignButton(title: "Sign in", action: {})
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
                    showSignUp.toggle()
                }
            } label: {
                Text("Don't have an account? ***Sign up***")
            }
            .tint(.primary)

        }
        .padding()
        .sheet(isPresented: $showForgotView, content: {
            ForgotView()
                .presentationDetents([.fraction(0.40)])
        })
    }
}

#Preview {
    HomeView()
//    SignIn()
}
struct TopView: View {
    var title:String
    var details:String
    var body: some View {
        VStack(alignment:.leading,spacing: 16){
            Text(title).font(.title.bold())
            Text(details)
                .foregroundStyle(.secondary)
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
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3),in: .rect(cornerRadius: 16))
            Text(title).padding(.leading)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .animation(.spring, value: isActive)
                .foregroundStyle(isActive ? .primary : .secondary)
                .onTapGesture {
                    isActive = true
                }
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
                .background(.primary,in: .rect(cornerRadius: 16))
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

 
 
struct signAccount: View {
    var image:ImageResource
    var width:CGFloat
    var height:CGFloat
    var action:() -> Void
    var body: some View {
        Button(action: {}, label: {
            Image(image).renderingMode(.template)
                .resizable().scaledToFill()
                .frame(width: width, height: height)
                .overlay {
                    RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1.5)
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.gray.opacity(0.3))
                }
        })
        .tint(.primary)
    }
}

 
