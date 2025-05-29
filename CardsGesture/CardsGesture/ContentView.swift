 

import SwiftUI
struct colorModel: Identifiable {
    var id = UUID()
    var color: [Color]
}

struct ContentView: View {
    var mColor: [colorModel] = [
        colorModel(color: [.b1, .b2, .b3 ]),
        colorModel(color: [.b4, .b5, .b6 ]),
        colorModel(color: [.b7, .b8, .b9 ]),
        colorModel(color: [.b10, .b11, .b12 ]),
        colorModel(color: [.b13, .b14, .b15])
    ]
    @State private var show = false
    @State private var dragAmount = CGSize.zero
    @State var selectedcolor:Color = .black
    var body: some View {
        ZStack {
            Color(selectedcolor).ignoresSafeArea()
            ZStack{
                ForEach(mColor.indices,id: \.self) { item in
                    VStack{
                        ForEach(mColor[item].color,id: \.self) { color in
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(color)
                                .frame(width: 40, height: 40)
                                .onTapGesture {
                                    withAnimation {
                                        selectedcolor = color
                                    }
                                }
                        }
                    }
                    .padding(5)
                    .padding(.bottom,40)
                    .background(.white,in: RoundedRectangle(cornerRadius: 15))
                    .overlay(alignment: .bottom) {
                        Button(action: {
                            withAnimation {
                                show.toggle()
                            }
                        }, label: {
                            Circle().frame(width: 20, height: 20)
                                .foregroundStyle(selectedcolor)
                        })
                        .offset(x: show ? 4 : 0, y: -7)
                    }
                    .rotationEffect(.degrees(Double(show ? 23 * item : 0 ) + limitedRotation(item: item)), anchor: .bottom)
                    .offset(x: CGFloat(show ? Int(-6.9) * item : 0 ) - limitedRotation(item: item) / 3.7, y: CGFloat(show ? -6 * item : 0 ) - limitedRotation(item: item) / 4)
                    .gesture(
                        DragGesture()
                            .onChanged{ gesture in
                                self.dragAmount = gesture.translation
                                
                            }
                            .onEnded({ gesture in
                                withAnimation {
                                    self.dragAmount = .zero
                                    if gesture.translation.width > 50 && !show {
                                        show = true
                                    }else if gesture.translation.width < 20 && show{
                                       show = false
                                    }
                                }
                            })
                    )
                    
                    
                    
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomLeading)
        .padding()
        }
    }
    func limitedRotation(item:Int) -> Double{
        let dragFactor = 0.1
        _ = Double(mColor.count - 1) * dragAmount.width * dragFactor
        let maxRotation = 100.5
        let maxAllowedDragWidth = maxRotation / (Double(mColor.count - 1) * dragFactor)
        let limitedDragAmount = min(dragAmount.width, maxAllowedDragWidth)
        return min(Double(item) * limitedDragAmount * dragFactor , maxRotation)
    }
}

#Preview {
    ContentView()
}
