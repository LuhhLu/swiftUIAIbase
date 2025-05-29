 

import SwiftUI

struct ContentView: View {
    @State var showView = false
    var body: some View {
        VStack {
            Button(action: {
                showView.toggle()
            }, label: {
                Label("Start typing", systemImage: "keyboard.fill")
            })
            .tint(.green)
            .buttonStyle(.bordered)
            .controlSize(.large)
            
        }
        .padding()
        .sheet(isPresented: $showView, content: {
            TextSheet()
        })
    }
}

#Preview {
    ContentView()
}
