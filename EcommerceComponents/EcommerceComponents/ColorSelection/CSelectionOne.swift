import SwiftUI

struct CSelectionOne: View {
    let availableColors: [Color] = [.gray, .yellow, .pink, .red]
    @State private var selectedColor: Color = .gray
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Color").bold()
            HStack(spacing:16){
                ForEach(availableColors,id:\.self) { color in
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(color)
                        .scaleEffect(selectedColor == color ? 0.75 : 1)
                        .overlay {
                            Circle().stroke(lineWidth: 2)
                                .foregroundStyle(selectedColor == color ? Color.primary : .clear)
                        }
                        .onTapGesture {
                            withAnimation {
                                selectedColor = color
                            }
                        }
                }
            }
         
        }
//        .padding()
    }
}

#Preview {
    CSelectionOne()
}
