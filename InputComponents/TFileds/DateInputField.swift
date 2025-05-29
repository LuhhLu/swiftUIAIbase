 

import SwiftUI

struct DateInputField: View {
    @State private var deletedCharacters: [Character] = []
    @State private var selectedDate: Date = Date()
    @State private var isDatePickerPresented = false
    @State private var inputText: String = ""
    @State private var errorMessage: String? = nil
    @State var TFPromot = "DD/MM/YYYY"
    @FocusState var istyping
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text("Date")
                .foregroundStyle(.gray)
            HStack{
                TextFieldView
                DatePickerVeiw
                    .sheet(isPresented: $isDatePickerPresented) {
                        sheeetVeiw
                            .presentationDetents([.fraction(0.6)])
                    }
            }
            .frame(height: 44)
            .background(Color(.systemGray6),in:.rect(cornerRadius: 8))
            .overlay(
                RedLineCorner
            )
            .overlay(alignment: .bottomLeading) {
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .offset(y: 20)
                }
            }
          
            
        }
       
        .onChange(of: inputText) { old, newDate in
            formatInputText()
        }
        .onChange(of: inputText) { old, newDate in
            formatInputText()
            if newDate.count > old.count {
                 if let lastCharacter = newDate.last, lastCharacter.isNumber {
                     if !TFPromot.isEmpty {
                        deletedCharacters.append(TFPromot.first!)
                        TFPromot.removeFirst()
                    }
                }
            } else if newDate.count <= old.count {
                if inputText.count < 10, let lastDeleted = deletedCharacters.popLast() {
                    TFPromot.insert(lastDeleted, at: TFPromot.startIndex)
                }
            }
        }
        .onChange(of: selectedDate) { old, newDate in
            inputText = dateFormatter.string(from: newDate)
            errorMessage = nil
            TFPromot = "" // Clear TFPromot when a date is selected from the picker
            deletedCharacters = Array("DD/MM/YYYY") // Reset deletedCharacters to track placeholder restoration
        }
        
    }
    
    
    var TextFieldView:some View{
        TextField("", text: $inputText)
        .font(.system(.body, design: .monospaced))
        .padding(.leading)
        .keyboardType(.numberPad)
        .focused($istyping)
        .overlay(alignment: .leading) {
            Text("\(TFPromot)")
                .font(.system(.body,design: .monospaced))
                .offset(x: -5)
                .frame(width: 125,alignment: .trailing)
                .foregroundStyle(.gray)
                .onTapGesture {
                    istyping = true
                }
            
        }
    }
    
    
    var DatePickerVeiw:some View{
        Button {
            isDatePickerPresented.toggle()
        } label: {
            Image(systemName: "calendar")
                .foregroundStyle(.gray)
                .padding(.trailing,13)
        }
        

    }
    
    
    var RedLineCorner:some View{
        RoundedRectangle(cornerRadius: 8)
            .stroke(errorMessage == nil ? Color.gray.opacity(0.2) : Color.red, lineWidth: 1)
    }
    var sheeetVeiw:some View{
        VStack {
            DatePicker(
                "Select Date",
                selection: $selectedDate,
                displayedComponents: .date
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .onChange(of: selectedDate) {old, newDate in
                inputText = dateFormatter.string(from: newDate)
                errorMessage = nil
            }
            .padding()
            Button("Done") {
                inputText = dateFormatter.string(from: selectedDate)
                isDatePickerPresented = false
                errorMessage = nil
            }
            .padding()
        }
    }
    

    
    
    
    private func formatInputText() {
        errorMessage = nil // Reset error message

        // Filter input to allow only numbers
        inputText = inputText.filter { $0.isNumber }

        // Remove any existing slashes to reformat cleanly
        var digitsOnly = inputText.replacingOccurrences(of: "/", with: "")

        // Limit to 8 characters for DDMMYYYY format
        if digitsOnly.count > 8 {
            digitsOnly = String(digitsOnly.prefix(8))
        }
        
        // Apply formatting with validations
        if digitsOnly.count >= 2 {
            let dayText = digitsOnly.prefix(2)
            if let day = Int(dayText) {
                // Allow two digits for the day, but show error if invalid
                if day < 1 || day > 31 {
                    errorMessage = "Invalid day. Use a day between 1 and 31."
                    inputText = "\(dayText)" // Keep the two characters entered
                    return
                }
            }

            let monthText = digitsOnly.dropFirst(2).prefix(2)
            if digitsOnly.count >= 4, let month = Int(monthText) {
                // Allow two digits for the month, but show error if invalid
                if month < 1 || month > 12 {
                    errorMessage = "Invalid month. Use a month between 1 and 12."
                    inputText = "\(dayText)/\(monthText)" // Keep the two characters entered
                    return
                }
            }

            // Only allow year input after valid day and month
            let yearText = digitsOnly.dropFirst(4).prefix(4)  // Limit year to 4 digits
            if digitsOnly.count <= 2 {
                inputText = "\(dayText)"
            } else if digitsOnly.count <= 4 {
                inputText = "\(dayText)/\(monthText)"
            } else {
                inputText = "\(dayText)/\(monthText)/\(yearText)"
            }
            
            // Validate complete date format only if all parts are present (DD/MM/YYYY)
            if digitsOnly.count == 8, let date = dateFormatter.date(from: inputText) {
                selectedDate = date
            } else if digitsOnly.count == 8 {
                errorMessage = "Invalid date format"
            }
        }
    }
}

#Preview {
    DateInputField()
}
