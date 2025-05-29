 
import SwiftUI
struct TaskOption: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let subtitle: String
    let action: () -> Void
}
struct TaskCardView: View {
    var option: TaskOption
    var body: some View {
        ZStack {
        RoundedRectangle(cornerRadius: 18)
                .frame(width: 120, height: 125)
                .modeBasedCardStyle()
            VStack(spacing: 10) {
                Image(systemName: option.icon)
                    .font(.system(size: 13,weight: .semibold))
                    .padding(10)
                    .background(Circle().modeBasedCardStyle(darkShadowOpacity: 0.2, darkShadowRadius: 10, darkShadowX: 10, darkShadowY: 10))
                VStack(spacing: 4){
                    Text(option.title)
                        .font(.system(size: 15))
                    Text(option.subtitle)
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(5)
        }
    }
}

#Preview {
    TaskCardView(option: TaskOption(icon: "checklist", title: "Task", subtitle: "A one-time task to complete", action: {}))
        .frame(width: 100)
}
