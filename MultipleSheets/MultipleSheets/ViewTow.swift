 
import SwiftUI
import Modals
struct ViewTow: View {
    @State var isPresented = false
        var body: some View {
        
                Button {
                     isPresented = true
                } label: {
                    Text("View: 2")
                        .frame(width: 150, height: 80).background(.thinMaterial,in:RoundedRectangle(cornerRadius: 20))
                        .foregroundColor(.black).bold().font(.title2)
                }
                .modal(isPresented: $isPresented,backgroundColor: Color("C3")) {
                    ViewThree()
                }
        
          

        }
}

struct ViewTow_Previews: PreviewProvider {
    static var previews: some View {
        ViewTow()
    }
}
