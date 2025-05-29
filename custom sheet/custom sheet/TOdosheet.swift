//
//  TOdosheet.swift
//  custom sheet
//
//  Created by youssef on 2023-01-02.
//

import SwiftUI

struct TOdosheet: View {
    @State var sheet :Bool = false
    var body: some View {
        Button(action: {
            sheet.toggle()
        }, label: {
            Text("KLICK ME")
        })
        .buttonStyle(.bordered)
        .tint(.red)
        .sheet(isPresented: $sheet, content: {
           todoui()
                .presentationDetents([.fraction(0.30)])
                .presentationDragIndicator(.visible)
        })
        
    }
}

struct TOdosheet_Previews: PreviewProvider {
    static var previews: some View {
        TOdosheet()
    }
}
