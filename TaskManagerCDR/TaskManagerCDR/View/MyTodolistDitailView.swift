

import SwiftUI

struct MyTodolistDitailView: View {
    let mytask:MyTask
    @State var isPresented:Bool = false
    @State var titel = ""
    @FetchRequest(sortDescriptors: [])
    var  todosResults:FetchedResults<Todo>
    init(mytask:MyTask){
        self.mytask = mytask
        
        _todosResults = FetchRequest(fetchRequest: CoreDataService.gettodosBylist(mytask: mytask))
    }
    
    var body: some View {
        ScrollView{
            VStack{
                Button(action: {
                    isPresented = true
                }, label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.medium)
                        .foregroundColor(.white)
                        .padding(.trailing,5)
                })
                .frame(maxWidth: .infinity,alignment: .topTrailing)
                TodoListView(todos: todosResults)
            }
        }
        .frame(height: 103)
        .clipped()
        .sheet(isPresented: $isPresented, content: {
            VStack{
                TextField("type note...", text: $titel)
                    .padding()
                    .background(Color("T"))
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color("L"))
                        
                    })
                    .cornerRadius(10)
                    .padding(5)
                Button(action: {
                    do{
                        if !titel.isEmpty{
                            try CoreDataService.saveTodosBylist(mytask: mytask, titel: titel)
                            titel = ""
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }, label: {
                    HStack{
                        Image(systemName: "face.smiling").bold()
                            .imageScale(.small)
                        Text("Save").bold()
                    }
                    .foregroundColor(Color("BT"))
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .background(Color("BColor"))
                    .cornerRadius(15)
                })
            }
            .presentationDetents([.fraction(0.20)])
            .presentationDragIndicator(.visible)
        })
    }
}

//struct MyTodolistDitailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyTodolistDitailView()
//    }
//}
