 
import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    var data = DataSirves()
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), text: data.textValue)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), text: data.textValue)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, text: data.textValue)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let text: String
}

struct TWidgetEntryView : View {
    var entry: Provider.Entry
var data = DataSirves()
    var body: some View {
        VStack {
         
            Text(data.textValue).bold().font(.title2)
        }
    }
}

struct TWidget: Widget {
    let kind: String = "TWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                TWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                TWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    TWidget()
} timeline: {
    SimpleEntry(date: .now, text: "😀")
    
}
