import SwiftUI

struct AniumationTextone: View {
    @State var Yoffset: CGFloat = 0
    @State var tapCount = 4
    var body: some View {
        HStack {
            Text("Learning SwiftUI is")
            VStack(alignment: .leading, spacing: 20) {
                Text("engaging")
                    .foregroundStyle(.blue)
                Text("efficient")
                    .foregroundStyle(.orange)
                Text("modern")
                    .foregroundStyle(.green)
                Text("versatile")
                    .foregroundStyle(.purple)
            }
            
            .offset(y: 69)
            .offset(y: Yoffset)
            .mask({
                Rectangle()
                    .frame(height: 50)
            })
          
        }
        .font(.title2.bold())
        
        .onAppear() {
            startTimer()
        }
    }
    
      func startTimer() {
          Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
              if tapCount > 1 {
                  withAnimation(.bouncy(duration: 1)) {
                      Yoffset -= 46
                  }
                  tapCount -= 1
              } else {
                  timer.invalidate()
              }
          }
      }
}


#Preview {
    AniumationTextone()
}



