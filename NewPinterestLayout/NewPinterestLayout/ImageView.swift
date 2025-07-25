 

import SwiftUI

struct ImageView: View {
    var imageN:ImageResource
    @Binding var show:Bool
    var namespace:Namespace.ID
    var body: some View {
        ZStack{
            GeometryReader(content: { geo in
                Image(imageN).resizable().scaledToFit()
                    .matchedGeometryEffect(id: imageN, in: namespace)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .onTapGesture {
                        withAnimation(.spring(duration: 0.3)) {
                            show.toggle()
                        }
                    }
            })
        }
        .background(.thinMaterial)
        .ignoresSafeArea()
    }
}

//#Preview {
//    ImageView()
//}
