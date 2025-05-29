

import SwiftUI

struct ContentView: View {
    @State var value :Double = 0.5
    var tracGradient:LinearGradient
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                tracGradient
                    .frame(width: geometry.size.width, height: 10)
                    .cornerRadius(5)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white.opacity(0.5),lineWidth: 1)
                    }
                    .opacity(0.8)
                ZStack{
                    Circle()
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                    Circle()
                        .stroke(Color.white.opacity(0.5),lineWidth: 1)
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 10, height: 10)
                        .offset(x: circleOffset().x, y: circleOffset().y)
                        .opacity(0.7)
                }
                .offset(x:CGFloat(value) * geometry .size.width - 15)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged{
                            gesture in
                            updateValue(with: gesture, in: geometry)
                        }
                         
                )
                
            }
        }
        .padding(.horizontal,40)
        .frame(height: 40)
    }
    func updateValue(with gesture: DragGesture.Value,in geomtry:GeometryProxy){
        let newValue =  gesture.location.x / geomtry.size.width
        value = min(max(Double(newValue), 0),1)
    }
    func circleOffset() -> (x:CGFloat,y:CGFloat){
        let thumRadius:CGFloat = 15
        let circleRadius:CGFloat = 5
        let angle = 2 * CGFloat.pi * CGFloat(value)
        let x = (thumRadius - circleRadius) * cos(angle)
        let y = (thumRadius - circleRadius) * sin(angle)
        return (x:x,y:y)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tracGradient: LinearGradient(gradient: Gradient(colors: [.red,.yellow,.green,.blue,.purple]), startPoint: .leading, endPoint: .trailing))
    }
}
