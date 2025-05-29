 
import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .all
    var body: some View {
        VStack{
            segmentedControl(selectedTab: $selectedTab)
            Spacer()
            switch selectedTab {
            case .all:
                Text("All View")
            case .fiction:
                Text("fiction View")
            case .mystery:
                Text("mystery View")
            case .romance:
                Text("romance View")
            case .action:
                Text("action View")
            case .comedy:
                Text("comedy View")
            }
                
                
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    ContentView()
}
