 
import SwiftUI

struct ContentView: View {
    @State private var rectangleOffset: CGFloat = 0
    let threshold: CGFloat = UIScreen.main.bounds.height / 15

    var body: some View {

        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Fixed Tab")
                    .font(.title.bold()).padding()
                    .padding(.top, 70)

//                // Top Grid
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 15) {
                    ForEach(0 ..< 6) { item in
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 180, height: 200)
                            .foregroundStyle(.gray.opacity(0.3))
                    }
                }
            

                GeometryReader { geometry in
                    
                    SegmentedControl()
                        .offset(y: rectangleOffset)
                        .frame(maxWidth: .infinity)
                    
                        .onChange(of: geometry.frame(in: .global).minY) { _, newValue in
                            if newValue < threshold {
                                rectangleOffset = -newValue + threshold
                            } else { rectangleOffset = 0 }
                        }
                }
                .frame(height: 50)
                .zIndex(1)

                // Bottom Grid
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 15) {
                    ForEach(0 ..< 20) { item in
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 180, height: 200)
                            .foregroundStyle(.gray.opacity(0.3))
                    }
                }
               
            }
        }
        .padding(.horizontal, 10)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
