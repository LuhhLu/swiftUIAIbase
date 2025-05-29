
import Foundation
import CoreData
class TaskManagerViewModel: ObservableObject{
    @Published var tasktitel : String = ""
    @Published var taskdescrptiont : String = ""
    @Published var taskIcon:String = ""
    @Published var taskColor:String = ""
    @Published var taskDeadline: Date = Date()
    @Published var showDataPicker:Bool = false
    @Published var newtaskview:Bool = false
    func addnewtask(context:NSManagedObjectContext)-> Bool{
        let newtask = Task(context: context)
        newtask.titel = tasktitel
        newtask.descriptiont = taskdescrptiont
        newtask.color = taskColor
        newtask.icon = taskIcon
        newtask.deadline = taskDeadline
        do {
            try context.save()
            return true
        }catch{
            print("Error saving context :\(error)")
            return false
        }
     
    }
    func deletTask(task:Task,context:NSManagedObjectContext)-> Bool{
        context.delete(task)
        do {
            try context.save()
            return true
        }catch{
            print("\(error)")
            return false
        }
    }
    func resrText(){
        tasktitel = ""
        taskdescrptiont = ""
        taskIcon = ""
        taskColor = ""
        taskDeadline = Date()
    }
   
    
}
