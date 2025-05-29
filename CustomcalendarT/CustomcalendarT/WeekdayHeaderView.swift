
import SwiftUI

struct WeekdayHeaderView: View {
    @Binding var displayedMonth: Date
    
    let calendar = Calendar.current
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "MMMM yyyy"
        return f
    }()

     var weekdays: [String] {
        let symbols = calendar.shortStandaloneWeekdaySymbols
        return Array(symbols[1...6] + [symbols[0]])
    }

     var todayWeekdayIndex: Int {
        let originalIndex = calendar.component(.weekday, from: Date()) - 1
        return (originalIndex + 6) % 7
    }

    private func changeMonth(by value: Int) {
        displayedMonth = calendar.date(byAdding: .month, value: value, to: displayedMonth) ?? displayedMonth
    }

    var body: some View {
        VStack(spacing: 24) {
             HStack {
                Button(action: { changeMonth(by: -1) }) { Image(systemName: "chevron.left") }

                Spacer()
                Text(formatter.string(from: displayedMonth))
                    .font(.headline)
                Spacer()
                Button(action: { changeMonth(by: 1) }) { Image(systemName: "chevron.right") }
            }
            .tint(.primary)
            .padding(.horizontal)

             HStack(spacing: 2) {
                 
                ForEach(weekdays.indices, id: \.self) { index in
                    
                    Text(weekdays[index])
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity)
                        
                        .foregroundColor(index == todayWeekdayIndex ? .primary : .gray)
                        .padding(.vertical, 3)
                    
                        .background(index == todayWeekdayIndex ? .gray.opacity(0.4) : .gray.opacity(0.2), in:.rect(cornerRadius: 8))
                }
            }
        }
    }
}
