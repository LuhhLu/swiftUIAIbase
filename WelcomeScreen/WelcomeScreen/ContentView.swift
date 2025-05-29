// 
//import SwiftUI
//
//struct ContentView: View {
//    let starDate = Date.now
//    var body: some View {
//        VStack {
//            TimelineView(.animation){text in
//                VStack(spacing:-10) {
//                    Text("MAKE")
//                    Text("MOMENTS")
//                    Text("HAPPEN")
//                }
//                .distortionEffect(ShaderLibrary.Awave(.float(text.date.timeIntervalSince(starDate))), maxSampleOffset: .init(width: 0, height: 50))
//            }
//           
//            .font(.system(size: 48)).bold()
//            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [._1,._2,._3,._4]), startPoint: .leading, endPoint: .trailing))
//            
//        .padding()
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}


import SwiftUI
struct ContentView: View {
    var body: some View {
        VStack (spacing:-10){
            Text("MAKE")
            Text("MOMENTS")
            Text("HAPPEN")
        }
        .font(.system(size: 48)).bold()
        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [._1,._2,._3,._4]), startPoint: .leading, endPoint: .trailing))
        .distortionEffect(ShaderLibrary.wave(), maxSampleOffset: .init(width: 0, height: 50))
        .padding()
    }
}

#Preview {
    ContentView()
}
