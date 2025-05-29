 

import SwiftUI

struct SpaceButton: View {
    var body: some View {
        ZStack{
            MovingStarsView(spawnPoint: CGPoint(x: 200, y: 400))
            
            Capsule().stroke(lineWidth: 3)
                .frame(width: 300, height: 55)
            Text("Space Button")
                .font(.title.bold())
                .foregroundStyle(.white)
            
        }
        .mask {
            Capsule()
                .frame(width: 302, height: 57)
        }
     
     
    }
}

#Preview {
    SpaceButton()
}


import SwiftUI

// Define a struct to represent each star. It conforms to Identifiable so we can use it in a ForEach loop.
struct Star: Identifiable {
    let id = UUID() // Unique identifier for each star
    let diameter: CGFloat // Size of the star
}

struct StarView: View {
    @State private var position: CGPoint // Stores the current position of the star
    let diameter: CGFloat // Size of the star
    let direction: CGPoint // Determines the movement direction
    
    // Initializer: Sets the starting position and assigns a random movement direction
    init(startPoint: CGPoint, diameter: CGFloat) {
        _position = State(initialValue: startPoint) // Sets the initial position
        self.diameter = diameter
        self.direction = CGPoint(x: CGFloat.random(in: -1...1), y: CGFloat.random(in: -1...1)) // Random movement direction
    }
    
    var body: some View {
        Circle()
            .foregroundStyle(.white) // White circle to represent the star
            .frame(width: diameter, height: diameter) // Sets the size of the star
            .position(position) // Sets the initial position
            .onAppear {
                withAnimation(.linear(duration: 20)) { // Animate over 20 seconds
                    position.x += direction.x * 500 // Move the star horizontally
                    position.y += direction.y * 500 // Move the star vertically
                }
            }
    }
}

struct MovingStarsView: View {
    @State private var stars: [Star] = [] // Array to store all stars
    let spawnPoint: CGPoint // The point where stars appear
    let maxStars = 1000 // Maximum number of stars allowed at a time
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() // Black background to simulate space
            ForEach(stars) { star in // Loop through each star in the array
                StarView(startPoint: spawnPoint, diameter: star.diameter) // Create a new star view
            }
        }
        .onAppear {
            // Timer to generate new stars every 0.04 seconds
            Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { _ in
                addStar()
            }
        }
    }
    
    private func addStar() {
        if stars.count < maxStars { // Only add a new star if we haven't reached the limit
            let newStar = Star(diameter: CGFloat.random(in: 1...3)) // Create a new star with a random size
            stars.append(newStar) // Add it to the array
            
            // Remove the star after 10 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                stars.removeAll { $0.id == newStar.id }
            }
        }
    }
}

#Preview {
    MovingStarsView(spawnPoint: CGPoint(x: 200, y: 400))
}

