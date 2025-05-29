 

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        HStack {
            Text("Dating")
                .font(.title)
            Spacer()
            
            Image(systemName: "slider.horizontal.3")
                .imageScale(.large)
        }
        .fontWeight(.semibold)
        .fontDesign(.rounded)
    }
}
