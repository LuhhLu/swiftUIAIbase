 
import SwiftUI

struct CardsView: View {
    @State private var selection: Person.ID?
    @State private var people: [Person] = peopleData
    @State private var selectedPeople: [Person] = []

    @State private var isDragging = false
    @State private var offset = CGSize.zero
    @State private var cardOffset = CGSize.zero
    
    private let screenMidX = UIScreen.main.bounds.midX
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack(spacing: 12) {
                    Image(systemName: "person.slash.fill")
                 
                        .frame(width: geometry.size.width)
                        .font(.largeTitle)
                    
                    Text("There are no more people in the area")
                        .bold()
                       
                }
                .frame(maxHeight: .infinity)
                
                ForEach(people.reversed()) { person in
                    CardView(person: person, size: geometry.size, isDragging: $isDragging, cardOffset: $cardOffset, selection: $selection)
                }
            }
            
            MarkView(
                kind: .check,
                offset: $offset,
                cardOffset: $cardOffset
            )
            
            MarkView(
                kind: .x,
                offset: $offset,
                cardOffset: $cardOffset
            )
        }
        .gesture(
            DragGesture()
                .onChanged(performDragGesture(_:))
                .onEnded(finishDragGesture(_:))
        )
        .onAppear {
            selection = people.first?.id
        }
    }
}

private extension CardsView {
    func performDragGesture(_ value: DragGesture.Value) {
        isDragging = true
        offset = value.translation
        cardOffset = value.translation
    }
    
    func finishDragGesture(_ value: DragGesture.Value) {
        isDragging = false
        withAnimation { offset = .zero }
        
        if value.translation.width > 0 {
            if value.translation.width > screenMidX {
                likePerson()
            } else {
                withAnimation { cardOffset = .zero }
            }
        } else {
            if value.translation.width < -screenMidX {
                discardPerson()
            } else {
                withAnimation { cardOffset = .zero }
            }
        }
    }
    
    func likePerson() {
        withAnimation {
            cardOffset.width = screenMidX*3
        } completion: {
            if let person = people.first {
                selectedPeople.append(person)
            }
            people.removeFirst()
            cardOffset = .zero
            selection = people.first?.id
        }
    }
    
    func discardPerson() {
        withAnimation {
            cardOffset.width = -screenMidX*3
        } completion: {
            people.removeFirst()
            cardOffset = .zero
            selection = people.first?.id
        }
    }
}

#Preview {
    CardsView()
}
