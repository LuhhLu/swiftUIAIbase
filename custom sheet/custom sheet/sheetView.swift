//
//  sheetView.swift
//  custom sheet
//
//  Created by youssef on 2023-01-02.
//

import SwiftUI

struct sheetView: View {
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
          ContentView()
              .presentationDetents([.medium,.large])
              .presentationDragIndicator(.visible)
      })
    }
}

struct sheetView_Previews: PreviewProvider {
    static var previews: some View {
        sheetView()
    }
}
