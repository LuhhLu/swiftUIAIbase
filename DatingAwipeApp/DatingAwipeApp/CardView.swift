 
import SwiftUI

struct CardView: View {
    let person: Person
    let size: CGSize
    
    @Binding var isDragging: Bool
    @Binding var cardOffset: CGSize
    @Binding var selection: Person.ID?
    
    var body: some View {
        ScrollView {
            PersonContentView(person: person, size: size)
        }
        .scrollIndicators(.hidden)
        .scrollDisabled(selection == person.id ? isDragging : true)
        .background(.BG)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .offset(x: selection == person.id ? cardOffset.width : 0, y: 0)
        .rotationEffect(selection == person.id ? .degrees(Double(cardOffset.width/40)) : .zero)
    }
}
