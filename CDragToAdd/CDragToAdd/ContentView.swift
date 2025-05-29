import SwiftUI

// Task struct defining each task with a unique identifier, name, and note.
struct Task: Identifiable {
    let id = UUID() // Unique identifier for each task.
    var name: String // Name of the task.
    var note: String // Additional note for the task.
}

// ContentView is the primary view of your SwiftUI application.
struct ContentView: View {
    @State private var tasks: [Task] = [] // Array to store tasks.
    @State private var yOffset: CGFloat = 0 // Vertical scroll offset value.
    @State var show = false // State to control visibility of a task addition view.
    @State var newTask = Task(name: "", note: "") // Temporary storage for a new task.

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                AnimatedPlusCircle(yOffset: $yOffset) // Custom view for animated circle with a plus icon.
                ScrollView {
                    ScrollObserver(yOffset: $yOffset) {
                        // Action to toggle the visibility of task addition view.
                        withAnimation {
                            show.toggle()
                        }
                    }
                    TaskListView(tasks: tasks) // Custom view to display a list of tasks or a placeholder message.
                }
                .coordinateSpace(name: "Scrollview") // Coordinate space for tracking ScrollView's position.
            }

            // AddView is a custom view for adding a new task.
            AddView(task: $newTask, show: $show) { task in
                tasks.append(task) // Append new task to tasks array.
                show = false // Hide the AddView.
                newTask = Task(name: "", note: "") // Reset newTask for next input.
            }
            .offset(y: show ? 60 : 350) // Offset position for the AddView.
        }
    }
}

// ScrollObserver observes and reacts to ScrollView's scroll position.
struct ScrollObserver: View {
    @Binding var yOffset: CGFloat // Binding to the parent view's yOffset state.
    @State private var actionTriggered = false // Tracks whether the action has been triggered.
    let Action: () -> Void // Closure for the action to be executed on scroll.

    var body: some View {
        GeometryReader { geo in
            Color.clear
                .onChange(of: geo.frame(in: .named("Scrollview")).minY) { oldValue, newValue in
                    yOffset = newValue // Update yOffset based on ScrollView's position.
                    // Check if yOffset is enough to trigger the action and if it hasn't been triggered yet.
                    if min(yOffset / 100, 1) >= 1 && !actionTriggered {
                        Action() // Execute the action.
                        actionTriggered = true // Mark the action as triggered.
                    } else if min(yOffset / 100, 1) < 1 {
                        actionTriggered = false // Reset actionTriggered when yOffset is less than threshold.
                    }
                }
        }
        .frame(height: 0) // Invisible frame for the observer.
    }
}


#Preview {
   ContentView()
}

 

// CircleA is a view that draws a customizable circle based on the provided parameters.
struct CircleA: View {
    @Binding var yOffset: CGFloat // The vertical scroll offset value.
    var degrees: CGFloat = 60 // Rotation degree for the circle.
    var size: CGFloat = 0 // Size of the circle.
    var color: Color // Color of the circle.

    var body: some View {
        Circle()
            .trim(from: 0, to: min(yOffset / 100, 1)) // Trimming the circle based on yOffset.
            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)) // Styling the stroke of the circle.
            .frame(width: size, height: size) // Setting the frame of the circle.
            .foregroundStyle(color) // Setting the color of the circle.
            .rotationEffect(.degrees(degrees)) // Rotating the circle.
    }
}

// AnimatedPlusCircle combines a CircleIndicator and a PlusImage in a ZStack.
struct AnimatedPlusCircle: View {
    @Binding var yOffset: CGFloat // The vertical scroll offset value.

    var body: some View {
        ZStack {
            CircleIndicator(yOffset: $yOffset) // Custom circle indicator view.
            PlusImage() // Custom view for displaying a plus image.
        }
        .scaleEffect(scaleFactor) // Scaling the ZStack based on yOffset.
        .offset(y: offset) // Moving the ZStack up or down based on yOffset.
        .padding(.bottom, yOffset) // Padding at the bottom, adjusting with yOffset.
        .opacity(opacity) // Opacity changes based on yOffset.
    }

    // Calculates the scale factor based on yOffset.
    private var scaleFactor: CGFloat {
        min(yOffset / 100, 0.8)
    }

    // Calculates the offset based on yOffset.
    private var offset: CGFloat {
        -380 + yOffset
    }

    // Calculates the opacity based on yOffset.
    private var opacity: CGFloat {
        yOffset / 100
    }
}

// CircleIndicator is a view that creates a circular shape with animation effects.
struct CircleIndicator: View {
    @Binding var yOffset: CGFloat // The vertical scroll offset value.

    var body: some View {
        Circle()
            .trim(from: 0, to: trimmedAmount) // Trimming the circle based on yOffset.
            .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)) // Styling the stroke of the circle.
            .frame(width: 80, height: 80) // Setting the frame of the circle.
            .foregroundStyle(.black) // Color of the circle.
            .rotationEffect(.degrees(-90)) // Rotating the circle.
    }

    // Calculates the amount to trim the circle based on yOffset.
    private var trimmedAmount: CGFloat {
        min(yOffset / 100, 1)
    }
}

// PlusImage is a view that displays a plus symbol.
struct PlusImage: View {
    var body: some View {
        Image(systemName: "plus") // System image of a plus symbol.
            .bold() // Making the image bold.
            .font(.system(size: 40)) // Setting the font size of the image.
    }
}

// TaskListView displays either an EmptyTaskView or a TaskList based on whether tasks are available.
struct TaskListView: View {
    let tasks: [Task] // Array of Task items.

    var body: some View {
        if tasks.isEmpty {
            EmptyTaskView() // View to display when there are no tasks.
        } else {
            TaskList(tasks: tasks) // View to display the list of tasks.
        }
    }
}

// EmptyTaskView shows a message and an image when the task list is empty.
struct EmptyTaskView: View {
    var body: some View {
        VStack {
            Text("Drag Down To Add New Task") // Message prompting to add new task.
                .font(.title2) // Font style.
            Image(systemName: "arrow.down.circle.dotted") // System image.
                .font(.system(size: 40)) // Image size.
        }
        .bold() // Making the text bold.
        .offset(y: 150) // Vertically offsetting the view.
        .foregroundStyle(.gray) // Setting the foreground color.
    }
}

// TaskList displays a list of tasks.
struct TaskList: View {
    let tasks: [Task] // Array of Task items.

    var body: some View {
        ForEach(tasks) { task in
            TaskRow(task: task) // Creating a row for each task.
        }
    }
}

// TaskRow displays details for a single task.
struct TaskRow: View {
    let task: Task // Single Task item.

    var body: some View {
        VStack(alignment: .leading) { // Vertical stack with leading alignment.
            Text(task.name) // Displays the task's name.
            Text(task.note) // Displays the task's note.
            Divider() // A line to separate tasks.
        }
        .padding() // Padding around the task.
    }
}
