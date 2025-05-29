 

import SwiftUI

struct dataModel:Hashable{
    var image:String
    var name:String
    var prase:String
    var rating:String
}
enum ContentViewSelection {
    case home
    case favorite
    case purchase
    case trash
}
