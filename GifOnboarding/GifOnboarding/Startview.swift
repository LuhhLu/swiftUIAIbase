 

import SwiftUI

struct Startview: View {
    @State var  show = false
    @Binding var  step :Int
    var body: some View {
        ZStack {
            Color.black
            GifWebView(gifName: "start")
                .offset(y: -60)
                .overlay(alignment: .bottom) {
                        Rectangle()
                            .frame(height: 400)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.clear,Color("C3") ,Color("C2"),Color("C1"),Color("C4"),Color("C5")])
                              , startPoint: .top, endPoint: .bottom))

                }
            VStack(spacing:20){
                Spacer()
                Text("Explore 4K Wallpapers").bold().font(.system(size: 50))
                    .offset(y: 10)
                Text("Various images created by artificial intelligence").frame(width: 250, height: 70)
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
    Startview(step: .constant(0))
}
