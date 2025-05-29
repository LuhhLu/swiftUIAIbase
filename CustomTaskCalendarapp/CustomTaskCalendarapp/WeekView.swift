 

import SwiftUI

struct WeekView: View {
    let week: Week
    let items: [Item]
    @Binding var selectedDate: Date?
    
    var body: some View {
        HStack(spacing: .zero) {
            ForEach(week.days,id:\.self) { date in
                DayView(date: date, hasItems: !items.filter({Calendar.current.isDate($0.from, inSameDayAs: date)}).isEmpty, selectedDate: $selectedDate)
                if week.days.last != date {
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}
