import SwiftUI
enum SegmentedControlState: String, CaseIterable {
    case option1 = "Home"
    case option2 = "Notifications"
    case option3 = "Settings"
}
struct SegmentedControl: View {
    @State private var state: SegmentedControlState = .option1
    @Namespace private var segmentedControl
    var body: some View {
        HStack {
            ForEach(SegmentedControlState.allCases, id: \.self) { item in
                Text(item.rawValue).padding(10)
                .foregroundColor(state == item ? .white : .gray)
                .matchedGeometryEffect(id: item, in: segmentedControl)
                .onTapGesture {
                    withAnimation {
                        self.state = item
                    }
                }
            }
        }
        .padding(6)
        .background(
            Capsule()
                .fill(.gray.tertiary)
                .overlay(
                    Capsule()
                        .fill(.gray.tertiary)
                        .matchedGeometryEffect(id: state, in: segmentedControl, isSource: false)
                )
        )
    }
}

#Preview {
    SegmentedControl()
}

 
