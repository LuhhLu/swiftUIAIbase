 

import SwiftUI

struct TrippleRangeSlider: View {
    @Binding var upperValue: Double
    @Binding var middleValue: Double
    @Binding var lowerValue: Double
    
    init(
        lowerValue: Binding<Double>,
        middleValue: Binding<Double>,
        upperValue: Binding<Double>
    ) {
        _lowerValue = lowerValue
        _middleValue = middleValue
        _upperValue = upperValue
    }
    
    var body: some View {
        TrippleSlider(
            lowerValue: $lowerValue,
            middleValue: $middleValue,
            upperValue: $upperValue,
            range: 0...100,
            step: 1
        ) { value in
            VStack(alignment: .trailing) {
                Text("\(Int(value))%")
                    .padding(.all, 6)
            }
            .frame(width: 56)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.3))
            }
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var lowerValue: Double = 20
    @Previewable @State var middleValue: Double = 65
    @Previewable @State var upperValue: Double = 90
    
    TrippleRangeSlider(
        lowerValue: $lowerValue,
        middleValue: $middleValue,
        upperValue: $upperValue
    )
}
