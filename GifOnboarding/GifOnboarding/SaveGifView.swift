

import SwiftUI

struct SaveGifView: View {
    @State var  show = false
    @Binding var  step :Int
    var body: some View {
        ZStack {
            Color.black
            GifWebView(gifName: "save")
                .offset(y: -50)
                .overlay(alignment: .bottom) {
                        Rectangle()
                            .frame(height: 400)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.clear,Color("C3") ,Color("C2"),Color("C1"),Color("C4"),Color("C5")])
                              , startPoint: .top, endPoint: .bottom))

                }
            VStack(spacing:20){
                Spacer()
                Text("Download Wallpapers").bold().font(.system(size: 50))
                    .offset(y: 10)
                Text("Save photos on your device in a photo library").frame(width: 250, height: 70)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                CButton(titel: "Start", step: $step)
                    .padding(.bottom,20)
            }
            .foregroundStyle(.black)
           
            
        }
        .ignoresSafeArea()
      
    }
}

#Preview {
    SaveGifView(step: .constant(0))
}
