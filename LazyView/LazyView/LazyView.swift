import SwiftUI

struct LazyView: View {
@State private var displayedNumber: String = ""
let buttons = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
]
    
    var body: some View {
        VStack {
            
            Spacer()
            Text(displayedNumber)
                .font(.largeTitle)
                .frame(height: 30)
            Spacer()
            
            Grid(horizontalSpacing: 40, verticalSpacing: 35) {
                
                ForEach(0..<buttons.count, id: \.self) { rowIndex in
                    GridRow {
                        ForEach(buttons[rowIndex], id: \.self) { number in
                            KeypadButton(label: number, action: {
                                displayedNumber += number
                            })
                        }
                    }
                }
                
                GridRow {
                    KeypadButton(label: "0", action: { displayedNumber += "0" })
                    
                        .gridCellColumns(2)
                        .gridCellAnchor(.trailing)
                    
                    DeleteButton(action: {
                        if !displayedNumber.isEmpty {
                            displayedNumber.removeLast()
                        }
                    })
                  
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    LazyView()
}

struct KeypadButton: View {
    let label: String
    let action: () -> Void
    var body: some View {
        Button(action:  action) {
            Text(label)
                .font(.largeTitle)
                .frame(width: 80, height: 80)
                .background(Color.gray.opacity(0.3), in: Circle())
        }
        .tint(.primary)
    }
}

struct DeleteButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "delete.left").font(.largeTitle)
        } .tint(.primary)
    }
}
