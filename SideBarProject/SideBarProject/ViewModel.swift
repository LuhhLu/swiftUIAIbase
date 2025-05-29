
import Foundation
import SwiftUI
class ViewModel:ObservableObject{
    @Published var isopen:  Bool = false
    @Published var sideButton : Bool = true
    @Published var selctetditem:TabIcon = .home
    @Published var toggleAction = false

}

struct sideBar:Identifiable{
    var id = UUID()
    var icon : String
    var titel : String
    var tab:TabIcon
}
var sidebar = [
    sideBar(icon: "rectangle.stack", titel: "Tutorials ", tab: .home),
    sideBar(icon: "star", titel: "Favorite", tab: .maginf),
    sideBar(icon: "square.and.arrow.down", titel: "Downloads", tab: .bell),
    sideBar(icon: "ellipsis.message", titel: "Messages", tab: .rect)
]
enum TabIcon :String{
    case home
    case maginf
    case bell
    case rect
}

struct Colors:Identifiable{
    var id = UUID()
    var acolors:String
}
var arraycolor = [Colors(acolors: "c1"),
                  Colors(acolors: "c2"),
                  Colors(acolors: "c3")
]


struct projects:Identifiable{
    var id = UUID()
    var color:Color
    var titel:String
}
var proojects = [
    projects(color: .red, titel: "TabBr"),
    projects(color: .purple, titel: "api jeston"),
    projects(color: .yellow, titel: "side bar"),
    projects(color: .blue, titel: "todo app"),
    projects(color: .cyan, titel: "video edier ")
]
