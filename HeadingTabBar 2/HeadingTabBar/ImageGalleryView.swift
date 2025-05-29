 

import SwiftUI

struct ImageGalleryView: View {
    let scrollOffset: CGFloat
    let imageHeight: CGFloat
    
    let imageNames: [String] = ["room1", "room2", "room3"]
    
    @State private var visibleImageIndex: Int = 0
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal){
                HStack{
                    ForEach(imageNames,id:\.self) { name in
                        Image(name).resizable().scaledToFill()
                            .clipped()
                            .frame(width: proxy.size.width, height: max(0, imageHeight - scrollOffset))
                            .onScrollVisibilityChange { isVisible in
                                guard isVisible else { return }
                                visibleImageIndex  = imageNames.firstIndex(of: name) ?? 1
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .opacity(1.0-max(scrollOffset / (imageHeight/2),0))
            .overlay(alignment: .bottomTrailing) {
                Text("\(visibleImageIndex+1)/\(imageNames.count)")
                    .padding(.vertical,8)
                    .padding(.horizontal,16)
                    .foregroundStyle(.black)
                    .font(.callout)
                    .background(.white,in:.capsule)
                    .padding()
                    .opacity(1.0-max(scrollOffset/(imageHeight/4), 0))
            }
            
            
        }
    }
}

#Preview {
    ImageGalleryView(
        scrollOffset: 0,
        imageHeight: 300
    )
}
