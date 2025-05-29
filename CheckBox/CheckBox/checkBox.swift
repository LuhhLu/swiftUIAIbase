 
import SwiftUI

struct checkBox: View {
    @State var isComplete = false
    @State var degrees = false
    @State var opacity = false
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius:12).foregroundStyle(.blue)
                .frame(width: 40, height: 40)
                .scaleEffect(isComplete ? 1.8 : 0)
                .opacity(opacity ? 0 : 0.5)
            RoundedRectangle(cornerRadius:isComplete ? 12 : 20)
                .frame(width: 40, height: 40)
                .foregroundStyle(isComplete ? .blue : .white)
            Image(systemName: "checkmark").bold()
                .opacity(isComplete ? 1 : 0)
                .foregroundStyle(.white)
        }
        .rotationEffect(.degrees(degrees ? -20 : 0))
        .scaleEffect(2)
        .onTapGesture {
            withAnimation {
                isComplete.toggle()
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                degrees.toggle()
                opacity.toggle()
            }
            
            withAnimation(.easeInOut(duration: 0.5).delay(0.7)) {
                degrees.toggle()
            }
        }
       
    }
}

#Preview {
    checkBox()
}
