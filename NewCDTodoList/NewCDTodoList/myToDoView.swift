

import SwiftUI

struct myToDoView: View {
    let mytask:MyTask
    @FetchRequest(sortDescriptors: [])
    var todosResults:FetchedResults<ToDo>
    init(mytask:MyTask){
        self.mytask = mytask
        _todosResults = FetchRequest(fetchRequest: CDTaskService.getTodosByTask(mytask: mytask))
    }
    private func delettodo(_ indexset:IndexSet){
        indexset.forEach { index in
            let todo = todosResults[index]
            do{
                try CDTaskService.deletTodos(todo)
                if mytask.progress != 0 {
                    mytask.items -= 1
                    mytask.progress -= 100
                    mytask.percentage -= 50
                    mytask.multiple -= 99
                
                }else{
                    mytask.items -= 1
                    mytask.multiple -= 99
                }
                try CDTaskService.save()
            }catch{
                print(error)
            }
        }
    }
    @State var inputText = ""
    var body: some View {
        VStack(alignment: .leading){
            Text(mytask.titel ?? "") .bold()
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()
            List{
                ForEach(todosResults) { items in
                    HStack{
                        Image(systemName: items.isCompled ? "circle.inset.filled" : "circle")
                            .imageScale(.large)
                            .foregroundColor(.gray)
                        Text(items.titel ?? "").bold()
                            .strikethrough(items.isCompled, color: .black)
                            .padding(.horizontal)
                    }
                    
                    .onTapGesture {
                        do{
                            items.isCompled.toggle()
                            if items.isCompled == false {
                                mytask.progress -= 100
                                mytask.percentage -= 50
                                mytask.multiple += 1
                            }else if items.isCompled == true {
                                mytask.progress += 100
                                mytask.percentage += 50
                                mytask.multiple -= 1
                            }
                            try CDTaskService.save()
                        }catch{
                            fatalError("\(error)")
                        }
                    }
                    
                }
                .onDelete(perform: delettodo)
               
            }
            .listStyle(InsetListStyle())
          
            HStack{
                TextField("new todo...", text: $inputText).bold()
                    .font(.title2)
                    .foregroundColor(.black)
                Button {
                    do{
                        try CDTaskService.saveTodoToTask(mytask: mytask, titel: inputText)
                        mytask.multiple += 100
                        mytask.items += 1
                        try CDTaskService.save()
                        inputText = ""
                    }catch{
                        
                    }
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }

            }
            .padding()
            .background(.white)
            .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 0)
            .frame(maxHeight: .infinity,alignment: .bottom)
            
        }
       
        
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        myToDoView()
//    }
//}
