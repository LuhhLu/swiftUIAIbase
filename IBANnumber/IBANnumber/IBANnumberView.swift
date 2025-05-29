 

import SwiftUI

struct IBANnumberView: View {
    var IBANS: [IBANModel]
    @Binding var text: String
    @State private var maxNumbers = 22
    @FocusState var isTyping: Bool
    var SpaceBetweenNumbers: CGFloat {
        let reductionValues: [Int: CGFloat] = [
            // foe 15 number
            15: 1,
            // foe 16 number
            16: 0.8,
            // foe 17 number  ect ...
            17: 1,
            18: 0.8,
            19: 0.9,
            20: 0.9,
            21: 0.9,
            22: 0.9,
            23: 0.9,
            24: 0.9,
            25: 0.9,
            26: 0.8,
            27: 0.7,
            28: 0.7,
            29: 0.7,
            30: 0.6
        ]
        return reductionValues[maxNumbers] ?? 0.4
    }
    var IBANNumberwidth: CGFloat {
        let scalingValues: [Int: CGFloat] = [
            // foe 15 number
            15: 12.60,
            // foe 16 number
            16: 12.50,
            // foe 17 number  ect ...
            17: 12.9,
            18: 12.9,
            19: 12.7,
            20: 12.60,
            21: 12.9,
            22: 12.80,
            23: 12.70,
            24: 12.60,
            25: 12.80,
            26: 12.80,
            27: 12.79,
            28: 12.7,
            29: 12.9,
            30: 12.9
        ]
        return scalingValues[maxNumbers] ?? 12.55
    }
    var body: some View {
        VStack(alignment:.leading) {
            ZStack(alignment:.leading){
                HStack(spacing:1){
                    ForEach(0 ..< maxNumbers,id:\.self){ item in
                        if item < maxNumbers - (maxNumbers - text.replacingOccurrences(of: " ", with: "").count){
                            EmptyView()
                        }else{
                            // each 4 numbers will add space between them
                            if item % 4 == 0 && item != 0{
                                Rectangle()
                                    .frame(width: 13 - CGFloat(item / 4) * SpaceBetweenNumbers, height: 9)
                                    .foregroundStyle(.clear)
                            }
                            // first two will be "A"A" and the rest will be "0"
                            Text(item < 2 ? "A" : "0")
                                .font(.system(.body,design: .monospaced))
                                .frame(width: 9.2)
                                .foregroundStyle(.gray)
                        }
                    }
                    .onTapGesture {
                        isTyping = true
                    }
                }
                .frame(width: CGFloat(maxNumbers) * IBANNumberwidth,alignment: .trailing)
                TextField("", text: $text)
                    .textInputAutocapitalization(.characters)
                    .disableAutocorrection(true)
                    .font(.system(.body,design: .monospaced))
                    .onChange(of: text){old, newValue in
                        text = newValue.uppercased()
                    }
                    .focused($isTyping)
                    .onChange(of: text) { oldValue, newValue in
                        let cleanInput = newValue.replacingOccurrences(of: " ", with: "")
                            .filter { $0.isLetter || $0.isNumber }
                        let countryCode = String(cleanInput.prefix(2)).uppercased()
                        if let ibanModel = IBANS.first(where: { $0.CountryCode == countryCode }) {
                            maxNumbers = ibanModel.maxNumbers
                        } else {
                            maxNumbers = 22
                        }
                        if cleanInput.count <= maxNumbers {
                            text = formatText(cleanInput)
                        } else {
                            text = oldValue
                        }
                    }
                
            }
        }
      
    }
    // add space after each 4 letters
    private func formatText(_ input: String) -> String {
        let cleanInput = input.replacingOccurrences(of: " ", with: "")
        var formatted = ""
        for (index, char) in cleanInput.enumerated(){
            if index > 0 && index % 4 == 0 {
                formatted.append(" ")
            }
            formatted.append(char)
        }
        return formatted
    }
    
    
}

#Preview {
    HomeVeiw()
}
