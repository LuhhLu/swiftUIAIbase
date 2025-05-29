

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var show2 = false
    @State var scale:CGFloat = 1
    var body: some View {
        
        ZStack{
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2),spacing:10) {
                    ForEach(0 ..< 15) { item in
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 180, height: 200).foregroundStyle(.gray.opacity(0.3))
                    }
                }.padding(.horizontal,13)
            }
            .mask {
                Image(systemName:"cloud.fill").resizable().scaledToFill()
                    .frame(width: 150, height: 150)
                    .scaleEffect(scale)
            }
            
            Image(systemName: "cloud.fill").resizable().scaledToFill()
                .frame(width: 150, height: 150)
                .opacity(show ? 0 : 1)
                .scaleEffect(scale)
            
        }
        .onAppear(){
            withAnimation(.spring(duration: 1).delay(0.5)) {
                show2.toggle()
                scale = 0.8
            }
            withAnimation(.spring(duration: 1).delay(1)) {
                show.toggle()
                scale = 20
            }
        }
//        .onAppear(){
//            withAnimation(.spring(duration: 5).delay(0.5)) {
//                show2.toggle()
//                scale = 0.8
//            }
//            withAnimation(.spring(duration: 8).delay(5)) {
//                show.toggle()
//                scale = 20
//            }
//        }
        
    }
}

#Preview {
    ContentView()
}
//.onAppear(){
//    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//        withAnimation(.spring(duration: 5)) {
//            show2.toggle()
//            scale = 0.8
//        }
//
//    }
//    DispatchQueue.main.asyncAfter(deadline: .now() + 5){
//        withAnimation(.spring(duration: 5)) {
//            show.toggle()
//            scale = 20
//        }
//    }
//}
