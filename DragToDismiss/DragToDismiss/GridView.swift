 

import SwiftUI

struct GridView: View {
    // Add you images.......
    var image = ["im1", "im2", "im3", "im4", "im5", "im6","im3", "im4", "im5", "im6"]
    var columns : [GridItem] = [ GridItem(.flexible()),GridItem(.flexible())]
    @State var Gshow = false
    @State var viewstate :CGSize = .zero
    @Binding var show : Bool
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns){
                ForEach(image.indices,id: \.self) { index in
                    Image(image[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 170, height: 200)
                    .cornerRadius(20)
                    .offset(y: self.Gshow ? 0 :UIScreen.main.bounds.height)
                    .animation(Animation.spring().delay(Double(index) * 0.1), value: Gshow)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    .padding(.vertical)
                    
                }
            }
            .padding(.horizontal,12)
            .padding(.top,60)
           
        }
        .background(Color.purple)
        .mask(RoundedRectangle(cornerRadius: viewstate.width.magnitude, style: .continuous))
        .scaleEffect(viewstate.width / 500 + 1)
        .gesture(
            DragGesture()
                .onChanged{ value in
                    if value.startLocation.x > UIScreen.main.bounds.width - 100{
                        viewstate = value.translation
                    }
                }
                .onEnded({ value in
                    if viewstate.width < -50{
                        show = false
                        //dismiss the view
                    }
                    withAnimation {
                        viewstate = .zero
                    }
                })
                 
        )
        .onAppear(){
            withAnimation {
                self.Gshow = true
            }
        }
        .ignoresSafeArea()
        
        
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(show: .constant(true))
    }
}
