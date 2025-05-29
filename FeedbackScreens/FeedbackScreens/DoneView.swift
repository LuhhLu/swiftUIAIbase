 

import SwiftUI

struct DoneView: View {
    var action: () -> Void
    var body: some View {
        ZStack{
            Color.BG.ignoresSafeArea()
            
            VStack{
                Image(.done).resizable().scaledToFill()
                    .frame(width: 300, height: 300)
                Text("Sent Successfully")
                    .font(.system(size: 40)).bold()
                    .padding(10)
                Text("Thank you for sharing your feedback. We appreciate your time and will use your input to improve our service!")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
                Image(systemName: "xmark")
                .font(.title)
                    .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                    .padding()
                    .onTapGesture {
                        withAnimation {
                            action()
                        }
            }
        }
        
    }
}

#Preview {
    DoneView(action: {})
}
