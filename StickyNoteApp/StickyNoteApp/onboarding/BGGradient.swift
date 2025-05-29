 
import SwiftUI

struct BGGradient: View {
    @State  var shapeONE = Color.topl
    @State  var shapeTow = Color.topr
    @State  var shapeThree = Color.buttoml
    @State  var shapeFour = Color.buttomr
    let colors: [Color] = [.topl, .topr, .buttoml, .buttomr]
    var body: some View {
        GeometryReader{ geo in
            ZStack {
                ZStack{
                        Image(.shape1).resizable()
                            .renderingMode(.template)
                            .frame(width: 500, height: 500)
                            .offset(x: -80, y: -200)
                            .foregroundStyle(shapeONE)
                        
                        Image(.shape2).resizable()
                            .renderingMode(.template)
                            .frame(width: 550, height: 550)
                            .offset(x: 180, y: -300)
                            .foregroundStyle(shapeTow)
                        
                        Image(.shape3).resizable()
                            .renderingMode(.template)
                            .frame(width: 600, height: 600)
                            .offset(x: 100, y: 230)
                            .foregroundStyle(shapeThree)
                        
                        Image(.shape4).resizable()
                            .renderingMode(.template)
                            .frame(width: 600, height: 450)
                            .offset(x: -150, y: 230)
                            .foregroundStyle(shapeFour)
                    }
                    .blur(radius: 100)
                mishView(size: 1, opacity: 0.1).ignoresSafeArea()
                
                    .onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            withAnimation(.linear(duration: 3)){
                                let shuffledColors = colors.shuffled()
                                shapeONE = shuffledColors [0]
                                shapeTow = shuffledColors[1]
                                shapeThree = shuffledColors[2]
                                shapeFour = shuffledColors[3]
                            }
                        }
               
                }
                    
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
      
        

    }
}

#Preview {
    BGGradient()
}


 

struct mishView: View {
    let size: CGFloat
    let opacity: Double
    var body: some View {
        Canvas{context , size in
            for _ in 0...(Int(size.width * size.height) / 1){
                let x = CGFloat.random(in: 0...size.width)
                let y = CGFloat.random(in: 0...size.height)
                context.fill(Path(ellipseIn: CGRect(x: x, y: y, width: self.size, height: self.size)), with: .color(Color.white.opacity(opacity)))
                
            }
            
        }
        .blendMode(.overlay)
    }
}

 
