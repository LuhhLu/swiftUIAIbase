import SwiftUI

struct ContentView: View {
    
    @State var displayedWeek: Date = Calendar.current.startOfWeek(for: Date())
    let calendar = Calendar.current
    @State private var selectedDate: Date = Date()
    var body: some View {
        
        VStack{
            HStack{
                Text(weekdaySymbol(for: Date()).capitalized)// just to make first letter capital
                    .font(.largeTitle.bold())
                
                Spacer()
                Text(weekTitle(for: selectedDate))
                    .font(.title3).bold()
            }
            .padding(.bottom,8)
            
            ScrollViewReader { proxy   in // this is step one
                ScrollView(.horizontal) {
                    HStack(spacing:20){
                        ForEach(weeks,id:\.self) { weekStart in
                            
                            let days = weekGrid(for: weekStart)
                            VStack(spacing:4){
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 5), count: 7),spacing: 2) {
                                    ForEach(days,id:\.self) { date in
                                        let isSelected = calendar.isDate(selectedDate, inSameDayAs: date)
                                        let isToday = calendar.isDateInToday(date)
                                        let symbol = weekdaySymbol(for: date)
                                        
                                        VStack(spacing:4){
                                            Text("\(calendar.component(.day,from:date))")
                                                .font(.system(size: 24).bold())
                                                .frame(maxWidth: .infinity,minHeight: 45)
                                            Text(symbol)
                                                .font(.system(size: 11))
                                                .frame(maxWidth: .infinity)
                                            
                                        }
                                        .padding(.bottom,8)
                                        // is selected or is today if it is true will be one I else will be 0.3
                                        .opacity(isSelected || isToday ? 1 : 0.3)
                                        .background(isSelected ? .gray.opacity(0.3) : .gray.opacity(0.1),in:.rect(cornerRadius:8))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1)
                                            // right now all of them have line, but I want only the current day. Will have the line to make it easy for the user to know which day it is today.
                                                .foregroundStyle(isSelected ? Color.primary : .clear)
                                                // clear is no Color
                                                .padding(1)
                                        }
                                        .onTapGesture {
                                            selectedDate = date
                                        }
                                    }
                                }
                                .containerRelativeFrame(.horizontal)
                            }
                            .id(weekStart)//step 2
                        }
                    }
                    .onAppear(){
                 // the delay is very important because sometime he don't have the time to fetch the data from the Canada so this is very small time to make sure he always get the data from the calendar and display the current week
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                            proxy.scrollTo(displayedWeek, anchor: .center)
                        }
                    }
                    
                    .scrollTargetLayout()
                    
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
            }
            
        }
        .safeAreaPadding(20)
        .padding(.top,20)
        
        
    }
    // right now the calendar show us random numbers, but we need to discipline the current day and month and we can do this in three steps
    // step one we need ScrollViewReader
    // step two to add an ID to the ScrollView .id() when we have the ID we can tell him to scroll to april for example
    // step three we need scrollTo
    
    
    // This function returns a short uppercase string for the weekday of a given date.
    // Example: If the date is a Monday, it returns "MON".
    private func weekdaySymbol(for date: Date) -> String {
        // Extract the weekday component from the given date.
        // `.weekday` returns an Int from 1 (Sunday) to 7 (Saturday).
        let weekdayIndex = calendar.component(.weekday, from: date) - 1

        // `calendar.shortWeekdaySymbols` is an array like ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"].
        // We use `weekdayIndex` to get the symbol for the date.
        // `.prefix(3)` ensures we only get the first 3 letters (e.g., "Mon"), though this is often already 3.
        // `.uppercased()` converts it to uppercase for display style (e.g., "MON").
        return calendar.shortWeekdaySymbols[weekdayIndex].prefix(3).uppercased()
    }

    
    
    
    // This computed property returns an array of `Date` values,
    // each representing the starting date of a week.
    // It creates a range of weeks around the current week (past 12 and next 12 weeks).
    private var weeks: [Date] {
        // Get the current date.
        let current = Date()

        // Initialize an empty array to store the week's start dates.
        var result: [Date] = []

        // Loop through -12 to +12, representing 12 weeks before and after today.
        for i in -12...12 {
            // For each value of `i`, calculate the date that is `i` weeks away from the current week's start.
            // `calendar.date(byAdding:to:)` adds time components (like weeks) to a date.
            // `calendar.startOfWeek(for:)` gives the Monday (or Sunday based on locale) of that week.
            if let weekStart = calendar.date(byAdding: .weekOfYear, value: i, to: calendar.startOfWeek(for: current)) {
                // Append the calculated week start date to the result array.
                result.append(weekStart)
            }
        }

        // Return the list of week start dates.
        return result
    }


    
    
    // This function creates a readable title for a week based on a date.
    // Example output: "April 23"
    private func weekTitle(for date: Date) -> String {
        // Create an instance of DateFormatter, which converts dates into strings.
        let formatter = DateFormatter()

        // Set the format to show the full month name and day number.
        // "MMMM" = full month name (e.g., "April")
        // "d" = day of the month (e.g., "23")
        formatter.dateFormat = "MMMM d"

        // Convert the given date into a string using the formatter and return it.
        return formatter.string(from: date)
    }

    

    
    // This function returns an array of 7 dates starting from the given `weekStart` date.
    // This represents all the days of that week.
    private func weekGrid(for weekStart: Date) -> [Date] {
        // Create a range from 0 to 6 (representing 7 days in a week).
        // For each number `i`, add `i` days to the `weekStart` date.
        return (0..<7).compactMap {
            // Use the Calendar to calculate each day of the week.
            calendar.date(byAdding: .day, value: $0, to: weekStart)
        }
    }

}




// Extend the built-in Calendar type to add a custom helper function.
extension Calendar {
    
    // This function returns the starting day (usually Monday or Sunday depending on locale)
    // of the week that includes the given date.
    func startOfWeek(for date: Date) -> Date {
        
        // Extract the year and week number components for the given date.
        // `.yearForWeekOfYear` represents the year that corresponds to the week (ISO 8601-style).
        // `.weekOfYear` represents the number of the week in the year (e.g., week 17).
        let components = dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        
        // Use those components to construct a new Date representing the start of that week.
        // If this fails for some reason (very rare), fallback to returning the original date.
        return self.date(from: components) ?? date
    }
}


#Preview {
    ContentView()
}
 
