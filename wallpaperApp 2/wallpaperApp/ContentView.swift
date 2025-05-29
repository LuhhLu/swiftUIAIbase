import SwiftUI
import Observation
import UIKit
import Photos


// save image function
func saveImage(imageName: String) {
    guard let image = UIImage(named: imageName) else {
        print("Image not found!")
        return
    }
    
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    
    // Request authorization if necessary
    if PHPhotoLibrary.authorizationStatus() != .authorized {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }
    }
}




@Observable class ImageManager {
     var selectedImage: String? = nil
     var isSheetPresented = false
     var likedImages: [String] = [ ]
}
struct ContentView: View {
    var images = ["im1","im2","im3","im4","im5","im6","im7","im8","im9","im10","im11","im12","im13","im14"]
    var columns : [GridItem] = [GridItem(.flexible(), spacing: -3), GridItem(.flexible())]
    var imageManager = ImageManager()
    
    
    var body: some View {
        GeometryReader(content: { geometry in
            ScrollView{
                LazyVGrid(columns: columns,spacing: 4, content: {
                    ForEach(images,id: \.self) { image in
                        ImageView(imageName: image)
                            .frame(width: geometry.size.width / 2 - 5)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .onTapGesture {
                                imageManager.selectedImage = image
                                imageManager.isSheetPresented = true
                            }
                    }
                })
            }
        })
        
        .fullScreenCover(isPresented: Binding(
            get:{imageManager.isSheetPresented},
            set:{imageManager.isSheetPresented = $0}
        )){
            if let selectedImage = imageManager.selectedImage{
                ImageDetailView(imageName: selectedImage, imageManager: imageManager)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}

struct ImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ImageDetailView: View {
    var imageName: String
    var imageManager = ImageManager()
    @State var show = false
    @State var save = false
    @GestureState private var dragOffset: CGFloat = 0
    var body: some View {
        Image(imageName).resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    imageManager.isSheetPresented = false
                }, label: {
                    Image(systemName: "xmark").bold()
                        .frame(width: 40, height: 40)
                        .background(.ultraThinMaterial)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .offset(x: -30, y: -10)
                })
            }
            .overlay(content: {
                LIkeBA(show: $show)
            })
            .overlay(alignment: .bottomTrailing, content: {
                Button(action: {
                    save = true
                    saveImage(imageName: imageName)
                }, label: {
                   SaveB(save: $save)
                        .offset(x: -30)
                })
            })
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { value, state , transaction in
                        state = value.translation.height
                    })
                    .onEnded({ value in
                        if value.translation.height > 200{
                            imageManager.isSheetPresented = false
                        }
                    })
            )
//        I created this gesture so that I can drag to dismiss
            .onTapGesture (count: 2 ){
                //add image to LikedImageGridView
                if !imageManager.likedImages.contains(imageName){
                    imageManager.likedImages.append(imageName)
                }
                show = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    show = false
                }
            }
    }
}

//#Preview {
//    ImageDetailView(imageName: "im1")
//}


 


struct LikedImageGridView: View {
    var imageManager = ImageManager()
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(imageManager.likedImages, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
        }
    }
}
