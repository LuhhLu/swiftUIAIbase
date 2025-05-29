// 
//
import SwiftUI

struct HomeView: View {
    let books = Book.mock
    @Binding var navigationPath: [Navigator.Path]
    
    var body: some View {
        ScrollView {
            ForEach(books) { item in
                BookItemView(book: item)
                    .onTapGesture {
                        navigationPath.append(.details(item))
                    }
                    .contentShape(Rectangle())
            }
        }
    }
}

#Preview {
    @Previewable @State var path: [Navigator.Path] = []
    HomeView(navigationPath: $path)
}

