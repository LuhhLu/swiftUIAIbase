 

import SwiftUI

struct Screens: View {
    @State var isPressed = false
    var image:ImageResource
    var title:String
    var detels:String
    @Binding var currentView:Int
 @State var show = false
    var body: some View {
        VStack(alignment:.leading,spacing:20){
            Spacer()
            Image(image).resizable().scaledToFill()
                .frame(width: 300, height: 300)
                .frame(maxWidth: .infinity)
                .scaleEffect( show ? 1 : 0)
            Spacer()
            Text(title)
                .font(.largeTitle)
                .scaleEffect( show ? 1 : 0,anchor: .leading)
                .animation(.smooth.delay(0.4), value: show)
            Text(detels)
                .scaleEffect( show ? 1 : 0,anchor: .leading)
                .animation(.smooth.delay(0.8), value: show)
            Spacer()
                Text("Continue").foregroundStyle(.white).bold()
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.bg,in:.rect(cornerRadius: 10))
                    .scaleEffect(isPressed ? 0.95 : 1)
                    .animation(.easeInOut(duration: 0.2), value: isPressed)
                    .onTapGesture {
                    withAnimation {
                   currentView += 1
                    }
                }
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged({_ in isPressed = true})
                            .onEnded({_ in isPressed = false})
                    )
            Spacer()
               
        }
        .foregroundStyle(.white)
        .padding(.horizontal)
        .onAppear{
            withAnimation {
                show.toggle()
            }
        }
        
    }
}

#Preview {
    onboardingView()
}
