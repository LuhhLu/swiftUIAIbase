

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
    let items: [Item]
    
    @State private var weeks: [Week]
    @State private var position: ScrollPosition
    @State private var calendarWidth: CGFloat = .zero
    
    @Binding var calendarType: CalendarType
    @Binding var selection: Date?
    @Binding var visibleWeek: Week?
    
    init(_ items: [Item], selection: Binding<Date?>, calendarType: Binding<CalendarType>, visibleWeek: Binding<Week?>) {
        _selection = selection
        _calendarType = calendarType
        _visibleWeek = visibleWeek
        self.items = items
        
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
                    VStack{
                        WeekView(week: week, items: items, selectedDate: $selection)
                            .padding(.leading,42)
                            .frame(width: calendarWidth, height: 72)
                            .onAppear(){
                                loadWeek(from: week)
                            }
                        
                        if calendarType == .week {
                            ScrollView{
                                HStack(spacing:0){
                                    VStack(alignment:.trailing,spacing:0){
                                        ForEach(0..<24) { hour in
                                            if hour == 0 {
                                                Text("12 AM")
                                                    .frame(maxHeight: .infinity, alignment: .topTrailing)
                                            } else if hour < 12 {
                                                Text("\(hour) AM")
                                                    .frame(maxHeight: .infinity, alignment: .topTrailing)
                                            } else if hour == 12 {
                                                Text("12 PM")
                                                    .frame(maxHeight: .infinity, alignment: .topTrailing)
                                            } else {
                                                Text("\(hour - 12) PM")
                                                    .frame(maxHeight: .infinity, alignment: .topTrailing)
                                            }
                                        }
                                        .bold()
                                        .font(.caption2)
                                    }
                                    .padding(.trailing,4)
                                    .padding(.leading,10)
                                    ForEach(week.days, id: \.self) { day in
                                        TimelineView(day: day, style: .compact)
                                    }
                                    
                                    
                                }
                                .padding(.top)
                            }
                        }
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
}

#Preview {
    @Previewable @State var selection: Date? = .now
    @Previewable @State var calendarType: CalendarType = .month
    @Previewable @State var visibleWeek: Week?
    
    WeekCalendarView([], selection: $selection, calendarType: $calendarType, visibleWeek: $visibleWeek)
}
