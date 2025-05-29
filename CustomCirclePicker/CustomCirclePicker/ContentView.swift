 

import SwiftUI

struct ContentView: View {
    @State private var selection: CGFloat = 0
    var body: some View {
        VStack{
          
            CircularPickerView(selection: $selection, from: 0, to: 10, type: .tenths)
               
        }
       
    }
}

#Preview {
    ContentView()
}
