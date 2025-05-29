 
import SwiftUI

struct StyleTow: View {
    var StepsNum: Int
    @Binding var CurrentStep: Int
    var body: some View {
        HStack(spacing:0){
            ForEach(0 ..< StepsNum, id:\.self) { item in
                Circle().stroke(lineWidth: 3 )
                    .frame(width: 40, height: 40)
                    .foregroundStyle(item < CurrentStep ? .DL : .BG )
                    .overlay(content: {
                        Text("Step \(item  + 1)")
                            .fixedSize()
                            .offset(x: 3, y: 45)
                            .foregroundStyle(item <= CurrentStep ? .DL : .BG )
                    })
                    .overlay {
                        if item < CurrentStep{
                            Image(systemName: "checkmark.circle.fill").resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(.primary)
                                .transition(.scale)
                        }
                       
                    }
                if item < StepsNum  - 1{
                    ZStack(alignment:.leading){
                        Rectangle()
                            .frame(height: 3)
                            .foregroundStyle(.BG)
                        Rectangle()
                            .frame(height: 3)
                            .frame(maxWidth: item >= CurrentStep ? 0 : .infinity,alignment: .leading)
                            .foregroundStyle(.primary)
                    }
                    
                }
                
            }
        }
            .frame(height: 50)
    }
}

//#Preview {
//    StyleTow()
//}
#Preview {
    HomeView()
}
