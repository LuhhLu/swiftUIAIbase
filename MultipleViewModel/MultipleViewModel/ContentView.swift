import SwiftUI

struct ContentView: View {
    var model = SettingsModel.shared
    var body: some View {
        NavigationStack{
            Form{
                Section() {
                    ForEach(model.personalItems) { item in
                        SettingsRowView(item: item)
                    }
                }
                Section() {
                    ForEach(model.generalItems) { item in
                        SettingsRowView(item: item)
                    }
                }
                Section() {
                    ForEach(model.settingsItems) { item in
                        SettingsRowView(item: item)
                    }
                }
            }
            .navigationTitle("Settings")
            .padding(.top,20)
        }
    }
}

#Preview {
    ContentView()
}

struct SettingsRowView: View {
    var item:SettingItem
    var body: some View {
        NavigationLink(destination: item.destinationView) {
            HStack{
                Image(systemName: item.iconName)
                    .foregroundStyle(item.iconColor)
                Text(item.title)
            }
        }
    }
}
struct UserProfileView: View {
    var body: some View {
        let model = SettingsModel.shared
        NavigationStack{
            CustomNavigationLink(title: "ProfileView") {
                VStack {
                    Image(.user).resizable().scaledToFill()
                        .frame(width: 150, height: 150)
                        .padding(.top,25)
                    Form{
                            Section() {
                                ForEach(model.settingsItems2) { item in
                                    SettingsRowView(item: item)
                                }
                           }
                    }
                }
                
            }

        }
        
    }
}
struct ThirdView: View {
    var body: some View {
        CustomNavigationLink(title: "ThirdView") {
            VStack {
                Text("ThirdView").bold().font(.largeTitle)
            }
        }
        
    }
}
struct UserAvatarView: View {
    var body: some View {
        Text("User Avatar View")
    }
}
