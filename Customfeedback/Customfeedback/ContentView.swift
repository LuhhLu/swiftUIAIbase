
import SwiftUI
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                
                FeedbackTow()
                    .containerRelativeFrame(.vertical)
                FeedbackThre()
                    .containerRelativeFrame(.vertical)
                FeedbackView()
                    .containerRelativeFrame(.vertical)
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
        
       
    }
}

#Preview {
    ContentView()
}
