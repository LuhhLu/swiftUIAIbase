 

import SwiftUI

struct SingleSlider<Value, ThumbOverlay>: View where Value: BinaryFloatingPoint, Value.Stride: BinaryFloatingPoint, ThumbOverlay: View {
    let step: Value.Stride
    let range: ClosedRange<Value>
    let thumbOverlay: () -> ThumbOverlay
    
    @Binding var value: Value
    @Environment(\.isEnabled) var isEnabled
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging: Bool = false
    
    private let configuration = Configuration()
    
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value>,
        step stride: Value.Stride = 1,
        @ViewBuilder thumbOverlay: @escaping () -> ThumbOverlay
    ) {
        step = stride
        range = bounds
        _value = value
        self.thumbOverlay = thumbOverlay
    }
    
    private var normalizedValue: Value {
        let clampedValue = min(max(value, range.lowerBound), range.upperBound)
        return (clampedValue - range.lowerBound) / (range.upperBound - range.lowerBound)
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
                        width: sliderWidth * CGFloat(normalizedValue) + configuration.thumbSize.width / 2,
                        height: configuration.height
                    )
                
                configuration.thumbView
                    .frame(
                        width: configuration.thumbSize.width,
                        height: configuration.thumbSize.height
                    )
                    .offset(x: sliderWidth * CGFloat(normalizedValue))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                withAnimation { isDragging = true }
                                
                                let dragX = max(0, min(gesture.location.x, sliderWidth))
                                let newValue = range.lowerBound + (range.upperBound - range.lowerBound) * Value(dragX / sliderWidth)
                                value = newValue//Value((Value.Stride(newValue) / step).rounded() * step)
                            }
                            .onEnded { _ in
                                withAnimation {
                                    isDragging = false
                                    value = Value((Value.Stride(value) / step).rounded() * step)
                                }
                            }
                    )
                    .overlay {
                        if isDragging {
                            thumbOverlay()
                                .offset(x: sliderWidth * CGFloat(normalizedValue), y: -36)
                                .transition(.opacity)
                        }
                    }
            }
        }
        .frame(height: configuration.thumbSize.height)
    }
}

extension SingleSlider where ThumbOverlay == EmptyView {
    init(
        value: Binding<Value>,
        in bounds: ClosedRange<Value>,
        step stride: Value.Stride = 1
    ) {
        step = stride
        range = bounds
        _value = value
        self.thumbOverlay = { EmptyView() }
    }
}

extension SingleSlider {
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
    @Previewable @State var value: Float = 0
    
    Text("\(value)")
    SingleSlider(
        value: $value,
        in: 0...100,
        step: 1
    )
    .padding()
}
