 
import SwiftUI

struct ImageDetails: View {
    var Namespace: Namespace.ID
    var imageInfo:ImageD = imagess[0]
    @Binding var show:Bool
    @State var ShowText = false
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Spacer()
                }
                .onAppear{
                    withAnimation (.easeInOut.delay(0.3)){
                        ShowText = true
                    }
                }
                .onChange(of: show, {
                    ShowText = false
                })
                .frame(maxWidth: .infinity)
                .frame(width: UIScreen.main.bounds.width, height: 500)
                .foregroundStyle(.white)
                .background(
                    Image(imageInfo.name).resizable().scaledToFill()
                        .matchedGeometryEffect(id: "image\(imageInfo.id)", in: Namespace)
                )
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(imageInfo.id)", in: Namespace)
                      )
                .overlay {
                    VStack(alignment:.leading){
                        Spacer()
                        Text(imageInfo.text).font(.title.weight(.bold))
                            .matchedGeometryEffect(id: "titel\(imageInfo.id)", in: Namespace)
                        Text("SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and surprisingly little code. You can bring even better ...")
                            .opacity(ShowText ? 1 : 0)
                        
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(10)
                    .offset(y: 140)
                }
            }
         
        }
        .ignoresSafeArea()
    }
}

//#Preview {
//    ImageDetails()
//}
