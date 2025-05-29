 
import SwiftUI

struct ShipmentTimelineView: View {
    let steps: [Model] = [
        .init(title: "Placed"),
        .init(title: "Shipped"),
        .init(title: "On Its Way"),
        .init(title: "Delivered"),
    ]
    
    @State private var currentStep: Model
    
    enum Constant {
        static let highlightColor: Color = .red
        static let dimmedColor: Color = .red.mix(with: .gray, by: 0.5).opacity(0.4)
    }
    
    init() {
        _currentStep = State(initialValue: steps[0])
    }
    
    var body: some View {
        VStack(spacing: 12) {
  
            HStack{
                ForEach(steps) { step in
                    Text(step.title)
                        .font(.caption)
                        .fontWeight(index(of: step) <= index(of: currentStep) ? .bold : .medium)
                        .opacity(index(of: step) <= index(of: currentStep) ? 1 : 0.4)
                    if step != steps.last{
                        Spacer()
                    }
                    
                }
            }
            TimelineView(steps, selection: $currentStep) { step in
                ZStack{
                    if step == currentStep{
                        Image(systemName: "truck.box.fill")
                            .foregroundStyle(.adaptiveWhite)
                        Image(systemName: "truck.box")
                            .foregroundStyle(.adaptiveBlack)
                    }
                }
                .bold()
                .zIndex(1)
            } line: { step, _ in
                UnevenRoundedRectangle(
                    cornerRadii: .init(
                        topLeading: step == steps.first ? 4 : 0,
                        bottomLeading: step == steps.first ? 4 : 0,
                        bottomTrailing: step == steps[steps.count-2] ? 4 : 0,
                        topTrailing: step == steps[steps.count-2] ? 4 : 0
                    )
                )
                .frame(height: 6)
                .foregroundStyle(
                    index(of: step) < index(of: currentStep) ? Constant.highlightColor : Constant.dimmedColor
                )
            }

            
            
            
            Button(action: next) {
                Text("Next Step")
                    .frame(maxWidth: .infinity)
                    .fontWeight(.medium)
            }
            .foregroundStyle(.adaptiveWhite)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Constant.highlightColor)
            }
            .padding(.top, 20)
        }
        .padding(.horizontal)
    }
}

extension ShipmentTimelineView {
    struct Model: Steps {
        var id: String { title }
        
        let title: String
    }
}

extension ShipmentTimelineView {
    func index(of model: Model) -> Int {
        steps.firstIndex(of: model)!
    }
    
    func next() {
        let index = index(of: currentStep)
        guard index + 1 < steps.count else {
            currentStep = steps[0]
            return
        }
        currentStep = steps[index + 1]
    }
}

#Preview {
    ShipmentTimelineView()
}
