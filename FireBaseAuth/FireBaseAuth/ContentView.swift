
import SwiftUI
import FirebaseAuth
struct ContentView: View {
    @State private var text:String = "Sign Up"
    @State private var isSquareVisible = false
    @State private var count = 0
    @State var isSignInOrUp  = false
    @State var textfield = ""
    @State var email  = ""
    @State var password = ""
    @State var showProfile:Bool = false
    @State var showalert :Bool = false
    @State var showAlertView:Bool = false
    @State var alertTitel:String = ""
    @State var alertMasseag:String = ""
    let SigninS =  "Sign in"
    let SignUpS =  "Sign Up"
    var body: some View {
        ZStack {
            Image("background-1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                VStack(spacing: 15) {
                  signText()
                    EPtextfild(EPtype: $email, icon: "envelope.fill", text: "Email")
                    Line()
                    EPtextfild(EPtype: $password, icon: "key.fill", text: "passowrd")
                    SigninOruoButton()
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 330)
                .background(.white)
                .cornerRadius(30)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(.black,lineWidth: 5)
                })
            .padding()
                Text("Reset password").bold()
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal,30)
                    .onTapGesture {
                        sentresetpassword()
                    }
            }
            
        }
        .overlay(alignment: .bottomLeading, content: {
            swichsignbutton()
        })
//        .fullScreenCover(isPresented: $showProfile, content: {
//            profileView()
//        })
        .alert(isPresented: $showAlertView, content: {
            Alert(title: Text(alertTitel), message: Text(alertMasseag), dismissButton: .cancel())
        })
        
    }
    func sentresetpassword(){
        Auth.auth().sendPasswordReset(withEmail: email){
            error in
            guard error == nil else{
                alertTitel = "Uh-oh!"
                alertMasseag = (error!.localizedDescription)
                showAlertView.toggle()
                return
            }
            alertTitel = "password reset email sent"
            alertMasseag = "check your email"
            showAlertView.toggle()
        }
    }
    func signinorup(){
        if isSignInOrUp{
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard error == nil else{
                    alertTitel = "Uh-oh!"
                    alertMasseag = (error!.localizedDescription)
                    showAlertView.toggle()
                    return
                }
            }
        }else{
            Auth.auth().createUser(withEmail: email, password: password){
                result,error in
                guard error == nil else{
                    alertTitel = "Uh-oh!"
                    alertMasseag = (error!.localizedDescription)
                    showAlertView.toggle()
                    return
                }
            }
        }
       
    }
    func keyBAnimation(){
        if count == 5 {
            count = 0
            isSquareVisible = false
            return
        }
        withAnimation(.easeInOut(duration: 0.5)){
            self.isSquareVisible.toggle()
            
        }
        count += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
            self.keyBAnimation()
        }
    }
    func typeText(){
        text = ""
        for character in isSignInOrUp ? SigninS : SignUpS {
            text += "\(character)"
            RunLoop.current.run(until: Date() + 0.15)
        }
    }
    @ViewBuilder
    func  swichsignbutton() -> some View {
        Button(action: {
            withAnimation{
                email = ""
                text = ""
                password = ""
                keyBAnimation()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.typeText()
                }
                isSignInOrUp.toggle()
            }
 
        }, label: {
            HStack{
                Image("Gmail")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text(isSignInOrUp ? "Sign UP" : "Sign in").bold()
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding(35)
        })
    }
    @ViewBuilder
    func  signText() -> some View {
        HStack{
            Text(text).bold()
                .font(.largeTitle)
                .foregroundColor(.black)
            if isSquareVisible{
                Rectangle()
                    .frame(width: 3, height: 30)
                    .foregroundColor(.black)
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .frame(height: 55)
        
    }
    @ViewBuilder
    func  Line() -> some View {
        Rectangle()
           .frame(maxWidth: .infinity)
           .frame(height: 2)
           .padding(.horizontal,10)
           .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.white,.black]), startPoint: .leading, endPoint: .trailing))
            
    }
    @ViewBuilder
    func  SigninOruoButton() -> some View {
        Button(action: {
            signinorup()
        }, label: {
            Text(isSignInOrUp ? "Sign in" : "Create account").bold()
                .font(.title2).bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(.black)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.20), radius: 4, x: 3, y: 4)
                .shadow(color: .black.opacity(0.20), radius: 4, x: -3, y: -4)
            
        })
        .onAppear{
            Auth.auth().addStateDidChangeListener{
                auth,user in
                if user != nil{
                    showProfile.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct EPtextfild: View {
    @Binding var EPtype:String
    var icon = ""
    var text = ""
    var body: some View {
        HStack{
            Image(systemName: icon)
                .frame(width: 44, height: 44)
                .foregroundColor(Color.gray)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: .black.opacity(0.20), radius: 5, x: 0, y: 5)
                .padding(.horizontal)
            TextField(text, text: $EPtype)
                .colorScheme(.light)
                .foregroundColor(.black)
        }
        .frame(height: 50)
       
    }
}
