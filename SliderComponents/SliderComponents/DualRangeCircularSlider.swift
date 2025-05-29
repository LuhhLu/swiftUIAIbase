 

import SwiftUI

struct DualRangeCircularSlider: View {
    private let step: Double.Stride
    private let range: ClosedRange<Double>
    
    @Binding var lowerValue: Double
    @Binding var upperValue: Double
    
    init(
        lowerValue: Binding<Double>,
        upperValue: Binding<Double>,
        range: ClosedRange<Double>,
        step: Double.Stride = 1
    ) {
        _lowerValue = lowerValue
        _upperValue = upperValue
        
        self.range = range
        self.step = step
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: .zero) {
            HStack{
                Text("Range slider")
                Spacer()
                Text("\(Int(lowerValue)) - \(Int(upperValue))")
            }
            .padding(.bottom)
            .font(.system(.body,design: .rounded,weight: .medium))
            .frame(maxWidth: .infinity)
            RangeCircularSlider(lowerValue: $lowerValue, upperValue: $upperValue, in: range)
         }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

#Preview {
    @Previewable @State var lowerValue: Double = 0
    @Previewable @State var upperValue: Double = 50
    
    DualRangeCircularSlider(
        lowerValue: $lowerValue,
        upperValue: $upperValue,
        range: 0...10,
        step: 1
    )
}
