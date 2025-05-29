
import Foundation
class ImageSelection: ObservableObject {
   @Published var selectedData: datamode? = nil
   @Published var showingSheet: Bool = false
    func getHeight(_ index:Int) -> CGFloat{
        return index % 2 == 0 ? 180 : 300
    }
    func getHeight2(_ index:Int) -> CGFloat{
        return index % 2 == 0 ? 300 : 180
    }
}

struct datamode: Identifiable, Equatable {
   var id = UUID()
   var name : String
   var titel :String
   static func ==(lhs: datamode, rhs: datamode) -> Bool {
       return lhs.id == rhs.id
   }
}

var theimages = [
   datamode(name: "m1", titel: "Free stock photos & videos you can use everywhere. Browse millions of high-quality royalty free stock images & copyright free pictures."),
   datamode (name: "m2", titel: "Free stock photos "),
   datamode(name: "m3", titel: "the image is m3"),
   datamode (name: "m4", titel: "Free stock photos  "),
   datamode(name: "m5", titel: "Free stock photos "),
   datamode (name: "m6", titel: "Free stock photos ."),
]
var theimages2 = [
   datamode(name: "m7", titel: "Results 1 - 60 of 9154 — Discover the best free images, stock photos, free HD/4K videos, music, sound effects, GIFs, and more from Pexels on Pixabay."),
   datamode (name: "m8", titel: "Free stock photos " ),
   datamode(name: "m9", titel: "Free stock photos "),
   datamode (name: "m10", titel: "Free stock photos "),
   datamode(name: "m11", titel: "Free stock photos "),
   datamode (name: "m12", titel: "Free stock photos "),
]
var theimages3 = [
   datamode(name: "m7", titel: ""),
   datamode (name: "m14", titel: ""),
   datamode(name: "m10", titel: ""),
   datamode (name: "m12", titel: ""),
   datamode(name: "m8", titel: ""),
   datamode (name: "m9", titel: ""),
]
struct sideBar1: Identifiable {
   var id = UUID()
   var icon: String
   var title: String
   var tab: TabIcon1
   var index: Int
}

let sidebar1 = [
   sideBar1(icon: "square.stack", title: "Card", tab: .Card, index: 0),
   sideBar1(icon: "magnifyingglass", title: "Favorite", tab: .Favorite, index: 1),
   sideBar1(icon: "house", title: "Home ", tab: .Home, index: 2),
   sideBar1(icon: "star", title: "Purchases", tab: .Purchases, index: 3),
   sideBar1(icon: "person", title: "Notification", tab: .Notification, index: 4),
]
enum TabIcon1 :String {
   case Home
   case Card
   case Favorite
   case Purchases
   case Notification
}

struct sideBar: Identifiable {
   var id = UUID()
   var icon: String
   var title: String
   var tab: TabIcon
   var index: Int
}
let sidebar = [
   sideBar(icon: "house.fill", title: "Home ", tab: .Home, index: 0),
   sideBar(icon: "creditcard.fill", title: "Card", tab: .Card, index: 1),
   sideBar(icon: "heart.fill", title: "Favorite", tab: .Favorite, index: 2),
   sideBar(icon: "cart.fill.badge.plus", title: "Purchases", tab: .Purchases, index: 3),
   sideBar(icon: "bell.badge.fill", title: "Notification", tab: .Notification, index: 4),
]
enum TabIcon :String {
   case Home
   case Card
   case Favorite
   case Purchases
   case Notification
}
