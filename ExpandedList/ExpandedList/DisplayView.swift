 
import SwiftUI

struct DisplayView: View {
    var body: some View {
        ScrollView{
            VStack{
                HomeViewTow()
                    .containerRelativeFrame(.vertical)
                HomeView()
                    .containerRelativeFrame(.vertical)
               
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    DisplayView()
}
