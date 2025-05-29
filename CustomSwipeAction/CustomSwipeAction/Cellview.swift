 

import SwiftUI
struct Task: Identifiable {
    let id = UUID()
    let iconColor: Color
    let icon: String
    let title: String
    let detail: String
}
struct Cellview: View {
    var task:Task
    var onDelete: () -> Void
    @State var dragOffset = CGSize.zero
    @State var position = CGSize.zero
    @State var position2 = CGSize.zero
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top,spacing: 10) {
                Image(systemName: task.icon)
                    .font(.system(size: 20))
                    .foregroundStyle(task.iconColor)
                    .padding(10)
                    .background(task.iconColor.opacity(0.2),in:.circle)
                VStack(alignment: .leading, spacing: 6) {
                    Text(task.title).bold()
                    Text(task.detail)
                        .font(.caption).foregroundStyle(.secondary)
                }
                
                Spacer()
            }
        }
        .padding(12)
        .background(.BG,in:.rect(cornerRadius: 16))
        .offset(x: dragOffset.width + position.width)
        .animation(.linear, value: dragOffset)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    dragOffset = value.translation
                    position2.width = dragOffset.width + position.width
                })
                .onEnded { value in
                    if dragOffset.width < -200 {
                        onDelete()
                    } else if dragOffset.width < -40 {
                        position.width = -155
                    } else {
                        position.width = 0
                    }
                    position2.width = position.width
                    dragOffset = .zero
                }
        )
        .background(alignment: .trailing, content: {
            HStack(spacing:18) {
                option(iconName: "pencil.and.outline", iconColoor: .primary, action: {}, position2: position2)
                option(iconName: "bookmark", iconColoor: .blue, action: {}, position2: position2)
                option(iconName: "trash", iconColoor: .red, action: {onDelete()}, position2: position2)
            }
        })
        
        
        .padding(.horizontal)
    }
}

#Preview {
    Cellview(task: Task(iconColor: .orange, icon: "swift", title: "Learn Swift", detail: "Master the basics of Swift programming for building iOS and macOS apps."), onDelete: {})
}
struct option: View {
    var iconName:String
    var iconColoor:Color
    var action:() -> Void
    var position2 : CGSize
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                Circle().frame(width: 34, height: 34)
                    .foregroundColor(iconColoor.opacity(0.2))
                Image(systemName: iconName).resizable().scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(iconColoor)
                
            }
        }
        
        .opacity(min(max(-position2.width / 130, 0), 1))
        .scaleEffect(min(max(-position2.width / 130, 0), 1))
        .animation(.spring, value: position2)

    }
}
