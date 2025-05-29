 

import SwiftUI

struct NewDocumentDetail: View {
    let onSave: (Document) -> Void
    @State private var document: Document = .init(title: "")
    var body: some View {
        NavigationStack {
            DocumentDetail(document: document) {
                onSave(document)
            }
        }
    }
}

#Preview {
    NewDocumentDetail { _ in }
}
