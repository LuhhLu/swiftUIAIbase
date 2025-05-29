
import SwiftUI

struct ContentView: View {
    @State var hours: Int  = 0
    @State var min: Int  = 0
    @State var sec: Int  = 0
    @State var showTimerDetail: Bool = false
    private var duration: TimeInterval {
        TimeInterval(hours * 3600 + min * 60 + sec)
    }
    var body: some View {
        ZStack{
            pickerTimeView
            if showTimerDetail{
                if TimeManager.shared.savedDate != nil{
                    
                    ProgressView(title: TextBuilder.shared.durationText(), duration: TimeManager.shared.duration, remainingTime: TimeManager.shared.getRemainingTime(), showTimerDetail: $showTimerDetail)
                        .background()
                }else{
                    ProgressView(title: TextBuilder.shared.durationText(parammeters: (hours, min, sec)), duration: duration, showTimerDetail: $showTimerDetail)
                        .background()
                }
            }
        }
        
    }
    var pickerTimeView:some View{
        VStack{
            TimePicker(hours: $hours, min: $min, sec: $sec)
              
            HStack{
                CustomButtonView(text: "Cancel", color: .gray, ontapGestur: {
                    
                })
                Spacer()
                CustomButtonView(text: "Start", color: .green, ontapGestur: {
                    self.showTimerDetail = true
                })
              
            }
            .padding(.top,52)
        }
        .padding(16)
    }
}

#Preview {
    ContentView()
}
