//
//  TaskManagerCDRApp.swift
//  TaskManagerCDR
//
//  Created by youssef on 2023-04-07.
//

import SwiftUI

@main
struct TaskManagerCDRApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.container.viewContext)
        }
    }
}
