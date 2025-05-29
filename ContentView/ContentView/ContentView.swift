 

import SwiftUI

struct ContentView: View {
    @State var show = false
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2).ignoresSafeArea()
            
            ZStack{
                Capsule()
                    .frame(width: 160, height: 50)
                    .foregroundStyle(RadialGradient(colors: show ? [.indigo,.white] : [.gray.opacity(0.2)], center: .bottom, startRadius: 40, endRadius: -70))
                
                    .shadow(color:show ? .indigo :  .black, radius:show ? 30 : 0, x: 1, y: 3)
                
                Label("Generate", systemImage: "wand.and.stars.inverse").bold()
                    .foregroundStyle(show  ? .white :.gray)
            
            }
        }
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}





//
//import SwiftUI
//
//struct ContentView: View {
//    @State var show = true
//    var body: some View {
//        ZStack{
//            Color.gray.opacity(0.2).ignoresSafeArea()
//            
//            ZStack{
//                Capsule()
//                    .frame(width: 160, height: 50)
//                    .foregroundStyle(show ? .indigo : .gray.opacity(0.1))
//                    .shadow(color:show ? .indigo :  .black, radius:show ? 30 : 0, x: 1, y: 3)
//                Circle().trim(from: 0, to: 0.3)
//                    .frame(width: 100, height: 100)
//                    .rotationEffect(.degrees(-144))
//                    .offset(y: 54).blur(radius: 20)
//               
//                Label("Generate", systemImage: "wand.and.stars.inverse")
//                    .bold()
//                
//            }
//        }
//      
//    }
//}
//
//#Preview {
//    ContentView()
//}
