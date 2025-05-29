 




import SwiftUI
struct secondSlider: View {
    @State  var value:Double = 0.5
    var body: some View {
        GeometryReader{ geomtry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 2.5)
                    .frame(width: geomtry.size.width, height: 5)
                ZStack{
                    Circle()
                        .stroke(lineWidth: 4)
                        Circle()
                        .foregroundColor(.white)
                    Text("\(Int(value * 100))")
                    
                }
                .offset(x: CGFloat(value) * geomtry.size.width - 20)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged{ gesture in
                            updateValue(with: gesture, in: geomtry)
                            
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

struct secondSlider_Previews: PreviewProvider {
    static var previews: some View {
        secondSlider()
    }
}
