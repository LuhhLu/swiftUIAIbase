 

import SwiftUI

struct ContentView: View {
    @State var ShowTab: Bool = false
    var body: some View {
       
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                ForEach(0 ..< 15) { item in
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.gray.tertiary)
                        .frame(height: 200)
                }
            }
        }
        .safeAreaPadding(.horizontal,10).scrollIndicators(.hidden)
        
        .overlay(alignment: .bottom) {
            if ShowTab{
                CustomTabBar()
                    .transition(.offset(y: 300))
             }
        }

        .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
            geometry.contentOffset.y
        }, action: { oldValue, newValue in
            
            if newValue > oldValue { withAnimation { ShowTab = false } }
            else { withAnimation { ShowTab = true } }
            
        })
    }
}

#Preview {
    ContentView()
}
