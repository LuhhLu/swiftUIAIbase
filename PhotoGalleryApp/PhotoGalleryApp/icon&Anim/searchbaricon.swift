 
import SwiftUI
struct searchbaricon: View {
    @State var state = false
    @Namespace var namespace
    var body: some View {
        if !state{
            ZStack{
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "one", in: namespace)
                    .frame(width: 50, height: 50)
                Image(systemName: "magnifyingglass").bold()
                    .font(.title2)
                    .matchedGeometryEffect(id: "icon", in: namespace)
                    .foregroundColor(.black)
                
            }
            .foregroundColor(.white)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            .onTapGesture {
                withAnimation (.interactiveSpring(response: 0.9, dampingFraction: 0.9)){
                    state.toggle()
                }
            }
        }else{
        
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "one", in: namespace)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .overlay(alignment: .leading) {
                        Image(systemName: "magnifyingglass").bold()
                            .font(.title2)
                            .matchedGeometryEffect(id: "icon", in: namespace)
                            .foregroundColor(.black)
                            .padding(.leading,10)
                    }
            .foregroundColor(.white)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            .onTapGesture {
                withAnimation (.interactiveSpring(response: 0.9, dampingFraction: 0.9)){
                    state.toggle()
                }
            }
            
        }
    }
}

struct searchbaricon_Previews: PreviewProvider {
    static var previews: some View {
        searchbaricon()
    }
}
