 

import SwiftUI

struct ShakeButton: View {
    @State var attempts = 0
    @State var shapeColor:Color = .white
    var body: some View {

        RoundedRectangle(cornerRadius: 12)
            .frame(width: 200, height: 150)
            .padding(.bottom,50)
            .foregroundStyle(shapeColor)
            .shakeEffect(shakes: CGFloat(attempts))
        Button(action: {
            triggerShake()
           
        }, label: {
            Text("Shake").font(.title2).foregroundStyle(.white)
                .frame(width: 200, height: 55)
                .background(.gray.opacity(0.3),in: .rect(cornerRadius: 12))
        })
        
 
    }
    func triggerShake() {
        withAnimation(Animation.linear(duration: 0.2).repeatCount(1, autoreverses: true)) {
           self.attempts += 1
            shapeColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                shapeColor = .white
            }
            
       }
    }
}

#Preview {
    ShakeButton()
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
