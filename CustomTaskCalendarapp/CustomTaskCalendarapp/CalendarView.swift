

import SwiftUI

enum Constants {
   static let hourHeight: CGFloat = 72
   static let hourDivisionCount: CGFloat = 4
}

enum CalendarType: Int {
   case day, week, month
}

struct CalendarView: View {
   @State var visibleWeek: Week?
   @State var selectedDay: Date? = Date()
   @State var calendarType: CalendarType = .month
   
   var body: some View {
       VStack {
           Text("Calendar")
               .bold()
               .font(.title)
               .frame(maxWidth: .infinity, alignment: .leading)
               .padding()
           
           HStack(alignment: .center) {
               switch calendarType {
               case .day:
                   if let selectedDay {
                       Text(title(for: selectedDay))
                           .font(.headline)
                   }
               case .week:
                   if let visibleWeek {
                       Text(title(for: visibleWeek))
                           .font(.headline)
                   }
               case .month:
                   if let day = visibleWeek?.days.first {
                       Text(Calendar.monthAndYear(from: day))
                           .font(.headline)
                   }
               }
               
               Spacer()
               
               Picker("", selection: $calendarType) {
                   Text("Day").tag(CalendarType.day)
                   Text("Week").tag(CalendarType.week)
                   Text("Month").tag(CalendarType.month)
               }
               .frame(width: 160)
               .pickerStyle(.segmented)
           }
           .padding()
           
           switch calendarType {
           case .day:
               WeekCalendarView(
                   Items.data,
                   selection: $selectedDay,
                   calendarType: $calendarType,
                   visibleWeek: $visibleWeek
               )
               .frame(height: 72)
               
               DayTimelineView(day: selectedDay, style: .full)
           case .week:
               WeekCalendarView(
                   Items.data,
                   selection: $selectedDay,
                   calendarType: $calendarType,
                   visibleWeek: $visibleWeek
               )
           case .month:
               MonthCalendarView(
                   selectedDay: $selectedDay,
                   visibleWeek: $visibleWeek
               )
           }
       }
   }
}

extension CalendarView {
   func title(for week: Week) -> String {
       var title = ""
       
       if let firstDay = week.days.first, let lastDay = week.days.last {
           title += Calendar.dayNumber(from: firstDay)
           title += " - \(Calendar.dayNumber(from: lastDay))"
           title += " \(Calendar.monthAndYear(from: lastDay))"
       }
       
       return title
   }
   
   func title(for date: Date) -> String {
       var title = ""
       title += Calendar.dayNumber(from: date)
       title += " \(Calendar.monthAndYear(from: date))"
       
       return title
   }
}

#Preview {
   CalendarView()
}

