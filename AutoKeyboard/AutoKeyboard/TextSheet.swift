
import SwiftUI

struct TextSheet: View {
    @State var text = "Starting text"
    @FocusState var showkeyboard :Bool
    var body: some View {
        NavigationStack{
            TextEditor(text: $text).bold().font(.title)
                .padding(12)
                .focused($showkeyboard)
                .navigationTitle("Dynamic keyboard")
        }
        .onAppear(){
            showkeyboard = true
        }
        
    }
}

#Preview {
    TextSheet()
}
