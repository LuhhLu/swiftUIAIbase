     

    import SwiftUI

    struct MeteorView: View {
        @State var show2 = false
        @State var show3 = false
        @State private var yOffset: CGFloat = -200
        var delayAnimation:Double
        var body: some View {
            ZStack{
                Image(.NS)
                    .resizable().scaledToFill()
                    .frame(width: 20, height: 10)
                    .offset(x:show2 ? -200 : 0 ,y: show2 ? 200 : -200)
                    .opacity(show3 ? 1 : 0)
                    .offset(x: 100, y: yOffset)
            }
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: delayAnimation, repeats: true) { _ in
                        yOffset = CGFloat.random(in: -700...0)
                        show2 = false
                        show3 = false
                        withAnimation(.spring(duration: 2)) {
                            show2.toggle()
                            show3.toggle()
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation {
                                show3.toggle()
                            }
                        }
                    }
            }
        }
    }

    #Preview {
    //    NSVeiw()
        HomeView()
    }


 
