import SwiftUI
import UIKit

struct ImmediateKeyboardModifier: ViewModifier {
    @State private var isFirstResponder = false

    func body(content: Content) -> some View {
        content
            .background(ImmediateKeyboardHelper(isFirstResponder: $isFirstResponder))
            .onAppear {
                isFirstResponder = true
            }
    }
}

struct ImmediateKeyboardHelper: UIViewRepresentable {
    @Binding var isFirstResponder: Bool

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isHidden = true
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        if isFirstResponder {
            uiView.becomeFirstResponder()
        }
    }
}

extension View {
    func immediateKeyboard() -> some View {
        self.modifier(ImmediateKeyboardModifier())
    }
}
