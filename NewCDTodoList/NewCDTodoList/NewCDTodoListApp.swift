

import SwiftUI

@main
struct NewCDTodoListApp: App {
    var body: some Scene {
        WindowGroup {
            HomePage()
                .environment(\.managedObjectContext, CDTaskProvider.shared.container.viewContext)
        }
    }
}
