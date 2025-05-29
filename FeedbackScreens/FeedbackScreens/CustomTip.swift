import SwiftUI

struct CustomTip: View {
    
    @Binding var customTip: String
    @Binding var isPresented: Bool
    @Binding var selectedTip: String
    var formattedDisplay: String {
        // Attempt to convert the `customTip` string into a Double.
        // If conversion fails (e.g. input is not a valid number), return an empty string.
        guard let value = Double(customTip) else { return "" }

        // Create a new NumberFormatter instance.
        // This is used to format numeric values into a user-friendly string (e.g., adding commas).
        let formatter = NumberFormatter()

        // Set the formatter to use decimal number style.
        // This ensures numbers are displayed with commas for thousands, etc., but no currency symbols.
        formatter.numberStyle = .decimal

        // Format the double value into a localized string using the formatter.
        // `NSNumber` is used because NumberFormatter works with NSNumber, not Double directly.
        // If formatting fails for some reason, it falls back to an empty string using nil coalescing (`?? ""`).
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
let buttons = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
]
    
    var body: some View {
        
        VStack{
            Text(formattedDisplay)
                .font(.largeTitle).bold()
                .frame(height: 30)
                .padding(.vertical,36)
                .padding(.top,24)
            Grid(horizontalSpacing: 40, verticalSpacing: 35, content: {
                ForEach(0..<buttons.count,id:\.self) { rowIndex in
                    GridRow {
                        ForEach(buttons[rowIndex],id:\.self){ number in
                            KeypadButton(label: number) {
                                customTip += number
                            }
                        }
                    }
                }
                
                GridRow {
                    KeypadButton(label: "") {
                        customTip += ""
                    }
                    KeypadButton(label: "0") {
                        // per minute to make sure if it the custom tip is not empty and then we can add zero
                        if !customTip.isEmpty {
                            customTip += "0"
                        }
                       
                    }
                    DeleteButton {
                        if !customTip.isEmpty {
                            customTip.removeAll()
                        }
                    }
                    
                }
            })
            
            Button {
                // I have forget to add this action inside animation
                withAnimation {
                    if let value = Double(customTip), value > 0 {
                        let formatted = String(format: "$%.2f", value)
                        selectedTip = formatted
                        isPresented = false
                    }
                }
               

                
            } label: {
                Text("Continue")
                    .frame(height: 55)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .background(.white,in:.capsule)
                    .padding(.horizontal,30)
            }
            .padding(.vertical)
            .padding(.top,12)
            .padding(.bottom,8)
  
        }
        .background(.sheetBG,in:.rect(cornerRadius: 34))
        .padding()
        .safeAreaPadding(.bottom,100)
        .overlay(alignment: .topTrailing) {
            Image(systemName: "xmark")
                .font(.title)
                .padding(40)
                .onTapGesture {
                    withAnimation {
                        isPresented = false
                    }
                }
        }
       
    }
}

#Preview {
    CustomTip(customTip: .constant("00"), isPresented: .constant(false), selectedTip: .constant("00"))
}
struct KeypadButton: View {
    let label: String
    let action: () -> Void
    var body: some View {
        Button(action:  action) {
            Text(label)
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
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
