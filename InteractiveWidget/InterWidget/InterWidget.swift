
import WidgetKit
import SwiftUI
import AppIntents

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), addone: 1)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), addone: 1)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let userDefaults = UserDefaults(suiteName: "group.Sucodee.TDWidget.TaskWidget")
        let currentNumber = userDefaults?.integer(forKey: "add") ?? 0
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, addone: currentNumber)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let addone:Int
}

struct InterWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        HStack {
            VStack{
                Button(intent: AddIntent()) {
                    Image(systemName: "plus").bold().font(.title2)
                        .frame(width: 60, height: 30)
                }
                
                Button(intent: SubtractIntent()) {
                    Image(systemName: "minus").bold().font(.title2)
                        .frame(width: 60, height: 30)
                }
                
            }
            Spacer()
            ZStack{
                Circle()
                    .stroke(lineWidth: 20)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
                Circle()
                    .stroke(lineWidth: 0.34)
                    .frame(width: 78, height: 78)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.3),.clear]), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .overlay {
                        Circle()
                            .stroke(.black.opacity(0.3),lineWidth: 2)
                            .blur(radius: 5)
                            .mask {
                                Circle()
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black,.clear]),
                                                                    startPoint: .topLeading,
                                                                    endPoint: .bottomTrailing))
                            }
                    }
                Circle()
                    .trim(from: 0, to:  CGFloat( entry.addone) / 100)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(-90))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.purple,.blue]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing))
                Text("\(entry.addone)%").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
            }
        }
        .padding(.horizontal)
    }
}

struct InterWidget: Widget {
    let kind: String = "InterWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                InterWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                InterWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemSmall) {
    InterWidget()
} timeline: {
    SimpleEntry(date: .now, addone: 1)
     
}

struct AddIntent:AppIntent{
    static var title: LocalizedStringResource = "add"
    
    func perform() async throws -> some IntentResult {
        if let store = UserDefaults(suiteName: "group.Sucodee.TDWidget.TaskWidget"){
            var count = store.integer(forKey: "add")
            count = min(count + 5 ,100)
            store.setValue(count, forKey: "add")
            WidgetCenter.shared.reloadAllTimelines()
            return .result()
        }
        return .result()
    }
}

struct SubtractIntent:AppIntent{
    static var title: LocalizedStringResource = "Subtract"
    
    func perform() async throws -> some IntentResult {
        if let store = UserDefaults(suiteName: "group.Sucodee.TDWidget.TaskWidget"){
            var count = store.integer(forKey: "add")
            count = max(count - 5 ,0)
            store.setValue(count, forKey: "add")
            WidgetCenter.shared.reloadAllTimelines()
            return .result()
        }
        return .result()
    }
}
