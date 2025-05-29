 

import SwiftUI
import Observation
@Observable
class SelsctImageManager {
    var selectedImage = ""
    var images:[ItemsModel] = [
        ItemsModel(imageName: "im1"),
        ItemsModel(imageName: "im2"),
        ItemsModel(imageName: "im3"),
        ItemsModel(imageName: "im4"),
        ItemsModel(imageName: "im5"),
        ItemsModel(imageName: "im6"),
        ItemsModel(imageName: "im7"),
        ItemsModel(imageName: "im8"),
        ItemsModel(imageName: "im9"),
        ItemsModel(imageName: "im10")
    ]
}
struct ContentView: View {
    @State var vm = SelsctImageManager()
    @Namespace var imageZoom
    @State var isOptionViewPresented = false
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2),spacing:18) {
                    ForEach(vm.images) { image in
                        NavigationLink(value: image.imageName) {
                            Image(image.imageName).resizable().scaledToFill()
                                .frame(width: 180, height: 200)
                                .clipShape(.rect(cornerRadius: 12))
                                .matchedGeometryEffect(id: image.imageName, in: imageZoom)
                                .matchedTransitionSource(id: image.imageName, in: imageZoom)
                                .scaleEffect(vm.selectedImage == image.imageName ? 0.9 : 1.0)
                                .onLongPressGesture(minimumDuration: 1.0, pressing: { isPressing in
                                    if isPressing {
                                        withAnimation(.spring(duration: 0.5)) {
                                            vm.selectedImage = image.imageName
                                        }
                                    } else if !isOptionViewPresented {
                                        vm.selectedImage = ""
                                    }
                                }) {
                                    withAnimation (.spring(duration: 0.5)){
                                        isOptionViewPresented = true
                                    }
                                }
                            
                        }
                    }
                }
                .safeAreaPadding(5)
            }
            .scrollIndicators(.hidden)
            .navigationDestination(for: String.self) { imageName in
                ImageView(imageN: imageName)
                    .navigationTransition(.zoom(sourceID: imageName, in: imageZoom))
            }
            .overlay {
                if isOptionViewPresented{
                    OptionView(imageName: vm, namespace: imageZoom, isOptionViewPresented: $isOptionViewPresented) {
                        withAnimation(.spring(duration: 0.1)) {
                            deleteImage(named: vm.selectedImage)
                        }
                       
                    }
                }
            }
        }
    }
    func deleteImage(named imageName: String) {
        vm.images.removeAll { $0.imageName == imageName }
        isOptionViewPresented = false
    }
}

#Preview {
    ContentView()
}
