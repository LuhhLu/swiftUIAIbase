struct TapItem: Identifiable {
    var id = UUID()
    var icon: String
    var tap: Tap
}
var tapItems = [
    TapItem(icon: "pencil.and.outline", tap: .pencil),
    TapItem(icon: "sparkles", tap: .sparkles),
    TapItem(icon: "square.3.layers.3d.down.forward", tap: .square),
    TapItem(icon: "textformat.abc.dottedunderline", tap: .textformat),
    TapItem(icon: "squareshape", tap: .squareshape),
    TapItem(icon: "gear.circle", tap: .gear)
]
enum Tap: String {
    case pencil
    case sparkles
    case square
    case textformat
    case squareshape
    case gear
}

import SwiftUI

struct ContentView: View {
    @State var startX:CGFloat = UIScreen.main.bounds.width * -0.20
    @State var currentDragOffsetX:CGFloat = 0
    @State var endX:CGFloat = 0
    var body: some View {
        VStack {
            SideToolBar(startX: startX, currentDrahOffsetx: $currentDragOffsetX, endX: $endX)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SideToolBar:View{
    let startX:CGFloat
    @Binding var currentDrahOffsetx:CGFloat
    @Binding var endX:CGFloat
    @State private var selctedTap:Tap = .pencil
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 15, height: 80)
                .shadow(color: .black.opacity(0.3), radius: 10)
                .offset(x:39)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 72, height: 400)
                .overlay {
                    VStack(spacing: 35){
                        ForEach(tapItems) { item in
                            TabItems(item: item, selctedTap: $selctedTap)
                        }
                    }
                }
                 
        }
        .padding(.leading,5)
        .frame(maxWidth: .infinity,alignment: .leading)
        .offset(x: startX + currentDrahOffsetx + endX)
        .gesture(
            DragGesture()
                .onChanged{ value in
                    withAnimation(.spring()){
                        currentDrahOffsetx = value.translation.width
                    }
                }
                .onEnded{ value in
                    withAnimation(.spring()){
                        if currentDrahOffsetx > 10{
                            endX = -startX
                            currentDrahOffsetx = 0
                            
                        }else if endX != 0 && currentDrahOffsetx < 10{
                            endX = 0
                            currentDrahOffsetx = 0
                        }else{
                            currentDrahOffsetx = 0
                        }
                    }
                }
        )
        
     
    }
}
struct TabItems: View {
    let item:TapItem
    @Binding var selctedTap:Tap
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(selctedTap == item.tap ? .white : .clear)
                .frame(width: selctedTap == item.tap ? 55 : 40, height: selctedTap == item.tap ? 35 : 30)
            Image(systemName: item.icon)
                .font(.system(size: selctedTap == item.tap ? 30 : 20))
                .foregroundColor(selctedTap == item.tap ? .black : .white)
        }
        .onTapGesture {
            withAnimation{
                selctedTap = item.tap
            }
        }
    }
}
