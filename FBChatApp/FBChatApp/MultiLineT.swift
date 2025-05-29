



import SwiftUI

struct MultiLineT: View {
    @Binding var multiLineText :String
    @Binding var textHeight:CGFloat
        var body: some View {
            VStack(alignment: .leading) {
                TextView(text: $multiLineText, textHeight: $textHeight)
                    .frame(height: textHeight,alignment: .top)
                    .padding(.horizontal,20)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            
        }
    

struct TextView:UIViewRepresentable{
    @Binding var text:String
    @Binding var textHeight:CGFloat
    func makeUIView(context: Context) ->  UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        return textView
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    func makeCoordinator() -> Coordinator {
       Coordinator(self)
    }

    class Coordinator :NSObject, UITextViewDelegate{
        var parent:TextView
        init(_ parent: TextView) {
            self.parent = parent
        }
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
            DispatchQueue.main.async {
                self.parent.textHeight = textView.sizeThatFits(textView.frame.size).height
                    
            }
        }
    }
    
}

struct MultiLineT_Previews: PreviewProvider {
    static var previews: some View {
        MultiLineT(multiLineText: .constant("test"), textHeight: .constant(38))
    }
}
