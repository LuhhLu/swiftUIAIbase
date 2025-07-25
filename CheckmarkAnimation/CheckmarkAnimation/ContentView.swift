 
import SwiftUI

struct ContentView: View {
    @State private var drawPercentage1: CGFloat = 0
    @State private var drawPercentage2: CGFloat = 0
    @State private var drawCircle: CGFloat = 0
    var LineWidth: CGFloat = 8
    let markScale: CGFloat = 0.7
    var body: some View {
        ZStack{
            Group{
                Path{ path in
                    path.move(to: CGPoint(x: 70 * markScale, y: 60 * markScale))
                    path.addLine(to: CGPoint(x: 108 * markScale, y: 100 * markScale))
                    
                }
                .trim(from: 0, to: drawPercentage1)
                .stroke(style: StrokeStyle(lineWidth: LineWidth, lineCap: .round, lineJoin: .round))
                
                Path{ path in
                    path.move(to: CGPoint(x: 108 * markScale, y: 100 * markScale))
                    path.addLine(to: CGPoint(x: 155 * markScale, y: 10 * markScale))
                    
                }
                .trim(from: 0, to: drawPercentage2)
                .stroke(style: StrokeStyle(lineWidth: LineWidth, lineCap: .round, lineJoin: .round))
                
            }
            .offset(x: -40 * markScale, y: 5 * markScale)
            Circle().trim(from: 0, to: drawCircle)
                .stroke(style: StrokeStyle(lineWidth: LineWidth, lineCap: .round, lineJoin: .round))
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(-50))
                
            
        }
        .foregroundStyle(.green)
        .frame(width: 50 * markScale, height: 100 * markScale)
        Button(action: {
            drawPercentage1 = 0
            drawPercentage2 = 0
            drawCircle = 0
            withAnimation(.easeInOut(duration: 1)) {
                drawPercentage1 = 1.0
            }
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeInOut(duration: 1)) {
                    drawPercentage2 = 1.0
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut(duration: 1)) {
                    drawCircle = 0.93
                }
            }
        }, label: {
            Text("Done")
        })
        .offset(y: 100)
         
    }
}

#Preview {
    ContentView()
}
