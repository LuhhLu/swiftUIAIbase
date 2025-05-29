 
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.BG.ignoresSafeArea()
            Button(action: {}, label: {
                Text("Click me")
            }).buttonStyle(WhiteButtonStyle())
        }
    }
}

#Preview {
    ContentView()
}
struct WhiteButtonStyle:ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(
                    .BG
                        .shadow(
                            .inner(color: .black.opacity(configuration.isPressed ? 0.15 : 0), radius: 10, x: 4, y: 4)
                        )
                        .shadow(
                            .inner(color: .white.opacity(configuration.isPressed ? 1 : 0), radius: 10, x: -10, y: -10)
                        )

                )
            configuration.label.font(.title)
                .opacity(configuration.isPressed ? 0.5 : 1)
   
        }
        .frame(width: 200, height: 60)
        .background(
            .BG
                .shadow(
                    .drop(color: .white.opacity(configuration.isPressed ? 0 : 1), radius: 10, x: 0, y: -10)
                )
                .shadow(
                    .drop(color: .black.opacity(configuration.isPressed ? 0 : 0.15), radius: 10, x: 15, y: 5)
                )
            ,in:.rect(cornerRadius: 12)
        )
        .animation(.none, value: configuration.isPressed)
    }
}
