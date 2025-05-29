import SwiftUI

struct WeekView: View {
    let week: Week
    
    @Binding var selectedDate: Date?
    
    var body: some View {
        HStack(spacing: .zero) {
            ForEach(week.days, id: \.self) { date in
                DayView(
                    date: date,
                    selectedDate: $selectedDate
                )
                
                if week.days.last != date {
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}
