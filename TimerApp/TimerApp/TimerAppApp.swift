 

import SwiftUI

@main
struct TimerAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(showTimerDetail: TimeManager.shared.savedDate != nil)
                .onAppear{
                    print(TimeManager.shared.savedDate != nil)
                }
        }
    }
}
