

import SwiftUI

struct onboardingView: View {
    @State var currentView = 0
    var body: some View {
        ZStack{
            if currentView <= 2 {
                BGGradient()
             }
            switch currentView{
            case 0:
                Screens(image:.on1,title: "Sticky Note", detels: "You can choose one of five different stickers in shape and color to suit your tasks", currentView: $currentView)
            case 1:
                Screens(image:.on2,title: "Dragging Board", detels: "You can drag a memo to any location inside the whiteboard" , currentView: $currentView)

                
            case 2:
                Screens(image:.on3,title: "Tracking", detels: "Track the progress of tasks and tasks that have been completed and remain" , currentView: $currentView)
                    .transition(.asymmetric(insertion: .opacity, removal: .move(edge: .leading)))
                     
            default:
                HomeView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
        }
    }
}

#Preview {
    onboardingView()
}
