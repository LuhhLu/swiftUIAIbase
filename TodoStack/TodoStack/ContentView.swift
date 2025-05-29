 

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack{
                StackView(Tcolor: .purple, color: .P_1, icon: "book", title: "Read Books")
                StackView(Tcolor: .o2, color: .P_2, icon: "figure.strengthtraining.traditional", title: "Workout")
//                Spacer()
            }

               
        }
    }
}

#Preview {
    ContentView()
}
