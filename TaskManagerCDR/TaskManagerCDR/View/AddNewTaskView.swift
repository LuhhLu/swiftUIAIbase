
import SwiftUI

struct AddNewTaskView: View {
    @State var titel = ""
    @State var note = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            TextField("Task Titel", text: $titel).bold()
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding(.top,60)
            TextEditor(text: $note).bold()
                .frame(width: UIScreen.main.bounds.width - 30)
                .frame(height: 150)
                .foregroundColor(.orange)
                .background(.yellow)
                .opacity(0.7)
                .cornerRadius(10)
                .overlay(alignment: .topLeading, content: {
                    if note.isEmpty{
                        Text("Write a note...").bold()
                            .foregroundColor(.orange)
                            .offset(x: 5, y: 10)
                    }
                })
            Button{
                do{
                    if !titel.isEmpty{
                        try CoreDataService.saveMyTask(titel, note)
                        dismiss()
                    }
                    
                    
                }catch{
                    
                }
            }label: {
                ZStack{
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .frame(width: 120, height: 40)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green,.blue]), startPoint: .top, endPoint: .bottom))
                                .blur(radius: 2)
                            
                        })
                    Text("Save Task").bold()
                        .font(.title3)
                        .foregroundColor(.black)
                }
                .padding()
                
            }
            
            
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
       
    }
}

struct AddNewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskView()
    }
}
