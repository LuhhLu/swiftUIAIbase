 

import SwiftUI
import UIKit
struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                NavigationLink(destination: HomeTow()) {
                    Text("View 1").bold().font(.title2).foregroundStyle(.white)
                        .frame(width: 100, height: 60).background(.black,in:RoundedRectangle(cornerRadius: 10))
                }
            }
        }
       
         
    }
}

#Preview {
    ContentView()
}

struct HomeTow: View {
    @Environment(\.dismiss) var  dismiss
    var body: some View {
        NavigationStack{
            ZStack{
                SwipeBackGesture{
                    self.dismiss()
                }
                NavigationLink(destination: HomeThree()) {
                    Text("View 2").bold().font(.title2).foregroundStyle(.white)
                        .frame(width: 100, height: 60).background(.black,in:RoundedRectangle(cornerRadius: 10))
                }
                
            }
        }
        
    }
}
struct HomeThree: View {
    @Environment(\.dismiss) var  dismiss
    var body: some View {
        ZStack{
            SwipeBackGesture{
                self.dismiss()
            }
            Text("View 3").bold().font(.title2).foregroundStyle(.white)
                .frame(width: 100, height: 60).background(.black,in:RoundedRectangle(cornerRadius: 10))
        }
    }
}


 



// SwipeBackGesture is a custom gesture implemented using UIViewControllerRepresentable.
struct SwipeBackGesture: UIViewControllerRepresentable {
    // A closure to be called when a swipe-back gesture is detected.
    var onSwipe: () -> Void

    // Create a coordinator to manage the gesture recognizer.
    func makeCoordinator() -> Coordinator {
       Coordinator(self)
    }

    // Create a UIViewController to host the gesture recognizer.
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let gestureRecognizer = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan))
        viewController.view.addGestureRecognizer(gestureRecognizer)  // Add the gesture recognizer to the view.
      return viewController
         
    }

    // Update the UIViewController - in this case, there is nothing to update.
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    // The Coordinator class manages the gesture recognizer.
    class Coordinator: NSObject {
        var swipeBackGesture:SwipeBackGesture  // Reference to the SwipeBackGesture struct.

        // Initialize the coordinator with a reference to the SwipeBackGesture struct.
        init(_ swipeBackGesture: SwipeBackGesture) {
            self.swipeBackGesture = swipeBackGesture
        }

        // Handle the pan gesture, checking the translation to determine if the swipe-back action should be triggered.
        @objc func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
             // Calculate progress based on the translation.
            let translation = gestureRecognizer.translation(in: nil)
            let progress  = translation.x / 200
            if gestureRecognizer.state == .ended{
                if progress > 0.5{
                    swipeBackGesture.onSwipe()  // Call the onSwipe closure if progress is sufficient.
                }
            }
                   
               
            
        }
    }
}


