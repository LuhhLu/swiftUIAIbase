 
import SwiftUI

struct DLToggle: View {
    @State var isOn = false
    var body: some View {
        VStack{
            Toggle("", isOn: $isOn)
            .toggleStyle(DLToggleStyle())
            .padding(.top,100)
            .scaleEffect(1.5)
            Spacer()
        }
       
    }
}

#Preview {
    DLToggle()
}





struct DLToggleStyle: ToggleStyle {
    @State var degrees:CGFloat = 0
    func makeBody(configuration: Configuration) -> some View {

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(configuration.isOn ? .blue :.cyan)
                    .frame(width: 60, height: 30)
                    
                
                HStack(spacing:15){
                    Image(systemName: "moon.fill").foregroundStyle(.cyan)
                    Image(systemName: "sun.max.fill").foregroundStyle(.yellow)
                    .rotationEffect(.degrees(degrees))
                 }
//                
                .onAppear(){
                    withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                        degrees = 360
                    }
                }
                
                Circle().fill(.white)
                    .frame(width: 28, height: 28)
                    .offset(x: configuration.isOn ? 15 : -15)
               
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            configuration.isOn.toggle()
                        }
                    }
            }
       
        
 
    }
}
