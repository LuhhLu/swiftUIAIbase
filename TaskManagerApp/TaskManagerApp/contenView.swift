
import SwiftUI

struct contenView: View {
    var body: some View {
        NavigationView{
            HomeView()
                .navigationTitle("Task Manager")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct contenView_Previews: PreviewProvider {
    static var previews: some View {
        contenView()
    }
}
