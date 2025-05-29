 
import SwiftUI

struct HomeView: View {
    @State var showTheShareView = false
    var body: some View {
        switch showTheShareView {
        case false:
            Button(action: {
                withAnimation {
                    showTheShareView.toggle()
                }
            }, label: {
                HStack{
                   
                    Text("Invite")
                    Image(systemName: "person.badge.plus")
                }
                .bold().font(.title)
                
                    
            })
            .tint(.primary)
            .frame(maxWidth: .infinity)
            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
        case true:
            ShareView(showShareView: $showTheShareView)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
        }
    }
}

#Preview {
    HomeView()
}
