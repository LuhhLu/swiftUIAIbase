
import Foundation
import Firebase
import FirebaseFirestore
struct QuestionModel:Identifiable,Codable{
    var id:String
    var name:String
    var fliping:Bool = false
    var question:String
    var answer:String
}
class Manager:ObservableObject{
    @Published var questionList:[QuestionModel] = []
    init(){
        fetchData()
    }
    func updateCard(question:QuestionModel,newName:String,newQuestion:String,newAnswer:String){
        guard let index = self.questionList.firstIndex(where: {$0.id == question.id})else {return}
        self.questionList[index].name = newName
        self.questionList[index].question = newQuestion
        self.questionList[index].answer = newAnswer
        let db = Firestore.firestore()
        let docRef = db.collection("questions").document(question.id)
        docRef.updateData([
            "name": newName,
            "question": newQuestion,
            "answer": newAnswer

        ]){ err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document updated successfully.")
            }
        }
    }
    func toggleFliping(forQuestion question :QuestionModel){
        guard let index = self.questionList.firstIndex(where: {$0.id == question.id})else{return}
        self.questionList[index].fliping.toggle()
        toggleFilpingValue(forDocumentWithID: question.id, newValue: self.questionList[index].fliping)
    }
    func toggleFilpingValue(forDocumentWithID documenID: String,newValue:Bool){
        let db = Firestore.firestore()
        let docRef = db.collection("questions").document(documenID)
        docRef.updateData(["fliping":newValue]){ err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document updated successfully.")
            }
        }
        
    }
    func deletcard(at indexSet:IndexSet){
        let db = Firestore.firestore()
        let documentIdQuestioList = indexSet.map{
            self.questionList[$0].id
        }
        for documentID in documentIdQuestioList{
            db.collection("questions").document(documentID).delete(){ error in
                if let error = error{
                    print("deletcard\(error)")
                }else{
                    print("Document successfully deleted.")
                }
                
            }
        }
        self.questionList.remove(atOffsets: indexSet)
    }
    func saveToFirestore(name:String,question:String,answer:String,fliping:Bool){
        let db = Firestore.firestore()
        db.collection("questions").addDocument(data: [
            "name":name,
            "question":question,
            "answer":answer,
            "fliping":fliping
        ]){err in
            if let err = err{
                print("\(err)")
                
            }else{
                
            }
            
        }
        self.fetchData()
    }
    func fetchData(){
        let db = Firestore.firestore()
        db.collection("questions").getDocuments { snapshot, error in
            guard  error ==  nil else{
                print("\(String(describing: error?.localizedDescription))")
                return
            }
            if let snapshot = snapshot{
                self.questionList = snapshot.documents.map{data in
                    return QuestionModel(id: data.documentID, name: data["name"] as? String ?? "", fliping: data["fliping"] as? Bool ?? false, question: data["question"] as? String ?? "", answer: data["answer"] as? String ?? "")
                }
            }
        }
    }
}
