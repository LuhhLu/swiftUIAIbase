 

import PDFKit
import SwiftData
import SwiftUI

struct PDFReaderView: View {
    let book: Book
    let progress: BookProgress?
    let pdfDocument: PDFDocument?
    
    @State private var pageIndex = 0
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack{
            PDFKitView(
                pdfDocument: pdfDocument,
                pageIndex: $pageIndex
            )
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Reading Book")
            .navigationBarTitleDisplayMode(.inline)
        }
        .overlay(alignment: .top) {
            HStack {
                if let pageCount = pdfDocument?.pageCount {
                    Text("Page \(pageIndex + 1)/\(pageCount)")
                }
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .padding()
                }
                .foregroundStyle(.progress)
            }
            .padding(.horizontal)
        }
        .onChange(of: pageIndex) {
            if let pageCount = pdfDocument?.pageCount {
                progress?.percentage = Float(pageIndex + 1) / Float(pageCount)
                progress?.currentPageIndex = pageIndex
                
                try? modelContext.save()
            }
        }
        .onAppear {
            pageIndex = progress?.currentPageIndex ?? 0
        }
    }
}
