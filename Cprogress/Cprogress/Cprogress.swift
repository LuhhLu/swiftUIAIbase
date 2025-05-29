import SwiftUI

struct Cprogress: View {
    @State var progress: CGFloat = 0.0
    @State var percentage: Int = 0

    var body: some View {
 
        
        ZStack {
            Circle().stroke(lineWidth: 20)
                .foregroundStyle(.gray.opacity(0.2))
            
            Circle().trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(-90)).foregroundStyle(.blue.gradient)
            
            Text("\(percentage)%").font(.title).bold()
               
        }
        .frame(width: 200, height: 200)
        .onAppear {
            withAnimation(.linear(duration: 5)) {
                progress = 1
            }
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                if percentage < 100 {
                    percentage += 1
                } else {
                    timer.invalidate()
                }
            }
        }
    }
}

#Preview {
    Cprogress()
}

