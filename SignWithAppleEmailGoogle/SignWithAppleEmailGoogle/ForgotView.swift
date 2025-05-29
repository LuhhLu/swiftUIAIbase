
import FirebaseAuth
import SwiftUI

struct ForgotView: View {
    @State var email = ""
    @State private var errorMessage: String?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing:28){
            VStack(spacing:8){
                Text("Forgot your password?").font(.title.bold())
                if let errorMessage {
                    Text(errorMessage).fixedSize(horizontal: false, vertical: true)
                        .foregroundStyle(.red)
                } else {
                    Text("Enter your email address and we will share a link to create a new password").fixedSize(horizontal: false, vertical: true)
                        .foregroundStyle(.secondary)
                }
                
            }
            .multilineTextAlignment(.center)
            TextField("Email", text: $email)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.gray.opacity(0.3),in: .rect(cornerRadius: 12))
           
            SignButton(title: "Send", action: sendPasswordReset)
            Spacer()
        }
        .padding()
        .padding(.top,20)
    }
    
    private func sendPasswordReset() {
        Task {
            do {
                try await Auth.auth().sendPasswordReset(withEmail: email)
                email = ""
                dismiss()
            } catch {
                errorMessage = "Error sending password reset email: \(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    ForgotView()
}
