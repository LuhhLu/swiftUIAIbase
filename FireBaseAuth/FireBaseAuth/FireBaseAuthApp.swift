
import SwiftUI
import Firebase
@main
struct FireBaseAuthApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
