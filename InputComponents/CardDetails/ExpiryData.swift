 

import SwiftUI

struct ExpiryData: View {
    @State private var deletedCharacters: [Character] = []
    @State private var inputText: String = ""
    @State private var errorMessage: String? = nil
    @State var TFPromot = "MM/YY"
    @FocusState var isTyping: Bool
    
    // Computed properties to extract month and year
    private var extractedMonth: String {
        let digitsOnly = inputText.replacingOccurrences(of: "/", with: "")
        return String(digitsOnly.prefix(2))
    }
    
    private var extractedYear: String {
        let digitsOnly = inputText.replacingOccurrences(of: "/", with: "")
        return String(digitsOnly.dropFirst(2).prefix(2))
    }
    var body: some View {
        
        
        VStack(alignment:.leading){
//            Text("Month: \(extractedMonth)")
//                .font(.caption)
//                .foregroundColor(.gray)
//            Text("Year: \(extractedYear)")
//                .font(.caption)
//                .foregroundColor(.gray)
            Text("Expiry Date")
                .foregroundStyle(.gray)
            
            TextFieldView
                .overlay(alignment: .trailing) {
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            
                            .offset(x: -20)
                    }
                   
                }
          
               
        }
        .onChange(of: inputText) { old, newInput in
            formatInputText()
            if newInput.count > old.count {
                if let lastCharacter = newInput.last, lastCharacter.isNumber {
                    if !TFPromot.isEmpty {
                        deletedCharacters.append(TFPromot.first!)
                        TFPromot.removeFirst()
                    }
                }
            }else if inputText.count <= old.count{
                if inputText.count < 5, let lastDeleted = deletedCharacters.popLast() {
                    TFPromot.insert(lastDeleted, at: TFPromot.startIndex)

                }
            }
            
        }
        
        
    }
    var TextFieldView:some View{
        TextField("", text: $inputText)
            .font(.system(.body, design: .monospaced))
            .keyboardType(.numberPad)
            .focused($isTyping)
            .overlay(alignment: .leading) {
                Text("\(TFPromot)")
                    .font(.system(.body, design: .monospaced))
                    .frame(width: 55, alignment: .trailing)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        isTyping = true
                    }
            }
        
    }
    
    
    private func formatInputText() {
        errorMessage = nil
        inputText = inputText.filter { $0.isNumber }
        var digitsOnly = inputText.replacingOccurrences(of: "/", with: "")
        if digitsOnly.count > 4 {
            digitsOnly = String(digitsOnly.prefix(4))
        }
        if digitsOnly.count >= 2 {
            let monthText = digitsOnly.prefix(2)
            if let month = Int(monthText) {
                if month < 1 || month > 12 {
                    errorMessage = "Invalid month"
                    inputText = "\(monthText)"
                    return
                }
            }
            let yearText = digitsOnly.dropFirst(2).prefix(2)
            if digitsOnly.count <= 2 {
                inputText = "\(monthText)"
            } else {
                inputText = "\(monthText)/\(yearText)"
            }
        }
    }
}

#Preview {
    ExpiryData()
}
