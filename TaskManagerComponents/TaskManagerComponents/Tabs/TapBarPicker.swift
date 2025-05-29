
import SwiftUI
struct TabPicker: Identifiable {
    var id = UUID()
    var title: String
    var tab: tabitem
}
let PickerItems = [
    TabPicker(title: "All Tasks", tab: .alltasks),
    TabPicker(title: "In progress", tab: .inprogress),
    TabPicker(title: "Completed", tab: .completed),
]

enum tabitem: String {
    case alltasks
    case inprogress
    case completed
}
struct TapBarPicker: View {
    @State var selectedTab: tabitem = .alltasks
    @Namespace var animationNamespace
    @State private var textWidth: CGFloat = 0
    var body: some View {
        HStack{
            ForEach(PickerItems) { item in
                Text(item.title).bold()
                    .frame(width: 110)
                    .background(
                        Group{
                            if selectedTab == item.tab {
                                Capsule().frame(width: 120, height: 50)
                                    .foregroundStyle(Color(.systemGray4))
                                    .matchedGeometryEffect(id: "Capsule", in: animationNamespace)
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5)){
                            selectedTab = item.tab
                        }
                    }
            }
        }
        .frame(height: 65)
        .padding(.horizontal,13)
        .background(Color(.systemGray6),in:Capsule())
 
    }
}

#Preview {
    TapBarPicker()
}
