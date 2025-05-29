 

import SwiftUI

struct CustomButtonView: View {
    var text: String
    var color: Color
 
    var ontapGestur: () -> ()
    var body: some View {
        ZStack{
           Circle()
                .foregroundStyle(color.opacity(0.3))
                .frame(width: 80, height: 80)
            Text(text)
                .foregroundStyle(color)
                .onTapGesture {
                    ontapGestur()
                }
                
        }
    }
}

#Preview {
    CustomButtonView(text: "Cancel", color: .green, ontapGestur: {})
}
