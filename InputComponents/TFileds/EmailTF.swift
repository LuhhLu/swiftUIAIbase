 

import SwiftUI

struct EmailTF: View {
    @Binding var emailAddress:String
    @Binding var send:Bool
    var action:() -> Void
    @State var isValidEmail = true
    @State var showError = false
    var body: some View {
        
        VStack{
            TextField("email address", text: $emailAddress)
                .padding(.leading, 10).padding(.trailing, 50)
                .frame(height: 70)
                .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 12))
                .contentTransition(.symbolEffect)
                .foregroundColor(isValidEmail ? .primary : .red)
                .overlay(alignment: .trailing) {
                    SendButton(send: $send) {
                        isValidEmail = validateEmail(emailAddress)
                        if isValidEmail{
                            withAnimation {
                                action()
                                showError = false
                            }
                        }else{
                            showError = true
                        }
                    }
                }
                .overlay(alignment: .topLeading) {
                    if showError {
                        invalidView
                    }
                }
        }
        .onChange(of: emailAddress) { oldValue, newValue in
            isValidEmail = true
            showError = false
        }
         
    }
    
    var invalidView:some View{
        Text("Invalid email address")
            .foregroundColor(.red)
            .font(.caption)
            .padding(.leading,10)
            .offset(y: -25)
            .transition(.opacity)
    }
    
    private func validateEmail(_ email: String) -> Bool {
        let emailPattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
        
        // Check if email format matches basic pattern
        guard predicate.evaluate(with: email) else { return false }
        
        // Check if domain part contains at least one period
        if let domainPart = email.split(separator: "@").last {
            return domainPart.contains(".")
        }
        return false
    }
}

#Preview {
    EmailTF(emailAddress: .constant(""), send:  .constant(false), action: {})}
struct SendButton: View {
    @Binding var send: Bool
    var action:() -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: send ? "checkmark" : "arrow.right")
                .font(.title).padding(12)
                .foregroundStyle(.DL)
                .background(.primary, in: RoundedRectangle(cornerRadius: send ? 50 : 8))
                .contentTransition(.symbolEffect)
        }
        .padding(.trailing, 10)
        .tint(.primary)
        
    }
}
