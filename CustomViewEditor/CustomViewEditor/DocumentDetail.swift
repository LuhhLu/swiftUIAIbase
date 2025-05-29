 
import SwiftUI
import PhotosUI

struct DocumentDetail: View {
    
    @Environment(\.dismiss) private var dismiss
    @Bindable var document: Document
    var onDismiss: (() -> Void)? = nil
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var selectedRange: NSRange? = nil
    @State private var changesMade: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Title", text: $document.title, axis: .vertical)
                .font(.largeTitle)
                .fontWeight(.bold)
            RichTextView(attributedString: $document.body, selectedRange: $selectedRange) {
                customKeyboardToolbar
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(.horizontal)
        .toolbar { toolbarContent }
        .background(Color(.secondarySystemBackground))
        .onChange(of: selectedPhoto) { _, newValue in
            Task {
                guard let newValue, let data = try await newValue.loadTransferable(type: Data.self),
                      let image = UIImage(data: data) else {
                    return
                }

                document.insertImage(image, at: selectedRange)
                selectedPhoto = nil
            }
        }
        .onChange(of: document.title) { _, _ in
            changesMade = true
        }
        .onChange(of: document.body) { _, _ in
            changesMade = true
        }
    }
}

// MARK: ToolBar
extension DocumentDetail {
    var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 15) {
                if changesMade {
                    Image(systemName: "square.and.arrow.up")
                    Image(systemName: "ellipsis")
                    Button {
                        dismiss()
                        onDismiss?()
                    } label: {
                        Text("Done")
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                } else {
                    Button {
                        dismiss.callAsFunction()
                        onDismiss?()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.circle)
                }
            }
            .font(.headline)
        }
    }
    var customKeyboardToolbar: some View {
        VStack(spacing: 0) {
            Divider()
            HStack(spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    PhotosPicker(selection: $selectedPhoto) {
                        Image(systemName: "photo")
                            .imageScale(.large)
                    }
                }
                .contentMargins(10, for: .scrollContent)
              
                Divider()
                Button(action: dismissKeyboard) {
                    Image(systemName: "keyboard.chevron.compact.down")
                        .imageScale(.large)
                }
                .padding(.horizontal, 10)
            }
        }
        .background(Color(.secondarySystemBackground))
        .tint(.primary)
    }
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
struct RichTextView<Toolbar: View>: UIViewRepresentable {
    @Binding var attributedString: AttributedString
    @Binding var selectedRange: NSRange?
    @ViewBuilder var toolbar: Toolbar

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.delegate = context.coordinator
        
        textView.isUserInteractionEnabled = true
        textView.isSelectable = true
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.showsVerticalScrollIndicator = false
        
        let toolbarHostingController = UIHostingController(rootView: toolbar)
        toolbarHostingController.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        textView.inputAccessoryView = toolbarHostingController.view
        
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        let nsAttributedStirng = NSMutableAttributedString(attributedString)
        let fullRange = NSRange(location: 0, length: nsAttributedStirng.length)
        
        // Update text attributes
        let attributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.label,
            .font: UIFont.boldSystemFont(ofSize: 18)
        ]
        
        nsAttributedStirng.addAttributes(attributes, range: fullRange)
        uiView.attributedText = nsAttributedStirng
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: RichTextView

        init(_ parent: RichTextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.attributedString = AttributedString(textView.attributedText)
        }
        
        func textViewDidChangeSelection(_ textView: UITextView) {
            parent.selectedRange = textView.selectedRange
        }
    }
}

#Preview {
    DocumentDetail(document: .init(title: ""))
        .tint(.primary)
}
