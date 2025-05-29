
import SwiftUI
struct ContentView: View {
    @State var Height:CGFloat = 200
    @State var Height2:CGFloat = 200
    let colors: [Color] = [.pink, .purple, .green, .blue, .orange, .red, .yellow, .gray, .black, .brown]

    var body: some View {
        ScrollView {
            SquareAnim(Height: $Height, Height2: $Height2)
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding(.horizontal)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: Height),spacing: 10)],spacing: 10) {
                ForEach(0 ..< 10) { item in
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .frame( height: Height2)
                        .foregroundColor(colors[item % colors.count].opacity(0.6))
                }
            }
            .padding(.horizontal,10)
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
