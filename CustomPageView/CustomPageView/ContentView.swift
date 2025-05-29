 

import SwiftUI
struct Item:Identifiable {
    var  id  = UUID()
    let color: Color
    let text: String
}

struct ContentView: View {
    @State private var currentIndex: Int = 0
    @State private var dragOffset: CGFloat = 0

    private let numberOfItems: Int = 5
    private let itemWidth: CGFloat = 300
    private let peekAmount: CGFloat = -10
    private let dragThreshold: CGFloat = 100
    let items: [Item] = [
        Item(color: .red, text: "Learn SwiftUI"),
        Item(color: .blue, text: "Learn UIkit"),
        Item(color: .green, text: "Learn CoreData"),
        Item(color: .yellow, text: "Learn CloudKit"),
        Item(color: .purple, text: "Learn Fierbase")
    ]
    
    
    
    
    var body: some View {
        GeometryReader{ geometry in
            HStack(spacing: peekAmount){
                ForEach(items.indices,id: \.self) { index in
                    RoundedRectangle(cornerRadius: 20).foregroundColor(items[index].color)
                        .frame(width: itemWidth, height: 450)
                        .overlay(alignment: .bottomLeading) {
                            Text(items[index].text)
                                .foregroundColor(.black).font(.title).bold()
                                .offset(y: 40)
                                .opacity(self.opacityForText(at: index, in: geometry))
                        }
                        .scaleEffect(self.scaleValueForItem(at: index, in: geometry))
                    
                }
            }
            .offset(x: calculateOffset() + dragOffset)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged{ value in
                        withAnimation(.interactiveSpring()){
                            dragOffset = value .translation.width
                        }
                        
                    }
                    .onEnded{ value in
                        withAnimation(.interactiveSpring()){
                            finalizePosition(dragValue: value)
                            dragOffset = 0
                        }
                        
                        
                    }
            )
            
        }
        .padding(.leading)
        .offset(y: 150)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    /// Calculates the horizontal offset for the `HStack` of items.
    /// - Returns: The computed offset based on the current index.
    func calculateOffset() -> CGFloat {
        // Compute the total width of an item, including the peek amount (the visible part of neighboring items)
        let totalItemWidth = itemWidth + peekAmount
        // Calculate the base offset based on the current item's index. We multiply with the negative value to move items left.
        let baseOffset = -CGFloat(currentIndex) * totalItemWidth
        return baseOffset
    }




    /// Calculates the scale value for an item based on its distance from the center.
    /// - Parameters:
    ///   - index: The index of the item.
    ///   - geometry: Provides the size and coordinate space information of the parent view.
    /// - Returns: The scale factor for the item.
    func scaleValueForItem(at index: Int, in geometry: GeometryProxy) -> CGFloat {
        // Calculate the current item's offset including any dragging offset
        let currentItemOffset = calculateOffset() + dragOffset
        // Calculate the position of the item based on its index
        let itemPosition = CGFloat(index) * (itemWidth + peekAmount) + currentItemOffset
        // Calculate how far the item is from the center of the screen
        let distanceFromCenter = abs(geometry.size.width / 2 - itemPosition - itemWidth / 2)
        // Calculate the scale value based on its distance from the center
        let scale: CGFloat = 0.8 + (0.2 * (1 - min(1, distanceFromCenter / (itemWidth + peekAmount))))
        return scale
    }




    /// Finalizes the position of the carousel after a drag gesture has ended.
    /// - Parameter dragValue: The value that encapsulates the properties of the drag gesture.
    func finalizePosition(dragValue: DragGesture.Value) {
        // Check if the drag was to the right and exceeds the threshold, and we're not already at the first item
        if dragValue.predictedEndTranslation.width > dragThreshold && currentIndex > 0 {
            currentIndex -= 1  // Decrement the current index
        }
        // Check if the drag was to the left and exceeds the threshold, and we're not already at the last item
        else if dragValue.predictedEndTranslation.width < -dragThreshold && currentIndex < numberOfItems - 1 {
            currentIndex += 1  // Increment the current index
        }
    }





    /// Calculates the opacity for the text of an item based on its distance from the center.
    /// - Parameters:
    ///   - index: The index of the item.
    ///   - geometry: Provides the size and coordinate space information of the parent view.
    /// - Returns: The opacity value for the item's text.
    func opacityForText(at index: Int, in geometry: GeometryProxy) -> Double {
        // Calculate the current item's offset including any dragging offset
        let currentItemOffset = calculateOffset() + dragOffset
        // Calculate the position of the center of the item based on its index
        let itemPosition = CGFloat(index) * (itemWidth + peekAmount) + currentItemOffset + itemWidth / 2
        // Calculate how far the center of the item is from the center of the screen
        let distanceFromCenter = abs(geometry.size.width / 2 - itemPosition)
        // Use half the item's width as the threshold for maximum opacity
        let threshold: CGFloat = itemWidth / 2
        // Compute the opacity value based on the distance from the center
        let opacity = min(1, max(0, (threshold - distanceFromCenter) / threshold))
        return Double(opacity)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


