 

import SwiftUI

struct SimpleCircularSlider: View {
    private let step: Double.Stride
    private let range: ClosedRange<Double>
    
    @Binding var value: Double

    init(
        value: Binding<Double>,
        range: ClosedRange<Double>,
        step: Double.Stride = 1
    ) {
        _value = value
        self.range = range
        self.step = step
    }
    
    var body: some View {
        ZStack{
            CircularSlider(value: $value, in: range, step: step)
            Text("\(Int(value))")
        }
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    @Previewable @State var value: Double = 0
    
    SimpleCircularSlider(
        value: $value,
        range: 0...10,
        step: 1
    )
}
