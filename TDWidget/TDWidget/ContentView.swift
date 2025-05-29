 

import SwiftUI
import WidgetKit
 
struct DataManager{
    static var shared = DataManager()
    let userDefaults = UserDefaults(suiteName: "group.Sucodee.TDWidget.TaskWidget")!
    let itemkey = "widgetItems"
    var items:[String]{
        get {userDefaults.stringArray(forKey: itemkey) ?? []}
        set{
            userDefaults.setValue(newValue, forKey: itemkey)
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
    mutating func addItem(_ item:String){
        items.append(item)
    }
}
struct ContentView: View {
    @State private var newItemText: String = ""
    @State private var items: [String] = DataManager.shared.items
    var body: some View {
        VStack {
            ForEach(items , id: \.self) { index in
                Text(index)
                    .onTapGesture {
                        print(index)
                    }
            }
            TextField("New item", text: $newItemText)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                DataManager.shared.addItem(newItemText)
                self.items = DataManager.shared.items
                newItemText = ""
                
            }, label: {
                Text("Add new task")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
