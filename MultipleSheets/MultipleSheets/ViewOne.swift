 
import SwiftUI
import Modals
struct ViewOne: View {
    @State var isPresented = false
        var body: some View {
            
                Button {
                     isPresented = true
                } label: {
                    Text("View: 1")
                        .frame(width: 150, height: 80).background(.thinMaterial,in:RoundedRectangle(cornerRadius: 20))
                        .foregroundColor(.black).bold().font(.title2)
                }
                .modal(isPresented: $isPresented , cornerRadius: 40,backgroundColor: Color("C2")) {
                  ViewTow()
                }

        }
}

struct ViewOne_Previews: PreviewProvider {
    static var previews: some View {
        ViewOne()
    }
}
