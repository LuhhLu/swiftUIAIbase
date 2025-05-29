 




import SwiftUI

struct DashCircle: View {
    @ObservedObject var tm = TimerManager()
    var body: some View {
        ZStack {
            Color("bg")
            ZStack{
                //100 line
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 20, dash: [3,4.5]))
                    .frame(width: 200, height: 200)
                Circle()
                    .trim(from: 0, to: tm.showvalue ? tm.value : 0)
                    .stroke(style: StrokeStyle(lineWidth: 20, dash: [3,4.5]))
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color("dash"))
                Circle()
                    .trim(from: 0, to: tm.showvalue ? tm.value : 0)
                    .stroke(style: StrokeStyle(lineWidth: 20, dash: [3,4.5]))
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color("dash"))
                    .blur(radius: 15)
                   
            }
            .rotationEffect(.degrees(-90))
            NumValue(displayedValue: tm.displayedValue, color: .white)
        }
        .ignoresSafeArea()
        .onTapGesture {
            withAnimation(.spring().speed(0.2)) {
                tm.showvalue.toggle()
                tm.startTimer()
            }
        }
    }
}

struct DashCircle_Previews: PreviewProvider {
    static var previews: some View {
        DashCircle()
            .environmentObject(TimerManager())
    }
}
