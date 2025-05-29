

import Foundation
import CoreData
class CDTaskProvider{
    static let shared = CDTaskProvider()
    let container:NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { descip, error in
            if let error{
                fatalError("loadPersistentStores error \(error)")
            }
            
        }
    }
    
}
