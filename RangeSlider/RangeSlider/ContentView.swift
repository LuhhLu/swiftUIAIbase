 

import SwiftUI

struct ContentView: View {
    @State var width :CGFloat = 0
    @State var widthTow :CGFloat = 15
     let offsetValue: CGFloat = 40
     @State var totalScreen: CGFloat = 0
    let maxValue: CGFloat = 1000
        @State var isDraggingLeft = false
        @State var isDraggingRight = false
    var lowerValue: Int {
        max(18, Int(mapw(value: width, from: 0...totalScreen, to: 18...60)))
    }
    var upperValue: Int {
        min(60, Int(mapw(value: widthTow, from: 0...totalScreen, to: 18...60)))
    }
    var body: some View {
        ZStack {
            Color("BG")
            GeometryReader{ geometry in
                VStack(spacing:30){
                    Text("$ \(lowerValue) - $ \(upperValue)").bold()
                        .foregroundStyle(Color("Color"))
                    ZStack(alignment:.leading){
                        RoundedRectangle(cornerRadius: 10).foregroundStyle(.gray)
                            .opacity(0.3)
                            .frame(height: 6)
                            .padding(.horizontal,6)
                        Rectangle().foregroundStyle(Color("Color"))
                            .frame(width: widthTow - width, height: 6)
                            .offset(x: width + 20)
                        HStack(spacing:0){
                            DraggableCircle(isLeft: true, isDragging: $isDraggingLeft, position: $width, otherPosition: $widthTow, limit: totalScreen)
                            DraggableCircle(isLeft: false, isDragging: $isDraggingRight, position: $widthTow, otherPosition: $width, limit: totalScreen)
                        }

                        ValueBox(isDragging: isDraggingLeft, value: lowerValue, position: width, xOffset: -18)
                        ValueBox(isDragging: isDraggingRight, value: upperValue, position: widthTow, xOffset: 0)
                    }
                    .offset(y: 8)
                }
                .frame(width: geometry.size.width, height: 130)
                .onAppear(){
                    totalScreen = geometry.size.width - offsetValue
                }
                .onAppear() {
                    totalScreen = geometry.size.width - offsetValue
                    // Setting default positions for the slider handles
                    width = getPositionForValue(22, in: 18...60, totalScreen: totalScreen)
                    widthTow = getPositionForValue(40, in: 18...60, totalScreen: totalScreen)
                }
            }
            .frame(height: 130)
            .padding(.horizontal,30)
        .background(.white,in:RoundedRectangle(cornerRadius: 20,style: .continuous))
        .padding(.horizontal,10)
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 0)
        }
        .ignoresSafeArea()
        
    }
    func mapw(value: CGFloat, from: ClosedRange<CGFloat>, to: ClosedRange<CGFloat>) -> CGFloat {
        let inputRange = from.upperBound - from.lowerBound
        guard inputRange != 0 else { return 0 }
        let outputRange = to.upperBound - to.lowerBound
        return (value - from.lowerBound) / inputRange * outputRange + to.lowerBound
    }
    func getPositionForValue(_ value: CGFloat, in range: ClosedRange<CGFloat>, totalScreen: CGFloat) -> CGFloat {
        return mapw(value: value, from: 18...60, to: 0...totalScreen)
    }
}

#Preview {
    ContentView()
}



struct DraggableCircle: View {
    var isLeft: Bool
    @Binding var isDragging: Bool
    @Binding var position: CGFloat
    @Binding var otherPosition: CGFloat
    var limit: CGFloat
    var body: some View {
        ZStack{
            Circle().frame(width: 25, height: 25).foregroundStyle(Color("Color"))
            Circle().frame(width: 15, height: 15).foregroundStyle(.white)
            
        }
        .offset(x: position + (isLeft ? 0 : -5))
        .gesture(
            DragGesture()
                .onChanged({ value in
                    withAnimation {
                        isDragging = true
                    }
                    if isLeft {
                        position = min(max(value.location.x, 0 ), otherPosition)
                    }else{
                        position = min(max(value.location.x, otherPosition ), limit)
                    }
                })
                .onEnded({ value in
                    withAnimation {
                        isDragging = false
                    }
                })
        )
    }
}

 
struct ValueBox: View {
    var isDragging: Bool
    var value: Int
    var position: CGFloat
    var xOffset: CGFloat
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .frame(width: 60, height: 30)
                .foregroundStyle(isDragging ? .black : .clear)
            Text("$\(value)")
                .foregroundStyle(isDragging ? .white : .clear)
                
        }
        .scaleEffect(isDragging ? 1 : 0)
        .offset(x: position + xOffset,y: isDragging ? -40 : 0)
    }
}

 
