
import SwiftUI

struct Habits:View {
    var iconName: String
    var habitName: String
    @Binding var selectedHabits: [String]
    var isSelectable :Bool {selectedHabits.count < 3 || selectedHabits.contains(habitName)}
    
    var body: some View {
        VStack(spacing:30) {
            Image(systemName: iconName)
                .font(.system(size: 25))
            Text(habitName)
        }
        .frame(width: 150, height: 130)
        .background(isSelectable ? (selectedHabits.contains(habitName) ? Color(.BG) : .white) : .white, in: RoundedRectangle(cornerRadius: 10))
        .background(RoundedRectangle(cornerRadius: 10)
            .stroke(selectedHabits.contains(habitName) ? Color(.LW) : .clear,lineWidth: 3))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        .opacity(isSelectable ? 1.0 : 0.5)
        .scaleEffect(selectedHabits.contains(habitName) ? 0.9 : 1)
        .animation(.spring, value: selectedHabits)
        .onTapGesture {
            if selectedHabits.contains(habitName){
                selectedHabits.removeAll(where: {$0 == habitName})
            }else if isSelectable{
                selectedHabits.append(habitName)
            }
        }
    }
}
struct ContentView: View {
    @State private var selectedHabits = [String]()
    let habitsData: [(icon: String, name: String)] = [
        ("figure.walk", "Work Out"),
        ("fork.knife", "Eat Food"),
        ("mic.fill", "Music"),
        ("paintbrush.fill", "Art & Design"),
        ("airplane", "Traveling"),
        ("book.fill", "Read Book"),
        ("gamecontroller.fill", "Gaming"),
        ("wrench.fill", "Mechanic")
    ]

    var body: some View {
        ZStack(alignment:.bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Choose habit").bold()
                        .font(.largeTitle)
                    Text("Choose your top 3 habits").foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 28) {
                        ForEach(habitsData, id: \.name) { habit in
                            Habits(iconName: habit.icon, habitName: habit.name, selectedHabits: $selectedHabits)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            Button(action: {
                // Handle button action here
            }) {
                Text("Get Started!")
                    .frame(width: 250, height: 50)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .offset(y: 20)
        }
    }
}


#Preview {
    ContentView()
}
