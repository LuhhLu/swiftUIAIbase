
import SwiftUI

struct signup: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State var anim :CGFloat = 0
    @State var anim2 :CGFloat = 0
    @State var anim3 :CGFloat = 0
    @FocusState var  focusfilde: filde?
    @State var nw:CGFloat = 0
    @State var ew:CGFloat = 0
    @State var pw:CGFloat = 0
    @State var heding = false
    @Binding var transtionl:Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Image("sup").resizable().scaledToFill()
                .frame(width: 180, height: 180)
                .offset(y: 30)
                .frame(maxWidth: .infinity,alignment: .center)
            Spacer()
            Group {
                TextField("", text: $name)
                    .padding()
                    .textFStyle(width: nw, text: "name", anim: anim3)
                    .textContentType(.name)
                    .focused($focusfilde, equals: .name)
                TextField("", text: $email)
                    .padding()
                    .textFStyle(width: ew, text: "Email", anim: anim)
                    .textContentType(.emailAddress)
                    .focused($focusfilde, equals: .email)
                ZStack(alignment: .trailing){
                    if !heding{
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
                            heding.toggle()
                    } label: {
                        Image(systemName:heding ? "eye" :"eye.slash")
                            .padding(.trailing)
                            .foregroundColor(.black)
                             
                    }
                }
            }
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .frame(maxWidth:.infinity)
                .frame(height: 55)
                .overlay {
                    Text("Sign up").bold().font(.title3)
                        .foregroundColor(.white)
                }
            Button {
                transtionl.toggle()
            } label: {
                Text("Already have an account?")
                +
                Text("**Signin**")
            }
            .foregroundColor(.black)

           
                 
            ZStack{
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black,.white,.black]), startPoint: .leading, endPoint: .trailing))
                Text("or").bold()
                    .offset(y: -1.5)
            }
            Text("Login in with one of the follwoing")
            HStack(spacing: 20){
                SignWithButton(icon: "Gi")
                SignWithButton(icon: "Ai",width: 24,height: 24 )
                    
            }
            .onChange(of: focusfilde) { newValue in
                if email.isEmpty{
                    withAnimation(.spring()) {
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
                    withAnimation(.spring()) {
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
                    pw = 93
                }
                if name.isEmpty{
                    withAnimation(.spring()) {
                        if newValue == .name{
                            anim3 = -30
                            nw = 60
                        }else{
                            anim3 = 0
                            nw = 0
                        }
                    }
                }else{
                    anim3 = -30
                    nw = 60
                }
               
            }
            Spacer()
        }
        .padding()
    }
}

struct signup_Previews: PreviewProvider {
    static var previews: some View {
        signup( transtionl: .constant(false))
        
    }
}
 
