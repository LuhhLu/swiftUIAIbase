
import SwiftUI

struct ColorPair:Identifiable{
    var id = UUID()
    let color1: Color
    let color2: Color
    
}

struct ContentView: View {
    @Namespace var iconTransition
    @State var selcttedRectIndices = Set<UUID>()
    @State var iconScale: [UUID:CGFloat] = [:]
    @State var showChecMark: [UUID:Bool] = [:]
    let columns:[GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let colorPairs:[ColorPair] = [
        ColorPair(color1: .red, color2: .yellow),
        ColorPair(color1: .green, color2: .blue),
        ColorPair(color1: .purple, color2: .pink),
        ColorPair(color1: .orange, color2: .gray),
        ColorPair(color1: .black, color2: .white),
        ColorPair(color1: .blue, color2: .red)
    ]
    var body: some View {
        LazyVGrid(columns: columns,spacing: 15) {
            ForEach(colorPairs) { items in
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 160, height: 160)
                        .foregroundColor(.clear)
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(AngularGradient(gradient: Gradient(colors: [items.color1,items.color2]), center: .center))
                        .scaleEffect(selcttedRectIndices.contains(items.id) ? 0.8 : 1)
                        .frame(width: 160, height: 160)
                        .overlay(alignment: .bottomTrailing) {
                            ZStack{
                           Image(systemName: "circle")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .scaleEffect(iconScale[items.id] ?? 1)
                                if showChecMark[items.id] == true{
                                    ZStack{
                                        Circle()
                                            .frame(width: 28)
                                            .foregroundColor(.blue)
                                        Image(systemName:"checkmark.circle")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .scaleEffect(iconScale[items.id] ?? 1)
                                        
                                        
                                    }
                                }
                            }
                            .padding(5)
                        }
                        .onTapGesture {
                            withAnimation {
                                if selcttedRectIndices.contains(items.id){
                                    selcttedRectIndices.remove(items.id)
                                    iconScale[items.id] = 1
                                    showChecMark[items.id] = false
                                    
                                }else{
                                    selcttedRectIndices.insert(items.id)
                                    iconScale[items.id] = 0.2
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                                        withAnimation (.spring()){
                                            iconScale[items.id] = 1
                                           
                                        }
                                        showChecMark[items.id] = true
                                        
                                    }
                                }
                            }
                        }
                }
            }
        }
        .padding(.horizontal,30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
