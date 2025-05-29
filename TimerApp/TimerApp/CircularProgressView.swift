 

import SwiftUI

var viewW =  UIScreen.main.bounds.width

struct CircularProgressView: View {
    @Environment(\.scenePhase) private var scenePhase
    var width = viewW * 0.7
    @State var remainingTime: TimeInterval = 0
    @Binding var isPaused: Bool
    @State private var progress: Double = 1.0
    @State var duration: TimeInterval
    @State var timer: Timer?
    var lineWidth: CGFloat = 8.0
    var backgroundColor: Color = Color.gray.opacity(0.3)
    var progressColor: Color
    var onfinishRunningTimer: () -> ()
    
    private var endDate: Date {
        Calendar.current.date(byAdding: .second, value: Int(duration), to: Date())!
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    backgroundColor,
                    style: StrokeStyle(lineWidth: lineWidth)
                )
                .frame(width: width, height: width, alignment: .center)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(progress))
                .stroke(
                    progressColor,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round)
                )
                .rotationEffect(Angle(degrees: -90))
                .frame(width: width, height: width, alignment: .center)
                .animation(.easeInOut(duration: 0.1), value: progress)
            
            RemainingTimeView(remainingTime: Int(progress * duration).remainingTimeText, endDate: endDate.endDateText)
            
        }
        .frame(width: width , height: width, alignment: .center)
        .onAppear {
            startTimer()
        }
        .onDisappear{
            stopTimer()
        }
        .onChange(of: isPaused, { oldValue, newValue in
            
            if newValue {
                stopTimer()
            } else {
                startTimer()
            }
        })
        .onChange(of: scenePhase, { oldValue, newValue in
            withAnimation {
                if newValue == .background {
                    updateSavedData()
                    stopTimer()
                } else if newValue == .active {
                    updateTimerData()
                    startTimer()
                }
            }
         
        })
    }
    
      func updateTimerData() {
        remainingTime = TimeManager.shared.getRemainingTime()
        duration = TimeManager.shared.duration
        progress = remainingTime / duration
    }
    
      func updateSavedData() {
        TimeManager.shared.remainingTime = remainingTime
        TimeManager.shared.duration = duration
        TimeManager.shared.savedDate = Date()
    }
    
      func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
      func startTimer() {
        stopTimer()
        remainingTime = remainingTime  ==  0 ? duration : remainingTime
        if !isPaused {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                if remainingTime > 0 {
                    remainingTime -= 0.1
                    progress = remainingTime / duration
                    updateSavedData()
                } else {
                    stopTimer()
                    TimeManager.shared.clearUserData()
                    onfinishRunningTimer()
                }
            }
        }
    }
    
}

