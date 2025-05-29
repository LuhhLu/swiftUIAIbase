 

import SwiftUI

struct DayTimelineView: View {
    let day: Date?
    let style: TimelineItemStyle
    
    var body: some View {
        ScrollView(.vertical) {
            HStack(spacing: .zero) {
                VStack(alignment: .trailing, spacing: .zero) {
                    ForEach(0..<24) { hour in
                        if hour == 0 {
                            Text("12 AM")
                                .frame(maxHeight: .infinity, alignment: .topTrailing)
                        } else if hour < 12 {
                            Text("\(hour) AM")
                                .frame(maxHeight: .infinity, alignment: .topTrailing)
                        } else if hour == 12 {
                            Text("12 PM")
                                .frame(maxHeight: .infinity, alignment: .topTrailing)
                        } else {
                            Text("\(hour - 12) PM")
                                .frame(maxHeight: .infinity, alignment: .topTrailing)
                        }
                    }
                    .bold()
                    .font(.caption2)
                }
                .padding(.trailing, 4)
                .padding(.leading, 10)
                
                TimelineView(day: day ?? .now, style: style)
            }
            .padding(.top)
        }
    }
}
