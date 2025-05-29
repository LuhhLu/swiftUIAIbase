 

import SwiftUI
struct ContentView: View {
    @State private var previousYOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    @State var  show = true
    var body: some View {
        ZStack{
            ZStack{
                CircleA(yOffset: $yOffset, size: 90, color: .blue)
                CircleA(yOffset: $yOffset, degrees: -60 , size: 70, color: .yellow)
                CircleA(yOffset: $yOffset, degrees: 100 , size: 50, color: .red)
            }
            .scaleEffect(min(yOffset / 100, 0.8))
            .offset(y: -410 + yOffset)
            .padding(.bottom, 0 + yOffset / 2)
        
            ScrollView(.vertical,showsIndicators: false) {
                    ForEach(0 ..< 5) { item in
                        HStack{
                            VStack(alignment:.leading){
                                Text("Refreshing").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                Text("is a custom Refresha function and more").bold()
                                Spacer()
                            }
                           Spacer()
                            Image("im").resizable().scaledToFill()
                                .frame(width: 150, height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .background(GeometryReader{
                            self.detectScrollOffset(grometry: $0)
                        })
                       
                        .padding(.horizontal)
                    }
            }
            .coordinateSpace(name: "Scrollview")
            .redacted(reason: show ? [] : .placeholder)
        }
    }
    func detectScrollOffset (grometry:GeometryProxy)-> some View{
        let yoffset = grometry.frame(in: .named("Scrollview")).minY
        DispatchQueue.main.async {
            self.yOffset = yoffset
            if yoffset > 20 {
                self.show = false
            }else{
                self.show = true
                if self.previousYOffset == 0 && self.yOffset == 0{
                    //your update finction
                    print("The view has been updated.")

                }
                self.previousYOffset = self.yOffset
            }
        }
        return Rectangle().fill(Color.clear)
    }
}

#Preview {
    ContentView()
}
struct CircleA: View {
    @Binding var yOffset:CGFloat
    var degrees:CGFloat = 60
    var size:CGFloat = 0
    var color:Color
    var body: some View {
        Circle().trim(from: 0, to: min(yOffset / 100, 1))
            .stroke(style: StrokeStyle(lineWidth: 5,lineCap: .round,lineJoin: .round))
            .frame(width: size, height: size)
            .rotationEffect(.degrees(degrees + yOffset))
            .foregroundStyle(color)
        
    }
}

 
