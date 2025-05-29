import SwiftUI

struct FocusTimerView: View {
    @State private var timeElapsed: Int = 0
    @State private var timerActive: Bool = false
    @State private var timer: Timer? = nil
    @AppStorage("lastExitTime") private var lastExitTime: Double = 0.0
    @AppStorage("timerActive") private var storedTimerActive: Bool = false
    @AppStorage("timeElapsed") private var storedTimeElapsed: Int = 0
    @Environment(\.scenePhase) private var scenePhase
    @State private var milliseconds: Int = 0
    @State private var showColon: Bool = true
    @State private var colonTimer: Timer? = nil
    
    var body: some View {
        VStack(spacing:20){
            HStack(alignment: .bottom, spacing: 0) {
                TimeSegmentView(value: hours)
                    .frame(width: 180,alignment: .leading)
                
                Text(":")
                TimeSegmentView(value: minutes)
                    .frame(width: 180,alignment: .leading)
                Group{
                    Text(":")
                        .opacity(showColon ? 1 : 0)
                        .frame(width: 70,alignment: .leading)
                    TimeSegmentView(value: seconds)
                        .frame(width: 150,alignment: .leading)
                        .offset(x: -20)
                }
                .font(.system(size: 90, weight: .medium, design: .monospaced))
                .offset(y: -10)
              
                   
            }
            .font(.system(size: 150, weight: .medium, design: .monospaced))
            .frame(maxWidth: .infinity)
            
            DigitalClockView()
                .padding(.horizontal,70)
                .offset(x: -20)
                
        }
        .overlay(alignment: .topTrailing, content: {
            HStack(spacing:20){
                Button {
                    if timerActive{
                        pauseTimer()
                    }else{
                        startTimer()
                    }
                } label: {
                    Image(systemName: timerActive ? "pause.circle" : "play.circle")
                        .font(.system(size: 40))
                }
                .tint(.primary)
                Button {
                    resetTimer()
                } label: {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .font(.system(size: 40))
                }
                .tint(.primary)
                


            }
        })
        
        
        .onAppear {
            UIDevice.current.isBatteryMonitoringEnabled = true
            timeElapsed = storedTimeElapsed
            timerActive = storedTimerActive
            recoverTimer()
        }

        .onDisappear {
            saveTimerState()
        }
        .onChange(of: scenePhase) { old, newPhase in
            if newPhase == .background {
                saveTimerState()
            } else if newPhase == .active {
                recoverTimer()
            }
        }

        
    }
    
    
    var hours: String {
        String(format: "%02d", timeElapsed / 3600)
    }
    var minutes: String {
        String(format: "%02d", (timeElapsed % 3600) / 60)
    }
    var seconds: String {
        String(format: "%02d", timeElapsed % 60)
    }
    var formattedMilliseconds: String {
        String(format: "%02d", milliseconds)
    }
    
    
    func startColonBlinking() {
        colonTimer?.invalidate()
        colonTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            showColon.toggle()
        }
    }
    func stopColonBlinking() {
        colonTimer?.invalidate()
        colonTimer = nil
        showColon = true
    }
    
    
    func startTimer() {
        timerActive = true
        storedTimerActive = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            milliseconds += 1
            if milliseconds == 100 {
                milliseconds = 0
                timeElapsed += 1
                storedTimeElapsed = timeElapsed
            }
        }
        startColonBlinking()
    }


    func resetTimer() {
        timerActive = false
        timer?.invalidate()
        timeElapsed = 0
        milliseconds = 0
        stopColonBlinking()

        // Clear stored values
        storedTimerActive = false
        storedTimeElapsed = 0
    }


    func pauseTimer() {
        timerActive = false
        timer?.invalidate()
        stopColonBlinking()
    }
    
    func saveTimerState() {
        if timerActive {
            lastExitTime = Date().timeIntervalSince1970 // Save the current timestamp
        }
        storedTimerActive = timerActive
        storedTimeElapsed = timeElapsed
    }

    func recoverTimer() {
        let currentTime = Date().timeIntervalSince1970
        if storedTimerActive {
            let elapsedTimeSinceLastExit = Int(currentTime - lastExitTime)
            timeElapsed = storedTimeElapsed + elapsedTimeSinceLastExit
            startTimer()
        } else {
            timeElapsed = storedTimeElapsed
        }
    }


    
}

#Preview {
    FocusTimerView()
}



struct TimeSegmentView: View {
    let value: String
    var body: some View {
        HStack(spacing:0){
            Text(String(value.first ??  "0"))
                .foregroundStyle(value.first == "0" ? .gray : .primary)
            Text(String(value.last ??  "0"))
                .foregroundStyle(value == "00" ? .gray : .primary)
        }
      
    }
}










 
