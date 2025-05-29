 

import SwiftUI

struct CreateTaskView: View {
    @State private var title: String = ""
    @State private var fromDate: Date = .now
    @State private var toDate: Date = .now
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State private var selectedColor: Color = .yellow
    private let colors: [Color] = [.yellow, .red, .blue, .green,.cyan, .gray]
    var body: some View {
        ScrollView{
            VStack(spacing:20){
                Text("Create New Task")
                    .bold()
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                container {
                    TextField("Task name", text: $title)
                }
                VStack{
                    container { DatePicker("From date", selection: $fromDate) }
                    
                    container { DatePicker("From date", selection: $toDate, in: fromDate...Date.distantFuture) }
                }
                container {
                    VStack{
                        Text("Select Color")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack{
                            ForEach(colors, id: \.self){ color in
                                Circle()
                                    .fill(color)
                                    .frame(width: 40, height: 40)
                                    .opacity(selectedColor == color ? 1 : 0.5)
                                    .scaleEffect(selectedColor == color ? 1 : 0.8)
                                    .overlay(content: {
                                        Circle().stroke(lineWidth: 2)
                                            .foregroundStyle(selectedColor == color ?  Color.primary : .clear)
                                            .padding(-4)
                                    })
                                
                                    .onTapGesture {
                                            selectedColor = color
                                    }
                            }
                            Spacer()
                        }
                        .padding(5)
                    }
                    .padding(.vertical,12)
                    
                }
                Text("Save Task").font(.title2.bold())
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.thinMaterial,in:.capsule)
                .padding(.vertical,10)
                .contentShape(Rectangle())
                .onTapGesture {
                    create()
                }
               
            }
        }
        .scrollIndicators(.hidden)
        .safeAreaPadding(.bottom,100)
        .padding(.horizontal)
    }
    @ViewBuilder
    func container<C: View>(with content: () -> C) -> some View {
        HStack{
            content()
        }.padding(.horizontal)
            .tint(.primary)
            .frame(minHeight: 55)
            .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 15))
            
    }
    func create() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let taskTitle = title.isEmpty ? "(No Title)" : title
        let task = Item(
            from: formatter.string(from: fromDate),
            to: formatter.string(from: toDate),
            title: taskTitle,
            subtitle: timeRangeString(from: fromDate, to: toDate),
            color: colorName(for: selectedColor)
           
        )
        modelContext.insert(task)
        try? modelContext.save()
        dismiss()
    }
    func colorName(for color: Color) -> String {
        switch color {
        case .yellow: return "yellow"
        case .red:    return "red"
        case .blue:   return "blue"
        case.green : return "green"
        case .purple: return "purple"
        case .gray:   return "gray"
        case .cyan:   return "cyan"
        default:      return "yellow"
        }
    }
    func timeRangeString(from startDate: Date, to endDate: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h.mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        let startString = formatter.string(from: startDate)
        let endString = formatter.string(from: endDate)
        
        return "\(startString) - \(endString)"
    }
}

#Preview {
    CreateTaskView()
}
