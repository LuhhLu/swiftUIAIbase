 

import Foundation
import SwiftUI

extension View {
    func handleRootOrDismiss(presentationMode: Binding<PresentationMode>, rootView: AnyView) {
        if presentationMode.wrappedValue.isPresented == false {
            withAnimation {
                RootViewManager.shared.rootView = rootView
            }
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    
}

extension TimeInterval {
    func extractTimeComponents() -> (hours: Int, minutes: Int, seconds: Int) {
        let totalSeconds = Int(self)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        return (hours, minutes, seconds)
    }
}

extension Int {
    var remainingTimeText: String {
        let hours = self / 3600
        let minutes = (self % 3600) / 60
        let seconds = self % 60
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else if minutes > 0 {
            return String(format: "%02d:%02d", minutes, seconds)
        } else {
            return "\(String(format: "%02d", seconds)) sec"
        }
    }
}

extension Date {
    var endDateText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return "\(formatter.string(from: self))"
    }
}

import SwiftUI

class RootViewManager: ObservableObject {
    static let shared = RootViewManager()
    @Published var rootView: AnyView = AnyView(ContentView())
}

