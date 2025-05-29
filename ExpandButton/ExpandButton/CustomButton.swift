 

import SwiftUI

struct CustomButton: View {
    @State var Expand = false
    var title:String
    var color:Color
    var action:() -> Void
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: Expand ? 5 : 10)
                .frame(width: Expand ? 300 : 190, height:Expand ? 25 : 50)
                .foregroundStyle(Color(color))
            Text(title).foregroundStyle(.black)
                .kerning(Expand ? 15 : 5)
                .frame(width: 300, height: 50)
                .offset(x: Expand ? 8 : 5)
            
        }
        .animation(.default, value: Expand)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ _ in
                    Expand = true
                })
                .onEnded({ _ in
                    Expand = false
                    action()
                })
        )
    }
}

//#Preview {
//    ContentView()
//}
