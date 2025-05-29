 
import SwiftUI
struct ContentView: View {
    @State var show = false
    var body: some View {
        Button {
            show.toggle()
        } label: {
            Text("Show GridView")
            
        }
        .fullScreenCover(isPresented: $show) {
            GridView(show: $show)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
