 

import SwiftUI
struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0.58721*height))
        path.addCurve(to: CGPoint(x: 0.97807*width, y: 0.67442*height), control1: CGPoint(x: 0.98789*width, y: 0.58721*height), control2: CGPoint(x: 0.97807*width, y: 0.62626*height))
        path.addCurve(to: CGPoint(x: width, y: 0.76163*height), control1: CGPoint(x: 0.97807*width, y: 0.72258*height), control2: CGPoint(x: 0.98789*width, y: 0.76163*height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0.75581*height))
        path.addCurve(to: CGPoint(x: 0.02193*width, y: 0.6686*height), control1: CGPoint(x: 0.01211*width, y: 0.75581*height), control2: CGPoint(x: 0.02193*width, y: 0.71677*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.5814*height), control1: CGPoint(x: 0.02193*width, y: 0.62044*height), control2: CGPoint(x: 0.01211*width, y: 0.5814*height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        return path
    }
}
struct ShapePath: View {
    var body: some View {
        ZStack(alignment: .top){
            MyShape()
                .frame(width: 350, height: 100)
                .cornerRadius(10)
                .foregroundColor(.white)
            VStack(spacing: 10){
                    HStack{
                        Text("NYK")
                        Spacer()
                        Text("1h30m")
                        Spacer()
                        Text("SFO")
                    }
                    .foregroundColor(.black)
                    .frame(width: 340)
                HStack(spacing: 12){
                   
                        Text("10:00")
                            .foregroundColor(.black)
                  
                        ZStack{
                            Circle()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.blue.opacity(0.5))
                                .blur(radius: 3)
                            Circle()
                                .frame(width: 5, height: 5)
                                .foregroundColor(.blue.opacity(0.5))
                        }
                
                    ZStack{
                        Path { path in
                            path.move(to: CGPoint(x: 0, y: 0))
                            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
                        }
                        .stroke(style: StrokeStyle(lineWidth: 2 ,dash: [5]))
                        .frame(width: 185, height: 1)
                        .clipped()
                        .foregroundColor(.black)
                        Image(systemName: "airplane")
                            .font(.title3)
                            .foregroundColor(.blue )
                            .rotationEffect(Angle.radians(6.3), anchor: .center)
                    }
                    ZStack{
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.blue.opacity(0.5))
                            .blur(radius: 3)
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(.blue.opacity(0.5))
                    }
                        Text("11:30")
                            .foregroundColor(.black)
                  
                    
                }
                .frame(width:340)
                .offset(y: -2)
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
                }
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 335, height: 2)
                    .foregroundColor(.gray)
                    .clipped()
                    .offset(y: 3)
                HStack{
                    Text("SAS").bold()
                    
                    Spacer()
                    Text("190$").bold()
                }
                .foregroundColor(.black)
                .frame(width: 340)
                   
            }
            
        }
    }
}

struct ShapePath_Previews: PreviewProvider {
    static var previews: some View {
        ShapePath()
    }
}
