 
import SwiftUI

struct ContentView: View {
    @State private var highlightedIndex: Int = 0
    let letters = Array("LOADING")
       var body: some View {
           HStack {
               ForEach(letters.indices, id: \.self) { index in
                   Text(String(letters[index]))
                       .font(.largeTitle).bold()
                       .foregroundColor(highlightedIndex == index ? .yellow : Color.primary)
                       .shadow(color:highlightedIndex == index ? .yellow : .clear, radius: 10, x: 0, y: 0)
               }
           }
           .onAppear {
               startAnimation()
           }
       }
        func startAnimation() {
           Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
               withAnimation(.easeInOut(duration: 0.2)) {
                   highlightedIndex = (highlightedIndex + 1) % letters.count
               }
           }
       }
}

#Preview {
    ContentView()
}
