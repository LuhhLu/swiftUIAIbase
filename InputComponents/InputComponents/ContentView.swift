 

import SwiftUI

struct ContentView: View {
    @State private var selectedDay = "01"
       @State private var selectedMonth = "January"
       @State private var selectedYear = "2023"
       
       private let days = (1...31).map { String(format: "%02d", $0) }
       private let months = Calendar.current.monthSymbols
       private let years = (1900...2100).map { String($0) }
    //SubmitTF
    @State var text = ""
    
    //EmailTF
    @State var emailAddress = ""
    @State var send = false
    
    //InfoField
    @State var Firsname = ""
    @State var Lastname = ""
    //SearchBar
    @State var search = ""
    var body: some View {
        ScrollView {
 
                VStack(spacing:44) {
                    
                    CardView()
                    
                    DateInputField()
                    
                    HStack(spacing: 36) {
                        CustomPicker(width: 70, selectedValue: $selectedDay, values: days, title: "Day")
                        CustomPicker(width: 135,selectedValue: $selectedMonth, values: months, title: "Month")
                        CustomPicker(width: 93,selectedValue: $selectedYear, values: years, title: "Year")
                    }
                    
                    PhoneNumberTextField()

                    PasswordCheckField()
                     .padding(.top)
                    
                    EmailTF(emailAddress: $emailAddress, send: $send, action: {send.toggle()})
//                    
                    SubmitTF(text: $text, action: {})
                    
                    InfoField(title: "First Name", text: $Firsname)
                    InfoField(title: "Last Name", text: $Lastname)
                    
                    SearchBar(search: $search)
                    
                }
            .padding()
        }

        .safeAreaPadding(.vertical,20)
    }
}

#Preview {
    ContentView()
}
