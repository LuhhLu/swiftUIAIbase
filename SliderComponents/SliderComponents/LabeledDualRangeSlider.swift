 
import SwiftUI

struct LabeledDualRangeSlider: View {
    private let range: ClosedRange<Double>

    @Binding var upperValue: Double
    @Binding var lowerValue: Double
    
    init(
        lowerValue: Binding<Double>,
        upperValue: Binding<Double>,
        range: ClosedRange<Double>
    ) {
        _lowerValue = lowerValue
        _upperValue = upperValue
        self.range = range
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
                Text("Price slider")
                .font(.title.bold())
                .padding(.bottom,24)
            HStack{
                Text("\(Int(lowerValue)) - \(Int(upperValue))")
                    .font(.title3.bold())
            }
            .frame(maxWidth: .infinity)
            RangeSlider(lowerValue: $lowerValue, upperValue: $upperValue, range: range, step: 1)

        }
        .padding()
    }
}

#Preview {
    @Previewable @State var lowerValue: Double = 65
    @Previewable @State var upperValue: Double = 150
    
    LabeledDualRangeSlider(
        lowerValue: $lowerValue,
        upperValue: $upperValue,
        range: 0...200
    )
}
