 

import SwiftUI

struct TickSlider: View {
    private let range: ClosedRange<Double>
    
    @Binding var value: Double

    init(
        value: Binding<Double>,
        range: ClosedRange<Double>
    ) {
        _value = value
        self.range = range
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Slider with ticks")
                .padding(.bottom)
                .font(.title3)
            SingleSlider(value: $value, in: range)
            
            HStack{
                ForEach(0...Int(range.upperBound),id:\.self){ index in
                    VStack {
                        Rectangle()
                            .foregroundStyle(.gray)
                            .frame(width: 1, height: 3 * CGFloat(index%2 + 1))
                    }
                    .frame(maxWidth: .infinity)
                    
                }
            }
            HStack {
                ForEach(0...Int(range.upperBound)/2, id: \.self) { index in
                    Text("\(index*2)").frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, -14)
            .foregroundStyle(.gray)
            .font(.system(.callout))
         
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var value = 0.0
    
    TickSlider(
        value: $value,
        range: 0...12
    )
}
