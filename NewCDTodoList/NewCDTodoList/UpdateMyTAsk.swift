
import SwiftUI

struct UpdateMyTAsk: View {
    let mytask:MyTask
    @Binding var Edit:Bool
    @State var updateText = ""
    var body: some View {
        HStack{
            Button {
                do{
                   try CDTaskService.updatemyTask(mytask: mytask, titel: updateText)
                    Edit = false
                }catch{
                    
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .imageScale(.large)
                    .foregroundColor(.yellow)
            }
            TextField(mytask.titel ?? "", text: $updateText)
                .frame(width: 200)

        }
        .padding(.horizontal)
        .background(.white)
        .cornerRadius(10)
        .padding(.horizontal)
        
    }
}

//struct UpdateMyTAsk_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateMyTAsk(Edit: .constant(false))
//    }
//}
