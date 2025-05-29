 



import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomCircularChart(
            segments: [
                CircularSegment(color: .purple, value: 500, transactions: [
                    Transaction(icon: "🛒", title: "Bought iPhone 15", date: "Feb 10, 2025", amount: 999.99),
                    Transaction(icon: "🍔", title: "McDonald's Meal", date: "Feb 12, 2025", amount: 12.99),
                    Transaction(icon: "📦", title: "Amazon Order", date: "Feb 15, 2025", amount: 54.99),
                    Transaction(icon: "🎮", title: "PS5 Game", date: "Feb 20, 2025", amount: 69.99),
                    Transaction(icon: "🎟", title: "Concert Ticket", date: "Feb 25, 2025", amount: 120.00)
                ]),
                
                CircularSegment(color: .blue, value: 350, transactions: [
                    Transaction(icon: "🚗", title: "Uber Ride", date: "Feb 14, 2025", amount: 22.50),
                    Transaction(icon: "⛽", title: "Gas Station", date: "Feb 16, 2025", amount: 45.00),
                    Transaction(icon: "🏨", title: "Hotel Booking", date: "Feb 18, 2025", amount: 300.00),
                    Transaction(icon: "🛠", title: "Car Repair", date: "Feb 22, 2025", amount: 180.00),
                    Transaction(icon: "🛵", title: "Food Delivery", date: "Feb 28, 2025", amount: 20.00)
                ]),
                
                CircularSegment(color: .red, value: 250, transactions: [
                    Transaction(icon: "💊", title: "Pharmacy Purchase", date: "Feb 11, 2025", amount: 30.00),
                    Transaction(icon: "🏋️", title: "Gym Membership", date: "Feb 13, 2025", amount: 50.00),
                    Transaction(icon: "🍕", title: "Pizza Night", date: "Feb 17, 2025", amount: 22.99),
                    Transaction(icon: "🎬", title: "Movie Ticket", date: "Feb 19, 2025", amount: 15.00),
                    Transaction(icon: "🏥", title: "Doctor's Visit", date: "Feb 23, 2025", amount: 90.00),
                    Transaction(icon: "🛏", title: "Furniture Purchase", date: "Feb 27, 2025", amount: 199.99)
                ]),
                
                CircularSegment(color: .yellow, value: 400, transactions: [
                    Transaction(icon: "🛩", title: "Flight Ticket", date: "Feb 9, 2025", amount: 450.00),
                    Transaction(icon: "🧳", title: "Luggage", date: "Feb 10, 2025", amount: 120.00),
                    Transaction(icon: "🌍", title: "Travel Insurance", date: "Feb 12, 2025", amount: 35.00),
                    Transaction(icon: "🍽", title: "Fine Dining", date: "Feb 18, 2025", amount: 150.00),
                    Transaction(icon: "🛍", title: "Shopping", date: "Feb 21, 2025", amount: 89.99),
                    Transaction(icon: "🏖", title: "Resort Stay", date: "Feb 24, 2025", amount: 600.00),
                    Transaction(icon: "🎢", title: "Theme Park", date: "Feb 26, 2025", amount: 80.00)
                ]),
                
                CircularSegment(color: .green, value: 300, transactions: [
                    Transaction(icon: "📚", title: "Bookstore", date: "Feb 7, 2025", amount: 35.00),
                    Transaction(icon: "🎸", title: "Music Lessons", date: "Feb 9, 2025", amount: 75.00),
                    Transaction(icon: "🏀", title: "Basketball Game", date: "Feb 15, 2025", amount: 110.00),
                    Transaction(icon: "🎭", title: "Theater Play", date: "Feb 20, 2025", amount: 45.00),
                    Transaction(icon: "🎤", title: "Karaoke Night", date: "Feb 22, 2025", amount: 25.00),
                    Transaction(icon: "🚴", title: "Bike Rental", date: "Feb 27, 2025", amount: 15.00)
                ])
                
            ]
        )

    }
}

#Preview {
    ContentView()
}
