 
import SwiftUI

struct TitleView: View {
    @State var show  = false
     var body: some View {
         VStack(spacing:12){
             TextView(text: "welcome to", show: show).font(.title2)
                 .animation(.spring, value: show)
             TextView(text: "SwiftUI", show: show).font(.system(size: 40).bold())
                 .animation(.spring.delay(1), value: show)
                 .onAppear(){
                     DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                         show = true
                     }
                     
                 }
         }
         .scaleEffect(1.5)
     
    }
}

#Preview {
    TitleView( )
}
struct TextView: View {
    var text:String
    var show : Bool
    var body: some View {
        Text(text).foregroundStyle(.white)
            .overlay(alignment: .trailing) {
                Rectangle()
                .foregroundStyle(.black)
                .frame(maxWidth: show ? 0 : .infinity)
            }
    }
}

 
