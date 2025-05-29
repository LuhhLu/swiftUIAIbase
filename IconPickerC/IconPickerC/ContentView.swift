 

import SwiftUI

struct ContentView: View {
    @State var icon = ""
    var body: some View {
            IconPicker(title: "select an icon", selection: $icon)
    }
}

#Preview {
    ContentView()
}
