

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          ArcMenuButton(buttons: ["circle","star","bell","bookmark"])
                .padding(.bottom,20)
                .padding(.trailing,20)
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
        }
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
