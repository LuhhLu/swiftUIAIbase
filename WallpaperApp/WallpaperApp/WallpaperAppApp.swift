

import SwiftUI
import Firebase
@main
struct WallpaperAppApp: App {
    @StateObject var vm = DataManager()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
