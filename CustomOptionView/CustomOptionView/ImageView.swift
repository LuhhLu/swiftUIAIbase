 
import SwiftUI

struct ImageView: View {
    @State var imageN:String = "im9"
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            GeometryReader { geo in
                Image(imageN).resizable().scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        Button {
                            dismiss()
                            imageN = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .foregroundStyle(.white)
                        }
                    }
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ImageView()
}
