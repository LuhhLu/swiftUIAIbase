
















import SwiftUI

struct ContentView: View {
    @State var progress:CGFloat = 0
    var body: some View {
        VStack(spacing:100) {
            ProgressBar(progress: $progress, width: 100, height: 25, CRadius: 20)
            DashLineProgress(progress: $progress, totalWidth: 100, dashWidth: 7, dashSpacing: 2)
            ProgressBox(progress: $progress, width: 250, height: 12, CRadius: 16)
        }
        .padding()
        .onTapGesture {
                withAnimation(.spring) {
                progress = CGFloat.random(in: 0...1)
            }
        }
    }
}

#Preview {
    ContentView()
}
