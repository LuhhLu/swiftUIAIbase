 

import SwiftUI
struct CustomAlert: View {
    @State var show = false
    var icon:String
    var iconColor:Color
    var title:String
    var details:String
    
    var body: some View {
        VStack{
            HStack(alignment: .top,spacing: 10) {
                ZStack{
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(iconColor.opacity(0.2))
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundStyle(iconColor)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .bold()
                    
                    Text(details)
                        .font(.caption).foregroundStyle(.gray)
                        .padding(.trailing,15)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(.BG.shadow(.drop(color: .black.opacity(0.2), radius: 1, x: 0, y: 0)),in:.rect(cornerRadius: 12))
            Spacer()
        }
        .padding(10)
    }
}
#Preview {
    CustomAlert(icon: "checkmark.circle.fill", iconColor: .green, title: "Success Notification", details: "Your email to recipient@example appears to have been sent, but it might be a good idea to double-check the Sent folder just to be sure. Occasionally, emails can get stuck in the Outbox due to network")
}

