 
import SwiftUI

struct StyleFour: View {
    var StepsNum: Int
    @Binding var CurrentStep: Int
    var body: some View {
        HStack(spacing:0){
            ForEach(0 ..< StepsNum, id:\.self) { item in
                Circle()
                    .frame(width: 40, height: item <= CurrentStep ? 40 : 15)
                    .foregroundStyle(item < CurrentStep ? .LD : .BG )
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
        .background(
            Rectangle()
                .frame(height: 3)
                .foregroundStyle(.BG)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.trailing)
        )
        
        
            .frame(height: 50)
    }
}

//#Preview {
//    StyleFour()
//}
#Preview {
    HomeView()
}
