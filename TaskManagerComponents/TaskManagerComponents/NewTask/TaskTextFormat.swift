 
import SwiftUI

struct FormattingOption: Identifiable {
    let id = UUID()
    let iconName: String
    let action: () -> Void
    var isSelected: Bool
}
struct TaskTextFormat: View {
    var formattingOptions: [FormattingOption] {
        [
            FormattingOption(
                iconName: "bold",
                action: { isBold.toggle() },
                isSelected: isBold
            ),
            FormattingOption(
                iconName: "underline",
                action: { isUnderlined.toggle() },
                isSelected: isUnderlined
            ),
           
            FormattingOption(
                iconName: "characters.uppercase",
                action: {
                    isUppercase.toggle()
                    if isUppercase {
                        isLowercase = false
                        text = text.uppercased()
                    }
                },
                isSelected: isUppercase
            ),
           
            FormattingOption(
                iconName: "characters.lowercase",
                action: {
                    isLowercase.toggle()
                    if isLowercase {
                        isUppercase = false
                        text = text.lowercased()
                    }
                },
                isSelected: isLowercase
            ),
            FormattingOption(
                iconName: "text.alignleft",
                action: { selectedAlignment = .leading },
                isSelected: selectedAlignment == .leading
            ),
            FormattingOption(
                iconName: "text.aligncenter",
                action: { selectedAlignment = .center },
                isSelected: selectedAlignment == .center
            ),
            FormattingOption(
                iconName: "text.alignright",
                action: { selectedAlignment = .trailing },
                isSelected: selectedAlignment == .trailing
            ),
           
        ]
    }
       @Binding var text: String
       @Binding var selectedColor: Color
       @Binding var isBold: Bool
       @Binding var selectedAlignment: TextAlignment
       @Binding var isUppercase: Bool
       @Binding var isLowercase: Bool
       @Binding var isUnderlined: Bool
    let colors: [Color] = [Color.primary, .pink, .purple, .blue, .green, .yellow, .red]
    var body: some View {
        VStack(spacing:12){
            HStack{
                Text("New Task")
                    .font(.headline)
                Spacer()
                if !text.isEmpty{
                    Button {
                        //
                    } label: {
                        Text("Save")
                            .padding(.horizontal)
                            .frame(height: 30)
                            .background(.indigo,in:.capsule)
                            .font(.headline)
                            .tint(.white)
                    }

                }
                Button {
                    //
                } label: {
                    Image(systemName: "xmark")
                        .padding(10)
                        .background(Color(.systemGray5),in:.circle)
                }.tint(.primary)
                
                

            }
            
            TextEditor(text: $text).frame(height: 80)
                .scrollContentBackground(.hidden)
                .background(Color(.systemGray5),in:.rect(cornerRadius: 12))
                .modifier(TextFormattingModifier(
                     textColor: selectedColor,
                     isBold: isBold,
                     isUnderlined: isUnderlined,
                     alignment: selectedAlignment
                 ))
            ColorSelectionView(selectedColor: $selectedColor, colors: colors)
            FormattingOptionsView(formattingOptions: formattingOptions)
            
        }
        .safeAreaPadding()
        .background(Color(.systemGray6),in:.rect(cornerRadius: 24))
        .padding()
    }
}

#Preview {
    ContentView()
}

struct ColorSelectionView: View {
    @Binding var selectedColor: Color
    let colors: [Color]
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 34) {
                ForEach(colors,id: \.self) { color in
                    Circle().frame(width: 40, height: 40)
                        .foregroundStyle(color)
                        .scaleEffect(selectedColor  == color ? 0.8 : 1)
                        .padding(.vertical,5)
                        .overlay {
                            Circle()
                                .stroke(selectedColor == color ? .gray : .clear,lineWidth: 2)
                        }
                        .onTapGesture {
                            withAnimation {
                                selectedColor = color
                            }
                            
                        }
                        
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}
struct FormattingOptionsView: View {
    let formattingOptions: [FormattingOption]
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing:34){
                ForEach(formattingOptions) { option in
                    Button(action: option.action) {
                        Image(systemName: option.iconName)
                            .font(.title)
                            .foregroundColor(option.isSelected ? .primary : .gray)
                    }

                }
            }
          
        }
        .safeAreaPadding(.leading, 10)
        .scrollIndicators(.hidden)

    }
}
struct TextFormattingModifier: ViewModifier {
    var textColor: Color
    var isBold: Bool
    var isUnderlined: Bool
    var alignment: TextAlignment

    func body(content: Content) -> some View {
        content
            .foregroundColor(textColor)
            .font(.system(size: 18, weight: isBold ? .bold : .regular))
            .multilineTextAlignment(alignment)
            .underline(isUnderlined, color: textColor)
    }
}
