 

import SwiftUI
import PhotosUI

struct ContentView: View {
    var manager: RemovalBackgroundManager = .init()
    var body: some View {
        ZStack{
            if let image = manager.processedImage{
                GeometryReader { geo in
                    ZStack{
                        Image(.PBG).resizable().scaledToFill()
                            .frame(width: geo.size.width, height: geo.size.height)
                        Image(uiImage: image).resizable().scaledToFill()
                            .frame(width: geo.size.width, height: geo.size.height)
                            .clipped()
                        
                    }
                }.ignoresSafeArea()
                
            }else{
                Image(systemName: "photo.badge.plus")
                    .resizable().scaledToFill()
                    .frame(width: 60, height: 60)
            }
            HStack{
                PhotosPicker(selection: manager.selectedPickerItemBinding, matching: .images) {
                    Image(systemName: "photo.badge.plus")
                        .font(.largeTitle)
                        .padding(20)
                        .background(.thinMaterial,in:.circle)
                }
                .tint(.primary)
                .disabled(manager.isLoading)
                .onChange(of: manager.selectedItem) { oldValue, newValue in
                    manager.loadSelectedImage()
                }
                if let image = manager.processedImage{
                    Button {
                        manager.createSticker()
                    } label: {
                        Image(systemName: "wand.and.stars.inverse")
                            .font(.largeTitle)
                            .padding(20)
                            .background(.purple.gradient,in:.circle)
                    }
                    .tint(.white)
                    
                }
            }
            .frame(maxHeight: .infinity,alignment: .bottom)
        }
    }
}

#Preview {
    ContentView()
}
