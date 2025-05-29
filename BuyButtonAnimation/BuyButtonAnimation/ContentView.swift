 

import SwiftUI

struct ContentView: View {
    @State private var show = false
    @State private var degrees = 0.0
    @State private var trimValue: CGFloat = 0.95
    @Namespace private var namespace
    @State var showCheckmark = 0.0
    var body: some View {
        VStack{
            Spacer()
            if !show{
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .matchedGeometryEffect(id: "ToCircle", in: namespace)
                    .frame(width: 200, height: 55)
                    .overlay {
                        Label("Buy", systemImage: "bag").bold().font(.title3)
                            .foregroundStyle(.white)
                    }
            }else{
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .trim(from: 0, to: trimValue)
                    .stroke(lineWidth: 3)
                    .matchedGeometryEffect(id: "ToCircle", in: namespace)
                    .frame(width: 55, height: 55)
                    .rotationEffect(.degrees(degrees))
                    .overlay {
                        CheckmarkView(showCheckmark: $showCheckmark)
                    }
                   
                
            }
        }
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.42) {
                withAnimation(.linear(duration: 0.8).repeatCount(3, autoreverses: false)) {
                    degrees = 360
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    trimValue = 1
                    showCheckmark = 1
                    
                }
            }
        }
      
    }
}

#Preview {
    ContentView()
}


struct CheckmarkView: View {
    @Binding var showCheckmark: Double
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: -1, y: -1))
            path.addCurve(to: CGPoint(x: 21, y: 26), control1:  CGPoint(x: -1, y: -11), control2:  CGPoint(x: 22, y: 26))
            path.addCurve(to: CGPoint(x: 56, y: -28), control1:  CGPoint(x: 20, y: 26), control2:  CGPoint(x: 56, y: -28))
            path.move(to:CGPoint(x: -1, y: -1))
                
        }
        .trim(from: 0.0, to: showCheckmark)
        .stroke(style: StrokeStyle(lineWidth: 8,lineCap: .round))
        .foregroundStyle(.green)
        .scaleEffect(0.5)
        .offset(y: 15)
    }
}
