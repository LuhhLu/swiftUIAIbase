 

import PDFKit
import SwiftUI

struct PDFKitView: UIViewRepresentable {
    let pdfDocument: PDFDocument?
    @Binding var pageIndex: Int
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.document = pdfDocument
        pdfView.displayMode = .singlePage
        pdfView.displayDirection = .horizontal
        pdfView.usePageViewController(true, withViewOptions: nil)
        
        if let document = pdfView.document, let page = document.page(at: pageIndex) {
            pdfView.go(to: page)
        }
        
        NotificationCenter.default.addObserver(
            context.coordinator,
            selector: #selector(Coordinator.onPageIndexChanged(notification:)),
            name: Notification.Name.PDFViewPageChanged,
            object: pdfView)
        
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = pdfDocument
        
        if let document = uiView.document, let page = document.page(at: pageIndex) {
            uiView.go(to: page)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}

extension PDFKitView {
    class Coordinator: NSObject {
        var parent: PDFKitView
        
        init(parent: PDFKitView) {
            self.parent = parent
        }
        
        @objc func onPageIndexChanged(notification: Notification) {
            guard let pdfView = notification.object as? PDFView,
                  let currentPage = pdfView.currentPage,
                  let pageIndex = pdfView.document?.index(for: currentPage) else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.parent.pageIndex = pageIndex
            }
        }
    }
}
