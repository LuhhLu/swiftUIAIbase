import SwiftUI
import IntentsUI
struct DynamicTextE: View {
    @FocusState var dismiskey:Bool
    @Binding var multiLineText:String
    @Binding var  textHeight:CGFloat
    @Binding var color:Color
    var body: some View {
        VStack(alignment: .leading) {
            TextView(text: $multiLineText, textHeight: $textHeight)
                .frame(height: textHeight,alignment: .top)
                .background(color.opacity(0.7),in:RoundedRectangle(cornerRadius: 5))
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: {
                           dismiskey = false
                        }, label: {
                            Image(systemName: "keyboard.chevron.compact.down.fill").font(.title).foregroundStyle(.primary)
                        })
                    }
                }
               
                
        }
    }
}
import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var textHeight: CGFloat

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.isScrollEnabled = true  // Set to true to allow scrolling
        textView.backgroundColor = UIColor.clear

        // Create a toolbar with a Done button to dismiss the keyboard
        let toolbar = UIToolbar()
        toolbar.sizeToFit()  // Size the toolbar to fit its contents
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)  // Flexible space to push the Done button to the right
        let doneButton = UIBarButtonItem(image: UIImage(systemName: "keyboard.chevron.compact.down.fill"), style: .done, target: context.coordinator, action: #selector(Coordinator.dismissKeyboard))
        toolbar.setItems([flexSpace, doneButton], animated: true)
        textView.inputAccessoryView = toolbar  // Assign the toolbar as the input accessory view (appears above the keyboard)

        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextView

        init(_ textView: TextView) {
            self.parent = textView
        }

        func textViewDidChange(_ textView: UITextView) {
                  self.parent.text = textView.text
                  DispatchQueue.main.async {
                      self.parent.textHeight = textView.sizeThatFits(textView.frame.size).height
                          
                  }
              }

        @objc func dismissKeyboard() {
            // Use UIApplication to resign the first responder status and dismiss the keyboard
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}


 

