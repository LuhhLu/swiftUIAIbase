

import SwiftUI

struct HomePage: View {
    @FetchRequest( sortDescriptors: [])
    var myTaskResults:FetchedResults<MyTask>
    
    var body: some View {
        VStack {
           MyTaskView(mytask: myTaskResults)
        }
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
