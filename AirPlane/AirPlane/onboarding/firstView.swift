
import SwiftUI

struct firstView: View {
    @State var animate = false
    var body: some View {
        ZStack{
           Rectangle()
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("topC"),Color("botC")]), startPoint: .top, endPoint: .bottom))
                .ignoresSafeArea()
            Image("m1")
                .resizable()
                .scaledToFit()
                .offset(y: animate ? 0 :300)
                .onAnimation(speed: 0.4, damping: 8,animate: animate)
            VStack(alignment: .leading){
                Text("its Big World")
                    .font(.title)
                Text("Out Terer\nGo Explore").bold()
                    .font(.system(size: 80))
                Spacer()
            }
            .foregroundColor(.white)
            .offset(x: animate ? 0 : 300)
            .onAnimation(speed: 0.7, damping: 10,animate: animate)
            .padding(.top)
        }
        
        .onAppear{
            animate.toggle()
        }
    }
}

struct firstView_Previews: PreviewProvider {
    static var previews: some View {
        firstView()
    }
}

struct OnAnimation:ViewModifier{
    var speed:CGFloat
    var damping:CGFloat
    var animate:Bool
    func body(content: Content) -> some View {
        content
            .animation(.interpolatingSpring(stiffness: 100, damping: damping).speed(speed), value: animate)
    }
    
}
extension View {
    func onAnimation(speed:CGFloat = 0.4,damping:CGFloat = 10,animate:Bool = false) -> some View {
        modifier(OnAnimation(speed: speed, damping: damping, animate: animate))
    }
}
