 

import SwiftUI

struct RollingNumberView: View {
    var number: String
    @State private var offset: [CGFloat] = []
    @State private var hasAppeared = false
    var body: some View {
        HStack{
            ForEach(0..<number.count , id:\.self) { index in
                let char = Array(number)[index]
                SingleDigitView(char: char, offset: offset[safe: index] ?? 0)
            }
        }
        .onAppear(){
            if !hasAppeared{
                setInitialOffsets()
                hasAppeared = true
            }
        }
        .onChange(of: number) { oldValue, newValue in
            withAnimation(.linear(duration: 0.5)){
                setOffsets()
            }
        }
    }
    func setOffsets() {
        withAnimation(.easeInOut(duration: 0.5)) {
            offset = number.map { char -> CGFloat in
                if let digit = Int(String(char)) {
                    return CGFloat(digit) * 70
                } else {
                    return 0
                }
            }
        }
    }
 
    func setInitialOffsets() {
        offset = number.map { _ in CGFloat(700) }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            setOffsets()
        }
    }
}

#Preview {
    RollingNumberView(number: "34")
}
struct SingleDigitView: View {
    var char: Character
    var offset: CGFloat = 0
    var body: some View {
        GeometryReader { geometry  in
            VStack(spacing:0){
                ForEach(0..<10) { number in
                    if char.isNumber {
                        Text("\(number)").font(.system(size: 40).bold())
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }else{
                        Text("\(char)").font(.system(size: 40).bold())
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
            }
            .offset(y: -offset)
        }
        .frame(width: 25, height: 70)
        .clipped()
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
