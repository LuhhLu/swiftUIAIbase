
import SwiftUI

struct ContentView: View {
    @State var show = false
    let mindarg : CGFloat = 100
    var body: some View {
        ZStack{
            Button {
                withAnimation {
                    show = true
                }
            } label: {
                Text("show")
            }

            sidemenuview()
                .offset(x: show ? 0 : -270)
                .gesture(
                    DragGesture()
                        .onEnded({ valeu in
                            let shoulsShow = valeu.translation.width > self.mindarg
                            withAnimation {
                                show = shoulsShow
                            }
                        })
                )
            
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
