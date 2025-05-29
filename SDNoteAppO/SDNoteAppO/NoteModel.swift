import SwiftUI
import SwiftData
@Model
class Note:Identifiable{
    var id = UUID()
    var icon:String
    var title:String
    var isComplet:Bool
    var iconColor:Bool
     
    init(id: UUID = UUID(), icon: String, title: String, isComplet: Bool, iconColor: Bool) {
        self.id = id
        self.icon = icon
        self.title = title
        self.isComplet = isComplet
        self.iconColor = iconColor
    }
}
