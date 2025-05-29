 

import SwiftUI

struct DashLineProgress: View {
    @Binding var progress: CGFloat
       var totalWidth: CGFloat
       var dashWidth: CGFloat
       var dashSpacing: CGFloat  
    var body: some View {
        VStack(alignment:.leading,spacing: 5){
            Text("\(Int(progress * 100)) %").bold()
                .font(.title3)
            ZStack(alignment:.leading){
                Rectangle().stroke(lineWidth: 2)
                    .frame(width: totalWidth + 4, height: 20)
                HStack(spacing:dashSpacing){
                    ForEach(0 ..< Int((progress * totalWidth) / (dashWidth + dashSpacing)),id: \.self) { item in
                        Rectangle()
                            .frame(width: dashWidth, height: 15)
                    }
                }
                .offset(x: 3)
            }
        }
        .foregroundStyle(.gProgress)
    }
}

//#Preview {
//    DashLineProgress()
//}
