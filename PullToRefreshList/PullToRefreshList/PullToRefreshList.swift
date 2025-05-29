import SwiftUI

// Task model
struct TaskModel: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let color:Color
}

struct PullToRefreshList: View {
    @State var tasks = [
        TaskModel(title: "Submit project report", icon: "doc.text", color: .blue),
        TaskModel(title: "Attend team meeting", icon: "person.2.fill", color: .green),
        TaskModel(title: "Review pull requests", icon: "checklist", color: .orange),
        TaskModel(title: "Prepare presentation slides", icon: "chart.bar.xaxis", color: .purple)
    ]
    
    @State var isRefreshing = false

    var body: some View {
        NavigationStack {
            
            List {
                
                ForEach(tasks) { task in
                    
                    HStack(spacing:24) {
                        
                        Image(systemName: task.icon).resizable().scaledToFill()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(task.color)
                           
                        Text(task.title)
                    }
                }
            }
            
            .refreshable { await refreshTasks() }
            .navigationTitle("Pull to Refresh")
            
        }
        
    }

    func refreshTasks() async {
        isRefreshing = true
        do {try await Task.sleep(nanoseconds: 2 * 1_000_000_000) // Simulate a delay
            withAnimation { tasks.shuffle() }// Randomize the list to simulate new data
        } catch { print("Failed to refresh tasks: \(error)") }
        isRefreshing = false
    }
}

#Preview {
    PullToRefreshList()
}
