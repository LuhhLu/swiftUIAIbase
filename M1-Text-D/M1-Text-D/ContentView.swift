 
























import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("Hello, World!")
             .font(.title)
             .fontWeight(.bold)
             .foregroundColor(.green)
         Text("Hello, World!").bold()
             .font(.title)
             .strikethrough(true, color: .red)
         Text("Hello, World!").bold()
             .font(.title)
             .underline(true, color: .pink)
            Text(
            """
            Hello **World**
            """
            )
            
            Text("Baselin")
                  .foregroundColor(.green)
              +
              Text("Offset")
                  .font(.title)
                  .foregroundColor(.yellow)
                  .baselineOffset(-20)
              LinearGradient(gradient: Gradient(colors: [.red,.blue,.green]), startPoint: .leading, endPoint: .trailing)
                  .mask(
                      Text("LinearGradient")
                          .font(.largeTitle).fontWeight(.heavy)
                  )
            
           Text("In the example below, the contents of the Text view are center aligned. This also applies to the interpolated newline placed in the middle of the text since")
                .font(.title3)
                .baselineOffset(5)
                .kerning(1)
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.5)
                .frame(width: 200, height: 150)
            
            Spacer()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          
    }
}




























