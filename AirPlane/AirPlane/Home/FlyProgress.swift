 

import SwiftUI

struct FlyProgress: View {
    @State var moveAlongPath = 10
    var body: some View {
        ZStack{
            HStack{
                Text("NYK")
                    .font(.title2)
                Spacer()
                Text("NYK")
                    .font(.title2)
            }
            .padding(.horizontal,30)
            .offset(y: 20)
            ZStack{
                Circle()
                    .trim(from: 1/2, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: 1,dash: [7,7]))
                    .frame(width: 300, height: 300)
                Image(systemName: "airplane")
                    .font(.title)
                    .rotationEffect(Angle.radians(4.8), anchor: .center)
                    .offset(x: -150)
                    .rotationEffect(.degrees(Double(moveAlongPath)))
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 5).delay(2)){
                            moveAlongPath = 100
                    }
                }
                Rectangle()
                    .frame(height: 1)
                Circle()
                    .frame(width: 10, height: 10)
                    .offset(x: -150)
                Circle()
                    .frame(width: 10, height: 10)
                    .offset(x: 150)
            }
        }
        .foregroundColor(.white)
    }
}

struct FlyProgress_Previews: PreviewProvider {
    static var previews: some View {
        FlyProgress()
    }
}
