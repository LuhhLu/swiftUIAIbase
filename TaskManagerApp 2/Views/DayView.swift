 
import SwiftUI
import SwiftData
struct DayView: View {
    let date: Date
    
    @Query var items: [Item]
    @Binding var selectedDate: Date?
    
    var isSelected: Bool {
        guard let selectedDate else { return false }
        return Calendar.current.isDate(date, inSameDayAs: selectedDate)
    }
    var body: some View {
        VStack(spacing:12){
            Text(Calendar.dayLetter(from: date))
                .font(.callout)
            Text(Calendar.dayNumber(from: date))
                .font(.callout)
                .background(
                    Circle()
                        .fill(.blue)
                        .opacity(isSelected ? 0.3 : 0)
                        .scaleEffect(2)
                )
            Circle()
                .fill(items.contains(where: {
                    let startDate = $0.from
                    let endDate = $0.to ?? $0.from

                    return Calendar.current.compare(date, to: startDate, toGranularity: .day) != .orderedAscending &&
                           Calendar.current.compare(date, to: endDate, toGranularity: .day) != .orderedDescending
                }) ? .blue : .clear)
                .frame(width: 6)
            
            
        }
        .foregroundStyle(isSelected ? .blue : Color.primary)
        .font(.system(.body, design: .rounded, weight: .medium))
        .onTapGesture {
            selectedDate = date
        }
        .animation(.easeInOut, value: selectedDate)
    }
}

//#Preview {
//    DayView(date: <#Date#>, items: <#[Item]#>, selectedDate: <#Binding<Date?>#>)
//}
