

import SwiftUI

struct CustomCircularSlider: View {
   @Binding var value: Double
   
   @State private var progress: Double = 0.0
   @State private var rotationAngle = Angle.degrees(0)

   enum Constants {
       static let lineWidth: CGFloat = 52
       static let size = CGSize(width: 320, height: 320)
       static let maximumValue: Int = 10
       static let thumbSize = CGSize(width: 42, height: 42)
   }
   
   var body: some View {
       ZStack {
           Circle()
               .stroke(
                   style: .init(
                       lineWidth: Constants.lineWidth,
                       lineCap: .round,
                       lineJoin: .round
                   )
               )
               .foregroundStyle(.gray.opacity(0.3))
           
           ForEach(1...Constants.maximumValue, id: \.self) { item in
               if item > Int(value) || item != Constants.maximumValue {
                   Text("\(item)")
                       .bold()
                       .rotationEffect(.degrees(-Double(360/Constants.maximumValue * item)))
                       .offset(y: -Constants.size.height/2)
                       .rotationEffect(.degrees(Double(360/Constants.maximumValue * item)))
                       .foregroundStyle(.gray.mix(with: .white, by: 0.5))
               }
           }
           
           Circle()
               .trim(from: 0, to: progress)
               .stroke(
                   style: .init(
                       lineWidth: Constants.lineWidth,
                       lineCap: .round,
                       lineJoin: .round
                   )
               )
               .foregroundStyle(.blue.mix(with: .purple, by: 0.4))
               .rotationEffect(.degrees(-90))
               .shadow(radius: 6)
           
           ForEach(1...Constants.maximumValue, id: \.self) { item in
               if item <= Int(value) || item == Constants.maximumValue {
                   Text("•")
                       .bold()
                       .offset(y: -Constants.size.height/2)
                       .rotationEffect(.degrees(Double(360/Constants.maximumValue * item)))
                       .foregroundStyle(.white)
               }
           }
           
           Circle()
               .frame(width: Constants.thumbSize.width, height: Constants.thumbSize.height)
               .offset(y: -Constants.size.height/2)
               .rotationEffect(rotationAngle)
               .foregroundStyle(.white)
               .gesture(
                   DragGesture(minimumDistance: 0)
                       .onChanged { value in
                           withAnimation(.linear(duration: 0.3)) {
                               rotationAngle = changeAngle(location: value.location)
                           }
                       }
                       .onEnded { _ in
                           let diff = progress * Double(Constants.maximumValue) - (progress * Double(Constants.maximumValue)).rounded(.down)

                           if diff > 0.5 {
                               withAnimation {
                                   value = value.rounded(.up) + 1
                                   progress = value / Double(Constants.maximumValue)
                                   rotationAngle = .degrees(360 * progress)
                               }
                           } else {
                               withAnimation {
                                   value = value.rounded(.down)
                                   progress = value / Double(Constants.maximumValue)
                                   rotationAngle = .degrees(360 * progress)
                               }
                           }
                       }
               )
           
           Text("x\(Int(value))")
               .font(.system(size: 80, weight: .bold))
       }
       .frame(width: Constants.size.width, height: Constants.size.height)
       .onAppear {
           progress = value / Double(Constants.maximumValue)
           rotationAngle = .degrees(360 * progress)
       }
       .onChange(of: progress) {
           value = (Double(Constants.maximumValue) * progress).rounded(.down)
       }
   }
   
   private func changeAngle(location: CGPoint) -> Angle {
       let vector = CGVector(dx: location.x, dy: -location.y)
       let angleRadians = atan2(vector.dx, vector.dy)
       let positiveAngle = angleRadians < 0.0 ? angleRadians + (2.0 * .pi) : angleRadians
       progress = positiveAngle / (2.0 * .pi)
       
       return Angle(radians: positiveAngle)
   }
}

#Preview {
   @Previewable @State var value = 4.0
   CustomCircularSlider(value: $value)
       .padding(.all, 40)
}
