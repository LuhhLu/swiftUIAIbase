 

import SwiftUI

struct CardNumber: View {
    @State private var deletedCharacters: [Character] = []
    @State private var inputText: String = ""
    @State var TFPromot = "0000 0000 0000 0000"
    @FocusState var isTyping: Bool
     private var cardNumberWithoutSpaces: String {
        inputText.replacingOccurrences(of: " ", with: "")
    }

    var body: some View {
        VStack(alignment:.leading){
//            Text("Card Number (no spaces): \(cardNumberWithoutSpaces)")
//                .font(.caption)
//                .foregroundColor(.gray)

            Text("Card Number")
                .foregroundColor(.gray)
            TextFieldView
        }
      
            .onChange(of: inputText) { old, newInput in
                formatInputText()
                if newInput.count > old.count{
                    if !TFPromot.isEmpty{
                        deletedCharacters.append(TFPromot.first!)
                        TFPromot.removeFirst()
                    }
                }else if newInput.count < old.count {
                    if inputText.count < 19, let lastDeleted = deletedCharacters.popLast(){
                        TFPromot.insert(lastDeleted, at: TFPromot.startIndex)
                    }
            
                }
            }
        
    }
    var TextFieldView:some View{
        TextField("", text: $inputText)
            .font(.system(.body,design: .monospaced))
            .keyboardType(.numberPad)
            .focused($isTyping)
            .overlay(alignment: .leading) {
                Text("\(TFPromot)")
                    .font(.system(.body,design: .monospaced))
                    .frame(width: 200,alignment: .trailing)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        isTyping = true
                    }
            }
    }
    
    
    private func formatInputText() {
         inputText = inputText.filter { $0.isNumber || $0 == " " }
        var digitsOnly = inputText.replacingOccurrences(of: " ", with: "")
        digitsOnly = String(digitsOnly.prefix(16))
        var formattedText = ""
        for (index, character) in digitsOnly.enumerated() {
            if index > 0 && index % 4 == 0 {
                formattedText.append(" ")
            }
            formattedText.append(character)
        }
        inputText = formattedText
    }
}

#Preview {
    CardNumber()
}
