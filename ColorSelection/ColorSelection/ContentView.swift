

import SwiftUI
struct ColorM:Identifiable{
    var id = UUID()
    var color:Color
}
struct ContentView: View {
    @State var colors:[ColorM] = [ ColorM(color: .b1),ColorM(color: .b3),ColorM(color: .b6),ColorM(color: .b13),ColorM(color: .b10),ColorM(color: .b2),ColorM(color: .b15) ,ColorM(color: .b12),ColorM(color: .b14),ColorM(color: .b5)]
    
    @State var selectedC:Color = .b1
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 20).frame(width: 100, height: 100)
                .foregroundStyle(selectedC)
            LazyHGrid(rows: Array(repeating: GridItem(), count: 2), content: {
                ForEach(colors) { color in
                    Circle().frame(width: 40, height: 40)
                        .foregroundStyle(color.color)
                        .opacity(0.8)
                        .scaleEffect(selectedC  == color.color ? 0.7 : 1)
                        .onTapGesture {
                            withAnimation {
                                selectedC = color.color
                                print("\(selectedC)")
                                
                            }
                        }
                        .overlay {
                            Circle().stroke(lineWidth: 3)
                                .foregroundStyle(selectedC == color.color ? .white : .clear)
                        }
                    
                }
            })
            .frame(height: 100)
        }
        .padding()
        .background(.black.opacity(0.8),in:RoundedRectangle(cornerRadius: 20))
        
    }
}

#Preview {
    ContentView()
}
