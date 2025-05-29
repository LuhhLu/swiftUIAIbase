 
import SwiftUI

struct SoftGlowing: View {
    var body: some View {
        ZStack{
            Color.B_2.ignoresSafeArea()
            Button(action: {
                       print("Join Dazzle Club tapped")
                   }) {}
                   .softGlowingStyle(title: "Join Dazzle Club", icon: "arrow.right")
        }
       
              
    }
}

#Preview {
    SoftGlowing()
}
 

struct SoftGlowingButtonStyle: ButtonStyle {
    var title: String
    var icon: String
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 6) {
            Text(title)
            Image(systemName: icon)
        }
        .font(.system(size: 20))
        .foregroundColor(.T_2)
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(
            Color.PB
                .clipShape(Capsule())
                .shadow(color: Color.psh.opacity(0.5), radius: 20, x: 0, y: 12)
        )
        .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
        .animation(.spring(), value: configuration.isPressed)
    }
}

extension Button {
    func softGlowingStyle(title: String, icon: String) -> some View {
        self.buttonStyle(SoftGlowingButtonStyle(title: title, icon: icon))
    }
}
