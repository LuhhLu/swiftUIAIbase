 

import SwiftUI

struct showImage: View {
    @State var show = false
    @Binding var Viewsheet:Bool
    var body: some View {
        ZStack(alignment: .top){
            ScrollView {
                VStack(alignment: .leading, spacing: 10){
                    Text("Osara nodiane").bold()
                        .font(.largeTitle)
                    Text("image from Pexels").bold()
                        .font(.title)
                    Text("Pexels is a free stock photo and video website and app that helps designers, bloggers, and everyone who is looking for visuals to find great photos and videos that can be downloaded and used for free. If you see a photo or video you like, simply download it for free (no strings attached!).If you'd like to contribute your work to Pexels, we accept photos and videos from everyone")
                        
                    
                }
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : UIScreen.main.bounds.width - 60,maxHeight:show ? .infinity : 260,alignment: .top)
            .offset(y: show ? 450 : 40)
            Image("im3")
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .onTapGesture {
                    withAnimation(.spring(response: 0.4,dampingFraction: 0.6)){
                        self.show.toggle()
                    }
                    
                }
                .frame(
                    maxWidth: show ? .infinity : UIScreen.main.bounds.width - 60,
                    maxHeight:show ? 450 : 460)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 20)
            
                 
            
        }
        .overlay(alignment: .topTrailing, content: {
            Image(systemName: "xmark.circle")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(show ? 30 : 20)
                .onTapGesture {
                    Viewsheet.toggle()
                }
            
        })
        .edgesIgnoringSafeArea(.all)
    }
}

struct showImage_Previews: PreviewProvider {
    static var previews: some View {
        showImage(Viewsheet: .constant(false))
    }
}
