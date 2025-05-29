 
import SwiftUI

struct TasksListView: View {
    let items: [Item]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(items) { item in
                ItemView(item: item)
                    .padding(.horizontal)
            }
        }
        .padding(.top)
    }
}
 
