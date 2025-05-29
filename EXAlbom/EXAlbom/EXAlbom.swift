//
 
import SwiftUI

struct EXAlbom: View {
    @State var show = false
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3).ignoresSafeArea()
            VStack{
                ZStack {
                    
                    ForEach(0 ..< 3) { index in
                        let reversedIndex = 2 - index
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 150, height: 200)
                            .foregroundStyle(.white)
                        
                        
                        
                        
                            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 0)
//                        
//                        
//                        
//                        
//                        
                            .offset(x: show ? CGFloat(reversedIndex * -7) : 0,
                                    y: show ? CGFloat(reversedIndex * -15) : 0)
                        
//                        
//                        
//                        
//                        
                            .rotationEffect(.degrees(show ? Double(reversedIndex * 15) : 0), anchor: .bottom)
//                        
//                        
//                        
                        
                        
                        
                    }
                }
                .padding(.top,40)
                Spacer()
                
                Button(action: {
                    withAnimation(.spring) {
                        show.toggle()
                    }
                }, label: {
                    Text("Button")
                })
            }

        }
    }
}


#Preview {
    EXAlbom()
}
