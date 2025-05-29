 

import SwiftUI

struct DayView: View {
    let date: Date
    let hasItems: Bool
    @Binding var selectedDate: Date?
    
    var body: some View {
        VStack(spacing: 12) {
            Text(Calendar.dayLetter(from: date))
                .font(.callout)
            Text(Calendar.dayNumber(from: date))
                .background(
                    Circle()
                        .fill(.blue)
                        .frame(width: 30, height: 30)
                        .opacity(selectedDate == date ? 0.3 : 0)
                       
                )
            Circle()
                .fill(hasItems ? .blue : .clear)
                .frame(width: 6)
            
            
        }
        .foregroundStyle(selectedDate == date ? .blue : Color.primary)
        .font(.system(.body, design: .rounded, weight: .medium))
        .onTapGesture {
            selectedDate = date
        }
 
        .animation(.easeInOut, value: selectedDate)
    }
}
