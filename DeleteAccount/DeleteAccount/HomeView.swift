 













import SwiftUI

struct HomeView: View {
    @State var show = false
    var body: some View {
        ZStack{
            Button(action: {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                show.toggle()
            }}, label: {
                Text("Show Delete Card")
                    .font(.title)
                
            }).tint(.pink)
            .buttonStyle(BorderedButtonStyle())
            DeleteCard(icon:  "trash.circle", title: "Delete Account", details: "Are you sure you want to delete your account? All your data will be permanently removed.",BStartTitle: "ACCOUNT DELETED", BEndTitle: "HOLD TO DELETE", show: $show)
                .frame(maxHeight: .infinity,alignment: .bottom)
                .offset(y: show ? -20 : 500)
        }
    }
}

#Preview {
    HomeView()
}
