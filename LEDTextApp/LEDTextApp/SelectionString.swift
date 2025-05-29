
import SwiftUI
struct datamodel:Identifiable{
    var id = UUID()
    var item:String = ""
    var font:String = "ChalkboardSE-Regular"
    var sizs:CGFloat = 100
    var color:String = "bc"
}
struct SelectionString: View {
    var title:String
    var items: [datamodel]
    @Binding var selected: String
    var keyPathToProperty: KeyPath<datamodel, String>
    var body: some View {
        VStack(alignment:.leading,spacing: 24) {
            Text(title).bold()
            HStack (spacing:20){
                ForEach(items) { item in
                    Text(item.item)
                        .frame(width: 40, height: 40)
                        .font(.custom(item.font, size: 18))
                        .background(Color(item.color) , in: .circle)
                        .scaleEffect(selected == item[keyPath: keyPathToProperty] ? 0.7 : 1)
                        .overlay {
                            Circle().stroke(lineWidth: 2)
                                .foregroundStyle(selected == item[keyPath: keyPathToProperty] ? .white : .clear)
                        }
                        .onTapGesture {
                            withAnimation {
                                selected = item[keyPath: keyPathToProperty]
                            }
                        }
                }
            }
        }
   
    }
}

//#Preview {
//    SelectionString()
//}
