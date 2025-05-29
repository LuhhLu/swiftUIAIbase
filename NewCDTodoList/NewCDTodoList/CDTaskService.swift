

import Foundation
import CoreData

class CDTaskService{
    static var viewContext:NSManagedObjectContext{
        CDTaskProvider.shared.container.viewContext
    }
    static func save() throws{
        try viewContext.save()
    }
    static func saveMyTask(_ titel:String, _ icon :String)throws{
        let mytask = MyTask(context: viewContext)
        mytask.titel = titel
        mytask.multiple += 1
        mytask.icon = icon
        try save()
    }
    static func deletmyTask(mytask:MyTask) throws{
        viewContext.delete(mytask)
        try save()
    }
    static func updatemyTask(mytask:MyTask, titel:String?) throws{
        if let titel = titel{
            mytask.titel = titel
        }
        try save()
    }
    static func saveTodoToTask(mytask:MyTask, titel:String) throws{
        let todos = ToDo(context: viewContext)
        todos.titel = titel
        mytask.addToTodos(todos)
        try save()
    }
    static func getTodosByTask(mytask:MyTask)-> NSFetchRequest<ToDo>{
        let request = ToDo.fetchRequest()
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "list = %@", mytask)
        return request
    }
    static func deletTodos(_ todo:ToDo) throws{
        viewContext.delete(todo)
        try save()
    }
    
}
