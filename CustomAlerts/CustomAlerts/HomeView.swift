import SwiftUI

enum AlertType {
    case success
    case information
    case warning
    case error
    case reminder
    
    var icon: String {
        switch self {
        case .success: return "checkmark.circle.fill"
        case .information: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .error: return "xmark.octagon.fill"
        case .reminder: return "bell.fill"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .success: return .green
        case .information: return .blue
        case .warning: return .orange
        case .error: return .red
        case .reminder: return .purple
        }
    }
    
    var title: String {
        switch self {
        case .success: return "Success Notification"
        case .information: return "Information"
        case .warning: return "Warning"
        case .error: return "Error"
        case .reminder: return "Reminder"
        }
    }
    
    var details: String {
        switch self {
        case .success:
            return "Your email to recipient@example appears to have been sent, but it might be a good idea to double-check the Sent folder just to be sure."
        case .information:
            return "Did you know? You can schedule emails to be sent later by selecting the 'Schedule Send' option in the compose window. "
        case .warning:
            return "It seems like you may have mentioned an attachment but didn’t include one. Double-check before "
        case .error:
            return "We’re not completely sure, but it looks like your email couldn’t be sent. You might want to check your internet connection and try"
        case .reminder:
            return "You have unread messages in your inbox—possibly around 5? You might want to take a look to make sure you’re not missing anything."
        }
    }
}


struct HomeView: View {
    @State var show = false
    @State var selectedAlert: AlertType = .success
    @State var dragOffset: CGFloat = 0
    var body: some View {
        ZStack {
            if show{
                CustomAlert(icon: selectedAlert.icon, iconColor: selectedAlert.iconColor, title: selectedAlert.title, details: selectedAlert.details)
                    .transition(.move(edge: .top))
                    .zIndex(1)
                    .offset(y: dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                dragOffset = value.translation.height
                            }
                            .onEnded { value in
                                if value.translation.height < -10 {
                                    withAnimation {
                                        show = false
                                    }
                                }
                                withAnimation {
                                    dragOffset = 0
                                }
                                
                            }
                    )
            }
            HStack(spacing: 10) {
                Button("Error") { showAlert(type: .error) }
                    .buttonStyle(.bordered)
                    .tint(.red)
                Button("Success") { showAlert(type: .success) }
                    .buttonStyle(.bordered)
                    .tint(.green)
                Button("Warning") { showAlert(type: .warning) }
                    .buttonStyle(.bordered)
                    .tint(.orange)
                Button("Reminder") { showAlert(type: .reminder) }
                    .buttonStyle(.bordered)
                    .tint(.indigo)
                Button("Information") { showAlert(type: .information) }
                    .buttonStyle(.bordered)
                    .tint(.blue)
            }
            
        }
        
    }
    
    func showAlert(type: AlertType) {
        selectedAlert = type
        withAnimation(.spring) {
            show = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            withAnimation(.spring) {
                show = false
            }
        }
        
    }
}

#Preview {
    HomeView()
}

