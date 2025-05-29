

import SwiftUI
import Firebase
@main
struct flashCardsApp: App {
    @StateObject var vm = Manager()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
        }
    }
}
