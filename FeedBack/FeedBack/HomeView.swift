 













import SwiftUI

struct HomeView: View {
    @State var text = ""
    var body: some View {
       FeedBackView(text: $text, SenAction: {})
    }
}

#Preview {
    HomeView()
}
