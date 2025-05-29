 
import SwiftUI
public enum SegmentStyle {
    case styleOne
    case styleTwo
}

public struct CustomPickerView: View {
    var segmentWidth: CGFloat = 1.0
    @Binding var count: Int
    var values: ClosedRange<Int>
    var spacing: Double
    var steps: Int
    @State var isScrolling: Bool = false
    var style: SegmentStyle
    
    public init(count: Binding<Int>, from: Int, to: Int, spacing: Double = 8.0, steps: Int, style: SegmentStyle) {
        _count = count
        self.values = from...(style == .styleTwo ? (to * steps) : to)
        self.spacing = spacing
        self.steps = steps
        self.style = style
    }
    public var body: some View {
        ZStack {
            GeometryReader { geo in
                ScrollViewReader(content: { proxy in
                    ScrollView(.horizontal) {
                        ZStack {
                            ScrollViewOffsetReader(onScrollingStarted: {
                                isScrolling = true
                            }, onScrollingFinished: {
                                isScrolling = false
                            })
                            HStack(spacing: spacing) {
                                SegmentView(values: values, steps: steps, segmentWidth: segmentWidth, style: style)
                            }
                            .frame(height: geo.size.height)
                            .scrollTargetLayout()
                        }
                    }
                    .overlay(alignment: .center) {
                        Rectangle()
                            .fill(.red)
                            .frame(width: 3, height: 40)
                            .padding(.bottom, 20)
                    }
                    .scrollIndicators(.hidden)
                    .safeAreaPadding(.horizontal, geo.size.width / 2.0)
                    .scrollTargetBehavior(.viewAligned)
                    .scrollPosition(
                        id: .init(
                            get: {
                                return count
                            },
                            set: { value, transaction in
                                if let value {
                                    count = value
                                }
                            }
                        )
                    )
                    .onChange(of: isScrolling, { oldValue, newValue in
                        if newValue == false && style == .styleTwo {
                            let indexValue: Double = Double(count) / Double(steps)
                            let nextItem = indexValue.rounded()
                            let newIndex = nextItem * Double(steps)
                            withAnimation{
                                if count != Int(newIndex) {
                                    count = Int(newIndex)
                                   
                                }
                            }
                        }
                    })
                    .onChange(of: count) {old, newValue in
                              // Trigger haptic feedback on count change
                              let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                              impactFeedback.impactOccurred()
                          }
                })
            }
        }
        .frame(height: 100)
    }
}

//#Preview {
//    CustomPickerView()
//}
