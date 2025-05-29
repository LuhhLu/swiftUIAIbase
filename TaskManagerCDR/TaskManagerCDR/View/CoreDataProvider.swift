

import Foundation
import CoreData

class CoreDataProvider{
    static let shared = CoreDataProvider()
    let container : NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "CDTaskManager")
        container.loadPersistentStores { description, error in
            if let error{
                fatalError("loadPersistentStores\(error)")
            }
        }
    }
}
