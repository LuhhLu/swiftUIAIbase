
import Foundation
import CoreData
class cddatamodel:ObservableObject{
    let contanier : NSPersistentContainer
    @Published var saveBreakfastEntity: [BreakfastEntity] = []
    @Published var saveLunchEntity:[LunchEntity] = []
    @Published var saveValueEntity:[ValueEntity] = []
    init(){
        contanier = NSPersistentContainer(name: "CDfoodclass")
        contanier.loadPersistentStores{(descrip,errer) in
            if let errer = errer {
                print("erroer loding data \(errer)")
            }
        }
        fechData()
    }
    func fechData(){
        let requestone = NSFetchRequest<BreakfastEntity>(entityName: "BreakfastEntity")
        let requestTow = NSFetchRequest<LunchEntity>(entityName: "LunchEntity")
        let requestThree = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
           saveBreakfastEntity =  try contanier.viewContext.fetch(requestone)
            saveLunchEntity =  try contanier.viewContext.fetch(requestTow)
            saveValueEntity =  try contanier.viewContext.fetch(requestThree)
        } catch let error {
            print("errer fecing data \(error)")
        }
    }
    func addBreakfast(icon:String,name:String,ingredients:String,fat:CGFloat,protein:CGFloat,cards:CGFloat){
        let newmeal = BreakfastEntity(context: contanier.viewContext)
        newmeal.icon = icon
        newmeal.name = name
        newmeal.ingredients = ingredients
        newmeal.fat = Float(fat)
        newmeal.protein = Float(protein)
        newmeal.cards = Float(cards)
        saveData()
    }
    func addLunch(icon:String,name:String,ingredients:String,fat:CGFloat,protein:CGFloat,cards:CGFloat){
        let newmeal = LunchEntity(context: contanier.viewContext)
        newmeal.icon = icon
        newmeal.name = name
        newmeal.ingredients = ingredients
        newmeal.fat = Float(fat)
        newmeal.protein = Float(protein)
        newmeal.cards = Float(cards)
        saveData()
    }
    func addValue(fat:CGFloat,protein:CGFloat,cards:CGFloat){
        let newValue = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
           let results  = try contanier.viewContext.fetch(newValue)
            if let entity = results.first{
                entity.fat += Float(fat)
                entity.protein += Float(protein)
                entity.cards += Float(cards)
                
            }else{
                let newValue = ValueEntity(context: contanier.viewContext)
                newValue.fat = Float(fat)
                newValue.protein = Float(protein)
                newValue.cards = Float(cards)
            }
            saveData()
            fechData()
        } catch  {
            print("\(error)")
        }
    }
    func Addringcarlories(calories:CGFloat){
        let newcal = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
           let results  = try contanier.viewContext.fetch(newcal)
            if let entity = results.first{
                entity.ring += Float(Int(calories))
            }else{
                let newEntity = ValueEntity(context: contanier.viewContext)
                newEntity.ring  = 10
            }
        } catch  {
            print("\(error)")
        }
        saveData()
        fechData()
    }
    func addmealTaggle(meal:BreakfastEntity){
        meal.addmale.toggle()
        saveData()
    }
    func deletone(indexst:IndexSet){
        guard let index = indexst.first else {return}
        let entity = saveBreakfastEntity[index]
        contanier.viewContext.delete(entity)
      saveData()
    }
    func saveData(){
        do {
            try contanier.viewContext.save()
            fechData()
        } catch  {
            print("save data failed \(error)")
        }
    }
    func resetValues() {
        let request = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
            let results = try contanier.viewContext.fetch(request)
            if let entity = results.first {
                // Reset values of existing entity
                entity.fat = 0
                entity.protein = 0
                entity.cards = 0
                entity.ring = 0
                saveData()
            } else {
                // Create new entity with default values of 0
                let newEntity = ValueEntity(context: contanier.viewContext)
                newEntity.fat = 0
                newEntity.protein = 0
                newEntity.cards = 0
                newEntity.ring = 0
                saveData()
            }
        } catch let error {
            print("Error fetching or creating ValuEntity: \(error)")
        }
    }
}
