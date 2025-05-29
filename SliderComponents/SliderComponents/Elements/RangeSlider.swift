
import SwiftUI

struct RangeSlider<Value>: View where Value: BinaryFloatingPoint, Value.Stride: BinaryFloatingPoint {
    let step: Value.Stride
    let range: ClosedRange<Value>
    
    @Binding var lowerValue: Value
    @Binding var upperValue: Value
    @Environment(\.isEnabled) var isEnabled
    
    private let configuration = Configuration()
    
    init(
        lowerValue: Binding<Value>,
        upperValue: Binding<Value>,
        range: ClosedRange<Value>,
        step: Value.Stride
    ) {
        self.step = step
        self.range = range
        _lowerValue = lowerValue
        _upperValue = upperValue
    }
    
    private var normalizedLowerValue: CGFloat {
        CGFloat((lowerValue - range.lowerBound) / (range.upperBound - range.lowerBound))
    }
    
    private var normalizedUpperValue: CGFloat {
        CGFloat((upperValue - range.lowerBound) / (range.upperBound - range.lowerBound))
    }
    
    var body: some View {
        GeometryReader { proxy in
            let sliderWidth = proxy.size.width - configuration.thumbSize.width
                                    
            ZStack(alignment: .leading) {
                RoundedRectangle(
                    cornerRadius: configuration.height / 2,
                    style: .circular
                )
                .fill(
                    color(configuration.backgroundColor, when: isEnabled)
                )
                .frame(
                    height: configuration.height
                )
                
                RoundedRectangle(
                    cornerRadius: configuration.height / 2,
                    style: .circular
                )
                .fill(
                    color(configuration.foregroundColor, when: isEnabled)
                )
                .frame(
                    width: sliderWidth * (normalizedUpperValue - normalizedLowerValue) + configuration.thumbSize.width,
                    height: configuration.height
                )
                .offset(x: sliderWidth * normalizedLowerValue)
                
                configuration.thumbView
                    .frame(
                        width: configuration.thumbSize.width,
                        height: configuration.thumbSize.height
                    )
                    .offset(x: (sliderWidth - configuration.thumbSize.width) * normalizedLowerValue)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                let dragX = max(
                                    0,
                                    min(gesture.location.x, sliderWidth * normalizedUpperValue)
                                )
                                
                                let newValue = range.lowerBound + (range.upperBound - range.lowerBound) * Value(dragX / (sliderWidth - configuration.thumbSize.width))
                                
                                lowerValue = newValue
                            }
                            .onEnded { _ in
                                withAnimation {
                                    lowerValue = min((lowerValue / Value(step)).rounded() * Value(step), upperValue)
                                }
                            }
                    )
                
                configuration.thumbView
                    .frame(
                        width: configuration.thumbSize.width,
                        height: configuration.thumbSize.height
                    )
                    .offset(x: (sliderWidth - configuration.thumbSize.width) * normalizedUpperValue + configuration.thumbSize.width)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                let dragX = max(
                                    sliderWidth * normalizedLowerValue,
                                    min(gesture.location.x, sliderWidth)
                                )
                                let newValue = range.lowerBound + (range.upperBound - range.lowerBound) * Value(dragX / sliderWidth)
                            
                                    upperValue = newValue
                               
                            }
                            .onEnded { _ in
                                withAnimation {
                                    upperValue = max((upperValue / Value(step)).rounded() * Value(step), lowerValue)
                                }
                            }
                    )
            }
        }
        .frame(height: configuration.thumbSize.width)
    }
}

extension RangeSlider {
    func color(_ color: Color, when isEnabled: Bool) -> Color {
        if isEnabled {
            color
        } else {
            color.mix(with: .white, by: isEnabled ? 0 : 0.7)
        }
    }
    
    struct Configuration {
        let height: CGFloat = 8.0
        
        let backgroundColor: Color = .gray.opacity(0.3)
        let foregroundColor: Color =  .indigo
        
        let thumbSize: CGSize = .init(width: 20, height: 20)
        let thumbView: AnyView = AnyView(StrokeThumb())
    }
}

#Preview {
    @Previewable @State var lowerValue: Double = 0
    @Previewable @State var upperValue: Double = 50
    
    Text("\(lowerValue) - \(upperValue)")
    RangeSlider(
        lowerValue: $lowerValue,
        upperValue: $upperValue,
        range: 0...100,
        step: 1
    )
    .padding()
}
