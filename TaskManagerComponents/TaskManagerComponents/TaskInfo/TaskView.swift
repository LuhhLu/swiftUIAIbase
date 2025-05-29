import SwiftUI

struct Task {
    var title: String
    var details: String
    var time: String
    var people: [String]
    var isCompleted: Bool
}
struct TaskView: View {
    @State var showTaskModal = false
    @State var task: Task
    var body: some View {
        HStack(alignment:.top){
            ZStack{
                Image(systemName: "square")
                    .font(.system(size: 30))
                if task.isCompleted{
                    Image(systemName: "square.fill")
                        .font(.system(size: 18))
                        .transition(.scale)
                }
            }
            .foregroundStyle(task.isCompleted ? Color.primary : .gray)
            .onTapGesture {
                withAnimation {
                    task.isCompleted.toggle()
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(task.title)
                    .font(.headline)
                    .strikethrough(task.isCompleted)
                Text(task.details)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    
                Label(task.time, systemImage: "clock")
                    .foregroundStyle(.gray)
            }
            Spacer()
            HStack(spacing: -18){
                if task.people.count > 3 {
                    ZStack{
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 32, height: 32)
                            .shadow(radius: 0.5)
                        Text("\(task.people.count - 3)+")
                            .foregroundStyle(.black)
                    }
                    .zIndex(4)
                }
                   
                ForEach(Array(task.people.prefix(3).enumerated()), id: \.element) { index, person in      Image(person).resizable()
                        .clipShape(.circle)
                        .frame(width: 32, height: 32)
                        .zIndex(Double(3 - index))
                }
            }
        }
    }
}


#Preview {
    TaskView(task: Task(title: "Create Design System", details: "In this comprehensive tutorial, we dive into everything you need to know about", time: "8 hr", people: ["person1", "person2", "person3", "person4"], isCompleted: false))
}
