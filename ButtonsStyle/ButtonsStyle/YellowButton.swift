 

import SwiftUI

struct YellowButton: View {
    var body: some View {
        Button(action: {}, label: {
            Text("Shop now")
        }).buttonStyle(YellowButtonStyle())
    }
}

#Preview {
    YellowButton()
}
struct YellowButtonStyle:ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 155, height: configuration.isPressed ? 63 : 67)
                .foregroundStyle(.black)
                .offset(y: configuration.isPressed ? 0.2 : 3)
            configuration.label.bold()
                .offset(y: configuration.isPressed ? -0.5 : 0)
                .foregroundStyle( configuration.isPressed ? .white : .black)
                .frame(width: 150, height: 60)
                .background(configuration.isPressed ? .cyan : .yellow ,in: .rect(cornerRadius: 12))
                .overlay {
                    RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 2)
                        .foregroundStyle(.white)
                }
        }
        .frame(height: 60)
        
        .animation(.spring, value: configuration.isPressed)
    }
}
