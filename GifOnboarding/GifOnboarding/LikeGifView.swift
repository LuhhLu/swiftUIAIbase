 
import SwiftUI
struct LikeGifView: View {
    @State var  show = false
    @Binding var  step :Int
    var body: some View {
        ZStack {
            Color.black
            GifWebView(gifName: "like")
                .offset(x: 1, y: -60)
                .overlay(alignment: .bottom) {
                    Rectangle().frame(height: 400)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.clear,Color("C3"),Color("C2"),Color("C1"),Color("C4"),Color("C5")]), startPoint: .top, endPoint: .bottom))
                }
            
            VStack(spacing:20){
                Spacer()
                Text("Like ❤️").bold().font(.system(size: 50))
                    .offset(y: 10)
                Text("Add photos to the Favorites section").frame(width: 250, height: 70)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                CButton(step: $step)
                    .padding(.bottom,20)
                
                
            }
            .foregroundStyle(.black)
             
            
        }
        .ignoresSafeArea()
      
    }
}

#Preview {
    LikeGifView(step: .constant(0))
}
