 

import SwiftUI
struct CardDetails{
    var icon:String
    var title:String
    var money:String
    var date:String
    var time:String
}
struct Cardtransitions: View {
    var cards: [CardDetails] = [
        CardDetails(icon: "bitcoinsign", title: "Bitcoin transaction", money: "$15.50", date: "Today", time: "11:35"),
        CardDetails(icon: "creditcard.fill", title: "Cash back reward", money: "$10.50", date: "Sunday, 23 April", time: "15:45"),
        CardDetails(icon: "creditcard.fill", title: "Cash back reward", money: "$15.50", date: "Monday, 29 April", time: "11:15"),
        CardDetails(icon: "music.note.list", title: "Music Subscription", money: "$9.50", date: "Monday, 12 April", time: "16:00"),
        CardDetails(icon: "cart.fill", title: "Shopping Payment", money: "$13.75", date: "Saturday, 10 April", time: "11:20"),
        CardDetails(icon: "airplane.departure", title: "Flight Ticket", money: "$120.99", date: "Friday, 09 April", time: "05:00")
    ]

    var color: Color
    @Binding var isCurrent: Bool
    var body: some View {
        VStack(spacing:50) {
            masterCard(color: color)
                VStack(spacing:5){
                    ForEach(cards.indices,id: \.self){ item in
                            HStack{
                                Image(systemName: cards[item].icon).font(.title3) .bold()
                                VStack(alignment:.leading){
                                    Text(cards[item].title)
                                    Text(cards[item].date).font(.footnote)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                VStack(alignment:.trailing){
                                    Text(cards[item].money)
                                    Text(cards[item].time).font(.footnote)
                                        .foregroundStyle(.secondary)
                                }

                            }
                            .padding(15)
                            .opacity(isCurrent ? 1 : 0)
                            .offset(y: isCurrent ? 0 : Double(item) * 10)
                            .animation(.easeIn.delay(Double(item) * 0.1), value: isCurrent)
                        
                        
                    }
                    .frame(width: 310)
                }
                .padding(10)
                .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 15))
                .opacity(isCurrent ? 1 : 0)

        }
    }
}

