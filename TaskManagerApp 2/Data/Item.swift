 

import SwiftData
import SwiftUI

@Model
class Item: Identifiable {
    var id: String
    var from: Date
    var to: Date?
    var title: String
    var subtitle: String
 
    var color: String
    
    init(
        from: String,
        to: String?,
        title: String,
        subtitle: String,
        color: String = "blue"
 
    ) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        self.id = from + "/" + (to ?? "")
        self.from = formatter.date(from: from) ?? .now
        if let to {
            self.to = formatter.date(from: to) ?? .now
        }
        self.title = title
        self.subtitle = subtitle
 
        self.color = color
    
  
        
    }
    
    var swiftUIColor: Color {
        switch color {
        case "yellow": Color.yellow
        case "red": Color.red
        case "blue": Color.blue
        case "green": Color.green
        case "purple": Color.purple
        case "cyan": Color.cyan
        case "gray": Color.gray
        default: Color.gray
        }
    }
}

struct Items {
    static let data: [Item] = [
    ]
}
 
