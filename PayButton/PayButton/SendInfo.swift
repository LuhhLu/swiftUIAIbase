 

import SwiftUI

struct SendInfo: View {
    var body: some View {
        VStack(spacing:8){
            Text("$ 890.00")
                .font(.system(size: 50).bold())
                .padding(.bottom,44)
            HStack(spacing:8){
                Text("To")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                Image(.AV).resizable().scaledToFill()
                    .frame(width: 40, height: 40)
                Text("SUCODEE").bold()
                  
                Spacer()
                Text("Change")
                    .font(.footnote)
            }
            .frame(height: 55)
            .padding(.horizontal,12)
            .background(.gray.opacity(0.3),in:Capsule())
            HStack(spacing:4){
                Text("Your balance")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                Text("$5,345.34")
                    .font(.footnote.bold())
                Spacer()
                
            }
            .frame(height: 55)
            .padding(.horizontal,12)
            .background(.gray.opacity(0.3),in:Capsule())
            
        }   
    }
}

#Preview {
    SendInfo()
}
