 





struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0.5*height))
        path.addCurve(to: CGPoint(x: 0.01522*width, y: 0.26261*height), control1: CGPoint(x: 0, y: 0.37048*height), control2: CGPoint(x: 0.00677*width, y: 0.26486*height))
        path.addLine(to: CGPoint(x: 0.9674*width, y: 0.00869*height))
        path.addCurve(to: CGPoint(x: width, y: 0.5*height), control1: CGPoint(x: 0.98531*width, y: 0.00392*height), control2: CGPoint(x: width, y: 0.22528*height))
        path.addLine(to: CGPoint(x: width, y: 0.5*height))
        path.addCurve(to: CGPoint(x: 0.9674*width, y: 0.99131*height), control1: CGPoint(x: width, y: 0.77473*height), control2: CGPoint(x: 0.98531*width, y: 0.99608*height))
        path.addLine(to: CGPoint(x: 0.01522*width, y: 0.73739*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.5*height), control1: CGPoint(x: 0.00677*width, y: 0.73514*height), control2: CGPoint(x: 0, y: 0.62952*height))
        path.addLine(to: CGPoint(x: 0, y: 0.5*height))
        path.closeSubpath()
        return path
    }
}
import SwiftUI

struct ContentView: View {
    @State private var dragOffset: CGFloat = 0.0
    @State private var initialDragOffset: CGFloat = 0.0
    private let sliderWidth: CGFloat = 220.0
    private let circleSpacing: CGFloat = 44.0
    struct EmojiSection {
        let emoji: String
        let description: String
        let range: ClosedRange<Double>
    }
    private let sections: [EmojiSection] = [
        EmojiSection(emoji: "😡", description: "Angry", range: 0...0.2),
        EmojiSection(emoji: "😕", description: "Confused",   range: 0.2...0.45),
        EmojiSection(emoji: "😊", description: "Happy",   range: 0.45...0.70),
        EmojiSection(emoji: "😃", description: "Excited",  range: 0.70...0.93),
        EmojiSection(emoji: "😍", description: "In Love",  range: 0.93...1)
    ]
    
    
    var body: some View {
        let progress = dragOffset / sliderWidth
        let currentSection = sections.first(where: { $0.range.contains(Double(progress)) }) ?? sections.last
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack{
                    Text("Rate your experience ").bold().font(.title3)
                    Text(currentSection?.description ?? "")
                        .font(.system(size: 15))
                        
                }
                HStack{
                    Text(currentSection?.emoji ?? "")
                        .font(.system(size: 40)).transition(.scale)
                        .animation(.easeOut(duration: 0.3), value: currentSection?.emoji)
                    ZStack(alignment: .leading){
                        MyShape().frame(width: 230, height: 15)
                            .foregroundColor(Color("BG"))
                        MyShape().frame(width: dragOffset + 10, height: 15)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red.opacity(0.8),.yellow]), startPoint: .leading, endPoint: .trailing))
                        HStack(spacing: circleSpacing){
                            ForEach(0..<sections.count,id:\.self) { index in
                                Circle().frame(width: 6 + CGFloat(index) * 1, height:  6 + CGFloat(index) * 1)
                                    .foregroundColor(.white)
                            }
                            
                        }
                        .offset(x: 5)
                        Circle().frame(width: 30, height: 30)
                            .offset(x: dragOffset)
                            .foregroundColor(.white).shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 0)
                            .gesture(
                                DragGesture()
                                    .onChanged({ value in
                                        let change = value.translation.width
                                        let newValue = min(max(initialDragOffset + change ,0),self.sliderWidth - 15)
                                        self.dragOffset = newValue
                                    })
                                    .onEnded({ value in
                                        self.initialDragOffset = dragOffset
                                    })
                            )
                            .onAppear{
                                self.initialDragOffset = dragOffset
                            }
                        
                    }
                }
            }
            .frame(width: 320, height: 80)
            .padding()
            .background(.white,in:RoundedRectangle(cornerRadius: 20, style: .continuous))
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
