import SwiftUI

struct ContentView: View {
    @State var selectionMode: CalendarSelectionMode = .range
    @State var allowsToSelect = true
    @State var showsOverflowDates = false

    var body: some View {
        VStack(spacing: 24) {
            CustomCalendarView(
                config: CalendarConfig(selectionMode: selectionMode, showsOverflowDates: showsOverflowDates),
                allowsToSelect: $allowsToSelect
            )

            Picker("Selection Mode", selection: $selectionMode) {
                Text("Single").tag(CalendarSelectionMode.single)
                Text("Range").tag(CalendarSelectionMode.range)
                Text("Multiple").tag(CalendarSelectionMode.multiple)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal,10)
            
            Toggle("Show Overflow Dates", isOn: $showsOverflowDates)
                .padding(.horizontal,10)

            Toggle("Allow Past Date Selection", isOn: $allowsToSelect)
                .padding(.horizontal,10)

            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

