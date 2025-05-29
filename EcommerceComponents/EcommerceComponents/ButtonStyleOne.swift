 
import SwiftUI



struct ButtonsStyle: View {
    var body: some View {
        VStack(spacing:60){
            BStyleTow(title: "Add to Order") {
                //
            }
            BStyleOne(title: "Add to Order") {
                //
            }
            
            orderCount()
        }
       
    }
}

#Preview {
    ButtonsStyle()
}
struct BStyleOne: View {
    var title:String
    var action:() -> Void
    var body: some View {
        Button(action: action) {
            Text("Add to Order").bold()
                .padding()
                .padding(.horizontal)
                .background(.thinMaterial,in: Capsule())
                .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 0)
        }
        .tint(.primary)
            
    }
}
struct BStyleTow: View {
    var title:String
    var action:() -> Void
    var body: some View {
        Button {
            action()
        } label: {
            HStack(){
                Text("Add to Cart")
                Spacer()
                Text("$50.00")
            }
            .bold()
            .foregroundStyle(.LD)
            .frame(width: 210, height: 55)
            .padding(.horizontal,24)
            .background(.primary,in: Capsule())
            .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 0)
        }
        .tint(.primary)
    }
   
}

 
