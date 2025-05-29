 
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack(spacing:60){
                PortfolioReturnView()
                    .frame(height: 220)
                
                BitcoinView()
                
                TotalIncomeView()
                
                BitcoinWidgetView()
                
            }
            .safeAreaPadding()
        }
        .safeAreaPadding(.vertical,50)
    }
}

#Preview {
    ContentView()
}
