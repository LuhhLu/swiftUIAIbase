
import SwiftUI

struct ButtonAnimation: View {
    @State var show = false
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3).ignoresSafeArea()
            VStack{
                Button(action: {withAnimation { show.toggle() } }) {
                  Text("BUTTON")
                    .font(.title2.bold())
            }
                .buttonStyle(CustomButtonStyle(show: $show))
                .padding(.top,60)
                Spacer()
            }
        
        }
    }
}

#Preview {
    ButtonAnimation()
}


struct CustomButtonStyle: ButtonStyle {
    @Binding var show: Bool
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .foregroundStyle(.black)
                .frame(width: show ? 300 : 20, height: show ? 300 : 20)
                .offset(y: 40)
            configuration.label
                .foregroundStyle(show ? .white : .black)
        }
        .frame(width: 200, height: 55)
        .background(.white, in: Capsule())
        .clipShape(Capsule())
        .contentShape(Capsule())
        .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        .animation(.easeInOut, value: configuration.isPressed)
    }
}


//
//
//import SwiftUI
//
//struct ButtonAnimation: View {
//    @State var show = false
//    var body: some View {
//        ZStack {
//            Color.gray.opacity(0.3).ignoresSafeArea()
//            ZStack{
//                Circle().foregroundStyle(.black)
//                    .frame(width:show ? 300 : 20, height:show ? 300 : 20)
//                    .offset(y:40)
//                Text("BUTTON")
//                    .font(.title2.bold())
//                    .foregroundStyle(show ? .white : .black)
//            }
//            .frame(width: 200, height: 55)
//            .background(.white,in: Capsule())
//            .clipShape(Capsule())
//            .contentShape(Capsule())
//            
//            .onTapGesture {
//                withAnimation {
//                    show.toggle()
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    ButtonAnimation()
//}
