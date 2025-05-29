 

import SwiftUI

struct ContentView: View {
    // These are like sliders for adjusting the size of the views on your screen.
    @State private var TopViewHeight: CGFloat = 0 // This keeps track of how tall the top view is.
    @State private var ButtomViewHeight: CGFloat = 0 // This one does the same for the bottom view.
    @State private var totalAvailableHeight: CGFloat = 0 // This is the total space we have to fit both views.
    let movementSensitivity: CGFloat = 1 / 3 // This makes the dragging feel slower so it's easier to control.
    let minViewHeight: CGFloat = 150 // This makes sure neither view gets too squished, at least 150 tall.


    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                RectangleView(color: .red)
                    .frame(height: TopViewHeight) // Red stack view

                // Draggable divider with a black background and a white, rounded rectangle as the handle
                ZStack{
                    Rectangle()
                        .frame(maxWidth: .infinity).foregroundStyle(.black)
                        .frame(height: 30)
                    RoundedRectangle(cornerRadius: 10).foregroundStyle(.white)
                        .frame(width: 60, height: 10)
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            // How far did you move your finger? Let's not go too fast, so we use movementSensitivity to slow it down.
                            let speedORdragAmount = value.translation.height * movementSensitivity
                            
                            // Let's figure out how tall the red (top) view should be now. But we won't let it get smaller than 150.
                            let newRedHeight = max(minViewHeight, TopViewHeight + speedORdragAmount)
                            
                            // Do the same for the   (bottom) view, making sure it also doesn't get too small.
                            let newBlueHeight = max(minViewHeight, ButtomViewHeight - speedORdragAmount)
                            
                            // Add up the heights to see if they fit in our total space.
                            let newTotalHeight = newRedHeight + newBlueHeight
                            
                            // If they fit, update the heights to these new values.
                            if newTotalHeight <= totalAvailableHeight {
                                TopViewHeight = newRedHeight
                                ButtomViewHeight = newBlueHeight
                            } else {
                                // Checking the direction of your drag...
                                if speedORdragAmount > 0 { // If you're dragging down...
                                    // Make sure the top view isn't too small, but adjust its height based on how much room is left.
                                    TopViewHeight = max(minViewHeight, totalAvailableHeight - ButtomViewHeight)
                                    // After adjusting the top view, do the same for the bottom view to fit the remaining space.
                                    ButtomViewHeight = max(minViewHeight, totalAvailableHeight - TopViewHeight)
                                } else if speedORdragAmount < 0 { // If you're dragging up...
                                    // This time, make sure the bottom view adjusts first, so it's not too small and fits the leftover space.
                                    ButtomViewHeight = max(minViewHeight, totalAvailableHeight - TopViewHeight)
                                    // Then, adjust the top view similar to how we did for the bottom view, ensuring it fits too.
                                    TopViewHeight = max(minViewHeight, totalAvailableHeight - ButtomViewHeight)
                                }

                            }
                        }
                )
                RectangleView(color: .blue)
                    .frame(height: ButtomViewHeight)
            }
            .onAppear {
                totalAvailableHeight = geometry.size.height
                TopViewHeight = totalAvailableHeight / 2
                ButtomViewHeight = totalAvailableHeight / 2
            }
        }
        .ignoresSafeArea()
    }

}

#Preview {
    ContentView()
}
struct RectangleView: View {
    let color:Color
    var body: some View {
            RoundedRectangle(cornerRadius: 0).foregroundStyle(color)
                .frame(maxWidth: .infinity)
//            .ignoresSafeArea()
    }
    
}
