

import SwiftUI

struct CardView: View {
    var show: Bool
    var card: Card
    var select: (Bool) -> Void
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top){
                Text(card.cardname).bold().font(.title2)
                +
                Text(" Card").font(.title2)
                Spacer()
                Image(systemName: card.logo).font(.title)
                    .padding()
                    .background(.ultraThinMaterial, in: Circle())
                    .frame(width: 60)
                
            }
            Text(card.num).bold().font(.system(size: 45))
            +
            Text(" .00").font(.title)
            Spacer()
            HStack{
                Text("***").font(.title)
                +
                Text(" 8790").font(.title3)
                    .baselineOffset(7)
                Spacer()
                Text("27/03").font(.title3)
            }
            .offset(y: 8)
            
        }
        .foregroundColor(.white)
        .padding(10)
        .frame(height: 230)
        .background(Color(card.color), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)){
                select(!show)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            show: false,
            card: Card(color:  "c1", cardname: "Shop", logo: "gamecontroller", num: "65,973"),
            select: { selected in print("Card selected: \(selected)") }
        )
    }
}
