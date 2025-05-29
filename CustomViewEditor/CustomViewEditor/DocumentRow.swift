 

import SwiftUI

struct DocumentRow: View {
    var document: Document
    var body: some View {
        HStack {
            Image(systemName: "doc.text")
                .font(.headline)
            Text(document.title)
                .font(.headline)
            Spacer()
        }
        .padding(15)
        .background(Color(.tertiarySystemBackground))
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    ContentView()
}
