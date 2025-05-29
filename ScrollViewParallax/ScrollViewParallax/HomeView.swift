 

import SwiftUI

struct HomeView: View {
    @Namespace var Namespace
    @State var show = false
    @State var selected = UUID()
    @State private var currentIndex: Int = 0
    @State private var dragOffset: CGFloat = 0
    private var numberOfItems: Int {
        return imagess.count
    }
    @State var itemWidth: CGFloat = 340
    private let peekAmount: CGFloat = -10
    private let dragThreshold: CGFloat = 100
    
    var body: some View {
        ZStack{
            if !show{
                GeometryReader{ geometry in
                    HStack(spacing:peekAmount){
                        ForEach(imagess.indices,id: \.self) { image in
                       ImageCard(Namespace: Namespace, imageInfo: imagess[image], show: $show, itemWidth: $itemWidth)
                                .frame(width: itemWidth)
                                .scaleEffect(self.scaleValueForItem(at: image, in: geometry))
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation {
                                        show.toggle()
                                        selected = imagess[image].id
                                    }
                                }
                            
                            
                        }
                    }
                    .offset(x: calculateOffset() + dragOffset)
                    .gesture(
                        DragGesture(coordinateSpace: .global)
                            .onChanged({ value in
                                withAnimation(.interactiveSpring()) {
                                    dragOffset = value .translation.width
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.interactiveSpring()) {
                                    finalizePosition(dragValue: value)
                                    dragOffset =  0
                                }
                            })
                    )
                    
                }
                .padding(.leading)
                .offset(y: 150)
                
            }
            if show{
                ForEach(imagess) { image in
                    if image.id == selected {
                        ImageDetails(Namespace: Namespace, imageInfo: image, show: $show)
                            .overlay(alignment: .topTrailing) {
                                Button {
                                    withAnimation {
                                        show = false
                                    }
                                } label: {
                                    Image(systemName: "xmark").font(.title3).foregroundStyle(.white)
                                        .padding(10)
                                        .background(.ultraThinMaterial)
                                        .clipShape(Circle())
                                }
                                .padding(.trailing)
                                

                            }
                        
                    }
                }
            }
        }
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
}

#Preview {
    HomeView()
}
