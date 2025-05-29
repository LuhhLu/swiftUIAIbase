import SwiftUI

struct SpinnerView: View {
    @State var step1 = false
    @State var step2 = false

    var body: some View {
        VStack(spacing:1) {
             Rectangle()
                .frame(width: 30, height: 30)
                .offset(x: step2 ? -15 : 0, y: step1 ? 30 : 0)
            Rectangle()
                .frame(width: 30, height: 30)
                .offset(x: step2 ? 15 : -30, y: step1 ? -30 : 0)
          
        }
        .offset(x: 10)
        .onAppear { animateLoop() }
    }

    func animateLoop() {
        withAnimation(.linear(duration: 0.4)) { step1.toggle()}
        withAnimation(.linear(duration: 0.4).delay(0.5)) { step2.toggle() }
        withAnimation(.linear(duration: 0.4).delay(1.0)) { step1.toggle() }
        withAnimation(.linear(duration: 0.4).delay(1.5)) { step2.toggle() }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){animateLoop() }
    }
}

#Preview {
    SpinnerView()
}
