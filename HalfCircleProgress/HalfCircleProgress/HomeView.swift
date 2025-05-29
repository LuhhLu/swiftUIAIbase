 

import SwiftUI

struct HomeView: View {
    @State var progress: CGFloat = 0
    @State var displayedProgress: CGFloat = 0
    var body: some View {
        VStack(spacing:130){
            HalfCircleProgressView(progress: progress, totalSteps: 500, minValue: 0, maxValue: 500)
            
            
            indicatorProgressView(progress: progress, totalSteps: 500, minValue: 0, maxValue: 500)
            Button {
                let newProgress = CGFloat.random(in: 0..<500)
                withAnimation {
                    startIncrementing(to: newProgress)
                }
            } label: {
                Text("Randomize Progress")
            }
            .offset(y: -30)
        }
        .offset(y: 60)
    }
        
    func startIncrementing(to targetValue: CGFloat) {
       let step: CGFloat = targetValue > displayedProgress ? 1 : -1
       Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true) { timer in
           if (step > 0 && displayedProgress < targetValue) || (step < 0 && displayedProgress > targetValue) {
               displayedProgress += step
               progress = displayedProgress
           } else {
               timer.invalidate()
               displayedProgress = targetValue
               progress = displayedProgress
           }
       }
   }
}

#Preview {
    HomeView()
}
