

import SwiftUI

struct LayoutView: View {
    var images: [String]
    @State var show = false
    @State var selectedImage: String? = nil
    @Namespace var imageZoom
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    VStack{
                        createGrid(for: images.filter{!isHeavy($0)})
                        Spacer()
                    }
                    VStack{
                        createGrid(for: images.filter{isHeavy($0)})
                        Spacer()
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationDestination(for: String.self) { imageName in
                ImageView(imageN: imageName)
                    .navigationTransition(.zoom(sourceID: imageName, in: imageZoom))
            }
            .safeAreaPadding(12)
        }
        .ignoresSafeArea()
    }
    func createGrid(for filteredImages: [String]) -> some View{
        
        ForEach(filteredImages,id: \.self) { item in
            GridRow {
                NavigationLink(value: item) {
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 12))
                        .matchedTransitionSource(id: item, in: imageZoom)
                     
                        
                }
            }
        }
        .transition(.blurReplace())
    }
    func isHeavy(_ image: String) -> Bool {
        if let index = images.firstIndex(of: image) {
            return index % 2 == 1
        }
        return false
    }
    
}

//#Preview {
//    LayoutView()
//}
#Preview {
    segmentedControl()
}
