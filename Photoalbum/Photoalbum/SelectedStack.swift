 

import SwiftUI

struct SelectedStack: View {
    var vm:DataModel
    var images:[photo]
    @State var SelectedImage:photo?
    var namespace:Namespace.ID
    var body: some View {
        ZStack{
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                    ForEach(images) { image in
                        Image(image.imageName).resizable().scaledToFill()
                            .matchedGeometryEffect(id: image.id, in: namespace)
                            .frame(width: 170, height: 200)
                            .clipShape(.rect(cornerRadius: 10))
                            .matchedGeometryEffect(id: image.clipId, in: namespace)
                            .contentShape(Rectangle(),eoFill: true)
                            .onTapGesture {
                                withAnimation(.smooth(duration: 0.3)) {
                                    SelectedImage = image
                                }
                            }
                        
                    }
                })
            }
            .safeAreaPadding(.top,60)
            .safeAreaPadding(.horizontal,15)
            .overlay(alignment: .topLeading) {
                DismissButton
            }
            if let SelectedImage{
                ZStack{
                    GeometryReader(content: { geometry in
                        Image(SelectedImage.imageName).resizable().scaledToFill()
                            .matchedGeometryEffect(id: SelectedImage.id, in: namespace)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.1)) {
                                    self.SelectedImage = nil
                                }
                            }
                            
                    })
                }
                .ignoresSafeArea()
        }
       
        }
        
    }
    var DismissButton:some View{
        Button(action: {
            withAnimation (.spring(duration: 0.3, bounce: 0.3)) {
                vm.isSheetPresented = false
            }
        }, label: {
            Image(systemName: "arrow.backward")
                .padding()
                .background(.ultraThinMaterial,in:Circle())
            
        })
        .tint(.primary)
        .padding()
        .offset(y: -20)
    }
}

//#Preview {
//    SelectedStack()
//}
