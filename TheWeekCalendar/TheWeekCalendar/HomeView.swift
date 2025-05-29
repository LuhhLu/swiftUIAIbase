 
import SwiftUI
struct HomeView: View {
    @State var showCalender = true
    var body: some View {
        Button {
            showCalender.toggle()
        } label: {
            Text("Calevder")
        }
        
        .sheet(isPresented: $showCalender) {
            ContentView()
                .presentationDetents([.fraction(0.20)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(40)
        }
    }
}

#Preview {
    HomeView()
}
