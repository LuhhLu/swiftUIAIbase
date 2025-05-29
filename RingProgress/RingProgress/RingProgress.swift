

import SwiftUI

struct RingProgress: View {
    @State var degrees:Double = 0
    @State var progress:CGFloat = 0
    @State var numProgress = 0
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 15)
                .frame(width: 150, height: 150)
                .foregroundStyle(.gray.opacity(0.3))
            
            Circle() .trim(from: 0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round))
                .frame(width: 150, height: 150)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.cyan,.blue]), startPoint: .top, endPoint: .bottom))
                .rotationEffect(.degrees(-90))
                .rotationEffect(.degrees(degrees))
            
            HStack(alignment:.bottom,spacing:0){
                Text("\(numProgress)").font(.largeTitle)
                Text("%").padding(.bottom,5)
            }.bold()
        }
        .onTapGesture {
            withAnimation(.easeOut(duration: 3)) {
                progress = 1
                degrees += 360
            }
            Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
                if numProgress < 100 {
                    numProgress += 1
                } else {
                    timer.invalidate()
                }
            }
        }
    }
}

#Preview {
    RingProgress()
}
