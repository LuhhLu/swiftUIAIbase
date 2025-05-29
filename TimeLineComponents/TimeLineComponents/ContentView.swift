
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 60) {
                DeliveryTimelineView()
                Divider()
               
                OrderTimelineView()
                Divider()
                
                ShipmentTimelineView()
              
                Divider()
                InvestmentTimelineView()
            }
        }
    }
}

#Preview {
    ContentView()
}
