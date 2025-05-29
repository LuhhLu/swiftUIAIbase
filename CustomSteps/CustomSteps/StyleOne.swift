 
import SwiftUI

struct StyleOne: View {
    var StepsNum: Int
    @Binding var CurrentStep: Int
    var body: some View {
        HStack(spacing:0){
            ForEach(0 ..< StepsNum, id:\.self) { item in
                Circle().stroke(lineWidth:  item <= CurrentStep ? 25 : 3)
                    .frame(width: 40, height: item <= CurrentStep ? 15 : 40)
                    .foregroundStyle(item < CurrentStep ? .green : .BG )
                    .overlay {
                        if item < CurrentStep{
                            Image(systemName: "checkmark").font(.title2)
                                .foregroundStyle(.white)
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
                            .foregroundStyle(.green)
                    }
                    
                }
                
            }
        }
            .frame(height: 50)
    }
}

//#Preview {
//    StyleOne()
//}
#Preview {
    HomeView()
}
