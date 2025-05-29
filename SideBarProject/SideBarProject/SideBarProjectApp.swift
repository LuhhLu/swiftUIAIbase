import SwiftUI
@main
struct SideBarProjectApp: App {
    @StateObject var viewModel : ViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
