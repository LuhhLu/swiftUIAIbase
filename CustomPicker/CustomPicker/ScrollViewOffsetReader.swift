 

import SwiftUI
import Combine

struct ScrollViewOffsetReader: View {
    private let onScrollingStarted: () -> Void
    private let onScrollingFinished: () -> Void
    private let detector: CurrentValueSubject<CGFloat, Never>
    private let publisher: AnyPublisher<CGFloat, Never>
    @State private var scrolling: Bool = false
    
    @State private var lastValue: CGFloat = 0
    
    init() {
        self.init(onScrollingStarted: {}, onScrollingFinished: {})
    }
    
    init(
        onScrollingStarted: @escaping () -> Void,
        onScrollingFinished: @escaping () -> Void
    ) {
        self.onScrollingStarted = onScrollingStarted
        self.onScrollingFinished = onScrollingFinished
        let detector = CurrentValueSubject<CGFloat, Never>(0)
        self.publisher = detector
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
        self.detector = detector
    }
    
    var body: some View {
        GeometryReader { g in
            Rectangle()
                .frame(width: 0, height: 0)
                .onChange(of: g.frame(in: .global).origin.x) { oldValue, newValue in
                    if !scrolling {
                        scrolling = true
                        onScrollingStarted()
                    }
                    detector.send(newValue)
                }
                .onReceive(publisher) {
                    scrolling = false
                    
                    guard lastValue != $0 else { return }
                    lastValue = $0
                    
                    onScrollingFinished()
                }
        }
    }
    
    func onScrollingStarted(_ closure: @escaping () -> Void) -> Self {
        .init(
            onScrollingStarted: closure,
            onScrollingFinished: onScrollingFinished
        )
    }
    
    func onScrollingFinished(_ closure: @escaping () -> Void) -> Self {
        .init(
            onScrollingStarted: onScrollingStarted,
            onScrollingFinished: closure
        )
    }
}
