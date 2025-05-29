 

import SwiftUI

struct ContentView: View {
    let text = "LOADING"
    @State  var startAnimation = false
    var body: some View {
        HStack(spacing:0){
            ForEach(Array(text.enumerated()),id:\.offset) { index ,letter in
                Text(String(letter)).font(.largeTitle.bold()).foregroundStyle(.yellow)
                    .shadow(color: .black, radius: 0, x: 2, y: 0.8)
                    .offset(y: startAnimation ? -40 : 0)
                    .offset(y: 40)
                    .animation(.spring(response: 0.6, dampingFraction: 0.5).repeatForever(autoreverses: true).delay(Double(index) * 0.1), value: startAnimation)
            }
          
        }
        .frame(height: 50).clipped()
        .onAppear(){
            startAnimation = true
        }
    }
}

#Preview {
    ContentView()
}
