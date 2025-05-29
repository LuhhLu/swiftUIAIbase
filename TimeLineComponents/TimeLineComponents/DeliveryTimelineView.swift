 

import SwiftUI

struct DeliveryTimelineView: View {
    let steps: [Model] = [
        .init(title: "Preparation", icon: "mustache.fill", initialDuration: 5),
        .init(title: "Packing", icon: "carrot.fill", initialDuration: 5),
        .init(title: "Delivering", icon: "figure.outdoor.cycle", initialDuration: 20),
        .init(title: "Bon appétit!", icon: "house.fill", initialDuration: 2)
    ]
    
    @State private var currentStep: Model
    @State private var progress: CGFloat = 0
    @State private var duration: TimeInterval = .zero
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    enum Constant {
        static let highlightColor: Color = .green
        static let dimmedColor: Color = .gray.opacity(0.3)
        
        static let lineHighlightColor: Color = .green
        static let lineDimmedColor: Color = .gray.opacity(0.3)
        
        static let iconHighlightColor: Color = .adaptiveWhite
        static let iconDimmedColor: Color = .adaptiveBlack
    }
    
    init() {
        _currentStep = State(initialValue: steps[0])
    }
    
    var body: some View {
        VStack(spacing: 28) {
            
            
            Text("Your Carrot is on its way with the delivery service!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .fontWeight(.medium)
            
            TimelineView(steps, selection: $currentStep, progress: $progress) { step in
                let isHighlighted =  index(of: step) <= index(of: currentStep)
                
                Circle()
                    .foregroundStyle(isHighlighted ? Constant.highlightColor : Constant.dimmedColor)
                    .frame(width: 36, height: 36)
                    .overlay {
                        Image(systemName: step.icon)
                            .foregroundStyle(isHighlighted ? Constant.iconHighlightColor : Constant.iconDimmedColor)
                    }
                
            } line: { step, progress in
                let isHighlighted =  index(of: step) < index(of: currentStep)
                Rectangle()
                    .frame(height: 4)
                    .foregroundStyle(isHighlighted ? Constant.lineHighlightColor : Constant.lineDimmedColor)
                    .animation(nil, value: isHighlighted)
                    .overlay(alignment: .leading) {
                        GeometryReader { proxy in
                            Rectangle()
                                .fill(Constant.lineHighlightColor)
                                .frame(width: proxy.size.width * (progress ?? (isHighlighted ? 1 : 0)))
                        }
                    }
                
            }

            HStack( spacing: .zero) {
                Circle()
                    .foregroundStyle(Constant.highlightColor)
                    .frame(width: 12, height: 12)
                    .padding(.trailing,8)
                Text(currentStep.title + ": ")
                    .contentTransition(.numericText())
                
                let min = Int(currentStep.initialDuration - duration)
                Text("00:\(min >= 10 ? "\(min)" : "0\(min)")")
                    .bold()
                    .frame(width: 55,alignment: .trailing)
                Text(" minutes")
                    .bold()
                Spacer()
            }
            
            
        }
        .padding(.horizontal)
        .onReceive(timer) { _ in
            timerTick()
        }
    }
}

extension DeliveryTimelineView {
    func index(of model: Model) -> Int {
        steps.firstIndex(of: model)!
    }
    
    func next() {
        duration = .zero
        progress = .zero
        
        let index = index(of: currentStep)
        guard index + 1 < steps.count else {
            currentStep = steps[0]
            return
        }

        withAnimation {
            currentStep = steps[index + 1]
        }
    }
    
    func timerTick() {
        duration += 1
        withAnimation(.linear(duration: 1)) {
            progress = duration/currentStep.initialDuration
        }
        
        guard duration > currentStep.initialDuration else { return }
        next()
    }
}

extension DeliveryTimelineView {
    struct Model: Steps {
        var id: String { title }
        
        let title: String
        let icon: String
        let initialDuration: TimeInterval
    }
}

#Preview {
    DeliveryTimelineView()
}
