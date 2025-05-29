//


import SwiftUI

struct totalView: View {
   @State private var currentTotal = 0
   let targetTotal = 133464
   let duration = 1.0 // duration for the count in seconds
   let updateInterval = 0.01 // how often to update the count
   var timer: Timer {
       Timer.scheduledTimer(withTimeInterval: self.updateInterval, repeats: true) { timer in
           let increment = Int(Double(self.targetTotal) * self.updateInterval / self.duration)
           if self.currentTotal < self.targetTotal - increment {
               self.currentTotal += increment
           } else {
               self.currentTotal = self.targetTotal
               timer.invalidate()
           }
       }
   }

   var body: some View {
       Text("$\(currentTotal)").bold().font(.system(size: 60))
           .onAppear {
               let _ = self.timer
           }
   }
}

struct totalView_Previews: PreviewProvider {
   static var previews: some View {
       totalView()
   }
}
