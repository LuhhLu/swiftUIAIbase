

import SwiftUI

struct AddView: View {
    @FocusState var Nfocus: Bool // State to track focus on the note TextEditor.
       @FocusState var Tfocus: Bool // State to track focus on the task name TextField.
       @Binding var task: Task // Binding to the Task object being edited.
       @Binding var show: Bool // Binding to control the visibility of AddView.
       var saveAction: (Task) -> Void // Closure to handle saving the task.
    var body: some View {
        VStack(spacing:15){
            HStack{
                TaskNameTextField(task: $task, isFocused: _Tfocus)
                 CloseButton(show: $show)
            }
            // Custom TextEditor for task note input.
                       NoteTextEditor(task: $task, isFocused: _Nfocus)
                       // Custom save button to save the task.
                       SaveButton(task: task, saveAction: saveAction)
        }
        .padding()
        .background(.white,in:RoundedRectangle(cornerRadius: 30))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
    }
}

#Preview {
    AddView(task: .constant(Task(name: "", note: "")), show: .constant(false)) { Task in
        print("")
    }
}

// TaskNameTextField is a custom view for inputting the task name.
struct TaskNameTextField: View {
    @Binding var task: Task // Binding to the task being edited.
    @FocusState var isFocused: Bool // State to track focus on the text field.

    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $task.name) // TextField for entering the task name.
                .focused($isFocused) // Focus state management.
                .foregroundColor(.white) // Text color.
                .padding() // Padding inside the TextField.
                .frame(width: 200, height: 50) // Fixed size for the TextField.
                .background(.black, in: RoundedRectangle(cornerRadius: 10)) // Black background with rounded corners.

            // Placeholder text that appears when the TextField is not focused and empty.
            if !isFocused && task.name.isEmpty {
                PlaceholderText(text: "Task name", isFocused: _isFocused)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading) // Full width, aligned to the leading edge.
    }
}

// CloseButton is a custom view for a button that closes the current view.
struct CloseButton: View {
    @Binding var show: Bool // Binding to control the visibility of the parent view.

    var body: some View {
        Button(action: {
            withAnimation {
                show = false // Hide the parent view on button press.
            }
        }, label: {
            Image(systemName: "xmark").font(.title) // 'X' mark icon.
        })
        .tint(.black) // Color of the button.
    }
}

// PlaceholderText is a custom view for displaying placeholder text.
struct PlaceholderText: View {
    var text: String // The placeholder text to display.
    @FocusState var isFocused: Bool // State to control the focus of the associated input field.

    var body: some View {
        Text("   \(text)") // Displaying the placeholder text.
            .bold().font(.title2).foregroundColor(.white) // Styling the text.
            .onTapGesture {
                isFocused.toggle() // Toggle focus state when text is tapped.
            }
    }
}

// NoteTextEditor is a custom view for editing the note of a task.
struct NoteTextEditor: View {
    @Binding var task: Task // Binding to the task being edited.
    @FocusState var isFocused: Bool // State to track focus on the TextEditor.

    var body: some View {
        TextEditor(text: $task.note) // TextEditor for editing the note.
            .focused($isFocused) // Focus state management.
            .frame(height: 120) // Fixed height for the TextEditor.
            .colorMultiply(.yellow.opacity(0.6)) // Yellow color effect for the TextEditor.
            .clipShape(RoundedRectangle(cornerRadius: 10)) // Rounded corners for the TextEditor.

            // Placeholder text for the TextEditor.
            .overlay(alignment: .topLeading) {
                if !isFocused && task.note.isEmpty {
                    Text("Write a note...").bold().foregroundStyle(.orange).padding(8)
                        .onTapGesture {
                            isFocused.toggle() // Toggle focus state when text is tapped.
                        }
                }
            }
    }
}

// SaveButton is a custom view for a button that saves the task.
struct SaveButton: View {
    var task: Task // The task to be saved.
    var saveAction: (Task) -> Void // Closure that defines the save action.

    var body: some View {
        Button(action: {
            withAnimation {
                saveAction(task) // Execute the save action when the button is pressed.
            }
        }, label: {
            Text("Save").bold().font(.title2).foregroundStyle(.white) // Button label.
                .frame(width: 360, height: 50) // Button size.
                .background(.black, in: RoundedRectangle(cornerRadius: 10)) // Black background with rounded corners.
        })
        .padding(.bottom, 40) // Bottom padding.
    }
}
