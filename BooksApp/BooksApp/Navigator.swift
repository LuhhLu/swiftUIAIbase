 

import PDFKit
import SwiftData
import SwiftUI


struct Navigator: View {
    @State private var path = [Path]()
    
    enum Path: Hashable, Equatable {
        case details(Book)
        case preview(Book, BookProgress)
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            HomeView(navigationPath: $path)
                .navigationTitle("My Books")
                .navigationBarTitleDisplayMode(.large)
                .navigationDestination(for: Path.self) { item in
                    switch item {
                    case let .details(book):
                        BookDetailsView(
                            book: book,
                            navigationPath: $path
                        )
                        .navigationBarBackButtonHidden()
                        
                    case let .preview(book, progress):
                        PDFReaderView(
                            book: book,
                            progress: progress,
                            pdfDocument: loadPDFDocument(for: book)
                        )
                        .toolbarVisibility(.hidden, for: .navigationBar)
                    }
                }
        }
        .modelContainer(for: [BookProgress.self])
    }
    
    private func loadPDFDocument(for book: Book) -> PDFDocument? {
        if let path = Bundle.main.url(forResource: book.fileName, withExtension: "pdf") {
            return PDFDocument(url: path)
        }
        return nil
    }
}

#Preview {
    Navigator()
}
