
import SwiftUI

struct ContentView: View {
   var body: some View {
       VStack(spacing:0) {
           GlowingButton()
           SoftGlowing()
           GrButton()
           PuButton()
           BlueButton()
       }
     
   }
}

#Preview {
   ContentView()
}
