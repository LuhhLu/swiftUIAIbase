 
import SwiftUI
struct ContentView: View {
    @State var show = false
    @State var text = ""
    @State var selectedColor: Color = Color.primary
    @State var isBold: Bool = false
    @State var selectedAlignment: TextAlignment = .leading
    @State var isUppercase: Bool = false
    @State var isLowercase: Bool = false
    @State var isUnderlined: Bool = false
    var body: some View {
        VStack {
            TaskTextFormat(
                text: $text,
                selectedColor: $selectedColor,
                isBold: $isBold,
                selectedAlignment: $selectedAlignment,
                isUppercase: $isUppercase,
                isLowercase: $isLowercase,isUnderlined: $isUnderlined
                )
        }
    }
}

#Preview {
    ContentView()
}
