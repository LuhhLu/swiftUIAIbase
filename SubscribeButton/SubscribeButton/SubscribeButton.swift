

import SwiftUI

struct SubscribeButton: View {
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.3) .ignoresSafeArea()
            Button(action: { print("Button pressed!")}) {
                Text("Subscribe")
            }
            .buttonStyle(CustomButton())
            .padding(.horizontal)
            .scaleEffect(1.8)
        }
      
    }
}

#Preview {
    SubscribeButton()
}
 
struct CustomButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label.padding().bold()
            .frame(height: 55).padding(.horizontal,30)
            .foregroundStyle(.white)
        
            .background(.indigo
            .shadow(.inner(color: .black, radius:  1, x: 0, y:configuration.isPressed ? 0 : -1.5))
            , in: .capsule)
        
            .overlay(content: {
                Capsule().stroke(lineWidth: 1.5).foregroundStyle(.white)
                    .padding(0.3)
            })
            
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring, value: configuration.isPressed)
    }
    
}

 



//
//
//import SwiftUI
//
//struct DaysUI: View {
//    
//    
//    @State private var isPressed = false
//    
//    var body: some View {
//        ZStack{
//            Color.gray.opacity(0.3) .ignoresSafeArea()
//            Button(action: { print("Button pressed!")}) {
//                Text("Subscribe")
//            }
//            .buttonStyle(CustomButton())
//            .padding(.horizontal)
//        }
//      
//    }
//}
//
//#Preview {
//    DaysUI()
//}
// 
//struct CustomButton: ButtonStyle {
//    
//    func makeBody(configuration: Configuration) -> some View {
//        
//        configuration.label.padding().bold()
//            .frame(height: 55)
//            .padding(.horizontal,30)
//            .foregroundStyle(.white)
//            .shadow(color: .black.opacity(0.5), radius: 1, x: 0, y: 0.5)
//            
//            .background(
//                .indigo.gradient, in: .capsule)
//        
//            .overlay(content: {
//                ZStack{
//                    Capsule().stroke(lineWidth: 1).foregroundStyle(.white.opacity(0.6))
//                        .padding(1.2)
//                    Capsule().stroke(lineWidth: 1).foregroundStyle(.black)
//                }
//                
//            })
//            
//            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
//            .animation(.spring, value: configuration.isPressed)
//    }
//    
//}
//
// 
