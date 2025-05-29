




import SwiftUI
import Shimmer

struct ContentView: View {

    @State private var dragAmount: CGFloat = 0
    @State private var showSlideText = true
    @State private var powerOn = false
    @State var showCheckmarkProgress = 0.0
    let phoneScreen = Image("bg")

    var body: some View {
        ZStack(alignment: .bottom) {
            phoneScreen
                .resizable()
                .blur(radius: 10)
                .ignoresSafeArea(.all)

                PowerSliderView(dragAmount: $dragAmount,
                                powerOn: $powerOn,
                                showSlideText: $showSlideText,
                                showCheckmarkProgress: $showCheckmarkProgress)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PowerSliderView: View {

    @Binding var dragAmount: CGFloat
    @Binding var powerOn: Bool
    @Binding var showSlideText: Bool
    @Binding var showCheckmarkProgress: Double
    var body: some View {
        ZStack (alignment: .trailing) {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 250 - dragAmount)
                .foregroundColor(Color(.systemGray))
                .foregroundStyle(.ultraThickMaterial)
                .blendMode(.plusLighter)
            PowerButtonView(dragAmount: $dragAmount,
                            powerOn: $powerOn,
                            showSlideText: $showSlideText,
                            showCheckmarkProgress: $showCheckmarkProgress)
        }
        .frame(maxWidth: 250, maxHeight: 62)
    }
}
struct PowerButtonView: View {
    @Binding var dragAmount: CGFloat
    @Binding var powerOn: Bool
    @Binding var showSlideText: Bool
    @Binding var showCheckmarkProgress: Double
    var body: some View {
        HStack {
            Image(systemName: powerOn ? "circle.fill" : "power.circle.fill")
                .font(.system(size: 52))
                .offset(x: self.dragAmount)
                .gesture(powerGesture())
            if showSlideText && dragAmount <= 10 {
                Text("Slide to power off")
                    .foregroundColor(.black)
                    .frame(width: 150)
                    .shimmering()
            }
            Spacer()
            CheckmarkView(showCheckmarkProgress: $showCheckmarkProgress,
                          dragAmount: $dragAmount)
        }
    }
    private func powerGesture() -> some Gesture {
        DragGesture()
            .onChanged { value in
                if value.translation.width > 0 && value.translation.width < 190 {
                    self.dragAmount = value.translation.width
                }
            }
            .onEnded { value in
                if self.dragAmount >= 180 {
                    print("Perform action")
                    self.dragAmount = 188
                    powerOn = true
                    withAnimation(Animation.easeInOut(duration: 1) ){
                        showCheckmarkProgress = 1
                    }
                } else {
                    withAnimation(.interpolatingSpring(stiffness: 200, damping: 10)) {
                        self.dragAmount = 0
                        self.showSlideText = false
                    }
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation {
                        self.showSlideText = true
                    }
                }
            }
    }
}
struct CheckmarkView: View {
    @Binding var showCheckmarkProgress: Double
    @Binding var dragAmount: CGFloat
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: -1, y: -1))
            path.addCurve(to: CGPoint(x: 21, y: 26), control1:  CGPoint(x: -1, y: -11), control2:  CGPoint(x: 22, y: 26))
            path.addCurve(to: CGPoint(x: 56, y: -28), control1:  CGPoint(x: 20, y: 26), control2:  CGPoint(x: 56, y: -28))
            path.move(to:CGPoint(x: -1, y: -1))
        }
        .trim(from: 0.0, to: showCheckmarkProgress)
        .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
        .foregroundColor(.green)
        .scaleEffect(0.4)
        .offset(x: self.dragAmount - 104 , y: 14)
    }
}







//
//
//import SwiftUI
//
//struct ContentView: View {
//    @State var dragAmount:CGFloat = 0
//    @State var showSliderText = true
//    @State var showCheckMark = 0.0
//    @State var dane = false
//    var body: some View {
//        ZStack {
//            Image("bg")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//                .blur(radius: 10)
//            VStack{
//                Text("\(dragAmount)")
//                ZStack(alignment: .trailing){
//                    RoundedRectangle(cornerRadius: 50, style: .continuous)
//                        .frame(width: 250 - self.dragAmount)
//                        .foregroundColor(Color(.systemGray))
//                        .foregroundStyle(.ultraThickMaterial)
//                        .blendMode(.plusLighter)
//                    HStack{
//                        Image(systemName:dane ? "circle.fill" : "power.circle.fill")
//                            .font(.system(size: 52))
//                            .offset(x: self.dragAmount)
//                            .simultaneousGesture(DragGesture()
//                                .onChanged{ value in
//                                    if value.translation.width > 0 && value.translation.width < 190{
//                                        self.dragAmount = value.translation.width
//                                    }
//                                }
//                                .onEnded{ value in
//                                    if dragAmount >= 180{
//                                        print("perform action")
//                                        dragAmount = 188
//                                        dane = true
//                                        withAnimation(Animation.easeInOut(duration: 1)){
//                                            showCheckMark = 1
//                                        }
//
//
//                                    }else{
//                                        withAnimation(.spring()){
//                                            dragAmount = 0
//                                            showSliderText = false
//                                        }
//                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
//                                            showSliderText = true
//                                        }
//
//                                    }
//                                }
//                            )
//                        if showSliderText && dragAmount <= 10 {
//                            Text("Slide to power off")
//                                .foregroundColor(.black)
//                        }
//                        Spacer()
//                    }
//
//                    Path{ path in
//                        path.move(to: CGPoint(x: -1, y: -1))
//                        path.addCurve(to: CGPoint(x: 21, y: 26), control1: CGPoint(x: -1, y: -11), control2: CGPoint(x: 22, y: 26))
//                        path.addCurve(to: CGPoint(x: 56, y: -28), control1: CGPoint(x: 20, y: 26), control2: CGPoint(x: 56, y: -28))
//                        path.move(to: CGPoint(x: -1, y: -1))
//                    }
//                    .trim(from: 0.0, to: showCheckMark)
//                    .stroke(style: StrokeStyle(lineWidth: 8 ,lineCap: .round,lineJoin: .round))
//                    .foregroundColor(.green)
//                    .scaleEffect(0.4)
//                    .offset(x: dragAmount - 55, y: 14)
//
//
//
//                }
//                .frame(width: 250, height: 62)
//
//            }
//
//
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
