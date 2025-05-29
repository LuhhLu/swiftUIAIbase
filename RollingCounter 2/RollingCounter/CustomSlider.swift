

import SwiftUI

struct CustomSlider: View {
    @State  var value:Double = 0.5
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment:.leading){
                Capsule()
                    .frame(width: geometry.size.width, height: 5)
                    .foregroundStyle(Color(.systemGray6))
                ZStack{
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color(.systemGray4))
                    RollingNumberView(number: String(Int(value * 100)))
                        .frame(width: 20, height: 20)
                        .scaleEffect(0.4)
                        .offset(y: -50)
                }
                .offset(x: CGFloat(value) * geometry.size.width - 20)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged{ gesture in
                            updateValue(with: gesture, in: geometry)
                            
                        }
                )
                
            }
        }
        .padding(.horizontal,40)
        .frame(height: 40)
    }
    private func updateValue(with gesture: DragGesture.Value, in geometry: GeometryProxy) {
        let newValue = gesture.location.x / geometry.size.width
        value = min(max(Double(newValue), 0), 1)
    }
}

#Preview {
    CustomSlider()
}
