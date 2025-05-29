 

import SwiftUI

struct TrippleSlider<Value, ThumbOverlay>: View where Value: BinaryFloatingPoint, Value.Stride: BinaryFloatingPoint, ThumbOverlay: View {
    let step: Value.Stride
    let range: ClosedRange<Value>
    let thumbOverlay: (Value) -> ThumbOverlay
    
    @Binding var lowerValue: Value
    @Binding var middleValue: Value
    @Binding var upperValue: Value
    @Environment(\.isEnabled) var isEnabled
    @State private var isDragging: Bool = false
    
    private let configuration = Configuration()
    
    init(
        lowerValue: Binding<Value>,
        middleValue: Binding<Value>,
        upperValue: Binding<Value>,
        range: ClosedRange<Value>,
        step: Value.Stride,
        @ViewBuilder thumbOverlay: @escaping (Value) -> ThumbOverlay
    ) {
        self.step = step
        self.range = range
        _lowerValue = lowerValue
        _middleValue = middleValue
        _upperValue = upperValue
        self.thumbOverlay = thumbOverlay
    }
    
    private var normalizedLowerValue: CGFloat {
        CGFloat((lowerValue - range.lowerBound) / (range.upperBound - range.lowerBound))
    }
    
    private var normalizedMiddleValue: CGFloat {
        CGFloat((middleValue - range.lowerBound) / (range.upperBound - range.lowerBound))
    }
    
    private var normalizedUpperValue: CGFloat {
        CGFloat((upperValue - range.lowerBound) / (range.upperBound - range.lowerBound))
    }
    
    var body: some View {
        GeometryReader { geometry in
            let sliderWidth = geometry.size.width
            
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
                    width: (sliderWidth - configuration.thumbSize.width * 3) * (normalizedUpperValue - normalizedLowerValue) + configuration.thumbSize.width * 3,
                    height: configuration.height
                )
                .offset(x: (sliderWidth - configuration.thumbSize.width * 3) * normalizedLowerValue)
                
                configuration.thumbView
                    .frame(
                        width: configuration.thumbSize.width,
                        height: configuration.thumbSize.height
                    )
                    .offset(x: (sliderWidth - configuration.thumbSize.width * 3) * normalizedLowerValue)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                withAnimation { isDragging = true }
                                let dragX = max(
                                    0,
                                    min(gesture.location.x, sliderWidth * normalizedMiddleValue)
                                )
                                
                                let newValue = range.lowerBound + (range.upperBound - range.lowerBound) * Value(dragX / (sliderWidth - configuration.thumbSize.width))
                                
                                lowerValue = newValue
                            }
                            .onEnded { _ in
                                withAnimation {
                                    isDragging = false
                                    lowerValue = min((lowerValue / Value(step)).rounded() * Value(step), middleValue)
                                }
                            }
                    )
                    .overlay {
                        if isDragging {
                            thumbOverlay(lowerValue)
                                .offset(x: (sliderWidth - configuration.thumbSize.width * 3) * normalizedLowerValue, y: -36)
                                .transition(.opacity)
                        }
                    }
                
                configuration.thumbView
                    .frame(
                        width: configuration.thumbSize.width,
                        height: configuration.thumbSize.height
                    )
                    .offset(x: (sliderWidth - configuration.thumbSize.width * 3) * normalizedMiddleValue + configuration.thumbSize.width)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                withAnimation { isDragging = true }
                                let dragX = max(
                                    sliderWidth * normalizedLowerValue,
                                    min(gesture.location.x, sliderWidth * normalizedUpperValue)
                                )
                                
                                let newValue = range.lowerBound + (range.upperBound - range.lowerBound) * Value(dragX / (sliderWidth - configuration.thumbSize.width))
                                
                                middleValue = newValue
                            }
                            .onEnded { _ in
                                withAnimation {
                                    isDragging = false
                                    middleValue = max(min((middleValue / Value(step)).rounded() * Value(step), upperValue), lowerValue)
                                }
                            }
                    )
                    .overlay {
                        if isDragging {
                            thumbOverlay(middleValue)
                                .offset(x: (sliderWidth - configuration.thumbSize.width * 3) * normalizedMiddleValue + configuration.thumbSize.width, y: -36)
                                .transition(.opacity)
                        }
                    }
                
                configuration.thumbView
                    .frame(
                        width: configuration.thumbSize.width,
                        height: configuration.thumbSize.height
                    )
                    .offset(x: (sliderWidth - configuration.thumbSize.width * 3) * normalizedUpperValue + configuration.thumbSize.width * 2)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                withAnimation { isDragging = true }
                                let dragX = max(
                                    (sliderWidth + configuration.thumbSize.width * 2) * normalizedMiddleValue,
                                    min(gesture.location.x, sliderWidth)
                                )
                                
                                let newValue = range.lowerBound + (range.upperBound - range.lowerBound) * Value(dragX / (sliderWidth))
                                                                
                                upperValue = newValue
                            }
                            .onEnded { _ in
                                withAnimation {
                                    isDragging = false
                                    upperValue = max((upperValue / Value(step)).rounded() * Value(step), middleValue)
                                }
                            }
                    )
                    .overlay {
                        if isDragging {
                            thumbOverlay(upperValue)
                                .offset(x: (sliderWidth - configuration.thumbSize.width * 3) * normalizedUpperValue + configuration.thumbSize.width * 2, y: -36)
                                .transition(.opacity)
                        }
                    }
            }
        }
        .frame(height: configuration.thumbSize.width)
    }
}

extension TrippleSlider {
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

extension TrippleSlider where ThumbOverlay == EmptyView {
    init(
        lowerValue: Binding<Value>,
        middleValue: Binding<Value>,
        upperValue: Binding<Value>,
        range: ClosedRange<Value>,
        step: Value.Stride
    ) {
        self.step = step
        self.range = range
        _lowerValue = lowerValue
        _middleValue = middleValue
        _upperValue = upperValue
        self.thumbOverlay = { _ in EmptyView() }
    }
}

#Preview {
    @Previewable @State var lowerValue: Double = 20
    @Previewable @State var middleValue: Double = 65
    @Previewable @State var upperValue: Double = 90

    Text("\(lowerValue) - \(middleValue) - \(upperValue)")
    TrippleSlider(
        lowerValue: $lowerValue,
        middleValue: $middleValue,
        upperValue: $upperValue,
        range: 0...100,
        step: 1
    )
    .padding()
}
