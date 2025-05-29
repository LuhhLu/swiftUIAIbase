
import SwiftUI

struct LayoutView: View {
    var images: [ImageResource]
    @State var show = false
    @Namespace var namespace
    @State var selectedImage: ImageResource? = nil
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                VStack{
                    createGrid(for: images.filter{!isHeavy($0)})
                    Spacer()
                }
                .zIndex(images.contains(where: isHeavy) ? 0 : 1)
                
                
                
                VStack{
                    createGrid(for: images.filter{isHeavy($0)})
                    Spacer()
                }
                .zIndex(images.contains(where: isHeavy) ? 1 : 0)
                
                
            })
        }
        .safeAreaPadding(.horizontal,10)
        .overlay {
            if show{
                ImageView(imageN: selectedImage!, show: $show, namespace: namespace)
            }
        }
    }
    
    func createGrid(for filteredImages: [ImageResource]) -> some View {
        ForEach(filteredImages,id:\.self){ item in
            GridRow {
                Image(item).resizable().scaledToFit()
                    .clipShape(.rect(cornerRadius: 12))
                    .matchedGeometryEffect(id: item, in: namespace)
                    .zIndex(selectedImage == item ? 1 : 0)
            }
            .onTapGesture {
                withAnimation (.spring(duration: 0.5)){
                    selectedImage = item
                    show.toggle()
                }
            }
            
        }
    }
    func isHeavy(_ image: ImageResource) -> Bool{
        if let index = images.firstIndex(of: image){
            return index % 2 == 1
        }
          return false
    }
    
}

#Preview {
    LayoutView(images: [.im1, .im2])
}
