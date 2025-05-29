//
//  TaskWidget.swift
//  TaskWidget
//
//  Created by youssef on 2023-11-09.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),items: ["Test"] )
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), items: ["Larn SwiftUI","Learn WidgetKit"] )
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let items = DataManager.shared.items
        let currentDate = Date()
        
        // Use Calendar to get the start of the next day.
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        let startOfNextDay = calendar.startOfDay(for: calendar.date(byAdding: .day, value: 1, to: currentDate)!)
        
        // Create an entry for the current date.
        let entry = SimpleEntry(date: currentDate, items: items)
        
        // Create a timeline with the next update time being the start of the next day.
        let timeline = Timeline(entries: [entry], policy: .after(startOfNextDay))
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
    var items:[String]
}

struct TaskWidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        HStack(spacing:13) {
            ZStack{
                VStack(alignment:.leading,spacing:20) {
                    HStack{
                        Text(entry.date.formatted(.dateTime.month()))
                        Text(entry.date.formatted(.dateTime.day()))
                             
                    }
                    .bold()
                    .font(.largeTitle)
                    Text(entry.date.formatted(.dateTime.weekday(.wide)))
                }
                .foregroundStyle(.white)
                NoiseView(size: 1, opacity: 0.1)
                    
            }
            .frame(width: 145, height: 143)
            .background(LinearGradient(gradient: Gradient(colors: [Color("C") , Color("C2")]), startPoint: .topLeading, endPoint: .bottomTrailing),in: RoundedRectangle(cornerRadius: 20))
            VStack(alignment:.leading, spacing:10){
                Text("upcoming".uppercased())
                    .foregroundStyle(.gray)
                if entry.items.isEmpty{
                    HStack{
                        RoundedRectangle(cornerRadius: 5).frame(width: 3, height: 35)
                            .foregroundStyle(Color("T"))
                        Text("Add New task").font(.title3)
                            
                        Spacer()
                        
                    }
                    .frame(width: 165)
                    
                }else{
                    ForEach(entry.items.suffix(2), id: \.self) { item in
                        HStack{
                            RoundedRectangle(cornerRadius: 5).frame(width: 3, height: 35)
                                .foregroundStyle(Color("T"))
                            Text(item).font(.title3)
                                .lineLimit(1)
                                .minimumScaleFactor(0.9)
                            Spacer()
                        }
                            .frame(width: 165)
                }
              
                }
                Spacer()
            }
            .padding(.top)
  
        }
    }
}

struct TaskWidget: Widget {
    let kind: String = "TaskWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
                TaskWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
           
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}
struct NoiseView: View {
    let size: CGFloat
    let opacity: Double
    var body: some View {
        Canvas { context, size in
            for _ in 0...(Int(size.width * size.height) / 1) {
                let x = CGFloat.random(in: 0...size.width)
                let y = CGFloat.random(in: 0...size.height)
                context.fill(
                    Path(ellipseIn: CGRect(x: x, y: y, width: self.size, height: self.size)),
                    with: .color(Color.black.opacity(self.opacity))
                )
            }
        }
        .blendMode(.overlay)
    }
}

#Preview(as: .systemSmall) {
    TaskWidget()
} timeline: {
    SimpleEntry(date: .now,items: ["1","2"] )
     
}


