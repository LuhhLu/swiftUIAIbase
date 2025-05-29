 
import SwiftUI

struct SendTip: View {
    var action: () -> Void
    var body: some View {
        ZStack{
            Color.BG.ignoresSafeArea()
            VStack{
                Image(.tip).resizable().scaledToFill()
                    .frame(width: 300, height: 300)
                Text("Tip Received!")
                    .font(.system(size: 40)).bold()
                    .padding(10)
                Text("Thank you so much for your generosity. Your support means a lot and helps us continue doing what we love!")
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
    SendTip(action: {})
}
