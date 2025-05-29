 

import SwiftUI

struct InvestmentTimelineView: View {
    let steps: [Model] = [
        .init(title: "Transaction Initiated", description: "You've started a transaction to send 10 USDC. This process may take a few seconds depending on network congestion.You've started a transaction to send 10 USDC. This process may take a few seconds depending on network congestion."),
        .init(title: "Payment Authorized", description: "Your wallet has successfully authorized the transaction. The funds are now pending on the blockchain."),
        .init(title: "Awaiting Confirmation", description: "Your transaction is being processed by the network. It will be confirmed once it's included in a block."),
        .init(title: "Transaction Complete", description: "Your USDC has been successfully transferred. You can view the transaction on the blockchain explorer.")
    ]

    
    let noneStep: Model = .init(title: "", description: "")
    
    @State private var currentStep: Model
    
    init() {
        _currentStep = State(initialValue: noneStep)
    }
    
    var body: some View {
        VStack {
            ForEach(steps) { step in
                VStack{
                    HStack(spacing: 16){
                        let (icon, color) = if index(of: step) <= index(of: currentStep){
                            ("checkmark", Color.green)
                        }else if step == steps [index(of: currentStep) + 1 ]{
                            ("checkmark", Color.green)
                        }else{
                            ("timer", Color.gray)
                        }
                        Image(systemName: icon)
                            .foregroundStyle(color)
                            .frame(width: 20, height: 20)
                        Text(step.title)
                            .bold()
                            .frame(maxWidth: .infinity,alignment:.leading)
                    }
                    HStack{
                        DescriptionView(step.description, isLineVisible: step != steps.last)
                    }
               
                    
                }
            }
        }
        .padding(.all, 20)
        
        Button(action: next) {
            Text("Next")
        }
    }
}

struct DescriptionView: View {
    let title: String
    let isLineVisible: Bool
    
    @State private var height: CGFloat = 0
    
    init(_ title: String, isLineVisible: Bool) {
        self.title = title
        self.isLineVisible = isLineVisible
    }
    
    var body: some View {
        HStack {
            Path { path in
                path.move(to: CGPoint(x: 20/2, y: 0))
                path.addLine(to: CGPoint(x: 20/2, y: height))
            }
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [2, 8]))
            .foregroundColor(isLineVisible ? .secondary : .clear)
            .frame(width: 26, height: height)
            
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onGeometryChange(for: CGFloat.self, of: { $0.size.height }) { newValue in
                    height = newValue
                }
                .padding(.bottom)
        }
    }
}

extension InvestmentTimelineView {
    func index(of model: Model) -> Int {
        steps.firstIndex(of: model) ?? -1
    }
}

extension InvestmentTimelineView {
    struct Model: Steps {
        var id: String { title }
        
        let title: String
        let description: String
    }
    
    func next() {
        let index = index(of: currentStep)
        guard index + 1 < steps.count else {
            currentStep = noneStep
            return
        }
        currentStep = steps[index + 1]
    }
}

#Preview {
    InvestmentTimelineView()
}
