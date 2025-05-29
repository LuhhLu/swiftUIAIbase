 
import SwiftUI

struct GlowGradientButtonStyle: View {
    var body: some View {
        Button(action: {}) {Text("Get started")}.buttonStyle(GradientButtonStyle())
             
    }
}

#Preview {
    GlowGradientButtonStyle()
}
 
 
struct GradientButtonStyle:ButtonStyle{
    let gradientColors = Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .pink])
    @State var isAnimating = false
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .stroke(AngularGradient.init(gradient: gradientColors, center: .center, angle: .degrees(isAnimating ? 360 : 0)),lineWidth: 14)
                .frame(width: 210, height: 30)
                .offset(y: 30)
                .blur(radius: 30)
            configuration.label.font(.title2).bold()
                .foregroundStyle(.white)
                .frame(width: 280, height: 60)
                .background(.bcolor,in: .rect(cornerRadius: 20))
                .overlay {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(AngularGradient.init(gradient: gradientColors, center: .center, angle: .degrees(isAnimating ? 360 : 0)),lineWidth: 3)
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 4)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black,.black,.clear]), startPoint: .top, endPoint: .bottom))
                    }
                    
                        
                    
                }
            
        }
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
        .animation(.spring, value: configuration.isPressed)
        .onAppear(){
            withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                isAnimating = true
            }
        }
    }
}
