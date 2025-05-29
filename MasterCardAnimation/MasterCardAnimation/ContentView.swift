 
import SwiftUI
struct ColorItem: Identifiable {
    let id = UUID()
    let color: Color
}
struct ContentView: View {
    @State private var currentIndex = 0
    var items: [ColorItem] = [
        ColorItem(color: .red),
        ColorItem(color: .yellow) ,
        ColorItem(color: .green),
        ColorItem(color: .purple)
    ]
    

    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:0){
                ForEach(Array(items.enumerated()),id: \.element.id) { index ,item in
                    Cardtransitions(color: item.color, isCurrent: .constant(currentIndex == index))
                        .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                        .background(GeometryReader { geo -> Color in
                            DispatchQueue.main.async {
                                let minX = geo.frame(in: .global).minX - geo.size.width / 5 + 100
                                if abs(minX) < 100 {
                                    currentIndex = index
                                }
                              
                            }
                            return Color.clear
                            
                        })
                }
                
            }
           
        }
        .overlay {
            HStack(spacing:10){
                ForEach(0..<items.count ,id:\.self) { item in
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(currentIndex == item ? .black : .gray)
                }
            }
            .animation(.spring, value: currentIndex)
            .offset(y: -128)
        }
        .scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ContentView()
}

 
