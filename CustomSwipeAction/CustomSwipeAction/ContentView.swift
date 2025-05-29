 

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = [
        Task(iconColor: .orange, icon: "swift", title: "Learn Swift", detail: "Master the basics of Swift programming for building iOS and macOS apps."),
        Task(iconColor: .blue, icon: "calendar", title: "Plan Day", detail: "Organize your tasks and schedule for a productive day."),
        Task(iconColor: .green, icon: "doc.text", title: "Read Docs", detail: "Review SwiftUI documentation to learn about layouts, states, and animations."),
        Task(iconColor: .red, icon: "bell", title: "Set Reminders", detail: "Add reminders for important deadlines and meetings."),
        Task(iconColor: .purple, icon: "star", title: "Track Goals", detail: "Monitor your progress on personal and professional goals."),
        Task(iconColor: .yellow, icon: "lightbulb", title: "Brainstorm Ideas", detail: "Generate new ideas for projects and creative tasks.")
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(tasks) { task in
                        Cellview(task:task,
                            onDelete: {
                                deleteTask(task)
                            }
                        )
                        .transition(.asymmetric(
                                insertion: .move(edge: .top),
                                removal: .move(edge: .leading).combined(with: .scale(scale: 0, anchor: .topLeading).combined(with: .opacity))
                            ))
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
    private func deleteTask(_ task: Task) {
        withAnimation {
            tasks.removeAll { $0.id == task.id }
        }
    }
}

#Preview {
    ContentView()
}
