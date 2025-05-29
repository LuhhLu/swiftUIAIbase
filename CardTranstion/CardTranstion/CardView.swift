 

import SwiftUI
struct CardMode: Identifiable {
    var id = UUID()
    var creditID = UUID()
    var TColor:Color
    var BColor:Color
    var name: String
    var num: String
}
struct CardView: View {
    var data:CardMode
    var namespace: Namespace.ID

    var body: some View {
        HStack{
            VStack(alignment:.leading,spacing:26){
                Text("Credit")
                    .matchedGeometryEffect(id:data.creditID, in: namespace)
                Spacer()
                Text(data.name)
                    .matchedGeometryEffect(id:data.name, in: namespace)
                Text(data.num)
                    .matchedGeometryEffect(id:data.num, in: namespace)
            }
            .font(.title3)
            .foregroundStyle(.white)
            Spacer()
            Image(.visa).renderingMode(.template)
                .resizable().scaledToFill()
                .foregroundStyle(.white)
                .frame(width: 60, height: 20)
                .frame(maxHeight: .infinity,alignment: .top)
        }
        
        .padding(24)
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [data.TColor,data.BColor]), startPoint: .topLeading, endPoint: .bottomTrailing),in: .rect(cornerRadius: 24))
        .padding(.horizontal,20)
    }
}

//#Preview {
//    CardView()
//}
#Preview {
    ContentView()
}
