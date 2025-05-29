 

import SwiftUI

struct CVVCode: View {
    @State private var deletedCharacters: [Character] = []
    @State private var inputText: String = ""
    @State var TFPromot = "000"
    @FocusState var isTyping: Bool
    var body: some View {
        VStack(alignment:.leading){
            Text("CVV Code")
                .foregroundStyle(.gray)
            TextFieldView
        }
        .onChange(of: inputText) { old, newInput in
            formatInputText()
            if newInput.count > old.count {
                 if !TFPromot.isEmpty {
                    deletedCharacters.append(TFPromot.first!)
                    TFPromot.removeFirst()
                }
            } else if newInput.count < old.count {
                 if inputText.count < 3, let lastDeleted = deletedCharacters.popLast() {
                    TFPromot.insert(lastDeleted, at: TFPromot.startIndex)
                }
            }
        }
    }
    
    var TextFieldView: some View {
        TextField("", text: $inputText)
            .allowsTightening(false)
            .font(.system(.body, design: .monospaced))
            .keyboardType(.numberPad)
            .focused($isTyping)
            
            .overlay(alignment: .leading) {
                Text("\(TFPromot)")
                    .font(.system(.body, design: .monospaced))
                    .frame(width: 35, alignment: .trailing)
                    .offset(x: -2)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        isTyping = true
                    }
            }
    }
    
    private func formatInputText() {
         inputText = String(inputText.prefix(3)).filter { $0.isNumber }
    }
}

#Preview {
    CVVCode()
}
