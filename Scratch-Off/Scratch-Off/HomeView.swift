 











import SwiftUI
struct HomeView: View {
    var body: some View {
        ScratchCard(width: 200, height: 200, backgroundColor: .bg, cornerRadius: 20) {
            Image(.im).resizable().scaledToFill()
        } scratch: {
            Image(.SC_2).resizable().scaledToFill()
        }
        ScratchCard(width: 300, height: 50, backgroundColor: .bg, cornerRadius: 10) {
            Text("QREW-RDGW-KMR0").font(.title).bold().foregroundStyle(.primary)
        } scratch: {
            Image(.SC_2).resizable().scaledToFill()
        }

    }
}


















#Preview {
    HomeView()
}
