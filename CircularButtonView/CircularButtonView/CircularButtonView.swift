import SwiftUI

import Foundation
struct CircularLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
          let radius = bounds.width / 3.0
          let angleIncrement = 2 * .pi / Double(subviews.count)

          subviews.enumerated().forEach { index, subview in
              let angle = angleIncrement * Double(index)
              let point = CGPoint(x: bounds.midX + radius * cos(angle),
                                  y: bounds.midY + radius * sin(angle))
              subview.place(at: point, anchor: .center, proposal: .unspecified)
          }
      }
}


struct CircularLayoutView: View {
    let text = "CIRCULAR BUTTON "
    @State var degrees:CGFloat = 0
    var body: some View {
            ZStack{
                Circle().stroke(lineWidth: 40)
                    .frame(width: 130, height: 130).foregroundStyle(.indigo)
                
                CircularLayout {
                    ForEach(0..<text.count, id: \.self) { index in
                        let letter = String(text[text.index(text.startIndex, offsetBy: index)])
                        Text(letter)
                            .font(.system(size: 16).bold()).foregroundStyle(.white)
                    }
                    
                    .rotationEffect(.degrees(-degrees))
                    
                }
                
                .frame(width: 200, height: 100)
                .rotationEffect(.degrees(degrees))
                
                Image(systemName: "arrow.up.right")
                              .resizable().scaledToFit()
                              .frame(width: 30, height: 30)
            }
            .onAppear(){
                withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                    degrees += 360
                }
            }
    }
}
#Preview {
    CircularLayoutView()
            
}
