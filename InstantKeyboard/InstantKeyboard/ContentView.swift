import SwiftUI

struct ContentView: View {
    @State private var text = "Starting text"
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
        .sheet(isPresented: $showView) {
            TextSheet()
        }
    }
}


struct TextSheet: View {
    @State var text = "Start Typing... "
    @FocusState var typing:Bool
    var body: some View {
        NavigationStack {
            TextEditor(text: $text)
                .bold()
                .font(.title)
                .padding(12)
                .focused($typing)
                .onAppear(){
                    typing = true
                }
                .immediateKeyboard()
                .navigationTitle("Instant Keyboard")
               
        }
    }
}

 
#Preview {
    ContentView()
}
