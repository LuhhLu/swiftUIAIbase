 

import SwiftUI

struct CheckMarkAnimation: View {
    @State var drawCheck: CGFloat = 0
    @State var drawCircle: CGFloat = 0
    let markScale: CGFloat = 0.7
    var body: some View {
        ZStack{
            Group{
                Path{ path in
                    path.move(to: CGPoint(x: 70 * markScale, y: 60 * markScale))
                    path.addLine(to: CGPoint(x: 108 * markScale, y: 100 * markScale))
                    path.move(to: CGPoint(x: 108 * markScale, y: 100 * markScale))
                    path.addLine(to: CGPoint(x: 155 * markScale, y: 10 * markScale))
                }
                .trim(from: 0, to: drawCheck)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
            }
            .offset(x: -27, y: 4.5)
            Circle().trim(from: 0, to: drawCircle)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(-50))
          
            Button(action: {
                drawCheck = 0
                drawCircle = 0
                withAnimation(.easeInOut(duration: 0.7)) {
                    drawCheck = 1
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    withAnimation(.easeInOut(duration: 0.7)) {
                        drawCircle = 0.93
                    }
                }
            }, label: {
                Text("Done")
            })
            .offset(y: 100)
            
        }
        .foregroundStyle(.green)
        .frame(width: 100, height: 100)
    }
}

#Preview {
    CheckMarkAnimation()
}
