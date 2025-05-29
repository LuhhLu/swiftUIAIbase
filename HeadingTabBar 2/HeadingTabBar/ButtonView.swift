 

import SwiftUI

struct ButtonView: View {
    let action: () -> Void
    let imageName: String
    let tabBarOpacity: CGFloat
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: imageName)
                .frame(width: 30, height: 30)
                .padding(4)
                .background(.white,in:.circle)
                .overlay {
                    Circle()
                        .stroke()
                        .opacity(0.5 - tabBarOpacity)
                }
        }
        .tint(.black)

    }
}

#Preview {
    ButtonView(
        action: {},
        imageName: "arrow.left",
        tabBarOpacity: 1
    )
}
