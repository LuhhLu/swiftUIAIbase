 

import SwiftUI

struct TermsAndPrivacyView: View {
    @Binding var Agree:Bool
    var body: some View {
        HStack{
            Toggle("",isOn:$Agree)
                .toggleStyle(CustomToggle()).contentTransition(.symbolEffect)
            HStack(spacing:0){
                Text("I agree with ")
                Button(action: {
                    if let url = URL(string: "https://www.example.com/terms") {
                        UIApplication.shared.open(url)
                    }
                }, label: {
                    Text("Terms and conditions").bold()
                        .underline()
                })
            }
            .foregroundStyle(.primary)
        }
    }
}

#Preview {
    TermsAndPrivacyView(Agree: .constant(false))
}
struct CustomToggle:ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            Image(systemName:configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundStyle(configuration.isOn ? .green : .gray)
           
        })
        
    }
}
