 

import SwiftUI

struct ContentView: View {
    @State var show:Bool = false
    var body: some View {
        VStack {
            Rectangle()
                .mask(canvas)
                .overlay {
                    ZStack{
                        Icons(show: $show, icon: "bolt.horizontal", Yoffset: 120, SAnimation: 0.22, delay: 0.14 )
                        Icons(show: $show, icon: "books.vertical", Yoffset: 211, SAnimation: 0.12, delay: 0.14)
                        Icons(show: $show, icon:  "person.badge.plus", Yoffset: 301,
                              SAnimation: 0.01, delay: 0.04)
                        
                        
                        Button {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.5)){
                                show.toggle()
                            }
                          
                        } label: {
                            ZStack{
                                Circle().frame(width: 60).foregroundColor(.black)
                                Image(systemName: "plus").font(.system(size: 30)).foregroundColor(.white)
                                    .rotationEffect(.degrees(show ? 45 : 0))
                            }
                            .offset(x: -20, y: -30)
                        }
                    }
                   

                  
                    .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
                }
        }
      
    }
    var canvas:some View{
        Canvas{ context,size in
            context.addFilter(.alphaThreshold(min: 0.4))
            context.addFilter(.blur(radius: 10))
            context.drawLayer { drawingContext in
                let drawPoint = CGPoint(x: size.width - 50, y: size.height - 60)
                for index in 1...4{
                    if let symbol = context.resolveSymbol(id: index){
                        drawingContext.draw(symbol, at: drawPoint)
                    }
                }
            }
            
        }symbols: {
            Circle().frame(width: 60).tag(1)
            CanCircle(show:$show, Yoffset:  90, sanimation: 0.3, tag: 2)
            CanCircle(show: $show, Yoffset: 180 , sanimation:0.2, tag: 3)
            CanCircle(show:$show, Yoffset:  270, sanimation: 0.1, tag: 4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Icons: View {
    @Binding var show: Bool
    let icon: String
    var Yoffset: CGFloat
    var SAnimation: CGFloat
    var delay:CGFloat
    var body: some View {
        Image(systemName: icon).font(.title2).foregroundColor(.white)
            .offset(x: -20, y:show ? -Yoffset : -45 )
            .scaleEffect(show ? 1 : 0).opacity(show ? 1 : 0)
            .animation(Animation.spring(response: 1, dampingFraction: 0.8).delay(show ? SAnimation : delay), value: show)
            .onTapGesture {
                print(icon)
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5)){
                    show.toggle()
                }
            }
            
    }
}
struct CanCircle: View {
    @Binding var show:Bool
    var Yoffset:CGFloat
    var sanimation:CGFloat
    var tag:Int
    var body: some View {
        Circle().frame(width: 60).tag(tag).offset(y: show ? -Yoffset : 0)
            .animation(Animation.spring(response: 1, dampingFraction: 0.8).delay(show ? sanimation : 0.1), value: show)
    }
}
