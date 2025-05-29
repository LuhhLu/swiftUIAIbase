 

import SwiftData
import SwiftUI

struct TaskCalendarView: View {
    @State var visibleWeek: Week?
    @State var isCreateViewVisible: Bool = false
    @State var selectedDay: Date? = .now
    
    @State private var selectedDayString = ""
    @State private var selectedMonthString = ""
    @State private var selectedYearString = ""
    
    @Query var items: [Item]
    
    private let days = (1...31).map { String(format: "%02d", $0) }
    private let months = Calendar.current.monthSymbols
    private let years = (1900...2100).map { String($0) }
    
    var body: some View {
        let _ = Self._printChanges()
        let items = items
            .filter {
                let selected = selectedDay ?? .now
                
                // Compare the 'from' date
                let isAfterOrEqualFrom = Calendar.current.compare(selected, to: $0.from, toGranularity: .day) != .orderedAscending
                
                // Compare the 'to' date (or fallback to 'from' for single-day tasks)
                let isBeforeOrEqualTo = Calendar.current.compare(selected, to: $0.to ?? $0.from, toGranularity: .day) != .orderedDescending
                
                // Return true if the selected date is within the range
                return isAfterOrEqualFrom && isBeforeOrEqualTo
            }

        VStack(spacing:0){
            Text("Tasks Calendar")
                .bold()
                .font(.title)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
            HStack(spacing:36){
                CustomPicker(width: 70, selectedValue: $selectedDayString, values: days, title: "Day")
                CustomPicker(width: 135, selectedValue: $selectedMonthString, values: months, title: "Month")
                CustomPicker(width: 93,selectedValue: $selectedYearString, values: years, title: "Year")
            }
            .padding(.horizontal)
            .padding(.bottom)
            WeekCalendarView(
                selection: $selectedDay,
                visibleWeek: $visibleWeek
            )
            .frame(height: 84)
            VStack{
                HStack{
                    Text("My Today Task")
                        .bold()
                    Text("\(items.count)")
                        .padding(.vertical,2)
                        .padding(.horizontal,8)
                        .foregroundStyle(.white)
                        .background(.red,in:.capsule)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }
            .padding(.leading)
            .padding(.bottom,10)
            ScrollView {
                TasksListView(items: items)
            }
            .safeAreaPadding(.bottom,50)
            .frame(maxHeight: .infinity)
        }
     
    
        .overlay(alignment: .bottomTrailing) {
            Image(systemName: "plus")
        .foregroundStyle(.white)
        .font(.title)
        .padding()
        .background(.gray.secondary,in:.circle)
        .onTapGesture {
            isCreateViewVisible = true
        }
        .padding()
        }
        
        
        .sheet(isPresented: $isCreateViewVisible, content: {
            CreateTaskView()
        })
      
        .onAppear { pickerSelection() }
        .onChange(of: selectedDayString, updatePicker(_:_:))
        .onChange(of: selectedMonthString, updatePicker(_:_:))
        .onChange(of: selectedYearString, updatePicker(_:_:))
        .onChange(of: selectedDay, updateSelection(_:_:))
        
    }
}

extension TaskCalendarView {
    func title(for date: Date?) -> String {
        guard let date else { return "" }
        var title = ""
        title += Calendar.dayNumber(from: date)
        title += " \(Calendar.monthAndYear(from: date))"
        
        return title
    }
    
    func updateSelection(_ oldValue: Date?, _ newValue: Date?) {
        guard oldValue != newValue else { return }
        pickerSelection()
    }
    
    func updatePicker(_ oldValue: String, _ newValue: String) {
        guard oldValue != newValue else { return }
        dateSelection()
    }
    
    func pickerSelection() {
        guard let selectedDay else { return }
        let components = Calendar.current.dateComponents([.year, .month, .day], from: selectedDay)
        
        guard let day = components.day, let month = components.month, let year = components.year else { return }
        selectedDayString = day < 10 ? "0\(day)" : "\(day)"
        selectedMonthString = "\(Calendar.current.monthSymbols[month - 1])"
        selectedYearString = "\(year)"
    }
    
    func dateSelection() {
        guard let selectedDay else { return }
        let stringDate = [selectedYearString, selectedMonthString, selectedDayString].joined(separator: "-") + " 00:00:00"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = dateFormatter.date(from: stringDate) else { return }
        
        guard Calendar.current.isDate(selectedDay, inSameDayAs: date) == false else { return }
        self.selectedDay = date
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Item.self, configurations: config)
    Items.data.forEach { item in
        container.mainContext.insert(item)
    }
    
    return TaskCalendarView()
        .modelContainer(container)
}
