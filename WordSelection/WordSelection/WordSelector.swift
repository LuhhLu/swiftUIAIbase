 

import SwiftUI
struct WordOption: Identifiable {
    let id = UUID()
    let label: String
    let action: () -> Void
}
struct WordSelector: View {
    @Binding var selectedWord: String
    var options: [WordOption]
    @State private var showOptions = false
    var Yoffset:CGFloat
    var body: some View {
        ZStack{
            Button {
                withAnimation {
                    showOptions.toggle()
                }
            } label: {
                Text(selectedWord)
                    .fixedSize()
                    .padding(.horizontal,12)
                    .padding(.vertical,6)
                    .contentTransition(.numericText())
            }
            .tint(.primary)
            .background(.gray,in:.capsule.stroke(lineWidth: 2))
            .padding(5)
            .clipShape(Capsule())
            VStack{
                ForEach(options.indices,id:\.self) { index in
                    let option = options[index]
                    Text(option.label)
                        .fixedSize()
                        .padding(.horizontal,12)
                        .padding(.vertical,6)
                        .background(.BG,in:.capsule)
                        .opacity(showOptions ? 1 : 0)
                        .animation(.easeOut.delay(Double(index) * 0.1), value: showOptions)
                        .onTapGesture {
                            withAnimation {
                                selectedWord = option.label
                                showOptions = false
                            }
                        }
                        
                }
            }
            .offset(y: Yoffset)
            .frame(width: 40)
            

        }
    }
}

#Preview {
    let options1: [WordOption] = [
        WordOption(label: "but") { print("Option 1: but") },
        WordOption(label: "while going forward") { print("Option 1: forward") },
        WordOption(label: "surreal mode") { print("Option 1: surreal") }
    ]
    @State  var selected1 = "but"
    WordSelector(selectedWord: $selected1, options: options1, Yoffset: 90)
}
