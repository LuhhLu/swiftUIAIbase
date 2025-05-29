 

import SwiftUI

struct ContentView: View {
    @State  var rectangleHeight: CGFloat = 150
    @State  var dragOffset: CGFloat = 0
    @State  var Value: Int = 100
    var body: some View {
 
            ZStack(alignment:.bottom){
                Rectangle().frame(width: 60, height: 150)
                    .foregroundColor(.gray)
                Rectangle().frame(width: 60, height: min(150,max(0, rectangleHeight + dragOffset)))
                   
                
                    
            }
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        withAnimation {
                            dragOffset = -value.translation.height * 1.2
                            let newHEIGHT = min(150,max(0, rectangleHeight + dragOffset))
                            Value = Int((newHEIGHT / 150) * 100)
                        }
                    })
                    .onEnded({ value in
                        rectangleHeight = min(150,max(0, rectangleHeight + dragOffset))
                        dragOffset = 0
                    })
            )
            .clipShape(.rect(cornerRadius: 20))
            .frame(height: 150)
            .overlay {
                Text("\(Value)%")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .contentTransition(.numericText())
            }
            .scaleEffect(1.5)
        
   
       
    }
}

#Preview {
    ContentView()
}
