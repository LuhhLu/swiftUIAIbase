 
import SwiftUI

struct ImageView: View {
    var imageN:String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        GeometryReader { geo in
            Image(imageN).resizable().scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .navigationBarBackButtonHidden(true)
                .toolbar{
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                }
        }
        .ignoresSafeArea()
    }
}

//#Preview {
//    ImageView()
//}
