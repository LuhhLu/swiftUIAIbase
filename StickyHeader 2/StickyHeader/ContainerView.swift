 
import SwiftUI

struct ContainerView: View {
    var body: some View {
        GeometryReader {
            DetailsView(
                percentageHeight: 0.5, size: $0.size,
                safeArea: $0.safeAreaInsets, content: {
                    ContentView()
                        .padding(.horizontal, 10)
                }
            )
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    ContainerView()
}
