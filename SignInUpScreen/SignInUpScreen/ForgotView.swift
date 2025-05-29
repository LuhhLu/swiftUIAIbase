 
import SwiftUI

struct ForgotView: View {
    @State var email = ""
    var body: some View {
        VStack(spacing:28){
            VStack(spacing:8){
                Text("Forgot your password?").font(.title.bold())
                Text("Enter your email address and we will share a link to create a newpassword").fixedSize(horizontal: false, vertical: true)
                    .foregroundStyle(.secondary)
            }
            .multilineTextAlignment(.center)
            TextField("Email", text: $email)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.gray.opacity(0.3),in: .rect(cornerRadius: 16))
           
            SignButton(title: "Send", action: {})
            Spacer()
        }
        .padding()
        .padding(.top,20)
    }
}

#Preview {
    ForgotView()
}
