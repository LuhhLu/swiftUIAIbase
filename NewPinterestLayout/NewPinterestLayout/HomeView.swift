 












import SwiftUI

struct HomeView: View {
    var images: [ImageResource] = [.im1, .im2, .im3, .im4, .im5, .im6, .im7, .im8, .im9, .im10]

    var body: some View {
        LayoutView(images: images)
    }
}

#Preview {
    HomeView()
}
