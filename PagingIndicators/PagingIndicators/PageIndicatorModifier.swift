

import SwiftUI
enum ScrollOrientation {
    case horizontal
    case vertical
}
struct PageIndicatorModifier: ViewModifier {
    var orientation: ScrollOrientation
    @Binding var currentCircleNumber: Int
    @Binding var nextCircleNumber: Int
    @Binding var currentCircleWidth: CGFloat
    @Binding var nextCircleWidth: CGFloat
    @Binding var index: Int
    @Binding var currentIndex:Int
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geo -> Color in
                    DispatchQueue.main.async {
                        let scrollViewWidth = orientation == .horizontal ? geo.size.width : geo.size.height
                        let minY = orientation == .horizontal ? geo.frame(in: .global).minX : geo.frame(in: .global).minY
                        let progress = abs(minY) / scrollViewWidth
                        let currentCircleNumber = Int(progress)
                        let nextCircleNumber = Int(progress + 1)
                        let indicatorProgress = progress - CGFloat(currentCircleNumber)
                        let currentCircleWidth = 18 - (indicatorProgress * 18)
                        let nextCircleWidth = indicatorProgress * 18
                        if abs(minY) < 100 {
                            currentIndex = index
                        }
                        self.currentCircleNumber = currentCircleNumber
                        self.nextCircleNumber = nextCircleNumber
                        self.currentCircleWidth = currentCircleWidth
                        self.nextCircleWidth = nextCircleWidth
                    }
                    return Color.clear
                }
            )
    }
}
extension View {
    func pageIndicator(orientation: ScrollOrientation,currentCircleNumber: Binding<Int>, nextCircleNumber: Binding<Int>, currentCircleWidth: Binding<CGFloat>, nextCircleWidth: Binding<CGFloat> , index: Binding<Int> , currentIndex: Binding<Int>) -> some View {
        self.modifier(PageIndicatorModifier(orientation: orientation,currentCircleNumber: currentCircleNumber, nextCircleNumber: nextCircleNumber, currentCircleWidth: currentCircleWidth, nextCircleWidth: nextCircleWidth, index: index, currentIndex: currentIndex))
    }
}
