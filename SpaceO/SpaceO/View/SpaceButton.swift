import SwiftUI

struct SpaceButton: View {
    let starCount: Int = 300
    var title:String
    var action: () -> Void
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 250, height: 50)
                .foregroundStyle(.C_1 )
                .overlay {
                    ZStack{
                        ForEach(0..<starCount, id: \.self) { _ in
                            StarButtonAimation()
                        }
                        Text(title)
                            .foregroundStyle(.white)
                            .font(.title2).bold()
                    }
                }
                .clipShape(.rect(cornerRadius: 40))
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
        }
        .onTapGesture {
            withAnimation {
                action()
            }
            
        }
    
    }
}
#Preview {
    HomeView()
}
struct StarButtonAimation: View {
    @State   var position =  CGPoint(x: CGFloat.random(in: 0...250),y: CGFloat.random(in: 0...55))
    let diameter = CGFloat.random(in: 0.1...2.5)
    var body: some View {
        Circle()
            .fill(.white)
            .frame(width: diameter, height: diameter)
            .position(position)
            .onAppear {
                animatePositionChange()
            }
    }
    private func animatePositionChange() {
        withAnimation(.smooth(duration: 8).repeatForever(autoreverses: true)) {
            position = CGPoint(x: CGFloat.random(in: 0...250),
                               y: CGFloat.random(in: 0...55))
        }
    }
}



  
