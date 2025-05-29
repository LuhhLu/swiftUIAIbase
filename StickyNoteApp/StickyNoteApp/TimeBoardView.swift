

import SwiftUI

struct TimeBoardView: View {
    @State var vm = Model()
    var body: some View {
        VStack(spacing:60){
            profileVeiw()
            ProgressView(vm: vm)
            HStack{
                NoteOverview(vm: vm)
                Spacer()
                infoView(vm: vm)
                    .frame(height: 400,alignment: .top)
                
            }
         
            Spacer()
        }
        .padding(.horizontal,25)
        
       
    }
}

#Preview {
    TimeBoardView()
}
