
import SwiftUI
import Modals
@main
struct MultipleSheetsApp: App {
    var body: some Scene {
        WindowGroup {
            ModalStackView {
                ContentView()
            }
           
        }
    }
}
