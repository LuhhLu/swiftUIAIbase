 
import SwiftUI

struct RangeCircularSlider: View {
    let step: Double.Stride
    let range: ClosedRange<Double>
    
    @Binding var lowerValue: Double
    @Binding var upperValue: Double
    @State private var lowerAngle: Angle = .degrees(0)
    @State private var upperAngle: Angle = .degrees(0)
    @State private var lowerProgress: Double = 0.0
    @State private var upperProgress: Double = 0.0
    @Environment(\.isEnabled) var isEnabled
    
    private let configuration = Configuration()
    
    init(
        lowerValue: Binding<Double>,
        upperValue: Binding<Double>,
        in bounds: ClosedRange<Double>,
        step stride: Double.Stride = 1
    ) {
        step = stride
        range = bounds
        _lowerValue = lowerValue
        _upperValue = upperValue
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color(configuration.backgroundColor, when: isEnabled),
                    lineWidth: configuration.width
                )
            
            Circle()
                .trim(from: 0.0, to: upperProgress - lowerProgress)
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
                .rotationEffect(.degrees(-90 + 360 * lowerProgress))
            
            configuration.thumbView
                .frame(
                    width: configuration.thumbSize.width,
                    height: configuration.thumbSize.height
                )
                .offset(y: -configuration.radius)
                .rotationEffect(lowerAngle)
                .gesture(
                    DragGesture(minimumDistance: 0.0)
                        .onChanged { value in
                            lowerAngle = changeLowerAngle(location: value.location)
                        }
                        .onEnded { _ in
                            let diff = lowerProgress * (range.upperBound - range.lowerBound) - (lowerProgress * (range.upperBound - range.lowerBound)).rounded(.down)
                            
                            if diff > 0.5 {
                                withAnimation {
                                    lowerProgress = lowerValue / (range.upperBound - range.lowerBound)
                                    lowerAngle = .degrees(360 * lowerProgress)
                                }
                            } else {
                                withAnimation {
                                    lowerProgress = lowerValue / (range.upperBound - range.lowerBound)
                                    lowerAngle = .degrees(360 * lowerProgress)
                                }
                            }
                        }
                )
            
            configuration.thumbView
                .frame(
                    width: configuration.thumbSize.width,
                    height: configuration.thumbSize.height
                )
                .offset(y: -configuration.radius)
                .rotationEffect(upperAngle)
                .gesture(
                    DragGesture(minimumDistance: 0.0)
                        .onChanged { value in
                            upperAngle = changeUpperAngle(location: value.location)
                        }
                        .onEnded { _ in
                            let diff = upperProgress * (range.upperBound - range.lowerBound) - (upperProgress * (range.upperBound - range.lowerBound)).rounded(.down)
                            
                            if diff > 0.5 {
                                withAnimation {
                                    upperProgress = upperValue / (range.upperBound - range.lowerBound)
                                    upperAngle = .degrees(360 * upperProgress)
                                }
                            } else {
                                withAnimation {
                                    upperProgress = upperValue / (range.upperBound - range.lowerBound)
                                    upperAngle = .degrees(360 * upperProgress)
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
            lowerProgress = lowerValue / (range.upperBound - range.lowerBound)
            lowerAngle = .degrees(360 * lowerProgress)
            
            upperProgress = upperValue / (range.upperBound - range.lowerBound)
            upperAngle = .degrees(360 * upperProgress)
        }
        .onChange(of: lowerProgress) {
            let newValue = ((range.upperBound - range.lowerBound) * lowerProgress)
            lowerValue = (newValue / step).rounded() * step
        }
        .onChange(of: upperProgress) { _, newValue in
            let newValue = ((range.upperBound - range.lowerBound) * upperProgress)
            upperValue = (newValue / step).rounded() * step
        }
    }
}

extension RangeCircularSlider {
    private func changeLowerAngle(location: CGPoint) -> Angle {
        let vector = CGVector(dx: location.x, dy: -location.y)
        let angleRadians = atan2(vector.dx, vector.dy)
        var positiveAngle = angleRadians < 0.0 ? angleRadians + (2.0 * .pi) : angleRadians
        let newLowerProgress = positiveAngle / (2.0 * .pi)

        lowerProgress = max(
            0,
            min(
                newLowerProgress,
                upperProgress
            )
        )
        
        if lowerProgress != newLowerProgress {
            positiveAngle = lowerProgress * 2.0 * .pi
        }
        
        return Angle(radians: positiveAngle)
    }
    
    private func changeUpperAngle(location: CGPoint) -> Angle {
        let vector = CGVector(dx: location.x, dy: -location.y)
        let angleRadians = atan2(vector.dx, vector.dy)
        var positiveAngle = angleRadians < 0.0 ? angleRadians + (2.0 * .pi) : angleRadians
        let newUpperProgress = positiveAngle / (2.0 * .pi)
        
        upperProgress = max(
            lowerProgress,
            min(
                newUpperProgress,
                1
            )
        )
        
        if upperProgress != newUpperProgress {
            positiveAngle = upperProgress * 2.0 * .pi
        }
        
        return Angle(radians: positiveAngle)
    }
}

extension RangeCircularSlider {
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
        let foregroundColor: Color =  .indigo
        
        let thumbSize: CGSize = .init(width: 20, height: 20)
        let thumbView: AnyView = AnyView(StrokeThumb())
    }
}

#Preview {
    @Previewable @State var lowerValue: Double = 1
    @Previewable @State var upperValue: Double = 3
    
    Text("\(lowerValue) - \(upperValue)")
    
    RangeCircularSlider(
        lowerValue: $lowerValue,
        upperValue: $upperValue,
        in: 0...10,
        step: 1
    )
//    .background(.red)
    .padding()
}
