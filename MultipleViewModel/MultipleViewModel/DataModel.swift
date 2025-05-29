import SwiftUI

struct SettingItem:Identifiable{
    var id = UUID()
    var title:String
    var iconName:String
    var iconColor:Color
    var destinationView:AnyView
}
class SettingsModel {
    static let shared = SettingsModel()
    let personalItems: [SettingItem] = [
        SettingItem(title: "Profile", iconName: "person.crop.circle.fill", iconColor: .blue, destinationView: AnyView(UserProfileView())),
        SettingItem(title: "Avatar", iconName: "person.fill.viewfinder", iconColor: .blue, destinationView: AnyView(UserAvatarView()))
    ]
    let generalItems: [SettingItem] = [
        SettingItem(title: "Broadcast Lists", iconName: "text.bubble.fill", iconColor: .green, destinationView: AnyView(Text("Broadcast Lists View"))),
        SettingItem(title: "Starred Messages", iconName: "star.fill", iconColor: .yellow, destinationView: AnyView(Text("Starred Messages View"))),
        SettingItem(title: "Linked Devices", iconName: "link", iconColor: .blue, destinationView: AnyView(Text("Linked Devices View")))
    ]
    let settingsItems: [SettingItem] = [
        SettingItem(title: "Account", iconName: "key.fill", iconColor: .blue, destinationView: AnyView(Text("Account View"))),
        SettingItem(title: "Privacy", iconName: "hand.raised.fill", iconColor: .blue, destinationView: AnyView(Text("Privacy View"))),
        SettingItem(title: "Chats", iconName: "message.fill", iconColor: .green, destinationView: AnyView(Text("Chats View"))),
        SettingItem(title: "Notifications", iconName: "bell.fill", iconColor: .red, destinationView: AnyView(Text("Notifications View"))),
        SettingItem(title: "Storage and Data", iconName: "externaldrive.fill", iconColor: .green, destinationView: AnyView(Text("Storage and Data View")))
    ]
    let settingsItems2: [SettingItem] = [
        SettingItem(title: "Edit", iconName: "pencil.slash", iconColor: .green, destinationView: AnyView(ThirdView())),
        SettingItem(title: "bookmark", iconName: "bookmark.fill", iconColor: .blue, destinationView: AnyView(Text("Privacy View"))),
    ]
     
}
