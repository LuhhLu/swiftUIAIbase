

import SwiftUI

struct TDEffectimage: View {
    func Geometry(geo:GeometryProxy)-> Double{
        let maxdis = UIScreen.main.bounds.width / 2
        let currenmax = geo.frame(in: .global).midX
        return Double( 1 - currenmax / maxdis)
    }
    var images :[String] = ["im1","im2","im3","im4","im5"]
   
    @State var shet = false
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(images,id: \.self) { index in
                    GeometryReader { geometry in
                        Image(index)
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(15)
                            .rotation3DEffect(Angle(degrees: Geometry(geo: geometry)) * 20, axis: (x: 0.0, y: 1.0, z: 0.0))
                            .onTapGesture {
                                shet.toggle()
                            }
                    }
                    .frame(width: 220, height: 300)
                    .fullScreenCover(isPresented: $shet, content: {
                        showImage(Viewsheet: $shet)
                    })
                    
                }
            }
            .padding(.top)
            .padding(.bottom,40)
        }
    }
}

struct _TDEffectimage_Previews: PreviewProvider {
    static var previews: some View {
        TDEffectimage()
    }
}
