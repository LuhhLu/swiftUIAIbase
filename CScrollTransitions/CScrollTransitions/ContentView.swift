

import SwiftUI
struct ImageModel: Identifiable {
   let id = UUID()
   let imageName: String
}

struct ContentView: View {
   let images = [
       ImageModel(imageName: "im1"),
       ImageModel(imageName: "im3"),
       ImageModel(imageName: "im4"),         ImageModel(imageName: "im12"),  ImageModel(imageName: "im5"),     ImageModel(imageName: "im12"),     ImageModel(imageName: "im6"),     ImageModel(imageName: "im13"),     ImageModel(imageName: "im7"),     ImageModel(imageName: "im14"),     ImageModel(imageName: "im8"),     ImageModel(imageName: "im15"),     ImageModel(imageName: "im9"),     ImageModel(imageName: "im16"),
   ]

   var body: some View {
       ScrollView(showsIndicators: false) {
           LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
               ForEach(images ) { item in
                   ImageView(imageName: item.imageName)
               }
               
               /*
                .scrollTransition seems to be a custom modifier or a function you have defined. SwiftUI doesn't have a built-in modifier named scrollTransition. It appears to be used here for applying certain transformations (scale, blur, rotation) to the Image view based on a phase condition during scrolling. Let's assume phase is an object that describes the current state of the view as it relates to the scroll.
                */
               
               .scrollTransition { image, phase in
                   image
                   /*
                    What it does: This modifier scales (or resizes) the view.
                    How it's used here: The scale of the image is being changed based on phase.isIdentity. If phase.isIdentity is true, the image stays at its original scale (1). If phase.isIdentity is false, the image is scaled down to 80% of its original size (0.8).
                    Why it's used: This can be used to create dynamic UI effects, such as making an image smaller as you scroll away from it.
                    */
                       .scaleEffect(phase.isIdentity ? 1 : 0.8)
                   /*
                    What it does: Applies a blur effect to the view.
                    How it's used here: The blur radius is determined by phase.isIdentity. If phase.isIdentity is true, no blur is applied (radius: 0). If phase.isIdentity is false, a blur with a radius of 4 points is applied.
                    Why it's used: This effect can be used to reduce the visual emphasis on an image when it is not the central focus, such as when scrolling past it.
                    */
                       .blur(radius: phase.isIdentity ? 0 : 4)
                   /*
                    What it does: Applies a 3D rotation effect to the view.
                    How it's used here: The rotation angle and axis are determined by phase.isIdentity. If phase.isIdentity is true, no rotation is applied (0 degrees). If phase.isIdentity is false, the image is rotated by 20 degrees around an axis with coordinates (30, 0, 30).
                    Why it's used: This effect can create a sense of depth and dynamism, making the UI feel more interactive and lively, especially during scrolling.
                    */
                       .rotation3DEffect(.degrees(phase.isIdentity ? 0 : 20 ), axis: (x: 30, y: 0, z: 30))
                   /*
                    Summary
                    In this context, .scrollTransition is used to dynamically modify the appearance of images in a scroll view. Depending on the scrolling phase (indicated by phase.isIdentity), each image may scale down, blur, and rotate slightly, likely creating an engaging and responsive visual effect as the user scrolls through the content.
                    */
               }
              
           })
           .padding(.horizontal,7)
       }
           
       
   }
}

#Preview {
   ContentView()
}
struct ImageView: View {
   let imageName: String
   var body: some View {
       Image(imageName)
           .resizable()
           .scaledToFill()
           .frame(width: 185, height: 190)
           .clipShape(RoundedRectangle(cornerRadius: 20))
            
   }
}
