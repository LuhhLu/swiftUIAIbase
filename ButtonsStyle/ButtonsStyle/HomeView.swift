 

import SwiftUI

struct HomeView: View {
    @State var reset = false
    var body: some View {
     LoadingButton(StartTitle: "Save", EndTitle: "Success!", reset: $reset,action: {})
    }
}

#Preview {
    HomeView()
}
