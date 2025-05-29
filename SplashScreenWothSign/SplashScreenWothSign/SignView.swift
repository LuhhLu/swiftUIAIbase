 

import SwiftUI

struct SignView: View {
    @State var show = false
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack(spacing:12){
                Spacer()
                Image(systemName: "swift")
                    .resizable().scaledToFill()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.blue.gradient)
                    .blur(radius: show ? 0 : 1)
                    .scaleEffect(show ? 1 : 0)
                    .animation(.smooth(duration: 2), value: show)
                    .padding(.bottom,40)
                TitleView(text: "Welcome To", show: $show)
                    .font(.title)
                    .animation(.spring.delay(1), value: show)
                TitleView(text: "SwiftUI", show: $show)
                    .font(.system(size: 60).bold())
                    .animation(.spring.delay(2), value: show)
                Spacer()
                HStack(spacing:14){
                    Image(systemName: "apple.logo")
                    Text("Sign in with Apple")
                }
                .font(.title2)
                .frame(height: 55)
                .padding(.horizontal,30)
                .background(.gray.tertiary,in:.capsule)
                
                .blur(radius: show ? 0 : 10)
                .opacity(show ? 1 : 0)
                .scaleEffect(show ? 1 : 0)
                .animation(.smooth.delay(3), value: show)
            }
        }
        .onAppear(){
            show.toggle()
        }
    }
}

#Preview {
    SignView()
}
