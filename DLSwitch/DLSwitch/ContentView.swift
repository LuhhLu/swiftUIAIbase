



import SwiftUI

struct ContentView: View {
    @State var isDarlMode:Bool = false
    @Namespace var namespace
    var body: some View {
        VStack {
            HStack{
                Text("4:20")
                    .font(.system(size: 14))
                    Spacer()

                Image(systemName: "antenna.radiowaves.left.and.right")
                    .resizable()
                    .frame(width: 10, height: 10)
                RoundedRectangle(cornerRadius: 2.5)
                    .frame(width: 15, height: 10)
            }
            .foregroundColor(isDarlMode ? .white : .black )
            .padding(.horizontal,25)
            .padding(.vertical,10)
            Circle()
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [
                    Color(isDarlMode ? "CRDT" : "CRLT"),
                    Color(isDarlMode ? "CRDB":"CRLB")]),
                                                startPoint: .topTrailing, endPoint: .bottomLeading))
                .frame(width: 140, height: 140)
                .overlay(alignment: .topTrailing) {
                    if !isDarlMode{
                        Circle()
                            .foregroundColor(.white)
                            .matchedGeometryEffect(id: "Circle", in: namespace)
                            .frame(width: 0, height: 0)
                            .offset(x: 10, y: 5)
                    }else{
                        Circle()
                            .foregroundColor(Color("CDD"))
                            .matchedGeometryEffect(id: "Circle", in: namespace)
                            .frame(width: 105, height: 105)
                            .offset(x: 1, y: -3)
                        
                    }
                    
                    
                }
                
            
            Toggle("", isOn: $isDarlMode)
                .toggleStyle(CustomToggleStyle())
                .padding()
        }
        .background(isDarlMode ? Color("CDD") : Color("CLL") )
        .cornerRadius(20)
        .frame(width: 290, height: 250)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
     
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
struct CustomToggleStyle:ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // is like Bool true or false value
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 200, height: 40)
                .foregroundColor(configuration.isOn ? Color("BD") : Color("BL"))
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(configuration.isOn ? Color("SD") : .white)
                .frame(width: 100, height: 44)
            // if is configuration is true go to right or go to left
                .offset(x: configuration.isOn ? 50 : -50)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
            HStack{
                Text("Light").bold().font(.system(size: 16))
                    .foregroundColor(configuration.isOn ? .gray : .black)
                Spacer()
                Text("Dark").bold().font(.system(size: 16))
                    .foregroundColor(configuration.isOn ? .white : .gray)
                  
                
            }
            .frame(width: 135)
            
            
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                configuration.isOn.toggle()
            }
        }
    }
}
