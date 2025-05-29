 
import Foundation
struct Card:Identifiable{
    var id = UUID()
    var color:String
    var cardname:String
    var logo:String
    var num:String
 
}
var card:[Card] = [ Card(color: "c1", cardname: "Shop", logo: "cart", num: "65,973" ),
                    Card(color: "c2", cardname: "Play", logo: "gamecontroller", num: "54,677" ),
                    Card(color: "c3", cardname: "Medic", logo: "bandage.fill", num: "12,438" )]

