 

import SwiftUI

struct StepsView: View {
    @Binding var currentPage:Int
    let numberOfCircles: Int
    let circleSize: (Int, Int) -> CGFloat
    @Binding var width: CGFloat
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<numberOfCircles,id: \.self){ index in
                Circle()
                    .fill(index <= currentPage ? .white : .gray)
                    .frame(width: circleSize(index,numberOfCircles), height: circleSize(index,numberOfCircles))
                    .frame(width: 30)
                
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 30)
                .frame(width: width + 5, height: 20)
                .offset(x: 4)
                .foregroundStyle(.BG),alignment: .leading
        )
        .padding(.vertical)
    }
}

 
