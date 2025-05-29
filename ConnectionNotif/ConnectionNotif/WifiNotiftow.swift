 

import SwiftUI

struct WifiNotiftow: View {
    @Binding var isConnected:Bool
    var body: some View {
        HStack(spacing:15){
            Image(systemName: isConnected ? "wifi" : "wifi.slash")
                .foregroundStyle(isConnected ? .green : .red)
                .font(.title2)
                .frame(width: 55, height: 50)
                .background(.thinMaterial,in: .rect(cornerRadius: 10))
                .padding(.leading,10)
           Text(isConnected ? "Internet connection restored" : "Internet connection lost")
            Spacer()
        }
        .bold()
        .frame(maxWidth: .infinity,maxHeight: 70)
        .background(.thinMaterial,in: .rect(cornerRadius: 20))
    }
}

//#Preview {
//    WifiNotiftow()
//}
