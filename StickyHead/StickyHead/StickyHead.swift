

import SwiftUI

struct StickyHead: View {
    @State var scrollOffset: CGFloat = 0.0
    var body: some View {
         ScrollView {
            VStack(alignment:.leading){
                //add you image name
                Image(.im).resizable().scaledToFill()
                
                    .frame(height: 400 + (scrollOffset < 0 ? abs(scrollOffset / 2) : 0))
                
                    .blur(radius: scrollOffset < 0 ? abs(scrollOffset) / 50 : 0)
                
                    .clipped()
                
                DetailsView
            }//VStack
            
            .offset(y: scrollOffset > 0 ? 0 : scrollOffset)
        }//ScrollView
        .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
            geometry.contentOffset.y
        }, action: { _, newValue in
            scrollOffset = newValue
        })
        .ignoresSafeArea()
    }
    var DetailsView:some View{
        VStack(alignment:.leading,spacing:14){
            Text("StickyHead IOS 18")
                .font(.largeTitle.bold())
            Text("with onScrollGeometryChange")
                .font(.title2.bold())
            Text("Scrolling Tracks scrollOffset:")
            Text("onScrollGeometryChange checks how much you scroll up or down and updates scrollOffset.")
            Text("Image Changes Size:")
            Text("1-The image gets bigger as you scroll down\n2-It stays the same size when you scroll up.")
            Text("Image Moves Up:")
            Text("The offset moves the image up as you scroll down.")
        }
        .padding()
    }
}

#Preview {
    StickyHead()
}
