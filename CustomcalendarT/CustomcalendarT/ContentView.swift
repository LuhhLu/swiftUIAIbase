 
import SwiftUI
 
import SwiftUI

 struct Task: Identifiable {
    let id = UUID()
    let date: Date
    let title: String
}
    
 let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

 let tasks: [Task] = [
    Task(date: dateFormatter.date(from: "2025-04-01")!, title: "Team meeting"),
    Task(date: dateFormatter.date(from: "2025-04-01")!, title: "Write blog post"),
    Task(date: dateFormatter.date(from: "2025-04-04")!, title: "Code review"),
    Task(date: dateFormatter.date(from: "2025-04-08")!, title: "Submit report"),
    Task(date: dateFormatter.date(from: "2025-04-08")!, title: "Buy groceries"),
    Task(date: dateFormatter.date(from: "2025-04-09")!, title: "Gym session"),
    Task(date: dateFormatter.date(from: "2025-04-10")!, title: "Prepare slides"),
    Task(date: dateFormatter.date(from: "2025-04-12")!, title: "Call client"),
    Task(date: dateFormatter.date(from: "2025-04-17")!, title: "Dentist appointment"),
    Task(date: dateFormatter.date(from: "2025-04-17")!, title: "Submit taxes"),
    Task(date: dateFormatter.date(from: "2025-04-17")!, title: "Update resume"),
    Task(date: dateFormatter.date(from: "2025-04-27")!, title: "Dinner with friends")
]
 
struct ContentView: View {
    @State var displayedMonth: Date = Date()
    @State var selectedDate: Date? = nil
    let calendar = Calendar.current
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                 WeekdayHeaderView(displayedMonth: $displayedMonth)
                 let days = generateMonthGrid()
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 7), spacing: 2) {
                    ForEach(days, id: \.self) { date in
                        let isCurrentMonth = calendar.isDate(date, equalTo: displayedMonth, toGranularity: .month)
                        let tasksForDay = tasks.filter { calendar.isDate($0.date, inSameDayAs: date) }
                        let isSelected = selectedDate != nil && calendar.isDate(selectedDate!, inSameDayAs: date)
                        VStack(spacing: 4) {
                            Text("\(calendar.component(.day, from: date))")
                                .font(.system(size: 15))
                                .frame(maxWidth: .infinity, minHeight: 45)
                                .foregroundColor(
                                    isSelected ? .se : (isCurrentMonth ? .primary : .gray )
                                )                            .background(isSelected ? Color.primary : isCurrentMonth ? .BG : .gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(Calendar.current.isDateInToday(date) ? Color.primary : .clear)
                                        .padding(1)
                                }
                                 .overlay(alignment: .bottom) {
                                    HStack(spacing: 3) {
                                        ForEach(0..<min(tasksForDay.count, 5), id: \.self) { _ in
                                            Circle()
                                                .frame(width: 4, height: 4).padding(.bottom,6)
                                                .foregroundStyle(isSelected ? .se : .primary)
                                        }
                                    }
                                }
                        }
                        .onTapGesture {
                            if let selected = selectedDate, calendar.isDate(selected, inSameDayAs: date) {
                                selectedDate = nil
                            } else {
                                selectedDate = date
                            }
                        }
                    }
                }
                
                Divider().padding(.top,20)
                VStack(alignment: .leading, spacing: 8) {
                    let visibleTasks = selectedDate != nil
                    ? tasks.filter { calendar.isDate($0.date, inSameDayAs: selectedDate!) }
                    : tasks
                    if visibleTasks.isEmpty {
                        Text("No tasks for this day.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(visibleTasks) { task in
                            HStack{
                                Text(task.title).frame(height: 55)
                                Spacer()
                                Image(systemName: "circle")
                            }
                            .padding(.horizontal,12).background(.BG,in:.rect(cornerRadius:12))
                        }
                    }
                }
                .padding(.top)
                Spacer()
            }
            .padding(10)
        }
    }
    
    func generateMonthGrid() -> [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: displayedMonth),
              let firstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
              let lastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end - 1)
        else { return [] }
        return stride(from: firstWeek.start, through: lastWeek.end, by: 86400).map { $0 }
    }
    
}
#Preview {
    ContentView ()
}
 
