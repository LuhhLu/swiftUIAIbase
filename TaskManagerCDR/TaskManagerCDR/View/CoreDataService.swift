 
import SwiftUI
import CoreData
class CoreDataService{
    static var viewContext:NSManagedObjectContext{
        CoreDataProvider.shared.container.viewContext
        
    }
    static func save()throws {
        try viewContext.save()
    }
    static func saveMyTask(_ titel:String,_ note:String) throws{
        let mytask = MyTask(context: viewContext)
        mytask.titel = titel
        mytask.note = note
        try save()
    }
    static func saveTodosBylist(mytask:MyTask,titel:String)throws{
        let mytodo = Todo(context: viewContext)
        mytodo.titel = titel
        mytask.addToTodos(mytodo)
        try save()

    }
    static func gettodosBylist(mytask:MyTask)-> NSFetchRequest<Todo> {
        let request = Todo.fetchRequest()
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "list = %@", mytask)
        return request
        
    }
    
    static func deleteAllData() throws {
        try deleteAllEntities(entityName: "MyTask")
        try deleteAllEntities(entityName: "Todo")
    }

    private static func deleteAllEntities(entityName: String) throws {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try viewContext.execute(deleteRequest)
        try save()
    }
    
}
