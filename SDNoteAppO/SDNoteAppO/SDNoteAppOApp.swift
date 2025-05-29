import SwiftUI
import SwiftData
@main
struct SDNoteAppOApp: App {
    @Environment(\.modelContext) var modelContext
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: [Note.self])
 
        }
    }
}
