 

import SwiftUI
enum filde:Hashable{
    case name
    case email
    case password
}
struct signin: View {
    @State var email = ""
    @State var password = ""
    @State var anim :CGFloat = 0
    @State var anim2 :CGFloat = 0
    @FocusState var  focusfilde: filde?
    @State var ew:CGFloat = 0
    @State var pw:CGFloat = 0
    @State var hiding = false
    @Binding var transtionl:Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            Image("sin").resizable().scaledToFill()
                .frame(width: 250, height: 250)
                .frame(maxWidth: .infinity,alignment: .center)
            Group {
                TextField("", text: $email)
                    .padding()
                    .textFStyle(width: ew, text: "Email", anim: anim)
                    .textContentType(.emailAddress)
                    .focused($focusfilde, equals: .email)
                ZStack(alignment: .trailing){
                    if !hiding{
                        SecureField("", text: $password)
                            .frame(height: 55)
                            .padding(.leading)
                            .textFStyle(width: pw, text: "Password", anim: anim2)
                            .textContentType(.password)
                            .focused($focusfilde, equals: .password)
                    }else{
                        TextField("", text: $password)
                            .frame(height: 55)
                            .padding(.leading)
                            .textFStyle(width: pw, text: "Password", anim: anim2)
                            .textContentType(.password)
                            .focused($focusfilde, equals: .password)
                        
                    }
                    Button {
                        hiding.toggle()
                    } label: {
                        Image(systemName: hiding ? "eye" : "eye.slash")
                            .padding(.trailing)
                            .foregroundColor(.black)
                    }
                    
                }
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .frame(height: 55)
                    .overlay {
                        Text("Sign in").bold().font(.title3)
                            .foregroundColor(.white)
                        
                    }
                Button {
                    transtionl.toggle()
                } label: {
                    Text("Dont have an account? **Signup**")
                     
                }
                .foregroundColor(.black)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black,.white,.black]), startPoint: .leading, endPoint: .trailing))
                    .overlay {
                        Text("or")
                            .offset(y: -1.5)
                    }
                Text("Login in with one of the follwoing")
                HStack(spacing: 20){
                    SignWithButton(icon: "Gi")
                   SignWithButton(icon: "Ai", width: 24, height: 24)
                }
               

            }
           
            
              
            Spacer()
        }
        .padding()
        .onChange(of: focusfilde) { newValue in
            if email.isEmpty{
                withAnimation(.spring()){
                    if newValue == .email{
                        anim = -30
                        ew = 60
                    }else{
                        anim = 0
                        ew = 0
                    }
                }
            }else{
                anim = -30
                ew = 60
            }
            if password.isEmpty{
                withAnimation(.spring()){
                    if newValue == .password{
                        anim2 = -30
                        pw = 93
                    }else{
                        anim2 = 0
                        pw = 0
                    }
                }
            }else{
                anim2 = -30
                pw = 90
            }
        }
        
    }
}

struct signin_Previews: PreviewProvider {
    static var previews: some View {
        signin(transtionl: .constant(false))
    }
}
struct TextFStyle:ViewModifier{
    var width:CGFloat
    var text:String
    var anim:CGFloat
    func body(content: Content) -> some View {
        content
            .overlay {
                ZStack{
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(lineWidth: 2.5)
                    ZStack (alignment: .leading){
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .frame(width: width, height: 27)
                            .padding(.leading,12)
                            .foregroundColor(Color("tf"))
                        Text(text).bold()
                            .padding(.leading,20)
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .offset(y:anim)
                    
                }
            }
    }
    
}
extension View{
    func textFStyle(width:CGFloat ,text:String,anim:CGFloat) -> some View {
        modifier(TextFStyle(width: width, text: text, anim: anim))
    }
}
 

struct SignWithButton: View {
    var icon:String
    var width:CGFloat = 30
    var height:CGFloat =  30
    var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .frame(width: 170, height: 55)
            .overlay {
                Image(icon).resizable().scaledToFill()
                    .frame(width: width, height: height)
            }
    }
}
