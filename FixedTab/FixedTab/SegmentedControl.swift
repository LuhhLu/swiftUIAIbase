import SwiftUI
enum SegmentedControlState: String, CaseIterable {
    case option1 = "Action"
    case option2 = "Fantasy"
    case option3 = "Adventure"
    case option4 = "Animation"
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
            RoundedRectangle(cornerRadius: 12)
                .fill(.BG)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.gray.tertiary)
                        .matchedGeometryEffect(id: state, in: segmentedControl, isSource: false)
                )
        )
    }
}

#Preview {
    SegmentedControl()
}

 
