//
//




import SwiftUI

struct HoldToComplete: View {
    // A special property wrapper used to track the gesture's temporary state.
    // SwiftUI automatically sets this to `true` while the user is pressing,
    // and resets it to `false` when the user lifts their finger.
    @GestureState var isPressing = false

    // This holds the current progress value from 0.0 to 100.0.
    // It's used to control the visual progress indicator in the UI.
    @State var progress: CGFloat = 0.0

    // A Timer instance that updates progress continuously.
    // We use it to increment or decrement the progress smoothly over time.
    @State var timer: Timer? = nil

    // This flag tells us whether the progress has reached 100%.
    // If true, we show a checkmark and stop any further progress changes.
    @State var isCompleted = false

    var body: some View {
        ZStack {
            
            Circle().padding(5)
                .foregroundStyle(.gray.opacity(0.3))
                .scaleEffect(isPressing ? 0.9 : 1)
            
            Circle().stroke(Color.gray.opacity(0.2), lineWidth: 10)

            Circle().trim(from: 0, to: progress / 100)
                .stroke(isCompleted ? .green : Color.primary, style: StrokeStyle(lineWidth: 10, lineCap: .round))
            
                .rotationEffect(.degrees(-90))

            Text("\(Int(progress))%")
                .font(.system(size: 25).bold())
                .scaleEffect(isPressing ? 0.9 : 1)
            
        }
        .frame(width: 100, height: 100)
        
        // Add a gesture to the view
        .gesture(
            // Use DragGesture with no movement required (so just touching counts)
            DragGesture(minimumDistance: 0)
                // `.updating` is used to update our `@GestureState` variable `isPressing`
                // This closure runs as long as the finger is touching the screen
                .updating($isPressing) { _, state, _ in
                    // Set the gesture state to `true` to indicate the user is pressing
                    // SwiftUI will automatically reset it to `false` when the finger lifts
                    state = true
                }
        )

        // Use `.onChange` to respond to changes in the `isPressing` value
        .onChange(of: isPressing) { old, newValue in
            // When the user starts pressing (isPressing becomes true)
            if newValue {
                // Start increasing the progress using the timer
                handleTimer(incrementing: true)
            }
            // When the user stops pressing (isPressing becomes false)
            // And if the progress has not yet reached 100%
            else if !isCompleted {
                // Start decreasing the progress using the timer
                handleTimer(incrementing: false)
            }
        }
        .animation(.smooth, value: isPressing)
    }
    // This function manages a Timer that either increases or decreases the progress value.
    // If `incrementing` is true, it will increase the progress gradually.
    // If `incrementing` is false, it will decrease the progress gradually.
    func handleTimer(incrementing: Bool) {
        
        // First, stop any existing timer to avoid having multiple timers running at the same time
        timer?.invalidate()
        
        // Start a new timer that fires every 0.02 seconds (about 50 times per second)
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            
            // If we are increasing progress (the user is pressing and holding)
            if incrementing {
                // If the progress is still below 100%, increase it by 1
                if progress < 100 {
                    progress += 1
                } else {
                    // If we reach 100%, mark the action as complete
                    isCompleted = true
                    // Stop the timer because the task is done
                    timer?.invalidate()
                    timer = nil
                }
            }
            
            // If we are decreasing progress (the user has stopped pressing)
            else {
                // If the user suddenly starts pressing again while we're decreasing,
                // cancel the countdown and let increasing take over
                if isPressing {
                    timer?.invalidate()
                    timer = nil
                }
                
                // If progress is above 0, reduce it by 1
                if progress > 0 {
                    progress -= 1
                } else {
                    // If progress hits 0, stop the timer — nothing more to do
                    timer?.invalidate()
                    timer = nil
                }
            }
        }
    }

}

















//import SwiftUI
//
//
//
//struct LearnGesture: View {
//    @State var isPressed = false
//    @State var progress: CGFloat = 0.0
//    @State var timer: Timer? = nil
//    @State var isCompleted = false
//    var body: some View {
//        ZStack{
//            Circle()
//                .padding(5)
//                .foregroundStyle(.gray.opacity(0.3))
//                .scaleEffect(isPressed ? 0.9 : 1)
//            Circle()
//                .stroke(Color.gray.opacity(0.2), lineWidth: 10)
//            Circle()
//                .trim(from: 0, to: progress / 100)
//                .stroke(isCompleted ?  .green : Color.primary, style: StrokeStyle(lineWidth: 10, lineCap: .round))
//                .rotationEffect(.degrees(-90))
//                          Text("\(Int(progress))%")
//                              .font(.system(size: 25))
//                              .bold()
//                              .scaleEffect(isPressed ? 0.9 : 1)
//        }
//        .frame(width: 100, height: 100)
//        .gesture(
//            DragGesture(minimumDistance: 0)
//               
//                .onChanged { _ in
//                    if timer == nil {
//                        handleTimer(isIncrementing: true)
//                    }
//                }
//                .onEnded { _ in
//                    isPressed = false
//                    if !isCompleted {
//                        handleTimer(isIncrementing: false)
//                    }
//                }
//        )
//    }
//    func handleTimer(isIncrementing: Bool) {
//        timer?.invalidate()
//        timer = nil
//        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
//            if isIncrementing {
//                isPressed = true
//                if progress < 100 {
//                    progress += 1
//                } else {
//                    isCompleted = true
//                    timer?.invalidate()
//                    timer = nil
//                }
//            } else {
//                isPressed = false
//                if progress > 0 {
//                    progress -= 1
//                } else {
//                    timer?.invalidate()
//                    timer = nil
//                }
//            }
//        }
//    }
//
//}
//
#Preview {
    HoldToComplete()
}





//
//import SwiftUI
//
//
//
//struct LearnGesture: View {
//    @GestureState private var isPressed = false
//    @State private var progress: CGFloat = 0.0
//    @State private var timer: Timer? = nil
//    @State private var isCompleted = false
//    var body: some View {
//        ZStack{
//            Circle()
//                .stroke(Color.gray.opacity(0.2), lineWidth: 20)
//            Circle()
//                .trim(from: 0, to: progress / 100)
//                .stroke(isCompleted ? Color.green : Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
//                .rotationEffect(.degrees(-90))
//                .animation(.easeInOut, value: progress)
//        }
//        .frame(width: 100, height: 100)
//            .gesture(
//                DragGesture(minimumDistance: 0)
//                    .updating($isPressed) { _, state, _ in
//                        state = true
//                        progress = 100
//                    }
//            )
//    }
//}
//
//
//
//#Preview {
//    LearnGesture()
//}
//
//
