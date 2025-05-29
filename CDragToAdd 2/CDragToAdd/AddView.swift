

import SwiftUI

struct AddView: View {
    @FocusState var Nfocus: Bool
       @FocusState var Tfocus: Bool
       @Binding var task: Task
       @Binding var show: Bool
       var saveAction: (Task) -> Void
    var body: some View {
        VStack(spacing:15){
            HStack{
                TaskNameTextField(task: $task, isFocused: _Tfocus)
                 CloseButton(show: $show)
            }
        
                       NoteTextEditor(task: $task, isFocused: _Nfocus)
                        
                       SaveButton(task: task, saveAction: saveAction)
        }
        .padding()
        .background(.gray.opacity(0.3),in:RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        .padding()
    }
        
}

#Preview {
    AddView(task: .constant(Task(name: "", note: "")), show: .constant(false)) { Task in
        print("")
    }
}

 
struct TaskNameTextField: View {
    @Binding var task: Task
    @FocusState var isFocused: Bool

    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $task.name)
                .focused($isFocused)
//                .foregroundColor(.white)
                .padding()
                .frame(width: 200, height: 50)
                .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 8))
 
            if !isFocused && task.name.isEmpty {
                PlaceholderText(text: "Task name", isFocused: _isFocused)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
 
struct CloseButton: View {
    @Binding var show: Bool

    var body: some View {
        Button(action: {
            withAnimation {
                show = false
            }
        }, label: {
            Image(systemName: "xmark").font(.title)
        })
        .tint(.primary)
    }
}

 
struct PlaceholderText: View {
    var text: String
    @FocusState var isFocused: Bool
    var body: some View {
        Text("   \(text)")
            .bold().font(.title2)
//            .foregroundColor(.red)
            .onTapGesture {
                isFocused.toggle()
            }
    }
}

 
struct NoteTextEditor: View {
    @Binding var task: Task
    @FocusState var isFocused: Bool

    var body: some View {
        TextEditor(text: $task.note)
            .focused($isFocused)
            .frame(height: 120)
            .scrollContentBackground(.hidden)
            .background(.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(alignment: .topLeading) {
                if !isFocused && task.note.isEmpty {
                    Text("Write a note...").bold().padding()
                        .onTapGesture {
                            isFocused.toggle()
                        }
                }
            }
    }
}
 
struct SaveButton: View {
    var task: Task
    var saveAction: (Task) -> Void

    var body: some View {
        Button(action: {
            withAnimation {
                saveAction(task)
            }
        }, label: {
            Text("Save").bold().font(.title2).foregroundStyle(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 8))
        })
      
    }
}
