 
import SwiftUI

struct ContentView: View {
    @State  var isOn = false
    var body: some View {
        VStack{
            Toggle("", isOn: $isOn)
            .toggleStyle(CustomToggleStyle())
            .padding(.top,40)
            Spacer()
               
        }
    }
}

#Preview {
    ContentView()
}
struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing:-15){
            ZStack {
                RoundedRectangle(cornerRadius: 16)  .fill(configuration.isOn ?.green :.red)
                    .frame(width: 60, height: 30)
                   
                   
                Circle() .fill(.white)
                    .frame(width: 28, height: 28)
                
                    .offset(x: configuration.isOn ? 15 : -15)
                
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            configuration.isOn.toggle()
                        }
                    }
            }
            
            .rotationEffect(.degrees(-90))
            
            VStack(alignment:.leading,spacing:-10){
                Text("N")
                Text("FF")
            }
            .font(.largeTitle.bold())
            .foregroundStyle(.secondary)
        }
 
    }
}
