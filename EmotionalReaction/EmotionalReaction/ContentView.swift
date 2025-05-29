 
import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var close = false
    @State var icon  = ""
    var body: some View {
        Image(.im1).resizable().scaledToFill()
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .onTapGesture(count: 2, perform: {
                icon = "❤️"
            })
            .onTapGesture {
                withAnimation {
                    show = false
                }
            close = false
            }
            .onLongPressGesture(maximumDistance: 0.1) {
                withAnimation {
                    show.toggle()
                    close = true
                    
                }
            }
           
            .overlay(alignment: .topLeading, content: {
                if close{
                    EmojiView(selectedIcon: $icon)
                        .offset(y: -45)
                    
                }
            })
            .overlay(alignment: .bottomTrailing, content: {
                if !icon.isEmpty{
                    Text(icon).offset(y: 0.4)
                        .frame(width: 30, height: 30)
                        .background(Color(.BG),in:Circle())
                        .offset(x: 10, y: 10)
                }
            })
            .scaleEffect(show ? 1.2 : 1)
             
            
        
    }
}

#Preview {
    ContentView()
}
