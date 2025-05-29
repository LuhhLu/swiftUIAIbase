 

import SwiftUI

struct TimelineView<Model, Step, Line> : View where Model: Steps, Step: View, Line: View {
    let axis: Axis.Set
    let steps: [Model]
    
    let step: (Model) -> Step
    let line: (Model, CGFloat?) -> Line
    
    @Binding var selection: Model
    @Binding var progress: CGFloat
    
    init(
        _ steps: [Model],
        axis: Axis.Set = .horizontal,
        selection: Binding<Model>,
        progress: Binding<CGFloat>? = nil,
        @ViewBuilder step: @escaping (Model) -> Step,
        @ViewBuilder line: @escaping (Model, CGFloat?) -> Line
    ) {
        self.axis = axis
        self.step = step
        self.line = line
        self.steps = steps
        
        _selection = selection
        _progress = progress == nil ? .constant(1) : progress!
    }
    
    var body: some View {
        switch axis {
        case .vertical:
            VStack(spacing: .zero) { content }
        default:
            HStack(spacing: .zero) { content }
        }
    }
    
    @ViewBuilder
    var content: some View {
        let array = Array(steps)
        ForEach(array) { item in
            step(item)
            if item != array.last {
                line(item, item == selection ? (progress < 1 ? progress : 1) : nil)
            }
        }
    }
}
