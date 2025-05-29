 

import SwiftUI

struct Item: Identifiable {
    let id: String
    let from: Date
    let to: Date
    let title: String
    let subtitle: String
    let description: String
    let color: Color
    
    init(
        from: String,
        to: String,
        title: String,
        subtitle: String,
        color: Color
    ) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        self.id = from + "/" + to
        self.from = formatter.date(from: from) ?? .now
        self.to = formatter.date(from: to) ?? .now
        self.title = title
        self.subtitle = subtitle
        self.color = color

        self.description = [
            "Running and meet with colleagues & discuss daily life.",
            "Confirm this meeting",
            "Write summary",
            "Check emails before and make notes",
            ""
        ].randomElement()!
    }
}

struct Items {
    static let data: [Item] = [
        Item(from: "2024-12-07 10:00:00", to: "2024-12-07 16:13:00", title: "Test", subtitle: "10AM - 4PM", color: .brown),
        
        // December 8, 2024
        Item(from: "2024-12-08 12:00:00", to: "2024-12-08 13:00:00", title: "Meeting", subtitle: "12PM - 1PM", color: .blue),
        Item(from: "2024-12-08 13:00:00", to: "2024-12-08 14:00:00", title: "Lunch", subtitle: "1PM - 2PM", color: .green),
        
        // December 9, 2024
        Item(from: "2024-12-09 09:00:00", to: "2024-12-09 10:00:00", title: "Team Stand-up", subtitle: "9AM - 10AM", color: .blue),
        Item(from: "2024-12-09 11:00:00", to: "2024-12-09 12:00:00", title: "Project Planning", subtitle: "11AM - 12PM", color: .green),
        Item(from: "2024-12-09 13:00:00", to: "2024-12-09 14:00:00", title: "Lunch Break", subtitle: "1PM - 2PM", color: .orange),
        
        // December 10, 2024
        Item(from: "2024-12-10 08:30:00", to: "2024-12-10 09:30:00", title: "Morning Review", subtitle: "8:30AM - 9:30AM", color: .gray),
        Item(from: "2024-12-10 10:00:00", to: "2024-12-10 11:30:00", title: "Budget Meeting", subtitle: "10AM - 11:30AM", color: .pink),
        Item(from: "2024-12-10 14:00:00", to: "2024-12-10 15:00:00", title: "Workshop Prep", subtitle: "2PM - 3PM", color: .yellow),
        Item(from: "2024-12-10 16:00:00", to: "2024-12-10 17:30:00", title: "Budget Meeting", subtitle: "10AM - 11:30AM", color: .pink),
        Item(from: "2024-12-10 18:00:00", to: "2024-12-10 19:00:00", title: "Workshop Prep", subtitle: "2PM - 3PM", color: .yellow),
        
        // December 11, 2024
        Item(from: "2024-12-11 09:00:00", to: "2024-12-11 10:30:00", title: "Product Update", subtitle: "9AM - 10:30AM", color: .indigo),
        Item(from: "2024-12-11 11:00:00", to: "2024-12-11 12:30:00", title: "Cross-Team Sync", subtitle: "11AM - 12:30PM", color: .blue),
        Item(from: "2024-12-11 14:00:00", to: "2024-12-11 15:30:00", title: "Market Analysis", subtitle: "2PM - 3:30PM", color: .green),
        
        // December 12, 2024
        Item(from: "2024-12-12 10:00:00", to: "2024-12-12 11:00:00", title: "1:1 Meeting", subtitle: "10AM - 11AM", color: .orange),
        Item(from: "2024-12-12 13:00:00", to: "2024-12-12 14:30:00", title: "Strategy Session", subtitle: "1PM - 2:30PM", color: .purple),
        Item(from: "2024-12-12 16:00:00", to: "2024-12-12 17:30:00", title: "Project Handoff", subtitle: "4PM - 5:30PM", color: .pink),
        
        // December 13, 2024
        Item(from: "2024-12-13 09:30:00", to: "2024-12-13 10:30:00", title: "Daily Check-In", subtitle: "9:30AM - 10:30AM", color: .yellow),
        Item(from: "2024-12-13 11:00:00", to: "2024-12-13 12:00:00", title: "Code Review", subtitle: "11AM - 12PM", color: .indigo),
        Item(from: "2024-12-13 14:30:00", to: "2024-12-13 15:30:00", title: "Client Demo", subtitle: "2:30PM - 3:30PM", color: .blue),
        
        // December 14, 2024
        Item(from: "2024-12-14 09:00:00", to: "2024-12-14 10:00:00", title: "Sprint Retrospective", subtitle: "9AM - 10AM", color: .green),
        Item(from: "2024-12-14 11:30:00", to: "2024-12-14 12:30:00", title: "Tech Discussion", subtitle: "11:30AM - 12:30PM", color: .orange),
        
    ]
}
