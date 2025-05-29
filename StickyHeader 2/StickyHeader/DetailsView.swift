 
import SwiftUI
struct ContentOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
struct DetailsView<Content: View>: View {
    let size: CGSize
    let safeArea: EdgeInsets
    var percentageHeight: CGFloat
    @State private var contentOffset: CGFloat = .zero
    let content: Content
    init(percentageHeight:CGFloat,size: CGSize, safeArea: EdgeInsets, @ViewBuilder content: () -> Content) {
        self.percentageHeight = percentageHeight
          self.size = size
          self.safeArea = safeArea
          self.content = content()
      }
    var body: some View {
        ZStack{
            VStack{
                ScrollView {
                    content
                        .padding(.top,size.height * percentageHeight + 14)
                        .background(
                            GeometryReader(content: { geo in
                                Color.clear
                                    .preference(key: ContentOffsetKey.self, value: geo.frame(in: .named("scrollView")).minY)
                            })
                        )
                }
                .scrollIndicators(.hidden)
                .coordinateSpace(name:"scrollView")
                .onPreferenceChange(ContentOffsetKey.self) { value in
                    self.contentOffset = value
                }
            }
            VStack{
                HeaderView(size: size, safeArea: safeArea, contentOffset: $contentOffset, percentageHeight: percentageHeight)
                Spacer()
            }
        }
    }
}

#Preview {
    ContainerView()
}
