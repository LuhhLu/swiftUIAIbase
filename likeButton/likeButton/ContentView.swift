 
import SwiftUI

struct ContentView: View {
    @State var like = false
    var body: some View {
        VStack(spacing:0) {
            Image(systemName: "hand.thumbsup")
                .imageScale(.large)
                .symbolEffect(.wiggle, value: like)
                .padding(12)
                .background(.yellow,in:.circle)
                .scaleEffect(like ? 0.8 : 1)
//            if like{
//                Text("Like")
//                    .transition(.scale(scale: like ? 0 : 1))
//            }
        }
        .onTapGesture {
            withAnimation {
                like.toggle()
            }
        }
        .padding()
        .scaleEffect(2)
    }
        
}

#Preview {
    ContentView()
}
