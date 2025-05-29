 

import SwiftUI

struct LoadingButton: View {
    @State  var spin = false
    @State  var isPressed = false
    @State  var next: CGFloat = 73
    @State  var hasBeenPressed = false
    var StartTitle:String
    var EndTitle:String
    @Binding  var reset:Bool 
    var action:() -> Void
    var body: some View {
        textAnimation(StartTitle: StartTitle, EndTitle: EndTitle, next: $next, spin: $spin)
            .frame(width: 280, height: 55)
            .clipped()
            .background(.black,in: .rect(cornerRadius: 12))
            .scaleEffect(isPressed ? 1.1 : 1)
            .animation(.spring, value: isPressed)
            .animation(.spring(duration: 1), value: next)
            .gesture(dragGesture())
        
    }
    func dragGesture() -> some Gesture{
      DragGesture(minimumDistance: 0)
            .onChanged { _ in
                isPressed = true
            }
            .onEnded { _ in
                action()
                isPressed = false
                if !hasBeenPressed{
                    hasBeenPressed = true
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        spin = true
                    }
                    next -= 73
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        next -= 73
                        
                    }
                }
            }
    }
    private func resetStateSaveButton() {
            spin = false
            next = 73
            hasBeenPressed = false
    }
}
#Preview {
    HomeView()
}

//#Preview {
//    LoadingButton(StartTitle: "Save", EndTitle: "Success!")
//}
struct textAnimation: View {
    var StartTitle:String
    var EndTitle:String
    @Binding var next: CGFloat
    @Binding var spin:Bool
    var body: some View {
        VStack(spacing:50){
            Text(EndTitle)
            Circle().trim(from: 0, to: 0.8)
                .stroke(lineWidth: 3)
                .frame(width: 25, height: 25)
                .rotationEffect(.degrees(spin ? 360 : 0))
                Text(StartTitle)
        }
        .bold()
        .foregroundStyle(.white)
        .offset(y: -next)
    }
}

 
