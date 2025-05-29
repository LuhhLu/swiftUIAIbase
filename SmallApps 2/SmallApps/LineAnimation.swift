 
import SwiftUI

struct LineAnimation: View {
    @State var show = true
    @State var top = false
    var body: some View {
        ZStack{
            HStack(spacing:20){
                LineView(color: .red, show: $show, top: $top)
                    .scaleEffect(-1)
                LineView(color: .yellow, show: $show, top: $top)
            }
            HStack(spacing:20){
                LineView(color: .purple, show: $show, top: $top)
                    .scaleEffect(-1)
                LineView(color: .mint, show: $show, top: $top)
            }
            .rotationEffect(.degrees(90))
            .opacity(0.7)
          
        }
//        .scaleEffect(3)
     
            .onAppear(){
                startAnimation()
            }
    }
    
    func startAnimation() {
        withAnimation(.easeInOut(duration: 0.5)) {
            show.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation() {
                top.toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 0.5)) {
                show.toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                startAnimation()
            }
        }
    }
}

#Preview {
    LineAnimation()
}
struct LineView: View {
    var color:Color
    @Binding var show :Bool
    @Binding var top:Bool
    var body: some View {
        ZStack(alignment:.top){
            Capsule()
                .frame(width: 10, height: show ? 50 : 10)
                .frame(maxHeight: .infinity,alignment:  top ? .top : .bottom)
                .foregroundStyle(color)
        }
        .frame(height: 50)
    }
}
 
