 

import SwiftUI

struct ContentView: View {
    var steps: Int = 10
    @State var value: Int = 0
    @State var value2: Int = 0
    @State var start: Int = 0
    @State var end: Int = 100
    @State var selectedSegment: Int = 0
    @State var style: SegmentStyle = .styleOne
    var body: some View {
        VStack {
            Text("\("\(value)")")
            CustomPickerView(count: $value, from: start, to: end, steps: 10, style: .styleOne)
            
            
            
            Text("\("\(Double(value2) / Double(steps))")")
            CustomPickerView(count: $value2, from: start, to: end, steps: 10, style: .styleTwo)

            
        }
     
    }
}

#Preview {
    ContentView()
}
