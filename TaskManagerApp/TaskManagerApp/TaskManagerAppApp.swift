//
//  TaskManagerAppApp.swift
//  TaskManagerApp
//
//  Created by youssef on 2023-01-19.
//

import SwiftUI

@main
struct TaskManagerAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            contenView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
