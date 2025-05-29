import SwiftUI

struct CircularIconsView: View {
    let outerIcons = [
        "car.fill","fuelpump.fill","bolt.fill", "speedometer","chart.line.uptrend.xyaxis","dollarsign.circle","folder.fill","wrench.fill","location.fill","book.fill"
    ]

    @State var degrees: CGFloat = 0
    var body: some View {
        ZStack {
            ForEach(0..<outerIcons.count, id: \.self) { index in
                VStack {
                    Image(systemName: outerIcons[index]).font(.title)
                        .symbolRenderingMode(.multicolor)
                        .rotationEffect(.degrees(-degrees))
                }
                .circularPosition(index: index, totalCount: outerIcons.count, radius: 130)
                .rotationEffect(.degrees(degrees))
            }
        }
       
        .onAppear() {
            withAnimation(.linear(duration: 15).repeatForever(autoreverses: false)) {
                degrees = 360
            }
        }
    }
}
#Preview {
    CircularIconsView()
}

struct CircularPositionModifier: ViewModifier {
    var index: Int
    var totalCount: Int
    var radius: CGFloat
    func body(content: Content) -> some View {
        let angle = Angle(degrees: (Double(index) / Double(totalCount)) * 360)
        return content
            .offset(
                x: CGFloat(cos(angle.radians)) * radius,
                y: CGFloat(sin(angle.radians)) * radius
            )
    }
}
extension View {
    func circularPosition(index: Int, totalCount: Int, radius: CGFloat) -> some View {
        self.modifier(CircularPositionModifier(index: index, totalCount: totalCount, radius: radius))
    }
}
 
