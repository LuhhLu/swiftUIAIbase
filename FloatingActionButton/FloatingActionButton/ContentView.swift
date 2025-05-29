import SwiftUI
struct ContentView: View {
    var body: some View {
        FloatingActionMenu(
            direction: .top,
            actionButtons: [
                ActionButton(icon: "globe", action: {
                    print("🌐 Globe tapped")
                }),
                ActionButton(icon: "paintpalette.fill", action: {
                    print("🎨 Theme changed")
                }),
                ActionButton(icon: "doc.fill", action: {
                    print("📄 Open document")
                })
            ]
        )
        .padding()
    }
}

#Preview {
    ContentView()
}


