 

import SwiftUI

struct CustomActivityRingsView: View {
    var icon: String
    var BG:String
    var WHeight:CGFloat
    var completionRate: Double
    var ringThickness: CGFloat
    var colorGradient: Gradient
 
   
    private var rotationDegree: Angle {
        .degrees(-90)
    }

    private var endAngle: Angle {
        .degrees(completionRate * 360 - 90)
    }

    private var strokeStyle: StrokeStyle {
        StrokeStyle(lineWidth: ringThickness, lineCap: .round)
    }

    private var gradientEffect: AngularGradient {
        AngularGradient(gradient: colorGradient, center: .center, startAngle: rotationDegree, endAngle: endAngle)
    }

    private var gradientEndColor: Color {
        colorGradient.stops.indices.contains(1) ? colorGradient.stops[1].color : Color.clear
    }


    private var circleShadow: Color {
        .black.opacity(0.4)
    }

    private var overlayPosition: (_ width: CGFloat, _ height: CGFloat) -> CGPoint {
        return { width, height in
            CGPoint(x: width / 2, y: height / 2)
        }
    }

    private var overlayOffset: (_ width: CGFloat, _ height: CGFloat) -> CGFloat {
        return { width, height in
            min(width, height) / 2
        }
    }

    private var overlayRotation: Angle {
        .degrees(completionRate * 360 - 90)
    }

    private var clippedCircleRotation: Angle {
        .degrees(-90 + completionRate * 360)
    }
    
    var body: some View {
        
        ZStack{
            Circle().stroke(lineWidth: 30).foregroundColor(Color(BG).opacity(0.2))
            Circle().rotation(rotationDegree)
                .trim(from: 0, to: CGFloat(completionRate))
                .stroke(gradientEffect, style: strokeStyle)
                .overlay(overlayCircle)
    
        }
        .frame(width: WHeight, height: WHeight)
        .overlay(alignment: .top) {
            Image(systemName: icon).bold().offset( y: -11).font(.title2)
                .foregroundColor(.black)
              
        }
    }
    var overlayCircle :some View{
        GeometryReader { geo in
            Circle().fill(gradientEndColor)
                .frame(width: ringThickness, height: ringThickness)
                .position(overlayPosition(geo.size.width,geo.size.height))
                .offset(x: overlayOffset(geo.size.width,geo.size.height))
                .rotationEffect(overlayRotation)
                .shadow(color: circleShadow, radius: ringThickness / 5)
        }
        .clipShape(
            Circle().rotation(clippedCircleRotation).trim(from: 0, to: 0.1)
                .stroke(style: strokeStyle)
        )
    }
}








struct CustomActivityRingsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomActivityRingsView(icon:"arrow.up",
                                BG: "C1", WHeight: 300, completionRate: 1.3, ringThickness: 30,
                                colorGradient: Gradient(colors: [Color("C1"), Color("C2")]))
    }
}
