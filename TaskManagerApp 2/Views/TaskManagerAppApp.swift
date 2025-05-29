 

import SwiftUI
import SwiftData

@main
struct TaskManagerAppApp: App {
    var body: some Scene {
        WindowGroup {
            TaskCalendarView()
                .modelContainer(for: [Item.self])
        }
    }
}
