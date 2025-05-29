 
import SwiftUI

struct NeonGlow: View {
    @State var Index = 0
    let color: [Color] = [.green, .pink, .blue, .orange, .purple]
    let title: [String] = ["NEON", "GLOW", "LIGHT","SHINE", "BRIGHT"]
    var body: some View {
            
                Text(title[Index])
                    .font(.system(size: 70, weight: .thin))
                    .contentTransition(.numericText())
                    .frame(width: 250)
          
            .shadow(color: color[Index], radius: 5)
            .shadow(color: color[Index], radius: 5 )
            .shadow(color: color[Index], radius: 50 )
            .shadow(color: color[Index], radius: 100)
            .shadow(color: color[Index], radius: 200)
        
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                withAnimation {
                    Index = (Index + 1) % color.count
                }
            }
        }
    }
}

#Preview {
    NeonGlow()
}

 
   
 
