 

import SwiftUI
struct SegmentedModel: Identifiable {
    let id = UUID()
    let iconName: String
    let tapName: String
    let images: [String]
}
struct segmentedControl: View {
    var SegmentedTap: [SegmentedModel] = [
           SegmentedModel(iconName: "tv", tapName: "Rewatching", images: ["im1", "im2", "im3", "im4", "im5", "im6", "im7", "im8","im9"]),
           SegmentedModel(iconName: "star", tapName: "Favorite", images: ["im20", "im11", "im12", "im13"]),
           SegmentedModel(iconName: "heart", tapName: "Love Story", images: ["im16", "im17", "im18", "im19", "im23", "im21", "im15" ]),
           SegmentedModel(iconName: "cross", tapName: "Hard times", images:
                            ["im24", "im25", "im20", "im26", "im27", "im28", "im29", "im4", "im6", "im8", "im10", "im12", "im13"]),
           SegmentedModel(iconName: "rectangle.stack", tapName: "Others", images:
                            ["im2", "im5", "im23", "im30", "im11", "im21"])
       ]
    init() {
        _selectedCategory = State(initialValue: SegmentedTap[1])
    }
    @State private var selectedCategory: SegmentedModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing:0){
                ScrollViewReader { scrollto in
                    ScrollView(.horizontal) {
                        HStack(spacing:24){
                            ForEach(SegmentedTap) { item in
                                Button {
                                    withAnimation (.easeIn){
                                        selectedCategory = item
                                        scrollto.scrollTo(item.id, anchor: .center)
                                    }
                                } label: {
                                    HStack{
                                        Image(systemName: item.iconName).resizable()
                                            .frame(width: 15, height: 15)
                                            .symbolVariant(selectedCategory.id  == item.id ? .fill : .none)
                                            .contentTransition(.symbolEffect)
                                        Text(item.tapName)
                                    }
                                    .id(item.id)
                                }
                                .foregroundStyle(selectedCategory.id == item.id ? Color.primary : .gray)
                            }
                            
                            
                        }
                        .padding()
                    }
                    .scrollIndicators(.hidden)
                }
                Divider()
                LayoutView(images: selectedCategory.images)
            }
        }
    }
}

#Preview {
    segmentedControl()
}
