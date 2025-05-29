 
import SwiftUI

struct ContentView: View {
    @State var start = false
    var body: some View {
        ScrollView {
            VStack(spacing:40) {
                Image(systemName: "bolt.heart.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(.red)
                    .reflection(spacing: -10)
                    .scaleEffect(start ? 1.3 : 1)
                
                    .padding(.top)
                
                Text("SwiftUI").font(.system(size: 100))
                    .foregroundStyle(.blue.gradient)
                    .reflection(spacing: -40)
                
                Image(.im9).resizable().scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .reflection()
                
              
            }
        }
        .scrollIndicators(.hidden)
        .onAppear(){
            withAnimation(.spring(duration:1).repeatForever(autoreverses: true)) {
                start.toggle()
            }
        }
      
    }
}

#Preview {
    ContentView()
}

struct ReflectionModifier:ViewModifier{
    var opacity:Double
    var spacing:CGFloat
    func body(content: Content) -> some View {
        VStack(spacing:0){
            content
            content
                .scaleEffect(-1)
                .mask(
                    LinearGradient(gradient: Gradient(colors: [.black,.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                )
                .mask(
                    LinearGradient(gradient: Gradient(colors: [.black,.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                )
                .opacity(opacity)
                .offset(y: spacing)
            
        }
   
        
    }
}

extension View{
    func reflection(opacity:Double = 0.4 ,spacing:CGFloat = 0 ) -> some View{
        self.modifier(ReflectionModifier(opacity: opacity, spacing: spacing))
    }
}
