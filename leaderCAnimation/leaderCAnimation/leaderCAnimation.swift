import SwiftUI

struct LeaderCAnimation: View {
    @State private var isLoading = 0
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    var body: some View {
        HStack {
            ForEach(0 ..< 5) { index in
                Circle()
                    .frame(width: 20, height: 20)
                    .scaleEffect(isLoading == index ? 1.5 : 0.5)
                    .foregroundStyle(isLoading == index ? .white : .blue)
                    .animation(.easeInOut(duration: 0.7), value: isLoading)
            }
        }
        .onReceive(timer) { _ in
                    isLoading = (isLoading + 1) % 5
        }
    }
}
#Preview {
   LeaderCAnimation()
}


//.onReceive(timer) { _ in
//    if isLoading == 5 {
//
//        timer.upstream.connect().cancel()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//
//            isLoading = (isLoading + 1) % 5 // Continue animation
//            timer.upstream.connect() // Restart the timer
//        }
//    } else {
//
//        withAnimation {
//            isLoading = (isLoading + 1) % 5
//        }
//    }
//}


//
//import SwiftUI
//
//struct LeaderCAnimation: View {
//    @State private var isLoading = 0
//    @State private var Gcolor = 0
//    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
//    @State private var isTimerRunning = true
//
//    var body: some View {
//        HStack {
//            ForEach(0 ..< 5) { index in
//                Circle()
//                    .frame(width: 20, height: 20)
//                    .scaleEffect(isLoading == index ? 1.5 : 0.5)
//                    .foregroundStyle(isLoading == index ? .white : .blue)
//                    .animation(.easeInOut(duration: 0.7), value: isLoading)
//            }
//        }
//        .onReceive(timer) { _ in
//            if isTimerRunning {
//                if isLoading == 4 {
//                    isTimerRunning = false
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                        isTimerRunning = true
//                        isLoading = (isLoading + 1) % 5
//                    }
//                } else {
//                    isLoading = (isLoading + 1) % 5
//                }
//            }
//        }
//    }
//}
