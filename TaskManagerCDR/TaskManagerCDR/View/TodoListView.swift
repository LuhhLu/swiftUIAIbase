

import SwiftUI

struct TodoListView: View {
    let todos:FetchedResults<Todo>
    var body: some View {
        ForEach(todos) { item in
            HStack{
                Image(systemName: item.isCompled ? "circle.inset.filled" : "circle")
                    .imageScale(.large)
                    .foregroundColor(.gray)
                Text(item.titel ?? "")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .strikethrough(item.isCompled ? true : false, color: .gray)
                Spacer()
            }
            .onTapGesture {
                item.isCompled.toggle()
                do{
                    try CoreDataService.save()
                    
                }catch{
                    print("isCompled \(error)")
                }
            }

        }
    }
}

//struct TodoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoListView()
//    }
//}
