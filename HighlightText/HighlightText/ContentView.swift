 
import SwiftUI

 struct Highlight: Identifiable {
    let id = UUID()
    var color: Color
    var startX: CGFloat
    var startY: CGFloat
    var width: CGFloat
}

 struct Task: Identifiable {
    let id = UUID()
    let title: String
    var highlights: [Highlight] = []
}
struct ContentView: View {
    
    @State var tasks: [Task] = [
        Task(title: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift."),
        Task(title: "Walk the dog"),
        Task(title: "Finish project"),
        Task(title: "Read a book"),
        Task(title: "Workout"),
        Task(title: "Clean the house"),
        Task(title: "Reply to emails"),
        Task(title: "Prepare dinner"),
        Task(title: "Plan weekend trip")
    ]

    var colors: [Color] = [.red, .orange, .blue, .yellow, .green, .purple]
    @State  var textWidths: [UUID: CGFloat] = [:]
    @State  var textHeights: [UUID: CGFloat] = [:]
    @State  var selectedColor: Color = .red
    @State  var activeTaskID: UUID? = nil
    @State  var currentHighlightID: UUID? = nil
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing:24){
                    ForEach($tasks) { $task in
                        let taskID = task.id
                        HStack{
                            Rectangle()
                                .frame(width: 10, height: 3)
                         
                            Text(task.title)
                                .font(.headline)
                            
                                .background{
                                    GeometryReader { geometry  in
                                        ZStack{
                                            ForEach(task.highlights) { highlight in
                                                Rectangle()
                                                    .foregroundStyle(highlight.color)
                                                    .frame(width: max(1, highlight.width),height: 20)
                                                    .position(x: highlight.startX + max(1,highlight.width) / 2,
                                                              y: textHeights[taskID,default:0] > 30 ? highlight.startY : 10)
                                                    .offset(y: textHeights[taskID,default:0] > 30 ? -5 : 0)
                                                
                                                    
                                                
                                            }
                                        }
                                        .onAppear{
                                            DispatchQueue.main.async {
                                                textWidths[taskID] = geometry.size.width
                                                textHeights[taskID] = geometry.size.height
                                            }
                                        }
                                        
                                    }
                                }
                               //I have changed this part because there's a delay when we start dragging
                                .simultaneousGesture(
                                    TapGesture(count: 2)
                                        .onEnded {
                                            DispatchQueue.main.async {
                                                task.highlights.removeAll()
                                                currentHighlightID = nil
                                                activeTaskID = nil
                                            }
                                        }
                                )
                                .gesture(
                                    DragGesture(minimumDistance: 0)
                                        .onChanged { value in
                                            // and in this part, I want make sure we are adding value before enable the opacity
                                            if abs(value.translation.width) > 5 {
                                                activeTaskID = task.id
                                            }
 
                                                        let textWidth = textWidths[task.id, default: 0]
                                                        let startX = value.startLocation.x
                                                        let startY = value.startLocation.y
                                                        let endX = value.location.x
                                                        
                                                         let maxAllowedWidth = textHeights[task.id, default: 0] > 30 ?
                                                            textWidth : textWidth - startX

                                                        let newWidth = min(max(1, endX - startX), maxAllowedWidth)

                                                        if let currentID = currentHighlightID,
                                                          
                                                           let index = task.highlights.firstIndex(where: { $0.id == currentID }) {
                                                           
                                                                task.highlights[index].width = newWidth
                                                            
                                                            
                                                        } else {
                                                          
                                                                let newHighlight = Highlight(color: selectedColor, startX: startX, startY: startY, width: newWidth)
                                                               task.highlights.append(newHighlight)
                                                               currentHighlightID = newHighlight.id
                                                            
                                                         
                                                        }

                                        }
                                        .onEnded { _ in
                                            DispatchQueue.main.async {

                                                    activeTaskID = nil
   
                                                currentHighlightID = nil
                                            }
                                        }
                                )
                               

                            
                            Spacer()
                        }
                        .opacity(activeTaskID == nil || activeTaskID == task.id ? 1 : 0.2)
                   
                       

                       
                    }
                }
                .safeAreaPadding()
               
            }
            .overlay(alignment: .bottom, content: {
                HStack{
                    ForEach(colors,id:\.self) { color in
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(color)
                            .scaleEffect(selectedColor == color ? 0.8 : 1)
                            .overlay {
                                Circle().stroke(lineWidth: 2)
                                    .foregroundStyle(selectedColor == color ? Color.primary : .clear)
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedColor = color
                                }
                            }
                    }
                }
            })
            .navigationTitle("Tasks")
        }
    }
}

#Preview {
    ContentView()
}
