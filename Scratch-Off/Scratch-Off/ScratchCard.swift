 

import SwiftUI

struct ScratchCard<Gift: View, Scratch: View>: View {
    @State private var points: [CGPoint] = []
    @State private var isScratched: Bool = false
    @State private var scale: CGFloat = 1.0
    var width: CGFloat
    var height: CGFloat
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var gift: Gift
    var scratch: Scratch
    private let scratchThreshold: CGFloat = 1

    init(width: CGFloat, height: CGFloat, backgroundColor: Color,   cornerRadius: CGFloat, @ViewBuilder gift: () -> Gift, @ViewBuilder scratch: () -> Scratch) {
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.gift = gift()
        self.scratch = scratch()
    }
    var body: some View {
        ZStack{
            // scratch view
            scratch
                .frame(width: width, height: height)
            Text("Scratch").foregroundStyle(.black).font(.title)
            Rectangle().foregroundStyle(backgroundColor)
                .frame(width: width, height: height)
                .overlay {
                    //gift view
                    gift
                        .frame(width: width, height: height)
                }
                .mask {
                    ScratchMaskView(points: $points, isScratched: $isScratched)
                        .frame(width: width, height: height)
                }
                .gesture(createScratchGesture())
            
        }
        .clipShape(.rect(cornerRadius: cornerRadius))
        .scaleEffect(scale)
        
        .onChange(of: isScratched) { oldValue, newValue in
            handleScratchedChange(newValue)
        }
       
    }
    func createScratchGesture() -> some Gesture{
        let dragGesture = DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged { value in
                points.append(value.location)
                checkIfScratchedEnough()
                
            }
        let topGesture = TapGesture()
            .onEnded { value in
                if let firstLocation = points.first{
                    points.append(firstLocation)
                    checkIfScratchedEnough()
                }
            }
        return dragGesture.simultaneously(with: topGesture)
    }
    func checkIfScratchedEnough(){
        let totalArea = width * height
        let scratchedArea = points.reduce(0) {result , point in
            result + ( 7 * 7)
            
        }
        if CGFloat(scratchedArea ) / totalArea >= scratchThreshold {
            isScratched = true
        }
    }
    
    func handleScratchedChange(_ newValue:Bool){
        if newValue{
            withAnimation {
                scale = 1.3
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                withAnimation {
                    scale = 1.0
                }
               
                
            }
        }
    }
  
}

#Preview {
    HomeView()
}
struct ScratchMaskView: View {
    @Binding var points: [CGPoint]
    @Binding var isScratched: Bool
    var body: some View {
        GeometryReader(content: { geometry in
            Canvas{ context ,size in
                if isScratched{
                    context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(.black))
                }else{
                    for point in points {
                        let rect = CGRect(origin: CGPoint(x: point.x - 25 , y: point.y - 25), size: CGSize(width: 50, height: 50))
                        context.fill(Path(ellipseIn: rect), with: .color(.black))
                    }
                }
                
            }
        })
    }
}

 
