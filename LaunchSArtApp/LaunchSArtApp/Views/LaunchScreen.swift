 

import SwiftUI
import Shimmer
struct LaunchScreen: View {
    @State var isActev = false
    var body: some View {
        if isActev{
            HomeView()
            
        }else{
            ZStack{
                Image("lunch")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .frame(width: 245, height: 85)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue,.yellow]), startPoint: .leading, endPoint: .trailing))
                    .shimmering()
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10,style: .continuous)
                            .frame(width: 230, height: 70)
                        Text("Art-Shop").bold()
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                    })
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3){
                    withAnimation{
                        self.isActev = true
                    }
                }
            }
        }
       
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
