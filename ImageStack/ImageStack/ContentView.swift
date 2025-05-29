 

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = 0
    let images:[ImageResource] = [.im1,.im2,.im3,.im4,.im5]
    let colors: [Color] = [.orange, .red, .blue, .cyan, .red, .primary, .blue]
    
    var body: some View {
        ZStack {
            Color(colors[selectedIndex]).opacity(0.85)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Explore The Anime World Now")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                Spacer()
               CardStackView(images: images, selectedCardIndex: $selectedIndex, imageSize: CGSize(width: 220, height: 320))
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
