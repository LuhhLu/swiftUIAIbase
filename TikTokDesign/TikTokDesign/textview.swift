
import SwiftUI

struct textview: View {
      let text = "sucodee learn swiftui faster"
      @State var animationspeed = 10
      @State private var offset: CGFloat = -UIScreen.main.bounds.width
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sucodee").bold()
                .font(.title2)
            Text("#learnswiftui\n#swiftui#swiiosdev...***See more***")
            HStack{
                Text(text)
                    .offset(x:offset)
                    .onAppear{
                        withAnimation(Animation.linear(duration: Double(self.animationspeed))
                            .repeatForever(autoreverses: false)){
                                self.offset = UIScreen.main.bounds.width
                            }
                    }
            }
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct textview_Previews: PreviewProvider {
    static var previews: some View {
        textview()
    }
}
