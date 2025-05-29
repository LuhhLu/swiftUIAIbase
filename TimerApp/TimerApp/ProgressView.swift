 

import SwiftUI

struct ProgressView: View {

    var title: String = ""
    var duration: TimeInterval
    var remainingTime: TimeInterval = 0
    @State private var isPaused: Bool = false
    @Binding var showTimerDetail: Bool
    
    var body: some View {
        VStack{
            CircularProgressView(remainingTime: remainingTime, isPaused: $isPaused, duration: duration, progressColor: .orange) {
                showTimerDetail = false
            }
            HStack{
                CustomButtonView(text: "cancel", color: .gray ) {
                    cancelTimerRunning()
                }
                Spacer()
                CustomButtonView(text: isPaused ? "Resume" : "Pause", color: isPaused ? .green : .orange) {
                    isPaused.toggle()
                }
            }
           
        }
        .padding(16)
    }
    func cancelTimerRunning() {
        showTimerDetail = false
        isPaused = true
        TimeManager.shared.clearUserData()
    }
    
}

#Preview {
    ProgressView( duration: 1, showTimerDetail: .constant(false))
}
