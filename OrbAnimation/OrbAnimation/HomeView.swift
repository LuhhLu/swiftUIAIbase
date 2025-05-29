 

import SwiftUI

struct HomeView: View {
    @State var text = ""
    var body: some View {
        HStack(spacing:0){
            ZStack{
                theOrb()
                BubbleAnimationView()
            }
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
            TextField("Ask anything", text: $text)
                .padding(.horizontal)
        }
        .padding(14)
        .frame(height: 70)
        .background(.gray.opacity(0.3),in:.rect(cornerRadius: 24))
        .padding()
       
       
 
    }
}

#Preview {
    HomeView()
}
