import SwiftUI

struct Week: Hashable, Identifiable {
    let id: String
    let days: [Date]
    let order: Order
    
    init(days: [Date], order: Order) {
        self.id = Calendar.weekAndYear(from: days.first ?? .now)
        self.days = days
        self.order = order
    }
    
    enum Order {
        case previous, current, next
    }
}

struct WeekCalendarView: View {
    @State private var weeks: [Week]
    @State private var position: ScrollPosition
    @State private var calendarWidth: CGFloat = .zero
    
    @Binding var selection: Date?
    @Binding var visibleWeek: Week?
    
    init(selection: Binding<Date?>, visibleWeek: Binding<Week?>) {
        _selection = selection
        _visibleWeek = visibleWeek
        
        let theNearestMonday = Calendar.nearestMonday(from: selection.wrappedValue ?? .now)
        let currentWeek = Week(
            days: Calendar.currentWeek(from: theNearestMonday),
            order: .current
        )
        
        let previousWeek: Week = if let firstDay = currentWeek.days.first {
            Week(
                days: Calendar.previousWeek(from: firstDay),
                order: .previous
            )
        } else { Week(days: [], order: .previous) }
        
        let nextWeek: Week = if let lastDay = currentWeek.days.last {
            Week(
                days: Calendar.nextWeek(from: lastDay),
                order: .next
            )
        } else { Week(days: [], order: .next) }
        
        _weeks = .init(initialValue: [previousWeek, currentWeek, nextWeek])
        _position = State(initialValue: ScrollPosition(id: currentWeek.id))
    }
    
    var body: some View {
        
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: .zero) {
                ForEach(weeks) { week in
                    VStack {
                        WeekView(
                            week: week,
                            selectedDate: $selection
                        )
                        .frame(width: calendarWidth, height: 72)
                        .onAppear { loadWeek(from: week) }
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition($position)
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)

        .onAppear {
            visibleWeek = weeks.first(where: { $0.id == (position.viewID as? String) })
        }
        .onChange(of: position) {
            visibleWeek = weeks.first(where: { $0.id == (position.viewID as? String) })
        }
        .onGeometryChange(for: CGFloat.self) { proxy in
            proxy.size.width
        } action: { newValue in
            calendarWidth = newValue
        }
        .onChange(of: selection, rebuildWeeks)
    }
}

extension WeekCalendarView {
    func loadWeek(from week: Week) {
        if week.order == .previous, weeks.first == week, let firstDay = week.days.first {
            let previousWeek = Week(days: Calendar.previousWeek(from: firstDay), order: .previous)
            
            var weeks = self.weeks
            weeks.insert(previousWeek, at: 0)
            self.weeks = weeks
        } else if week.order == .next, weeks.last == week, let lastDay = week.days.last {
            let nextWeek = Week(days: Calendar.nextWeek(from: lastDay), order: .next)
            
            var weeks = self.weeks
            weeks.append(nextWeek)
            self.weeks = weeks
        }
    }
    
    func rebuildWeeks() {
        guard let selection, visibleWeek?.days.contains(selection) == false else { return }
        let theNearestMonday = Calendar.nearestMonday(from: selection)
        let currentWeek = Week(
            days: Calendar.currentWeek(from: theNearestMonday),
            order: .current
        )
        
        let previousWeek: Week = if let firstDay = currentWeek.days.first {
            Week(
                days: Calendar.previousWeek(from: firstDay),
                order: .previous
            )
        } else { Week(days: [], order: .previous) }
        
        let nextWeek: Week = if let lastDay = currentWeek.days.last {
            Week(
                days: Calendar.nextWeek(from: lastDay),
                order: .next
            )
        } else { Week(days: [], order: .next) }
        
        weeks = [previousWeek, currentWeek, nextWeek]
        position = ScrollPosition(id: currentWeek.id)
    }
}

#Preview {
    @Previewable @State var selection: Date? = .now
    @Previewable @State var visibleWeek: Week?
    
    WeekCalendarView(selection: $selection, visibleWeek: $visibleWeek)
}
