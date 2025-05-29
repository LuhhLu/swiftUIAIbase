 
import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            Text("Your View").bold()
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
      
    }
}

#Preview {
    HomeView()
}
