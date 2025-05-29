 

import SwiftUI

struct GlowingButton: View {
    var body: some View {
        ZStack{
            Color.B_1.ignoresSafeArea()
            Button(action: {
                       print("Start Shipping button tapped")
                   }) {
                       EmptyView()
                   }
                   .glowingButtonStyle(title: "Start Shipping", icon: "bolt")
        }
         
    }
}

#Preview {
    GlowingButton()
}
 
struct GlowingButtonStyle:ButtonStyle {
    var title:String
    var icon:String
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing:6){
            Text(title)
            Image(systemName: icon)
        }
        .font(.system(size: 20,weight: .semibold))
        .padding(.horizontal,24)
        .padding(.vertical,12)
        .background(
            Color.YB
            .clipShape(Capsule())
            .shadow(color: .YB.opacity(0.35), radius: 12, x: 0, y: 5)
        )
        .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
        .animation(.spring, value: configuration.isPressed)
        .foregroundStyle(.T_1)
        
    }
}

extension Button{
    func glowingButtonStyle(title:String,icon:String) -> some View {
        self.buttonStyle(GlowingButtonStyle(title: title, icon: icon))
    }
}
