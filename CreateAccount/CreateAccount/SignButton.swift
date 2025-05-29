 
import SwiftUI

struct SignButton: View {
    @Binding var Agree :Bool
    @State var buttonText = "Create Account"
    @State var buttonColor = Color.gray.opacity(0.3)
    @State var buttonIcon = ""
    @State var attempts = 0
    var body: some View {
        ZStack{
            Group{
                if !buttonIcon.isEmpty{
                    if buttonIcon == "rays"{
                        Image(systemName: buttonIcon)
                            .symbolEffect(.variableColor.iterative)
                    }else{
                        Image(systemName: buttonIcon)
                    }
                }

            }
            .contentTransition(.symbolEffect)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.leading)
            Text(buttonText)
            
        }
        .foregroundStyle(.primary)
        .frame(maxWidth: .infinity)
        .frame(height: 55)
        .background(buttonColor,in: Capsule())
        .shakeEffect(shakes: CGFloat(attempts))
        .onTapGesture {
            handleButtonPress()
        }
        .onChange(of: Agree) { oldValue, newValue in
            resetState()
        }
        
    }
    func handleButtonPress() {
       if Agree {
           buttonText = "Creating..."
           buttonColor = .gray.opacity(0.3)
           buttonIcon = "rays"
           DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
               buttonText = "Account Created"
               buttonColor = .green
               buttonIcon = "checkmark"
           }
       } else {
           triggerShake()
           buttonText = "Please Agree"
           buttonColor = .red
           buttonIcon = "exclamationmark.triangle"
       }
   }
    func resetState() {
   buttonText = "Create Account"
   buttonColor = .gray.opacity(0.3)
   buttonIcon = ""
   
}
    func triggerShake() {
        withAnimation(Animation.linear(duration: 0.2).repeatCount(1, autoreverses: true)) {
           self.attempts += 1
       }
    }


}

#Preview {
    SignButton(Agree:.constant(true))
}





struct ShakeEffect: AnimatableModifier {
var shakes: CGFloat = 0
var animatableData: CGFloat {
    get { shakes }
    set { shakes = newValue }
}
func body(content: Content) -> some View {
    content
        .offset(x: sin(shakes * .pi * 2) * 10)
}
}
extension View {
func shakeEffect(shakes: CGFloat) -> some View {
    self.modifier(ShakeEffect(shakes: shakes))
}
}
