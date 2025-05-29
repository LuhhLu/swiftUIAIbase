 
import SwiftUI
enum newTaskType {
    case todo
    case inProgress
    case done
    var alignment: Alignment {
        switch self {
        case .todo:
            return .leading
        case .inProgress:
            return .center
        case .done:
            return .trailing
        }
    }
    var capsuleWidth: CGFloat {
          switch self {
          case .todo:
              return 80
          case .inProgress:
              return 120
          case .done:
              return 80
          }
      }
  
}
struct TaskTypeView: View {
    @Binding var selectedTask: newTaskType?
    var body: some View {
        VStack{
            HStack{
                TaskTypeB(title: "ToDo", task: .todo, selectedTask: $selectedTask)
                Spacer()
                TaskTypeB(title: "In Progress", task: .inProgress, selectedTask: $selectedTask)
                Spacer()
                TaskTypeB(title: "Done", task: .done, selectedTask: $selectedTask)
            }
            .padding(.horizontal,19)
            .frame(maxWidth: .infinity)
            .background(
                Capsule()
                    .frame(width: selectedTask?.capsuleWidth, height: 55)
                    .foregroundStyle(.gray.opacity(0.3))
                    .alignmentGuide(.leading){ _ in 0}
                    .frame(maxWidth: .infinity,alignment: selectedTask?.alignment ?? .center)
            )
            .animation(.easeInOut(duration: 0.3), value: selectedTask)
        }
    }
}

#Preview {
    TaskTypeView(selectedTask: .constant(.inProgress))
}
struct TaskTypeB: View {
    var title: String
    var task: newTaskType
    @Binding var selectedTask: newTaskType?
    var body: some View {
        Text(title).bold()
            .foregroundStyle(selectedTask == task ? Color.primary : .gray)
            .onTapGesture {
                selectedTask = task
            }
    }
}

 
