
import SwiftUI
struct ContentView: View {
    @State var isOn :Bool = false
    var body: some View {
        ZStack {
            isOn ? Color("L") : Color("N")
            Toggle("", isOn: $isOn)
                .toggleStyle(CustomToggleStyle())
        }
        .ignoresSafeArea()
         
    }
}
struct CustomToggleStyle:ToggleStyle{
    @Namespace var namespace
    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        return Button {
            withAnimation(.spring(response: 0.9, dampingFraction: 0.8)) {
                configuration.isOn.toggle()
                print(isOn ? "ON" : "OFF" )
            }
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .frame(width: 140, height: 50)
                    .foregroundColor(isOn ? Color("le") :Color("da"))
                    .overlay(alignment: .leading, content: {
                        ZStack(content: {
                            Image("Stars")
                                 .resizable()
                                 .frame(width: 110, height: 45)
                                 .offset(x: isOn ?  -115 : 0)
                                 .padding(.leading,5)
                            Image("clouds")
                                 .resizable()
                                 .frame(width: 80, height: 45)
                                 .offset(x: isOn ?  35 : 135)
                                 .padding(.leading,5)
                        })
                      
                        
                         
                    })
                    .overlay(alignment: .leading) {
                        if !isOn {
                            MoonView()
                                .matchedGeometryEffect(id: "Circle", in: namespace)
                                .offset(x: isOn ?  5 : 95)
                            
                        }else{
                            Circle()
                                .matchedGeometryEffect(id: "Circle", in: namespace)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.yellow)
                                .offset(x: isOn ? 5 : 95)
                        }
                      
                    }
            }
            .mask({
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                    .frame(width: 140, height: 50)
            })
        }
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
