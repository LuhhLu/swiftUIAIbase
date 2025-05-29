 
import SwiftUI

struct ContentView: View {
    @State var cards: [Card] = card
    @State var selectedCardId: UUID? = nil
    
    var body: some View {
        VStack {
            totalView()
                .padding(.top,100)
            Spacer()
            ZStack{
                ForEach(cards.indices,id:\.self) { card in
                    CardView(show: selectedCardId == cards[card].id,
                          card: cards[card],
                             select: {self.selectedCardId = $0 ? cards[card].id : nil})
                    .offset(y: calculateOffsetForCard(at: card))
                }
                 
            }
            .offset(y: 15)
             
        }
     
    }
    func calculateOffsetForCard (at index : Int)-> CGFloat{
        let selectedCardIndex = cards.firstIndex(where: {$0.id == selectedCardId})
        switch selectedCardIndex{
        case .none:
            return CGFloat(index * 80)
        case .some(let selectedIndex) where selectedIndex == index:
            return -300
        case .some(let selectedIndex):
            if selectedIndex < index{
                return CGFloat(index * 80)
            }else{
                return CGFloat((index + 1) * 83)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
