

import SwiftUI
struct StartView: View {
   @State var currentIndex = 0
   let vmCount = 3
   var body: some View {
       VStack {
           if currentIndex < vmCount {
               onboardingView(currentIndex: $currentIndex)
                   .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
           } else {
               HomeView()
                   .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
           }
       }
       
   }
}

#Preview {
   StartView()
}
