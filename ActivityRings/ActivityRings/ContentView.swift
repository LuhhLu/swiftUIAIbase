 

import SwiftUI

struct ContentView: View {
    @State var progress: CGFloat = 0.1
    @State var progress1: CGFloat = 0.1
    @State var progress2: CGFloat = 0.1
    var body: some View {
        VStack(spacing: 40) {
            ZStack{
                CustomActivityRingsView(icon:"arrow.up", BG: "C1", WHeight: 100, completionRate: progress, ringThickness: 30, colorGradient: Gradient(colors: [Color("C1"),Color("C2")]))
                CustomActivityRingsView(icon: "arrow.forward", BG: "C21", WHeight: 170, completionRate: progress1, ringThickness: 30, colorGradient: Gradient(colors: [Color("C21"),Color("C22")]))
                CustomActivityRingsView(icon: "arrow.forward", BG: "C31", WHeight: 240, completionRate: progress2, ringThickness: 30, colorGradient: Gradient(colors: [Color("C31"),Color("C32")]))
            }
            
            Slider(value: $progress, in: 0...2)
            Slider(value: $progress1, in: 0...2)
            Slider(value: $progress2, in: 0...2)
        }
        .padding(.horizontal)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
