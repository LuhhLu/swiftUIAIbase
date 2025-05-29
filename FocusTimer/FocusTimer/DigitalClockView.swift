import SwiftUI

struct DigitalClockView: View {
    @State private var currentDay = Calendar.current.component(.weekday, from: Date())
    @State private var currentDate = Date()
    @State private var batteryLevel: Int = UIDevice.batteryLevelAsPercentage()
    let weekdays = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    var body: some View {
        VStack(spacing:30){
            HStack(spacing:0){
                ForEach(0..<weekdays.count, id: \.self) { index in
       
                    Text(weekdays[index])
                        .opacity(currentDay == index + 1 ? 1 : 0.5)
                        .frame(maxWidth: .infinity)
              
            }
        }
            HStack{
                Text(currentDateDisplay)
                Spacer()
                Text("BATTERY: \(batteryLevel) %")
            }
            .padding(.horizontal,40)
       
            
        }
        .font(.system(size: 20, weight: .medium, design: .monospaced))

        .onAppear {
            UIDevice.current.isBatteryMonitoringEnabled = true
            batteryLevel = UIDevice.batteryLevelAsPercentage()
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            currentDate = Date()
            batteryLevel = UIDevice.batteryLevelAsPercentage()
        }
    } 
    var currentDateDisplay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM dd"
        return formatter.string(from: currentDate).uppercased()
    }
}
extension UIDevice {
    static func batteryLevelAsPercentage() -> Int {
        let level = UIDevice.current.batteryLevel
        if level < 0 { return 0 }
        return Int(level * 100)
    }
}

#Preview {
    DigitalClockView()
}







 
