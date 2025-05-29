 

















import SwiftUI

struct ContentView: View {
    var cards: [CardMode] = [
        CardMode(TColor: .t1, BColor: .t1, name: "youssef", num: "*** *** *** 351"),
        CardMode(TColor: .t2, BColor: .t2, name: "Sucodee", num: "*** *** *** 352"),
        CardMode(TColor: .t3, BColor: .t3, name: "Massimo", num: "*** *** *** 353")
    ]
    @State var show = false
    @Namespace  var namespace
    @State var selectedCard: CardMode? = nil
    var body: some View {
        ZStack{
            if let selectedCard = selectedCard ,show{
                OpenCardView(close: $show, data: selectedCard, namespace: namespace)
                    
            }else{
                ScrollView {
                    VStack {
                        ForEach(cards) { item in
                            CardView(data: item, namespace: namespace)
                                .matchedGeometryEffect(id: item.id, in: namespace)
                                .onTapGesture {
                                    selectedCard = item
                                    withAnimation(.spring(duration: 0.2)) {
                                        show = true
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
