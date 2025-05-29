 

import SwiftUI
struct ThemeC: Identifiable {
    var id = UUID()
    var color: Color
}
var  Colors = [ ThemeC(color: .red), ThemeC(color: .yellow), ThemeC(color: .green), ThemeC(color: .mint), ThemeC(color: .cyan), ThemeC(color: .orange), ThemeC(color: .blue), ThemeC(color: .pink),ThemeC(color: .pink)]


struct ContentView: View {
    let circleRadius: CGFloat = 160
    let smallCircleRadius: CGFloat = 30
    @State private var rotation: Angle = .zero
    @GestureState private var gestureRotation: Angle = .zero
    @Binding var indexColor  : Int

    
    
    
    var body: some View {
     
        VStack {
            Spacer()
            ZStack{
                ForEach(Colors.indices,id:\.self) { index in
                    let angle = 2 * CGFloat.pi / CGFloat(Colors.count) * CGFloat(index)
                    ZStack{
                        Circle().frame(width: 50, height: 50)
                            .foregroundColor(Colors[index].color)
                        Circle().stroke(lineWidth: 3) .frame(width: 60, height: 60)
                            .foregroundColor(indexColor == index ? .black : .clear)
                        
                    }
                    .onTapGesture {
                        indexColor = index
                    }
                    .offset(x: circleRadius * cos(angle), y: circleRadius * sin(angle))
                }
            }
            .rotationEffect(rotation + gestureRotation)
            .gesture(
                DragGesture()
                    .updating($gestureRotation){ (value ,gestureRotation ,transition) in
                        let width = circleRadius * 2
                        let dragAmount = value.translation.width / width
                        let rotation = Angle(degrees: Double(dragAmount) * 360)
                        gestureRotation = rotation
                    }
                    .onEnded({ value in
                        let width = circleRadius * 2
                        let dragSpeed  = value.predictedEndTranslation.width / width
                        let endRotation = Angle(degrees: Double(dragSpeed) * 360)
                        rotation += gestureRotation + endRotation
                        let totalDegees = rotation.degrees.truncatingRemainder(dividingBy: 360)
                        _ = totalDegees / 360
                        _ = Double(Colors.count)
                        
                    })
            )
            .animation(Animation.spring(response: 0.9, dampingFraction: 1.1), value: rotation)
        }
        .offset(y: 80)
         
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(indexColor: .constant(0))
   
    }
}
