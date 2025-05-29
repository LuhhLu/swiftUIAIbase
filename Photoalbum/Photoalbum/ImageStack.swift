 

import SwiftUI
 
struct ImageStack: View {
    var images:[photo]
    var namespace:Namespace.ID
    var body: some View {
        ZStack{
            ForEach(Array(images.enumerated().suffix(4)),id:\.element.id) { index , image in
                Image(image.imageName).resizable().scaledToFill()
                    .matchedGeometryEffect(id: image.id, in: namespace)
                    .frame(width: 140, height: 190)
                    .clipShape(.rect(cornerRadius: 10))
                    .matchedGeometryEffect(id: image.clipId, in: namespace)
                    .scaleEffect(index == images.count - 1 ? 1 : 1 - CGFloat(images.count - index - 1 ) * 0.05)
                    .offset(x: CGFloat(images.count - index - 1) * 9, y: index == images.count - 1 ? 0 : -1.8)
                    .rotationEffect(.degrees(images.count == images.count - 1 ? 0 :Double(images.count - index - 1) * 4))
                    .contentShape(Rectangle(),eoFill: true)
            }

        }
    }
}

//#Preview {
//    ImageStack()
//}

#Preview {
    HomeView()
}
