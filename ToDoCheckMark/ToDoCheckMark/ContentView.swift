 
import SwiftUI
struct TodoItem:Identifiable{
    var id = UUID()
    var title:String
    var isCompleted : Bool
}
struct ContentView: View {
    @State var shake = false
    @State private var tasks = [TodoItem]()
    @State private var newTaskTitle = ""
    var body: some View {
        VStack{
            ForEach($tasks) { task in
                DaneAnimation(task: task)
                    .onTapGesture {
                        withAnimation {
                            if let index = tasks.firstIndex(where: {$0.id == task.id}){
                                tasks[index].isCompleted.toggle()
                            }
                        }
                    }
            }
            Spacer()
            TextField("New Task", text: $newTaskTitle)
                .padding(.leading)
                .frame(height: 50)
                .background(.white,in:RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.1) ,radius: 10, x: 0, y: 0)
            Button(action: {
                addTask()
            }, label: {
                Text("Add Task").foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.blue, in: RoundedRectangle(cornerRadius: 10))
            })
            
        }
        .padding()
        
    }
    func addTask(){
        let newtask = TodoItem(title: newTaskTitle, isCompleted: false)
        tasks.append(newtask)
        newTaskTitle = ""
    }
}
struct TextSize: ViewModifier {
    @Binding var size: CGSize
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometry.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self) { preferences in
            self.size = preferences
        }
    }
    private struct SizePreferenceKey: PreferenceKey {
        static var defaultValue: CGSize = .zero
        static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
    }
}
struct TaskCompletionCircle: View {
    @Binding var isCompleted: Bool
    
    var body: some View {
        Circle()
            .frame(width: isCompleted ? 10 : 0, height: isCompleted ? 10 : 0)
    }
}
struct DaneAnimation: View {
    @Binding var  task : TodoItem
    @State var textSize:CGSize = .zero
    var body: some View {
        ZStack(alignment: .leading) {
            Text(task.title)
                .font(.title)
                .padding(.leading, 60)
                .foregroundStyle(task.isCompleted ? .gray : .black)
                .modifier(TextSize(size: $textSize))
            HStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: task.isCompleted ? 0 : 20, height: 5)
                    .opacity(task.isCompleted ? 0 : 1)
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: task.isCompleted ? max(textSize.width - 40, 0) : 20, height: 5)
                    .offset(x: task.isCompleted ? 50 : -30)
                
                Spacer()
            }
            .foregroundStyle(task.isCompleted ? .gray : .purple)
            .overlay {
                Group {
                    ZStack {
                        TaskCompletionCircle(isCompleted: $task.isCompleted)
                            .offset(y: task.isCompleted ? -38 : 0)
                        TaskCompletionCircle(isCompleted: $task.isCompleted)
                            .offset(y: task.isCompleted ? 38 : 0)

                        VStack(spacing: task.isCompleted ? 30 : 0) {
                            HStack(spacing: task.isCompleted ? 50 : 0) {
                                TaskCompletionCircle(isCompleted: $task.isCompleted)
                                TaskCompletionCircle(isCompleted: $task.isCompleted)
                            }
                            HStack(spacing: task.isCompleted ? 50 : 0) {
                                TaskCompletionCircle(isCompleted: $task.isCompleted)
                                TaskCompletionCircle(isCompleted: $task.isCompleted)
                            }
                        }
                    }
                    .opacity(task.isCompleted ? 0 : 1)
                    .overlay {
                        Image(systemName: "checkmark")
                            .bold()
                            .font(.system(size: task.isCompleted ? 20 : 0))
                            .scaleEffect(task.isCompleted ? 1 : 0, anchor: .leading)
                    }
                }
                .offset(x: -150)
                .animation(task.isCompleted ? .default : .none, value: task.isCompleted)
            }
            .foregroundStyle(.purple)
        }
        .padding(.leading, 40)
    }
}

 




#Preview {
    ContentView()
}
