
import SwiftUI
import SwiftData

struct NewNoteView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Query var notes :[Note]
    @State var text = ""
    @State var icon = "checklist.checked"
    @State var iconcolor = false
    var body: some View {
        VStack(spacing:20){
                ButtonStyle(icon: "xmark"){
                    dismiss()
                   }
            .padding(.top,30)
            TextField("New Note", text: $text)
                 .font(.largeTitle)
                 .frame(height: 55)
                 .padding(.leading)
                 .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 10))
            IconPicker(colors: $iconcolor, title: "Selact an icon", selection: $icon)
            Button(action: {
                AddnewNote()
            }, label: {
                Text("Save").bold()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 10))
            })
            .tint(.primary)
            Spacer()
        }
       
        .padding()
    }
    func AddnewNote( ){
        if !text.isEmpty{
            let noteCell = Note(icon: icon, title: text, isComplet: false, iconColor: iconcolor )
            context.insert(noteCell)
            do{
               try context.save()
            }catch{
                print(error.localizedDescription)
            }
            dismiss()
        }
       
    }
}

#Preview {
    NewNoteView()
        .modelContainer(for: [Note.self])
}
struct ButtonStyle: View {
    var icon:String
    var action : () -> Void
    var body: some View {
        Button(action: {
         action()
        }, label: {
            Image(systemName: icon).font(.title2)
                .frame(width: 40, height: 40)
                .background(.ultraThinMaterial,in:Circle())
        })
        .tint(.primary)
        .frame(maxWidth: .infinity,alignment: .trailing)
        
    }
}

 
