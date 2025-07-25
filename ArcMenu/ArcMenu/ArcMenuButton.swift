

import SwiftUI

struct ArcMenuButton: View {
    @State var isExpanded = false
    let buttons:[String]
    var body: some View {
        ZStack{
            ForEach(buttons.indices,id: \.self) { index in
                Image(systemName: buttons[index])
                    .frame(width: 10, height: 10)
                    .padding()
                    .background(Color(.systemGray6))
                    .foregroundColor(.gray)
                    .cornerRadius(20)
                    .offset(x: isExpanded ? CGFloat(cos((Double(index) * 45 + 135) * Double.pi / 180) * 60): 0, y: isExpanded ? CGFloat(sin((Double(index) * 45 + 135) * Double.pi / 180) * 60): 0)
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0).delay(Double(index) * 0.15), value: isExpanded)
                
            }
            Button {
                withAnimation {
                    isExpanded.toggle()
                }
            } label: {
                Image(systemName: isExpanded ? "xmark" : "plus")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .padding(15)
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
            }

        }
    }
}

struct ArcMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        ArcMenuButton(buttons: ["circle","star","bell","bookmark"])
    }
}
