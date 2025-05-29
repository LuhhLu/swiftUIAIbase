 
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack(spacing:40) {
                UnevenRoundedRectangle(topLeadingRadius: 100, bottomLeadingRadius: 100, bottomTrailingRadius: 0, topTrailingRadius: 100, style: .continuous)
                    .frame(width: 200, height: 200)
                
                
                UnevenRoundedRectangle(topLeadingRadius: 50, bottomLeadingRadius: 10, bottomTrailingRadius: 50, topTrailingRadius: 10, style: .continuous)
                    .frame(width: 300, height: 100)
                
                
                UnevenRoundedRectangle(topLeadingRadius: 50, bottomLeadingRadius: 10, bottomTrailingRadius: 50, topTrailingRadius: 10, style: .continuous)
                    .frame(width: 100, height: 100)
                
                
                UnevenRoundedRectangle(topLeadingRadius: 50,       bottomLeadingRadius: 10,
                    bottomTrailingRadius: 10,
                    topTrailingRadius: 50,
                                       style: .continuous)
                    .frame(width: 300, height: 150)
                
                
                UnevenRoundedRectangle(topLeadingRadius: 190,       bottomLeadingRadius: 0,
                    bottomTrailingRadius: 20,
                    topTrailingRadius: 0,
                                       style: .continuous)
                    .frame(width: 200, height: 200)
                
                
                UnevenRoundedRectangle(topLeadingRadius: 40,       bottomLeadingRadius: 40,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 60,
                                       style: .continuous)
                    .frame(width: 300, height: 100)
                
            
         
            }
        }
 
      
     
    }
}

#Preview {
    ContentView()
}
