 

import SwiftUI

struct CircularSlider: View {
    let step: Double.Stride
    let range: ClosedRange<Double>
    
    @Binding var value: Double
    @Environment(\.isEnabled) var isEnabled
    
    @State private var progress: Double = 0.0
    @State private var rotationAngle = Angle.degrees(0)
    
    private let configuration = Configuration()
    
    init(
        value: Binding<Double>,
        in bounds: ClosedRange<Double>,
        step stride: Double.Stride = 1
    ) {
        step = stride
        range = bounds
        _value = value
    }
    
    private var normalizedValue: CGFloat {
        CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound))
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color(configuration.backgroundColor, when: isEnabled),
                    lineWidth: configuration.width
                )
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: configuration.width,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .foregroundStyle(
                    color(configuration.foregroundColor, when: isEnabled)
                )
                .rotationEffect(.degrees(-90))
            
            configuration.thumbView
                .frame(
                    width: configuration.thumbSize.width,
                    height: configuration.thumbSize.height
                )
                .offset(y: -configuration.radius)
                .rotationEffect(rotationAngle)
                .gesture(
                    DragGesture(minimumDistance: 0.0)
                        .onChanged { value in
                            rotationAngle = changeAngle(location: value.location)
                        }
                        .onEnded { _ in
                            let diff = progress * (range.upperBound - range.lowerBound) - (progress * (range.upperBound - range.lowerBound)).rounded(.down)

                            if diff > 0.5 {
                                withAnimation {
                                    progress = value / (range.upperBound - range.lowerBound)
                                    rotationAngle = .degrees(360 * progress)
                                }
                            } else {
                                withAnimation {
                                    progress = value / (range.upperBound - range.lowerBound)
                                    rotationAngle = .degrees(360 * progress)
                                }
                            }
                        }
                )
        }
        .frame(
            width: configuration.radius * 2,
            height: configuration.radius * 2
        )
        .onAppear {
            progress = value / (range.upperBound - range.lowerBound)
            rotationAngle = .degrees(360 * progress)
        }
        .onChange(of: progress) {
            let newValue = ((range.upperBound - range.lowerBound) * progress)
            value = (newValue / step).rounded() * step
        }
    }
}

extension CircularSlider {
    private func changeAngle(location: CGPoint) -> Angle {
        let vector = CGVector(dx: location.x, dy: -location.y)
        let angleRadians = atan2(vector.dx, vector.dy)
        let positiveAngle = angleRadians < 0.0 ? angleRadians + (2.0 * .pi) : angleRadians
        progress = positiveAngle / (2.0 * .pi)
        
        return Angle(radians: positiveAngle)
    }
}

extension CircularSlider {
    func color(_ color: Color, when isEnabled: Bool) -> Color {
        if isEnabled {
            color
        } else {
            color.mix(with: .white, by: isEnabled ? 0 : 0.7)
        }
    }
    
    struct Configuration {
        let width: CGFloat = 8.0
        let radius: CGFloat = 60
        
        let backgroundColor: Color = .gray.opacity(0.3)
        let foregroundColor: Color = .indigo
        
        let thumbSize: CGSize = .init(width: 20, height: 20)
        let thumbView: AnyView = AnyView(StrokeThumb())
    }
}

#Preview {
    @Previewable @State var value: Double = 1
    Text("\(value)")
    CircularSlider(
        value: $value,
        in: 0...10,
        step: 1
    )
//    .background(.red)
    .padding()
}
