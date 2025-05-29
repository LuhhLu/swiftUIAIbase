import SwiftUI

struct CountdownTimer: View {
    @State  var timeRemaining: Int = 60
    @State  var progress: CGFloat = 1.0
    @State  var isRunning: Bool = false
    @State  var selectedTime: Int = 60
    @State  var timer: Timer?

    var body: some View {
        VStack(spacing: 40) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .foregroundStyle(.gray.opacity(0.3))

                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .foregroundStyle(.blue)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: progress)

                Text("\(timeString(from: timeRemaining))")
                    .font(.largeTitle)
                    .bold()
            }//ZStack
            .frame(width: 200, height: 200)

            HStack(spacing: 15) {
                TButton(title: "1 Min") { setTimer(minutes: 1) }
                TButton(title: "5 Min") { setTimer(minutes: 5) }
                TButton(title: "15 Min") { setTimer(minutes: 15) }
                TButton(title: "25 Min") { setTimer(minutes: 25) }
            }//HStack

            Button(action: resetTimer) {
                Text(isRunning ? "Reset" : "Start").padding()
                    .frame(maxWidth: .infinity)
                    .background(isRunning ? .red : .blue,in:.rect(cornerRadius: 12))
                    .foregroundStyle(.white)
                     
            }
            
            Spacer()
        }//Vstack
        .padding()
        .onDisappear {
            timer?.invalidate()
        }
    }

    // Helper to format time as MM:SS
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // Set Timer Duration
    private func setTimer(minutes: Int) {
        timer?.invalidate() // Stop any running timer
        timeRemaining = minutes * 60
        selectedTime = timeRemaining
        progress = 1.0
        isRunning = true
        startCountdown()
    }

    // Reset Timer
    private func resetTimer() {
        timer?.invalidate() // Stop any running timer
        if isRunning {
            timeRemaining = selectedTime
            progress = 1.0
            isRunning = false
        } else {
            startCountdown()
        }
    }

    // Start Countdown
    private func startCountdown() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
                progress = CGFloat(timeRemaining) / CGFloat(selectedTime)
            } else {
                timer.invalidate()
                isRunning = false
            }
        }
    }
}

#Preview {
    CountdownTimer()
}
struct TButton: View {
    var title:String
    var action:() -> Void
    var body: some View {
        
        Button {
            action()
        } label: {
            Text(title)
                .frame(width: 70, height: 70)
                .background(.gray.opacity(0.3),in:.rect(cornerRadius: 8))
                
        }
        .tint(.primary)
        .frame(maxWidth: .infinity)
    }
}

 
