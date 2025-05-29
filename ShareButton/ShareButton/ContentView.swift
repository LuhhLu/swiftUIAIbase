 

import SwiftUI

struct ContentView: View {
    @State var step1 = false
    @State var step2 = false
    var icons = ["x","g","f"]
    var body: some View {
        ZStack {
            HStack{
                ForEach(icons.indices,id:\.self) { index in
                    Button {
                        iconAction(iconname: icons[index])
                    } label: {
                        Image(icons[index]).resizable().scaledToFill()
                            .frame(width: 30, height: 30).clipShape(Circle())
                            .padding(10)
                            .scaleEffect(step2 ? 1 : 0)
                            .animation(.spring(duration: 0.5).delay(Double(index) * 0.3), value: step2)
                    }

                   
                }
                .padding(.horizontal,5)
                
                
            }
            .background(.white,in:RoundedRectangle(cornerRadius: 40))
            .offset(x: -4, y: -2)
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: step1 ? 0 : 200, height: 55)
                    .foregroundStyle(.b)
                    .onTapGesture {
                        withAnimation {
                            step1 = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation {
                                step2.toggle()
                            }
                        }
                    }
                Text("Share").bold()
                    .opacity(step2 ? 0 : 1)

            }
    
        }
    }
}
func iconAction(iconname:String){
    switch iconname{
    case "f":
        print("facebook icon tapped")
    case "x":
        print("X icon tapped")
        // Add Xcode action
    case "g":
        print("GitHub icon tapped")
        // Add GitHub action
    default:
        print("")
    }
}
#Preview {
    ContentView()
}
