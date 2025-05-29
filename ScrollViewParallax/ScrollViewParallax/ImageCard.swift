 

import SwiftUI
struct ImageD:Identifiable{
    var id = UUID()
    var name : String
    var text:String
}
var imagess:[ImageD] = [ImageD(name: "l1", text: "Wolf" ),ImageD(name: "l2", text: "Mountain" ),ImageD(name: "l3", text: "Mountain2" ),ImageD(name: "l4", text: "Village" ),ImageD(name: "l5", text: "Moon" )]



struct ImageCard: View {
    var Namespace: Namespace.ID
    var imageInfo:ImageD = imagess[0]
    @Binding var show:Bool
    @Binding var  itemWidth: CGFloat
    var body: some View {
        GeometryReader{ geo in
            let parallaxOffset = (geo.frame(in: .global).maxX - UIScreen.main.bounds.midX) / 3
            VStack{
                Spacer()
                Text(imageInfo.text).font(.title.weight(.bold))
                    .matchedGeometryEffect(id: "titel\(imageInfo.id)", in: Namespace)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(10)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    )
            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(
                Image(imageInfo.name).resizable().scaledToFill()
                    .matchedGeometryEffect(id: "image\(imageInfo.id)", in: Namespace)
                    .offset(x: parallaxOffset)
                
            )
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous)
                .matchedGeometryEffect(id: "mask\(imageInfo.id)", in: Namespace)
            )
            .frame(width: itemWidth, height: 450)
            
        }
    }
}

//#Preview {
//    ImageCard()
//}
