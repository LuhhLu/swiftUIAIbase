 

import SwiftUI

struct ContentView: View {
    @State var Icons = ["pencil.and.outline","scribble.variable","plus.magnifyingglass","square.fill.on.square.fill","triangle.fill","rhombus.fill",   "arrowshape.turn.up.left.fill"]
     @State var DragIcon:String?
    var body: some View {
        VStack {
            ForEach(Icons,id:\.self) { item in
                Image(systemName: item).foregroundColor(.white).font(.title2)
                    .padding(.vertical)
                    .draggable(item){
                        Image(systemName: item).foregroundColor(.white).font(.title2)
                            .onAppear(){
                                DragIcon = item
                            }
                    }
                //new update
                    .dropDestination(for: String.self) { _, _ in false }
                    isTargeted: { isOver in
                        guard let draggedItem = DragIcon, isOver, draggedItem != item,
                              let sourceIdx = Icons.firstIndex(of: draggedItem),
                              let destIdx = Icons.firstIndex(of: item) else { return }
                        withAnimation {
                            Icons.remove(at: sourceIdx)
                            Icons.insert(draggedItem, at: destIdx)
                        }
                    }
            }
        }
        .frame(width: 70)
        .background(.black,in:RoundedRectangle(cornerRadius: 10))
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.leading,10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
