 
import SwiftUI
import WidgetKit
struct DataSirves{
    @AppStorage("text" ,store: UserDefaults(suiteName: "group.Sucodee.textwigeTT.Twidget"))
    var text = ""
    var textValue:String{
        get{
            text
        }
        set{
            text = newValue
        }
    }
}

struct ContentView: View {
    @AppStorage("text" ,store: UserDefaults(suiteName: "group.Sucodee.textwigeTT.Twidget"))
    var text = ""
    var body: some View {
        VStack {
            TextField("Enter text", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Update Widget"){
                WidgetCenter.shared.reloadTimelines(ofKind: "TWidget")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
