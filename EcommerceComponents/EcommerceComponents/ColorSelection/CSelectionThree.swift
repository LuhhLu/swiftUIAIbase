import SwiftUI
struct ColorOption {
    var leftColor: Color
    var rightColor: Color
    var colorName: String
}
struct CSelectionThree: View {
    let availableColors: [ColorOption] = [
        ColorOption(leftColor: .mint, rightColor: .teal, colorName: "Mint / Teal"),
        ColorOption(leftColor: .blue, rightColor: .indigo, colorName: "Blue / Indigo"),
        ColorOption(leftColor: .orange, rightColor: .yellow, colorName: "Orange / Yellow"),
        ColorOption(leftColor: .orange, rightColor: .cyan, colorName: "Orange / Cyan"),
    ]
    
    @State private var selectedColorIndex: Int = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Color: \(availableColors[selectedColorIndex].colorName)")
            HStack(spacing:16){
                
                ForEach(availableColors.indices, id: \.self) { index in
                    ZStack{
                        if availableColors[index].leftColor == availableColors[index].rightColor{
                            Circle()
                                .fill(availableColors[index].leftColor)
                                .frame(width: 40, height: 40)
                        }else{
                            ZStack{
                                Circle().trim(from: 0.0, to: 0.5)
                                    .fill(availableColors[index].leftColor)
                                    .frame(width: 40, height: 40)
                                    .rotationEffect(.degrees(180))
                                Circle()
                                    .trim(from: 0.0, to: 0.5)
                                    .fill(availableColors[index].rightColor)
                                    .frame(width: 40, height: 40)
                            }
                            .rotationEffect(.degrees(90))
                            .scaleEffect(selectedColorIndex == index ? 0.8 : 1)
                            
                        }
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundStyle(selectedColorIndex == index ? Color.primary : .clear)
                            .frame(width: 44, height: 44)
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedColorIndex = index
                        }
                    }
   
                }
            }
        }
        .padding()
    }
}

#Preview {
    CSelectionThree()
}
