 

import SwiftUI

struct MonthCalendarView: View {
    let items: [Item] = Items.data
    @Binding var selectedDay: Date?
    @Binding var visibleWeek: Week?
    
    @State private var months: [Month]
    @State private var position: ScrollPosition
    
    var currentMonth: Month? { months.first(where: { $0.theSameMonth(as: .now) }) }
    
    init(selectedDay: Binding<Date?>, visibleWeek: Binding<Week?>) {
        _selectedDay = selectedDay
        
        let currentMonth = Month(from: selectedDay.wrappedValue ?? .now, order: .current)
        
        _months = State(
            initialValue: [
                currentMonth.previousMonth,
                currentMonth,
                currentMonth.nextMonth
            ].compactMap(\.self)
        )
        
        _visibleWeek = visibleWeek
        _position = State(initialValue: ScrollPosition(id: currentMonth.id))
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(spacing: .zero) {
                Text("M").frame(maxWidth: .infinity)
                Text("T").frame(maxWidth: .infinity)
                Text("W").frame(maxWidth: .infinity)
                Text("T").frame(maxWidth: .infinity)
                Text("F").frame(maxWidth: .infinity)
                Text("S").frame(maxWidth: .infinity)
                Text("S").frame(maxWidth: .infinity)
            }
            .padding(.bottom, 8)
            .font(.system(.callout, design: .rounded, weight: .medium))
            
            GeometryReader { proxy in
                ScrollView(.horizontal) {
                    LazyHStack(spacing: .zero) {
                        ForEach(months) { month in
                            MonthView(
                                month: month,
                                items: items,
                                selectedDay: $selectedDay
                            )
                            .frame(width: proxy.frame(in: .global).width)
                            .onAppear { loadMonth(from: month) }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollPosition($position)
                .scrollTargetBehavior(.viewAligned)
            }
        }
        .onAppear {
            if let visibleWeek {
                guard let id = months.first(where: { $0.weeks.contains(visibleWeek) })?.id else { return }
                position.scrollTo(id: id)
            } else {
                visibleWeek = currentMonth?.weeks[1]
            }
        }
        .onChange(of: position) { _, newValue in
            visibleWeek = months.first(where: { $0.id == (position.viewID as? String) })?.weeks[1]
        }
    }
}

extension MonthCalendarView {
    func loadMonth(from month: Month) {
        if month.order == .previous, months.first == month, let previousMonth = month.previousMonth {
            var months = self.months
            months.insert(previousMonth, at: 0)
            self.months = months
        } else if month.order == .next, months.last == month, let nextMonth = month.nextMonth {
            var months = months
            months.append(nextMonth)
            self.months = months
        }
    }
}

#Preview {
    @Previewable @State var date: Date? = Date()
    MonthCalendarView(selectedDay: $date, visibleWeek: .constant(nil))
}
