 

import SwiftUI

struct SelectionCGFloat: View {
    var title:String
    var items: [datamodel]
    @Binding var selected: CGFloat
    var keyPathToProperty: KeyPath<datamodel, CGFloat>
    var body: some View {
        VStack(alignment:.leading,spacing: 24){
            Text(title).bold()
            HStack(spacing:20) {
                ForEach(items) { item in
                    Text( item.item)
                        .frame(width: 40, height: 40)
                        .background(.bc,in:Circle())
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
//    SelectionCGFloat()
//}
