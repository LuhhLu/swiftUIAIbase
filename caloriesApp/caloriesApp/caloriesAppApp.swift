
import SwiftUI

@main
struct caloriesAppApp: App {
    @StateObject var vm : cddatamodel = cddatamodel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cddatamodel())
        }
    }
}
