import SwiftUI

struct DotSpinnerView: View {
    let dotCount = 8
    let radius: CGFloat = 30
    @State private var activeIndex = 0
    let timer = Timer.publish(every: 0.12, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            ForEach(0..<dotCount, id: \.self) { index in
                Circle()
                    .frame(width: 10, height: 10)
                    .opacity(index == activeIndex ? 1 : 0.0)
                    .animation(.spring(duration: 1.0), value: activeIndex)
                    .offset(y: -radius)
                    .rotationEffect(.degrees(Double(index) / Double(dotCount) * 360))
            }
        }
   
        .onReceive(timer) { _ in
                activeIndex = (activeIndex + 1) % dotCount
        }
    }
}

#Preview {
    DotSpinnerView()
}



import SwiftUI

struct DotSpinnertow: View {
    let dotCount = 8
    let radius: CGFloat = 30
    @State var activeIndex = 0
    let timer = Timer.publish(every: 0.10, on: .main, in: .common).autoconnect()

    var body: some View {
       
        
        ZStack {
            ForEach(0..<dotCount, id: \.self) { index in
                Circle()
                    .frame(width: 35, height: 35)
                    .scaleEffect(index == activeIndex ? 1 : 0.0)
                    .animation(.spring(duration: 1), value: activeIndex)
                    .offset(y: -radius)
                    .rotationEffect(.degrees(Double(index) / Double(dotCount) * 360))
            }
        }
  
        .onReceive(timer) { _ in
                activeIndex = (activeIndex + 1) % dotCount
        }
    }
}

#Preview {
    DotSpinnertow()
}
