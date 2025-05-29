 

import SwiftUI

struct ProgressBox: View {
    @Binding var progress: CGFloat
    var width:CGFloat
    var height:CGFloat
    var CRadius:CGFloat
    var body: some View {
        VStack(alignment:.leading,spacing: 7){
            HStack{
                Text("\(Int(progress * 100)) % To Complete").bold().font(.callout)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue , .cyan]), startPoint: .leading, endPoint: .trailing))
                Spacer()
                Group{
                    Image(systemName: "clock")
                    Text("12Min")
                }
                .font(.caption)
                .foregroundStyle(.gray.opacity(0.7))

            }
            .frame(width: width)
            ZStack(alignment:.leading){
                RoundedRectangle(cornerRadius: CRadius)
                    .frame(width: width, height: height)
                    .foregroundStyle(.bProgress)
                RoundedRectangle(cornerRadius: CRadius)
                    .frame(width: progress * width, height: height)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue , .cyan]), startPoint: .leading, endPoint: .trailing))
            }
            
            
        }
        .padding(20)
        .background(.white,in: .rect(cornerRadius: 16))
        .shadow(color: .black.opacity(0.1), radius: 20, x: 0.0, y: 0.0)
    }
}

//#Preview {
//    BrogressBox()
//}
