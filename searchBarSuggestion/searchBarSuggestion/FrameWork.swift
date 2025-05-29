 
import Foundation

import SwiftUI
struct FrameWork:Identifiable{
    var id = UUID()
    var image:String
    var name:String
    var titel:String


}
var framework:[FrameWork] = [
    FrameWork(image: "kit1", name: "CloudKit", titel:"Store your app’s data in iCloud and keep everything up to date across devices and on the web. Featuring efficient syncing, as well as simple monitoring and management, it’s never been easier to build and grow your apps with CloudKit. Store private data securely in your users’ iCloud accounts for limitless scale as your user base grows, and get up to 1PB of storage for your app’s public data."),
    
    
                             FrameWork(image: "kit2", name: "Homekit", titel:"There are a wide variety of accessories from leading brands that are compatible with the Home app. And now the Home app supports Matter — the new smart home connectivity standard. Check back for updates on what’s available"),
    
    
                             FrameWork(image: "kit3", name: "Swiftui", titel:"SwiftUI is a modern way to declare user interfaces for any Apple platform. Create beautiful, dynamic apps faster than ever before."),
    
    
                             FrameWork(image: "kit4", name: "Xcode", titel:"Xcode 15 enables you to develop, test, and distribute apps for all Apple platforms. Code and design your apps faster with enhanced code completion, interactive previews, and live animations. Use Git staging to craft your next commit without leaving your code. Explore and diagnose your test results with redesigned test reports with video recording. And start deploying seamlessly to TestFlight and the App Store from Xcode Cloud. Creating amazing apps has never been easier"),
]

class frameWC:ObservableObject{
    @Published var selectedItem:FrameWork?
    @Published var text = ""
    @Published var showingDetail = false
}
