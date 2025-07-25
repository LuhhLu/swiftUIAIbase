 

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var lineWidth:CGFloat = 3
    var body: some View {
        ZStack {
            VStack{
                HStack{
                    Image(.user1).resizable().scaledToFill()
                        .frame(width: 60, height: 60)
                        .overlay {
                            Circle().stroke(lineWidth: lineWidth)
                            
                        }
                        .offset(x:show ?  115 : 300, y: show ? -10 : -100)
                    Image(.user2).resizable().scaledToFill()
                        .frame(width: 60, height: 60)
                        .overlay {
                            Circle().stroke(lineWidth: lineWidth)
                            
                        }
                        .offset(x:show ?  -115 : -300, y: show ? -10 : -100)
                        
                }
                HStack{
                    Image(.user3).resizable().scaledToFill()
                        .frame(width: 60, height: 60)
                        .overlay {
                            Circle().stroke(lineWidth: lineWidth)
                            
                        }
                        .offset(x:show ?  115 : 300, y: show ? 10 : 100)
                    Image(.user4).resizable().scaledToFill()
                        .frame(width: 60, height: 60)
                        .overlay {
                            Circle().stroke(lineWidth: lineWidth)
                            
                        }
                        .offset(x:show ?  -115 : -300, y: show ? 10 : 100)
                        
                }
            }
            VStack{
                Image(.user5).resizable().scaledToFill()
                    .frame(width: 60, height: 60)
                    .overlay {
                        Circle().stroke(lineWidth: lineWidth)
                        
                    }
                    .offset(y:show ? -60 : -300)
                Image(.user6).resizable().scaledToFill()
                    .frame(width: 60, height: 60)
                    .overlay {
                        Circle().stroke(lineWidth: lineWidth)
                        
                    }
                    .offset(y:show ? 60 : 300)
            }
           
            Image(.user7).resizable().scaledToFill()
                .frame(width: 60, height: 60)
                .overlay {
                    Circle().stroke(lineWidth: lineWidth)
                }
                   
        }
        .rotationEffect(.degrees( show ? 0 : 100))
        .onAppear(){
            withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                show.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
