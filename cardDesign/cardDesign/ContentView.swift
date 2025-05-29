 
import SwiftUI

struct ContentView: View {
    var drgress :CGFloat = 125
    var body: some View {
        ZStack{
            Color("bg")
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 250, height: 350)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 250, height: 350)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.19),.clear]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(lineWidth: 3)
                .frame(width: 230, height: 320)
                .foregroundStyle(AngularGradient(colors: [Color("ct").opacity(0.3),Color("ct")], center: .center, startAngle: .degrees(drgress), endAngle: .degrees(drgress)))
                .blur(radius: 10)
            
            
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 250, height: 350)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.clear,.black.opacity(0.06)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(lineWidth: 5)
                .frame(width: 250, height: 350)
                .foregroundStyle(AngularGradient(colors: [.white,Color("ct")], center: .center, startAngle: .degrees(drgress), endAngle: .degrees(drgress)))
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
